local Creator = require("creator")
local Library = require("library")
local Flipper = require("flipper")
local Localization = require("localization")
local resolveFont = Creator.resolveFont
local UserInputService = game:GetService("UserInputService")

return function(Components)
	local New = Creator.New
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local TweenService = game:GetService("TweenService")

	local TAB_DRAG_THRESHOLD = 8

	local TabModule = {
		Window = nil,
		Tabs = {},
		Containers = {},
		SelectedTab = 0,
		TabCount = 0,
		AnimationTask = nil,
		CurrentAnimationTab = 0,
		TabOrder = {},
		Drag = {
			Active = false,
		},
	}

	function TabModule:Init(Window)
		TabModule.Window = Window
		TabModule.TabOrder = {}
		TabModule.Drag = TabModule.Drag or {}
		TabModule.Drag.Active = false
		TabModule.Drag.Placeholder = nil
		TabModule.Drag.PendingTab = nil
		TabModule.Drag.PendingInput = nil
		if not TabModule.Drag.InputChangedConn then
			TabModule.Drag.InputChangedConn = Creator.AddSignal(UserInputService.InputChanged, function(input)
				TabModule:OnInputChanged(input)
			end)
		end
		return TabModule
	end

	function TabModule:GetCurrentTabPos()
		if TabModule.Window.TabsInHeader then
			local TabHolderPos = TabModule.Window.TabHolder.AbsolutePosition.X
			local TabPos = TabModule.Tabs[TabModule.SelectedTab].Frame.AbsolutePosition.X
			return TabPos - TabHolderPos
		else
			local TabHolderPos = TabModule.Window.TabHolder.AbsolutePosition.Y
			local TabPos = TabModule.Tabs[TabModule.SelectedTab].Frame.AbsolutePosition.Y
			return TabPos - TabHolderPos
		end
	end

	function TabModule:GetTabOrderIndex(tabId)
		for index, value in ipairs(TabModule.TabOrder) do
			if value == tabId then
				return index
			end
		end
		return nil
	end

	function TabModule:ApplyLayoutOrder()
		for order, tabId in ipairs(TabModule.TabOrder) do
			local tab = TabModule.Tabs[tabId]
			if tab and tab.Frame then
				tab.Frame.LayoutOrder = order
			end
		end
	end

	function TabModule:ApplyDragLayout()
		local drag = TabModule.Drag
		if not drag.Active then
			return TabModule:ApplyLayoutOrder()
		end

		local placeholderIndex = drag.InsertIndex or (#TabModule.TabOrder + 1)
		local orderCounter = 1
		for _, tabId in ipairs(TabModule.TabOrder) do
			local tab = TabModule.Tabs[tabId]
			if tab and tab.Frame then
				local adjustedOrder = orderCounter
				if orderCounter >= placeholderIndex then
					adjustedOrder = adjustedOrder + 1
				end
				tab.Frame.LayoutOrder = adjustedOrder
				orderCounter = orderCounter + 1
			end
		end

		if drag.Placeholder then
			drag.Placeholder.LayoutOrder = placeholderIndex
		end
	end

	function TabModule:GetDragLayer()
		if TabModule.Window and TabModule.Window.DragLayer and TabModule.Window.DragLayer.Parent then
			return TabModule.Window.DragLayer
		end

		if Library.GUI then
			local layer = Instance.new("Frame")
			layer.Name = "TabDragLayer"
			layer.BackgroundTransparency = 1
			layer.BorderSizePixel = 0
			layer.ZIndex = 2000
			layer.Size = UDim2.fromScale(1, 1)
			layer.Parent = Library.GUI
			if TabModule.Window then
				TabModule.Window.DragLayer = layer
			end
			return layer
		end

		return nil
	end

	function TabModule:ElevateZIndex(frame)
		local drag = TabModule.Drag
		drag.ZIndexMap = {}

		local function elevate(object)
			if object:IsA("GuiObject") then
				drag.ZIndexMap[object] = object.ZIndex
				object.ZIndex = object.ZIndex + 200
			end
			for _, child in ipairs(object:GetChildren()) do
				elevate(child)
			end
		end

		elevate(frame)
	end

	function TabModule:RestoreDragZIndex()
		local drag = TabModule.Drag
		if drag.ZIndexMap then
			for object, value in pairs(drag.ZIndexMap) do
				if object then
					object.ZIndex = value
				end
			end
		end
		drag.ZIndexMap = nil
	end

	function TabModule:IsDragging()
		return TabModule.Drag and TabModule.Drag.Active or false
	end

	function TabModule:ClearPendingDrag()
		local drag = TabModule.Drag
		if drag.PendingChangedConn then
			drag.PendingChangedConn:Disconnect()
		end
		drag.PendingChangedConn = nil
		drag.PendingTab = nil
		drag.PendingTabId = nil
		drag.PendingInput = nil
		drag.PendingStartPosition = nil
		drag.PendingControlType = nil
	end

	function TabModule:StartPendingDrag(tab, tabId, input)
		if TabModule:IsDragging() or not tab or not tab.Frame then
			return
		end

		if #TabModule.TabOrder <= 1 then
			return
		end

		if Library.DialogOpen or (TabModule.Window and TabModule.Window.Minimized) then
			return
		end

		TabModule:ClearPendingDrag()

		local drag = TabModule.Drag
		drag.PendingTab = tab
		drag.PendingTabId = tabId
		drag.PendingInput = input
		drag.PendingStartPosition = Vector2.new(input.Position.X, input.Position.Y)
		drag.PendingControlType = input.UserInputType
		local absolutePos = tab.Frame.AbsolutePosition
		drag.PointerOffset = Vector2.new(input.Position.X - absolutePos.X, input.Position.Y - absolutePos.Y)

		drag.PendingChangedConn = Creator.AddSignal(input.Changed, function()
			if input.UserInputState == Enum.UserInputState.End then
				TabModule:ClearPendingDrag()
			end
		end)
	end

	function TabModule:BeginDrag(tab, tabId, input)
		local holder = TabModule.Window and TabModule.Window.TabHolder
		if not holder or not tab or not tab.Frame then
			return
		end

		local totalTabs = #TabModule.TabOrder
		if totalTabs <= 1 then
			return
		end

		local drag = TabModule.Drag
		drag.Active = true
		drag.Tab = tab
		drag.TabId = tabId
		drag.ActiveInput = input
		drag.ControlType = input.UserInputType == Enum.UserInputType.Touch and Enum.UserInputType.Touch or Enum.UserInputType.MouseMovement
		drag.MoveInput = input.UserInputType == Enum.UserInputType.Touch and input or nil

		local originalIndex = TabModule:GetTabOrderIndex(tabId) or totalTabs
		drag.OriginalIndex = originalIndex
		table.remove(TabModule.TabOrder, originalIndex)
		drag.InsertIndex = originalIndex

		local phWidth = tab.Frame.AbsoluteSize.X
		local phHeight = tab.Frame.AbsoluteSize.Y

		local placeholder = Instance.new("Frame")
		placeholder.Name = "TabDragPlaceholder"
		placeholder.BackgroundTransparency = 0.94
		placeholder.BackgroundColor3 = Creator.GetThemeProperty("Accent") or Color3.fromRGB(96, 205, 255)
		placeholder.BorderSizePixel = 0
		placeholder.Active = false
		placeholder.Size = TabModule.Window.TabsInHeader
			and UDim2.fromOffset(phWidth, phHeight)
			or UDim2.new(1, 0, 0, phHeight)
		placeholder.LayoutOrder = drag.InsertIndex
		placeholder.Parent = holder

		local phCorner = Instance.new("UICorner")
		phCorner.CornerRadius = UDim.new(0, 6)
		phCorner.Parent = placeholder

		local phStroke = Instance.new("UIStroke")
		phStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		phStroke.Color = Creator.GetThemeProperty("Accent") or Color3.fromRGB(96, 205, 255)
		phStroke.Transparency = 0.6
		phStroke.Thickness = 1
		phStroke.Parent = placeholder

		placeholder.BackgroundTransparency = 1
		phStroke.Transparency = 1
		TweenService:Create(placeholder, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0.92
		}):Play()
		TweenService:Create(phStroke, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Transparency = 0.5
		}):Play()

		drag.Placeholder = placeholder

		local absolutePos = tab.Frame.AbsolutePosition
		if not drag.PointerOffset then
			drag.PointerOffset = Vector2.new(input.Position.X - absolutePos.X, input.Position.Y - absolutePos.Y)
		end

		drag.OriginalParent = tab.Frame.Parent
		drag.OriginalSize = tab.Frame.Size
		drag.OriginalAutomaticSize = tab.Frame.AutomaticSize
		drag.OriginalAnchorPoint = tab.Frame.AnchorPoint

		local dragLayer = TabModule:GetDragLayer()
		tab.Frame.Parent = dragLayer or tab.Frame.Parent
		tab.Frame.AnchorPoint = Vector2.new(0, 0)
		tab.Frame.AutomaticSize = Enum.AutomaticSize.None
		tab.Frame.Size = UDim2.fromOffset(tab.Frame.AbsoluteSize.X, tab.Frame.AbsoluteSize.Y)
		tab.Frame.Position = UDim2.fromOffset(absolutePos.X, absolutePos.Y)

		TabModule:ElevateZIndex(tab.Frame)

		if tab.SetTransparency then
			tab.SetTransparency(0.82)
		end

		drag.Scale = Instance.new("UIScale")
		drag.Scale.Name = "DragScale"
		drag.Scale.Scale = 1
		drag.Scale.Parent = tab.Frame
		TweenService:Create(drag.Scale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.05 }):Play()

		if drag.InputEndedConn then
			drag.InputEndedConn:Disconnect()
		end
		drag.InputEndedConn = Creator.AddSignal(input.Changed, function()
			if input.UserInputState == Enum.UserInputState.End then
				TabModule:EndDrag(false)
			end
		end)

		TabModule:ApplyDragLayout()
		TabModule:UpdateDragPosition(Vector2.new(input.Position.X, input.Position.Y))
	end

	function TabModule:UpdateDragPosition(pointer)
		local drag = TabModule.Drag
		if not drag.Active or not drag.Tab or not drag.Tab.Frame then
			return
		end

		pointer = pointer or UserInputService:GetMouseLocation()
		local offset = drag.PointerOffset or Vector2.new(0, 0)
		local x = pointer.X - offset.X
		local y = pointer.Y - offset.Y
		drag.Tab.Frame.Position = UDim2.fromOffset(x, y)

		TabModule:UpdateDragOrder(pointer)
	end

	function TabModule:UpdateDragOrder(pointer)
		local drag = TabModule.Drag
		if not drag.Active then
			return
		end

		if not drag.Active or not drag.Tab or not drag.Tab.Frame then return end

		local holder = TabModule.Window and TabModule.Window.TabHolder
		if not holder then return end

		local isHeader = TabModule.Window.TabsInHeader

		pointer = pointer or game:GetService("UserInputService"):GetMouseLocation()
		local offset = drag.PointerOffset or Vector2.new(0, 0)
		local rawX = pointer.X - offset.X
		local rawY = pointer.Y - offset.Y

		local parentAbs = drag.Tab.Frame.Parent and drag.Tab.Frame.Parent.AbsolutePosition or Vector2.new(0,0)
		local draggedSize = isHeader and drag.Tab.Frame.AbsoluteSize.X or drag.Tab.Frame.AbsoluteSize.Y
		local draggedCenter = (isHeader and (rawX + parentAbs.X) or (rawY + parentAbs.Y)) + draggedSize / 2

		local startPos = isHeader and holder.AbsolutePosition.X or holder.AbsolutePosition.Y
		local scroll = isHeader and holder.CanvasPosition.X or holder.CanvasPosition.Y
		local spacing = 4

		local slots = {}
		local currentCoord = startPos - scroll

		for index = 1, #TabModule.TabOrder + 1 do
			local center = currentCoord + draggedSize / 2
			table.insert(slots, { Index = index, Center = center })

			local tabId = TabModule.TabOrder[index]
			if tabId then
				local tab = TabModule.Tabs[tabId]
				local elementSize = 34
				if tab and tab.Frame then
					elementSize = isHeader and tab.Frame.AbsoluteSize.X or tab.Frame.AbsoluteSize.Y
				end
				currentCoord = currentCoord + elementSize + spacing
			end
		end

		local closestDistance = math.huge
		local bestIndex = drag.InsertIndex

		for _, slot in ipairs(slots) do
			local dist = math.abs(draggedCenter - slot.Center)
			if dist < closestDistance then
				closestDistance = dist
				bestIndex = slot.Index
			end
		end

		if bestIndex ~= drag.InsertIndex then
			drag.InsertIndex = bestIndex
			TabModule:ApplyDragLayout()
		end
	end

	function TabModule:EndDrag(cancelled)
		local drag = TabModule.Drag
		if drag.PendingTab then
			TabModule:ClearPendingDrag()
		end

		if not drag.Active then
			return
		end

		drag.Active = false

		if drag.InputEndedConn then
			drag.InputEndedConn:Disconnect()
		end
		drag.InputEndedConn = nil

		local insertIndex = cancelled and drag.OriginalIndex or drag.InsertIndex or (#TabModule.TabOrder + 1)
		insertIndex = math.clamp(insertIndex, 1, #TabModule.TabOrder + 1)
		table.insert(TabModule.TabOrder, insertIndex, drag.TabId)
		TabModule:ApplyLayoutOrder()

		local targetPos = nil
		if drag.Placeholder and drag.Placeholder.Parent then
			targetPos = drag.Placeholder.AbsolutePosition
		end

		local tabFrame = drag.Tab and drag.Tab.Frame
		local originalParent = drag.OriginalParent or (TabModule.Window and TabModule.Window.TabHolder)
		local originalSize = drag.OriginalSize
		local originalAutoSize = drag.OriginalAutomaticSize
		local originalAnchor = drag.OriginalAnchorPoint
		local tabObj = drag.Tab
		local tabId = drag.TabId

		if drag.Scale then
			local scale = drag.Scale
			local tween = TweenService:Create(scale, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 })
			tween:Play()
			tween.Completed:Connect(function()
				if scale and scale.Parent then
					scale:Destroy()
				end
			end)
		end
		drag.Scale = nil

		local function finishDrop()
			if tabFrame and tabFrame.Parent then
				tabFrame.Parent = originalParent or tabFrame.Parent
				tabFrame.Size = originalSize or tabFrame.Size
				tabFrame.AutomaticSize = originalAutoSize or tabFrame.AutomaticSize
				tabFrame.AnchorPoint = originalAnchor or tabFrame.AnchorPoint
			end

			TabModule:RestoreDragZIndex()

			if tabObj and tabObj.SetTransparency then
				tabObj.SetTransparency(tabObj.Selected and 0.85 or 0.89)
			end

			if drag.Placeholder and drag.Placeholder.Parent then
				drag.Placeholder:Destroy()
				drag.Placeholder = nil
			end

			if
				TabModule.Window
				and TabModule.Window.SelectorPosMotor
				and TabModule.SelectedTab == tabId
			then
				TabModule.Window.SelectorPosMotor:setGoal(Spring(TabModule:GetCurrentTabPos(), { frequency = 6 }))
			end
		end

		if tabFrame and targetPos then
			local returnTween = TweenService:Create(
				tabFrame,
				TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Position = UDim2.fromOffset(targetPos.X, targetPos.Y) }
			)
			returnTween:Play()
			returnTween.Completed:Connect(function()
				finishDrop()
			end)
		else
			finishDrop()
		end

		drag.Tab = nil
		drag.TabId = nil
		drag.OriginalParent = nil
		drag.OriginalSize = nil
		drag.OriginalAutomaticSize = nil
		drag.OriginalAnchorPoint = nil
		drag.InsertIndex = nil
		drag.OriginalIndex = nil
		drag.PointerOffset = nil
		drag.ActiveInput = nil
		drag.MoveInput = nil
		drag.ControlType = nil
	end

	function TabModule:OnInputChanged(input)
		local drag = TabModule.Drag

		if drag.PendingTab and drag.PendingStartPosition then
			local isRelevant = false
			if drag.PendingInput == input then
				isRelevant = true
			elseif drag.PendingControlType == Enum.UserInputType.MouseButton1
				and input.UserInputType == Enum.UserInputType.MouseMovement then
				isRelevant = true
			end

			if isRelevant then
				local current = Vector2.new(input.Position.X, input.Position.Y)
				if (current - drag.PendingStartPosition).Magnitude >= TAB_DRAG_THRESHOLD then
					local pendingTab = drag.PendingTab
					local pendingTabId = drag.PendingTabId
					TabModule:ClearPendingDrag()
					TabModule:BeginDrag(pendingTab, pendingTabId, input)
					return
				end
			end
		end

		if drag.Active then
			if drag.MoveInput and input == drag.MoveInput then
				TabModule:UpdateDragPosition(Vector2.new(input.Position.X, input.Position.Y))
			elseif not drag.MoveInput and (input.UserInputType == drag.ControlType or input.UserInputType == Enum.UserInputType.MouseMovement) then
				TabModule:UpdateDragPosition(Vector2.new(input.Position.X, input.Position.Y))
			end
		end
	end

	function TabModule:New(Title, Icon, Parent)
		local Window = TabModule.Window
		local Elements = Library.Elements

		TabModule.TabCount = TabModule.TabCount + 1
		local TabIndex = TabModule.TabCount

		local Tab = {
			Selected = false,
			Name = Title,
			Type = "Tab",
		}

		if Library:GetIcon(Icon) then
			Icon = Library:GetIcon(Icon)
		end

		if Icon == "" or Icon == nil then
			Icon = nil
		end

		Tab.TitleLabel = New("TextLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			Text = Title,
			RichText = true,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font),
			TextSize = 12,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			BackgroundTransparency = 1,
			ZIndex = 11,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})
		Localization:registerText(Tab.TitleLabel, "Text", Title)

		Tab.TitleHolder = New("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = Icon and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
			Size = Icon and UDim2.new(1, -42, 1, 0) or UDim2.new(1, -24, 1, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 11,
		}, {
			Tab.TitleLabel
		})
		Creator.SetupMarquee(Tab.TitleLabel)

		Tab.Frame = New("TextButton", {
			Size = TabModule.Window.TabsInHeader and UDim2.new(0, 0, 1, -8) or UDim2.new(1, 0, 0, 34),
			AutomaticSize = TabModule.Window.TabsInHeader and Enum.AutomaticSize.X or Enum.AutomaticSize.None,
			ClipsDescendants = true,
			BackgroundTransparency = 0.92,
			Parent = Parent,
			ZIndex = 10,
			ThemeTag = {
				BackgroundColor3 = "Tab",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 6),
			}),
			Tab.TitleHolder,
			New("ImageLabel", {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.new(0, 8, 0.5, 0),
				BackgroundTransparency = 1,
				Image = Icon and Icon or nil,
				ZIndex = 11,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}),
		})

		local ContainerLayout = New("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		Tab.ContainerAnim = New("CanvasGroup", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Parent = Window.ContainerHolder,
			Visible = false,
			Position = UDim2.fromOffset(0, 0),
		})

		Tab.ContainerFrame = New("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Parent = Tab.ContainerAnim,
			Visible = true,
			BottomImage = "rbxassetid://6889812791",
			MidImage = "rbxassetid://6889812721",
			TopImage = "rbxassetid://6276641225",
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			ScrollBarImageTransparency = 0.95,
			ScrollBarThickness = 3,
			BorderSizePixel = 0,
			CanvasSize = UDim2.fromScale(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = true,
		}, {
			ContainerLayout,
			New("UIPadding", {
				PaddingRight = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 1),
				PaddingTop = UDim.new(0, 1),
				PaddingBottom = UDim.new(0, 1),
			}),
		})

		Tab.ContainerXMotor = Flipper.SingleMotor.new(0)
		Tab.ContainerTransparencyMotor = Flipper.SingleMotor.new(0)

		Tab.ContainerXMotor:onStep(function(Value)
			if Tab.ContainerAnim and Tab.ContainerAnim.Parent then
				Tab.ContainerAnim.Position = UDim2.fromOffset(Value, 0)
			end
		end)

		Tab.ContainerTransparencyMotor:onStep(function(Value)
			if Tab.ContainerAnim and Tab.ContainerAnim.Parent then
				Tab.ContainerAnim.GroupTransparency = Value
			end
		end)

		Creator.AddSignal(ContainerLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			Tab.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 2)
		end)

		Tab.Motor, Tab.SetTransparency = Creator.SpringMotor(0.92, Tab.Frame, "BackgroundTransparency")

		Creator.AddSignal(Tab.Frame.MouseEnter, function()
			Tab.SetTransparency(Tab.Selected and 0.85 or 0.87)
		end)
		Creator.AddSignal(Tab.Frame.MouseLeave, function()
			Tab.SetTransparency(Tab.Selected and 0.89 or 0.92)
		end)
		Creator.AddSignal(Tab.Frame.InputBegan, function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
			end
		end)
		Creator.AddSignal(Tab.Frame.InputEnded, function(input)
			if TabModule.Drag and TabModule.Drag.PendingInput == input then
				TabModule:ClearPendingDrag()
			end
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Down, function()
			if TabModule:IsDragging() then
				return
			end
			Tab.SetTransparency(0.92)
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Up, function()
			if TabModule:IsDragging() then
				return
			end
			Tab.SetTransparency(Tab.Selected and 0.85 or 0.89)
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Click, function()
			if TabModule:IsDragging() then
				return
			end
			TabModule:SelectTab(TabIndex)
		end)

		TabModule.Containers[TabIndex] = Tab.ContainerAnim
		TabModule.Tabs[TabIndex] = Tab
		table.insert(TabModule.TabOrder, TabIndex)
		Tab.Frame.LayoutOrder = #TabModule.TabOrder
		Tab.Index = TabIndex
		TabModule:ApplyLayoutOrder()

		Tab.Container = Tab.ContainerFrame
		Tab.ScrollFrame = Tab.Container

		if Window.TabsInHeader and Window.TabHolder and Window.TabHolder:FindFirstChild("UIListLayout") then
			local layout = Window.TabHolder:FindFirstChild("UIListLayout")
			Creator.AddSignal(layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				if Window.TabHolder then
					Window.TabHolder.CanvasSize = UDim2.new(0, layout.AbsoluteContentSize.X, 0, 0)
				end
			end)
			task.wait()
			if Window.TabHolder and layout then
				Window.TabHolder.CanvasSize = UDim2.new(0, layout.AbsoluteContentSize.X, 0, 0)
			end
		end

		Tab.SubTabs = {}
		Tab.SubTabContainers = {}
		Tab.SelectedSubTab = 0
		Tab.SubTabCount = 0
		Tab.SubTabHolder = nil

		function Tab:AddSubTab(Title, Icon)
			self.SubTabCount = self.SubTabCount + 1
			local SubTabIndex = self.SubTabCount

			if not self.SubTabHolder then
				local SubTabListLayout = New("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
				})

				self.SubTabHolder = New("ScrollingFrame", {
					Size = UDim2.new(1, -20, 0, 40),
					Position = UDim2.fromOffset(1, 8),
					BackgroundTransparency = 1,
					Parent = self.ContainerFrame,
					ScrollingDirection = Enum.ScrollingDirection.X,
					ScrollBarThickness = 0,
					ScrollBarImageTransparency = 1,
					ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
					CanvasSize = UDim2.fromScale(0, 1),
					BorderSizePixel = 0,
				}, {
					SubTabListLayout,
					New("UIPadding", {
						PaddingLeft = UDim.new(0, 0),
						PaddingRight = UDim.new(0, 0),
						PaddingTop = UDim.new(0, 0),
						PaddingBottom = UDim.new(0, 0),
					}),
				})

				Creator.AddSignal(SubTabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
					self.SubTabHolder.CanvasSize = UDim2.new(0, SubTabListLayout.AbsoluteContentSize.X, 0, 40)
				end)

				local SubTabContainerHolder = New("Frame", {
					Size = UDim2.new(1, -11, 1, -56),
					Position = UDim2.fromOffset(1, 48),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Parent = self.ContainerFrame,
				})

				self.SubTabContainerHolder = SubTabContainerHolder
			end

		local SubTabIcon = Icon
		local resolvedIcon = Library:GetIcon(Icon)
		if resolvedIcon then
			SubTabIcon = resolvedIcon
		end

		if SubTabIcon == "" or SubTabIcon == nil then
			SubTabIcon = nil
		end

			local SubTabButton = New("TextButton", {
				Size = UDim2.new(0, 0, 0, 32),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 0.92,
				Parent = self.SubTabHolder,
				Text = "",
				ThemeTag = {
					BackgroundColor3 = "Tab",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 6),
				}),
				New("UIStroke", {
					Transparency = 1,
					Thickness = 1,
					ThemeTag = {
						Color = "Accent",
					},
				}),
				New("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
				}),
				New("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12),
					PaddingTop = UDim.new(0, 6),
					PaddingBottom = UDim.new(0, 6),
				}),
				SubTabIcon and New("ImageLabel", {
					Size = UDim2.fromOffset(16, 16),
					BackgroundTransparency = 1,
					Image = SubTabIcon,
					LayoutOrder = 1,
					ThemeTag = {
						ImageColor3 = "Text",
					},
				}) or nil,
			local SubTabLabel = New("TextLabel", {
				Text = Title,
				RichText = true,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextTransparency = 0,
				FontFace = resolveFont(Library.Font),
				TextSize = 12,
				TextXAlignment = "Left",
				TextYAlignment = "Center",
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
					ThemeTag = {
						TextColor3 = "Text",
					},
				}),
			})

			local SubTabContainerAnim = New("CanvasGroup", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				GroupTransparency = 0,
				Parent = self.SubTabContainerHolder,
				Visible = false,
				Position = UDim2.fromOffset(0, 0),
			})

			local SubTabContainer = New("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Parent = SubTabContainerAnim,
				Visible = true,
				BottomImage = "rbxassetid://6889812791",
				MidImage = "rbxassetid://6889812721",
				TopImage = "rbxassetid://6276641225",
				ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
				ScrollBarImageTransparency = 0.95,
				ScrollBarThickness = 3,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = true,
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder,
				}),
				New("UIPadding", {
					PaddingRight = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 1),
					PaddingTop = UDim.new(0, 1),
					PaddingBottom = UDim.new(0, 1),
				}),
			})

			local SubTabLayout = SubTabContainer:FindFirstChild("UIListLayout")
			Creator.AddSignal(SubTabLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				SubTabContainer.CanvasSize = UDim2.new(0, 0, 0, SubTabLayout.AbsoluteContentSize.Y + 2)
			end)

			local SubTabXMotor = Flipper.SingleMotor.new(0)
			local SubTabTransparencyMotor = Flipper.SingleMotor.new(0)

			SubTabXMotor:onStep(function(Value)
				if SubTabContainerAnim and SubTabContainerAnim.Parent then
					SubTabContainerAnim.Position = UDim2.fromOffset(Value, 0)
				end
			end)

			SubTabTransparencyMotor:onStep(function(Value)
				if SubTabContainerAnim and SubTabContainerAnim.Parent then
					SubTabContainerAnim.GroupTransparency = Value
				end
			end)

			local SubTabMotor, SubTabSetTransparency = Creator.SpringMotor(0.92, SubTabButton, "BackgroundTransparency")
			local SubTabStroke = SubTabButton:FindFirstChild("UIStroke")

			local function UpdateSubTabAppearance()
				if self.SelectedSubTab == SubTabIndex then
					SubTabSetTransparency(0.75)
					if SubTabStroke then
						SubTabStroke.Transparency = 0
					end
				else
					SubTabSetTransparency(0.92)
					if SubTabStroke then
						SubTabStroke.Transparency = 1
					end
				end
			end

			Creator.AddSignal(SubTabButton.MouseEnter, function()
				if self.SelectedSubTab ~= SubTabIndex then
					SubTabSetTransparency(0.87)
				end
			end)

			Creator.AddSignal(SubTabButton.MouseLeave, function()
				UpdateSubTabAppearance()
			end)

			Creator.AddSignal(SubTabButton.MouseButton1Down, function()
				SubTabSetTransparency(0.92)
			end)

			Creator.AddSignal(SubTabButton.MouseButton1Up, function()
				UpdateSubTabAppearance()
			end)

			UpdateSubTabAppearance()

			Creator.AddSignal(SubTabButton.MouseButton1Click, function()
				self:SelectSubTab(SubTabIndex)
			end)

			local SubTab = {
				Type = "SubTab",
				Name = Title,
				TitleLabel = SubTabLabel,
				Button = SubTabButton,
				Container = SubTabContainer,
				ContainerAnim = SubTabContainerAnim,
				XMotor = SubTabXMotor,
				TransparencyMotor = SubTabTransparencyMotor,
				SetTransparency = SubTabSetTransparency,
				Selected = false,
				Parent = self,
			}
			Localization:registerText(SubTabLabel, "Text", Title)

			self.SubTabs[SubTabIndex] = SubTab
			self.SubTabContainers[SubTabIndex] = SubTabContainerAnim

			if self.SubTabCount == 1 then
				self:SelectSubTab(SubTabIndex)
			end

			function SubTab:AddSection(SectionTitle, SectionIcon)
				local Section = { Type = "Section", Parent = SubTab }

				local Icon = SectionIcon
				if Library:GetIcon(Icon) then
					Icon = Library:GetIcon(Icon)
				end

				if Icon == "" or Icon == nil then
					Icon = nil
				end

				local SectionFrame = Components.Section(SectionTitle, SubTab.Container, Icon)
				Section.Container = SectionFrame.Container
				Section.ScrollFrame = SubTab.Container

				setmetatable(Section, Elements)
				return Section
			end

			setmetatable(SubTab, Elements)
			return SubTab
		end

		function Tab:SelectSubTab(SubTabIndex)
			if self.SelectedSubTab == SubTabIndex then
				return
			end

			local PreviousSubTab = self.SelectedSubTab
			local Direction = (PreviousSubTab > 0 and SubTabIndex > PreviousSubTab) and 1 or -1
			if PreviousSubTab == 0 then
				Direction = 0
			end

			local ContainerSize = self.SubTabContainerHolder and self.SubTabContainerHolder.AbsoluteSize.X or 500
			local SlideDistance = math.min(ContainerSize * 0.15, 60)

			self.SelectedSubTab = SubTabIndex

			if Window and not Window.TabsInHeader and Window.TabDisplay then
				Window.TabDisplay.Text = self.Name .. " <font color=\"#888\">/</font> " .. self.SubTabs[SubTabIndex].Title
			end

			for idx, SubTabObj in next, self.SubTabs do
				SubTabObj.Selected = (idx == SubTabIndex)
				local SubTabStroke = SubTabObj.Button:FindFirstChild("UIStroke")
				if idx == SubTabIndex then
					SubTabObj.SetTransparency(0.75)
					if SubTabStroke then
						SubTabStroke.Transparency = 0
					end
				else
					SubTabObj.SetTransparency(0.92)
					if SubTabStroke then
						SubTabStroke.Transparency = 1
					end
				end
			end

			if PreviousSubTab > 0 and PreviousSubTab ~= SubTabIndex and self.SubTabs[PreviousSubTab] and self.SubTabs[SubTabIndex] then
				local OldContainer = self.SubTabs[PreviousSubTab].ContainerAnim
				local NewContainer = self.SubTabs[SubTabIndex].ContainerAnim
				local OldSubTab = self.SubTabs[PreviousSubTab]
				local NewSubTab = self.SubTabs[SubTabIndex]

				for idx, Container in next, self.SubTabContainers do
					if Container and idx ~= PreviousSubTab and idx ~= SubTabIndex then
						Container.Visible = false
						Container.Position = UDim2.fromOffset(0, 0)
						Container.GroupTransparency = 0
						if self.SubTabs[idx] then
							pcall(function()
								self.SubTabs[idx].XMotor:setGoal(Instant(0))
								self.SubTabs[idx].TransparencyMotor:setGoal(Instant(0))
							end)
						end
					end
				end

				OldContainer.Visible = true
				OldContainer.Position = UDim2.fromOffset(0, 0)
				OldContainer.GroupTransparency = 0
				pcall(function()
					OldSubTab.XMotor:setGoal(Instant(0))
					OldSubTab.TransparencyMotor:setGoal(Instant(0))
				end)

				NewContainer.Visible = true
				NewContainer.Position = UDim2.fromOffset(Direction * SlideDistance, 0)
				NewContainer.GroupTransparency = 1
				pcall(function()
					NewSubTab.XMotor:setGoal(Instant(Direction * SlideDistance))
					NewSubTab.TransparencyMotor:setGoal(Instant(1))
				end)

				task.wait()

				pcall(function()
					OldSubTab.XMotor:setGoal(Spring(-Direction * SlideDistance, { frequency = 4, dampingRatio = 0.7 }))
					OldSubTab.TransparencyMotor:setGoal(Spring(1, { frequency = 4, dampingRatio = 0.7 }))
				end)

				pcall(function()
					NewSubTab.XMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
					NewSubTab.TransparencyMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
				end)

				task.spawn(function()
					task.wait(0.5)
					if self.SelectedSubTab == SubTabIndex and self.SubTabs[PreviousSubTab] then
						local OldContainer = self.SubTabs[PreviousSubTab].ContainerAnim
						local OldSubTab = self.SubTabs[PreviousSubTab]
						if OldContainer and OldContainer.Parent then
							OldContainer.Visible = false
							OldContainer.Position = UDim2.fromOffset(0, 0)
							OldContainer.GroupTransparency = 0
						end
						if OldSubTab and OldSubTab.XMotor and OldSubTab.TransparencyMotor then
							pcall(function()
								OldSubTab.XMotor:setGoal(Instant(0))
								OldSubTab.TransparencyMotor:setGoal(Instant(0))
							end)
						end
					end
				end)
			else
				for idx, Container in next, self.SubTabContainers do
					if Container then
						Container.Visible = (idx == SubTabIndex)
						Container.Position = UDim2.fromOffset(0, 0)
						Container.GroupTransparency = 0
						if self.SubTabs[idx] then
							pcall(function()
								self.SubTabs[idx].XMotor:setGoal(Instant(0))
								self.SubTabs[idx].TransparencyMotor:setGoal(Instant(0))
							end)
						end
					end
				end
			end
		end

		function Tab:AddSection(SectionTitle, SectionIcon)
			if self.SelectedSubTab > 0 and self.SubTabs[self.SelectedSubTab] then
				return self.SubTabs[self.SelectedSubTab]:AddSection(SectionTitle, SectionIcon)
			end

			local Section = { Type = "Section", Parent = self }

			local Icon = SectionIcon
			local resolvedIcon = Library:GetIcon(Icon)
			if resolvedIcon then
				Icon = resolvedIcon
			end

			if Icon == "" or Icon == nil then
				Icon = nil
			end

			local SectionFrame = Components.Section(SectionTitle, Tab.Container, Icon)
			Section.Container = SectionFrame.Container
			Section.ScrollFrame = Tab.Container

			setmetatable(Section, Elements)
			return Section
		end

		setmetatable(Tab, Elements)
		return Tab
	end

	function TabModule:SelectTab(Tab)
		if TabModule.SelectedTab == Tab then
			return
		end

		if TabModule.AnimationTask then
			task.cancel(TabModule.AnimationTask)
			TabModule.AnimationTask = nil
		end

		local Window = TabModule.Window
		local PreviousTab = TabModule.SelectedTab

		local Direction = (PreviousTab > 0 and Tab > PreviousTab) and 1 or -1
		if PreviousTab == 0 then
			Direction = 0
		end

		local ContainerSize = Window.ContainerHolder and Window.ContainerHolder.AbsoluteSize.X or (Window.ContainerCanvas and Window.ContainerCanvas.AbsoluteSize.X or 500)
		local SlideDistance = math.min(ContainerSize * 0.15, 60)

		for _, Option in next, Library.Options do
			if Option and Option.Type == "Dropdown" and Option.Opened then
				pcall(function()
					Option:Close()
				end)
			end
		end

		TabModule.SelectedTab = Tab
		TabModule.CurrentAnimationTab = Tab

		for _, TabObject in next, TabModule.Tabs do
			TabObject.SetTransparency(0.92)
			TabObject.Selected = false
		end
		TabModule.Tabs[Tab].SetTransparency(0.89)
		TabModule.Tabs[Tab].Selected = true

		if not Window.TabsInHeader then
			Window.TabDisplay.Text = TabModule.Tabs[Tab].Name
		end
		Window.SelectorPosMotor:setGoal(Spring(TabModule:GetCurrentTabPos(), { frequency = 6 }))
		if Window.TabsInHeader then
			local tabFrame = TabModule.Tabs[Tab].Frame
			if tabFrame and Window.HeaderSelector then
				Window.SelectorSizeMotor:setGoal(Spring(tabFrame.AbsoluteSize.X, { frequency = 6 }))
			end
		end

		if PreviousTab > 0 and PreviousTab ~= Tab and TabModule.Tabs[PreviousTab] and TabModule.Tabs[Tab] then
			local OldContainer = TabModule.Tabs[PreviousTab].ContainerAnim
			local NewContainer = TabModule.Tabs[Tab].ContainerAnim
			local OldTab = TabModule.Tabs[PreviousTab]
			local NewTab = TabModule.Tabs[Tab]

			if not OldContainer or not NewContainer or not OldTab.ContainerXMotor or not OldTab.ContainerTransparencyMotor or not NewTab.ContainerXMotor or not NewTab.ContainerTransparencyMotor then
				for idx, Container in next, TabModule.Containers do
					if Container then
						Container.Visible = (idx == Tab)
						Container.Position = UDim2.fromOffset(0, 0)
						Container.GroupTransparency = 0
					end
				end
				return
			end

			for idx, Container in next, TabModule.Containers do
				if Container and idx ~= PreviousTab and idx ~= Tab then
					Container.Visible = false
					Container.Position = UDim2.fromOffset(0, 0)
					Container.GroupTransparency = 0
					if TabModule.Tabs[idx] and TabModule.Tabs[idx].ContainerXMotor and TabModule.Tabs[idx].ContainerTransparencyMotor then
						pcall(function()
							TabModule.Tabs[idx].ContainerXMotor:setGoal(Instant(0))
							TabModule.Tabs[idx].ContainerTransparencyMotor:setGoal(Instant(0))
						end)
					end
				end
			end

			OldContainer.Visible = true
			OldContainer.Position = UDim2.fromOffset(0, 0)
			OldContainer.GroupTransparency = 0
			pcall(function()
				OldTab.ContainerXMotor:setGoal(Instant(0))
				OldTab.ContainerTransparencyMotor:setGoal(Instant(0))
			end)

			NewContainer.Visible = true
			NewContainer.Position = UDim2.fromOffset(Direction * SlideDistance, 0)
			NewContainer.GroupTransparency = 1
			pcall(function()
				NewTab.ContainerXMotor:setGoal(Instant(Direction * SlideDistance))
				NewTab.ContainerTransparencyMotor:setGoal(Instant(1))
			end)

			task.wait()

			pcall(function()
				OldTab.ContainerXMotor:setGoal(Spring(-Direction * SlideDistance, { frequency = 4, dampingRatio = 0.7 }))
				OldTab.ContainerTransparencyMotor:setGoal(Spring(1, { frequency = 4, dampingRatio = 0.7 }))
			end)

			pcall(function()
				NewTab.ContainerXMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
				NewTab.ContainerTransparencyMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
			end)

			TabModule.AnimationTask = task.spawn(function()
				task.wait(0.5)
				if TabModule.CurrentAnimationTab == Tab and TabModule.Tabs[PreviousTab] then
					local OldContainer = TabModule.Tabs[PreviousTab].ContainerAnim
					local OldTab = TabModule.Tabs[PreviousTab]
					if OldContainer and OldContainer.Parent then
						OldContainer.Visible = false
						OldContainer.Position = UDim2.fromOffset(0, 0)
						OldContainer.GroupTransparency = 0
					end
					if OldTab and OldTab.ContainerXMotor and OldTab.ContainerTransparencyMotor then
						pcall(function()
							OldTab.ContainerXMotor:setGoal(Instant(0))
							OldTab.ContainerTransparencyMotor:setGoal(Instant(0))
						end)
					end
					TabModule.AnimationTask = nil
				end
			end)
		else
			for idx, Container in next, TabModule.Containers do
				if Container then
					Container.Visible = (idx == Tab)
					Container.Position = UDim2.fromOffset(0, 0)
					Container.GroupTransparency = 0
					if TabModule.Tabs[idx] and TabModule.Tabs[idx].ContainerXMotor and TabModule.Tabs[idx].ContainerTransparencyMotor then
						pcall(function()
							TabModule.Tabs[idx].ContainerXMotor:setGoal(Instant(0))
							TabModule.Tabs[idx].ContainerTransparencyMotor:setGoal(Instant(0))
						end)
					end
				end
			end
		end
	end

	Components.Tab = (function()
		return TabModule
	end)()
end
