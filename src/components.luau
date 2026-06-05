local Creator = require("creator")
local Library = require("library")
local Flipper = require("flipper")
local resolveFont = Creator.resolveFont

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local fischbypass
if game.GameId == 5750914919 then
	fischbypass = true
end

local Components = {
	Assets = {
		Close = Library:GetIcon("x"),
		Min = Library:GetIcon("minus"),
		Max = Library:GetIcon("maximize-2"),
		Restore = Library:GetIcon("minimize-2"),
	},
}

Components.Element = (function()
	local New = Creator.New

	local Spring = Flipper.Spring.new

	return function(Title, Desc, Parent, Hover, Options)
		local Element = {}
		local Options = Options or {}

		Element.TitleLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Title,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Element.TitleHolder = New("Frame", {
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = 2,
		}, {
			Element.TitleLabel
		})
		Creator.SetupMarquee(Element.TitleLabel)

		Element.Header = New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 0, 16),
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 5),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
		})

		if Options and Options.Icon then
			local iconImage = Options.Icon
			pcall(function()
				if Library and Library.GetIcon then
					local resolved = Library:GetIcon(Options.Icon)
					if resolved then iconImage = resolved end
				end
			end)
			Element.IconImage = New("ImageLabel", {
				Image = iconImage,
				Size = UDim2.fromOffset(16, 16),
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			})
			Element.IconImage.Parent = Element.Header
		end

		Element.TitleHolder.Parent = Element.Header

		Element.DescLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Desc,
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			ThemeTag = {
				TextColor3 = "SubText",
			},
		})

		Element.LabelHolder = New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -28, 0, 0),
		}, {
			New("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
			New("UIPadding", {
				PaddingBottom = UDim.new(0, 13),
				PaddingTop = UDim.new(0, 13),
			}),
			Element.Header,
			Element.DescLabel,
		})

		Element.Border = New("UIStroke", {
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(0, 0, 0),
			ThemeTag = {
				Color = "ElementBorder",
			},
		})

		Element.Frame = New("TextButton", {
			Visible = Options.Visible and Options.Visible or true,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 0.89,
			BackgroundColor3 = Color3.fromRGB(130, 130, 130),
			Parent = Parent,
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = "",
			LayoutOrder = 7,
			ThemeTag = {
				BackgroundColor3 = "Element",
				BackgroundTransparency = "ElementTransparency",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			Element.Border,
			Element.LabelHolder,
		})

		function Element:SetTitle(Set)
			Element.TitleLabel.Text = Set
			local hasTitle = (Set ~= nil and Set ~= "")
			Element.Header.Visible = hasTitle

			if not hasTitle then
				if Element.IconImage then
					if not Element.DescRow then
						Element.DescRow = New("Frame", {
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 14),
							LayoutOrder = 2,
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0, 5),
								FillDirection = Enum.FillDirection.Horizontal,
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = Enum.VerticalAlignment.Center,
							}),
						})
						Element.DescRow.Parent = Element.LabelHolder
					end

					if not Element.DescIconImage then
						Element.DescIconImage = New("ImageLabel", {
							Image = Element.IconImage.Image,
							Size = UDim2.fromOffset(16, 16),
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							ThemeTag = {
								ImageColor3 = "Text",
							},
						})
						Element.DescIconImage.Parent = Element.DescRow
					else
						Element.DescIconImage.Image = Element.IconImage.Image
						Element.DescIconImage.Parent = Element.DescRow
					end

					Element.DescLabel.Parent = Element.DescRow
					Element.DescLabel.LayoutOrder = 2
					Element.DescLabel.Size = UDim2.new(1, -24, 0, 14)
				else
					if Element.DescRow then
						Element.DescRow:Destroy()
						Element.DescRow = nil
						Element.DescIconImage = nil
					end
					Element.DescLabel.Parent = Element.LabelHolder
					Element.DescLabel.LayoutOrder = 2
					Element.DescLabel.Size = UDim2.new(1, 0, 0, 14)
				end
			else
				if Element.DescRow then
					Element.DescRow:Destroy()
					Element.DescRow = nil
					Element.DescIconImage = nil
				end
				Element.DescLabel.Parent = Element.LabelHolder
				Element.DescLabel.LayoutOrder = 2
				Element.DescLabel.Size = UDim2.new(1, 0, 0, 14)
			end
			if Library.Window and Library.Window.AllElements and Library.Window.AllElements[Element.Frame] then
				Library.Window.AllElements[Element.Frame].title = Set
			elseif Library.Windows and #Library.Windows > 0 then
				local currentWindow = Library.Windows[#Library.Windows]
				if currentWindow and currentWindow.AllElements and currentWindow.AllElements[Element.Frame] then
					currentWindow.AllElements[Element.Frame].title = Set
				end
			end
		end

		function Element:Visible(Bool)
			Element.Frame.Visible = Bool
		end

		function Element:SetDesc(Set)
			if Set == nil then
				Set = ""
			end
			if Set == "" then
				Element.DescLabel.Visible = false
			else
				Element.DescLabel.Visible = true
			end
			Element.DescLabel.Text = Set
			if Library.Window and Library.Window.AllElements and Library.Window.AllElements[Element.Frame] then
				Library.Window.AllElements[Element.Frame].description = Set
			elseif Library.Windows and #Library.Windows > 0 then
				local currentWindow = Library.Windows[#Library.Windows]
				if currentWindow and currentWindow.AllElements and currentWindow.AllElements[Element.Frame] then
					currentWindow.AllElements[Element.Frame].description = Set
				end
			end
		end

		function Element:GetTitle()
			return Element.TitleLabel.Text
		end

		function Element:GetDesc()
			return Element.DescLabel.Text
		end

		function Element:Destroy()
			Element.Frame:Destroy()
		end

		Element.Header.Visible = not (Title == nil or Title == "")

		Element:SetTitle(Title or "")
		Element:SetDesc(Desc)


		if Library.Window and Library.Window.RegisterElement then
			Library.Window.RegisterElement(Element.Frame, Title, "Element", Desc)
		elseif Library.Windows and #Library.Windows > 0 then
			local currentWindow = Library.Windows[#Library.Windows]
			if currentWindow and currentWindow.RegisterElement then
				currentWindow.RegisterElement(Element.Frame, Title, "Element", Desc)
			end
		end

		if Hover then
			local Themes = Library.Themes
			local Motor, SetTransparency = Creator.SpringMotor(
				Creator.GetThemeProperty("ElementTransparency"),
				Element.Frame,
				"BackgroundTransparency",
				false,
				true
			)

			Creator.AddSignal(Element.Frame.MouseEnter, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
			end)
			Creator.AddSignal(Element.Frame.MouseLeave, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency"))
			end)
			Creator.AddSignal(Element.Frame.MouseButton1Down, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency") + Creator.GetThemeProperty("HoverChange"))
			end)
			Creator.AddSignal(Element.Frame.MouseButton1Up, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
			end)
		end

		return Element
	end
end)()
Components.Section = (function()
	local New = Creator.New

	return function(Title, Parent, Icon)
		local Section = {}

		Section.Layout = New("UIListLayout", {
			Padding = UDim.new(0, 5),
		})

		Section.Container = New("Frame", {
			Size = UDim2.new(1, 0, 0, 26),
			Position = UDim2.fromOffset(0, 24),
			BackgroundTransparency = 1,
		}, {
			Section.Layout,
		})

		local SectionHeader = New("Frame", {
			Size = UDim2.new(1, -16, 0, 18),
			Position = UDim2.fromOffset(0, 2),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 5),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
			Icon and New("ImageLabel", {
				Image = Icon,
				Size = UDim2.fromOffset(16, 16),
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}) or nil,
		})

		Section.TitleLabel = New("TextLabel", {
			RichText = true,
			Text = Title,
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.SemiBold),
			TextSize = 18,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, Icon and -21 or 0, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})
		Section.TitleLabel.Parent = SectionHeader
		Creator.SetupMarquee(Section.TitleLabel)

		Section.Root = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 26),
			LayoutOrder = 7,
			Parent = Parent,
		}, {
			SectionHeader,
			Section.Container,
		})

		Creator.AddSignal(Section.Layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			Section.Container.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y)
			Section.Root.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y + 25)
		end)


		if Library.Window and Library.Window.RegisterElement then
			Library.Window.RegisterElement(Section.Root, Title, "Section")
		elseif Library.Windows and #Library.Windows > 0 then
			local currentWindow = Library.Windows[#Library.Windows]
			if currentWindow and currentWindow.RegisterElement then
				currentWindow.RegisterElement(Section.Root, Title, "Section")
			end
		end

		return Section
	end
end)()
Components.Tab = (function()
	local New = Creator.New
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local Components = Components

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

		if not fischbypass then 
			if Library:GetIcon(Icon) then
				Icon = Library:GetIcon(Icon)
			end

			if Icon == "" or Icon == nil then
				Icon = nil
			end
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

		Tab.TitleHolder = New("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = not fischbypass and Icon and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
			Size = not fischbypass and Icon and UDim2.new(1, -42, 1, 0) or UDim2.new(1, -24, 1, 0),
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
				-- TabModule:StartPendingDrag(Tab, TabIndex, input) -- Reordering temporarily disabled
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
			if not fischbypass then 
				local resolvedIcon = Library:GetIcon(Icon)
				if resolvedIcon then
					SubTabIcon = resolvedIcon
				end

			if SubTabIcon == "" or SubTabIcon == nil then
				SubTabIcon = nil
			end
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
				New("TextLabel", {
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
				Button = SubTabButton,
				Container = SubTabContainer,
				ContainerAnim = SubTabContainerAnim,
				XMotor = SubTabXMotor,
				TransparencyMotor = SubTabTransparencyMotor,
				SetTransparency = SubTabSetTransparency,
				Selected = false,
				Parent = self,
			}

			self.SubTabs[SubTabIndex] = SubTab
			self.SubTabContainers[SubTabIndex] = SubTabContainerAnim

			if self.SubTabCount == 1 then
				self:SelectSubTab(SubTabIndex)
			end

			function SubTab:AddSection(SectionTitle, SectionIcon)
				local Section = { Type = "Section", Parent = SubTab }

				local Icon = SectionIcon
				if not fischbypass then 
					if Library:GetIcon(Icon) then
						Icon = Library:GetIcon(Icon)
					end

			if Icon == "" or Icon == nil then
				Icon = nil
					end
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
			if not fischbypass then 
				local resolvedIcon = Library:GetIcon(Icon)
				if resolvedIcon then
					Icon = resolvedIcon
				end

				if Icon == "" or Icon == nil then
					Icon = nil
				end
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

	return TabModule
end)()
Components.Button = (function()
	local New = Creator.New

	local Spring = Flipper.Spring.new

	return function(Theme, Parent, DialogCheck)
		DialogCheck = DialogCheck or false
		local Button = {}

		Button.Title = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Button.HoverFrame = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ThemeTag = {
				BackgroundColor3 = "Hover",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		Button.Frame = New("TextButton", {
			Size = UDim2.new(0, 0, 0, 32),
			Parent = Parent,
			ThemeTag = {
				BackgroundColor3 = "DialogButton",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = 0.65,
				ThemeTag = {
					Color = "DialogButtonBorder",
				},
			}),
			Button.HoverFrame,
			Button.Title,
		})
		local Motor, SetTransparency = Creator.SpringMotor(1, Button.HoverFrame, "BackgroundTransparency", DialogCheck)
		Creator.AddSignal(Button.Frame.MouseEnter, function()
			SetTransparency(0.97)
		end)
		Creator.AddSignal(Button.Frame.MouseLeave, function()
			SetTransparency(1)
		end)
		Creator.AddSignal(Button.Frame.MouseButton1Down, function()
			SetTransparency(1)
		end)
		Creator.AddSignal(Button.Frame.MouseButton1Up, function()
			SetTransparency(0.97)
		end)

		return Button
	end
end)()
Components.Dialog = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	local Dialog = {
		Window = nil,
	}

	function Dialog:Init(Window)
		Dialog.Window = Window
		return Dialog
	end

	function Dialog:Create()
		local NewDialog = {
			Buttons = 0,
		}

		NewDialog.TintFrame = New("TextButton", {
			Text = "",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			Parent = Dialog.Window.Root,
			ZIndex = 1,
			ZLayer = "dialog",
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		})

		local TintMotor, TintTransparency = Creator.SpringMotor(1, NewDialog.TintFrame, "BackgroundTransparency", true)

		NewDialog.ButtonHolder = New("Frame", {
			Size = UDim2.new(1, -40, 1, -40),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 10),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),
		})

		NewDialog.ButtonHolderFrame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 70),
			Position = UDim2.new(0, 0, 1, -70),
			ZIndex = 961,
			ThemeTag = {
				BackgroundColor3 = "DialogHolder",
			},
		}, {
			New("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				ThemeTag = {
					BackgroundColor3 = "DialogHolderLine",
				},
			}),
			NewDialog.ButtonHolder,
		})

		NewDialog.Title = New("TextLabel", {
			FontFace = resolveFont(Library.Font, Enum.FontWeight.SemiBold),
			Text = "Dialog",
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 22,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 22),
			Position = UDim2.fromOffset(20, 25),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewDialog.Scale = New("UIScale", {
			Scale = 1,
		})

		local ScaleMotor, Scale = Creator.SpringMotor(1.1, NewDialog.Scale, "Scale")

		NewDialog.Root = New("CanvasGroup", {
			Size = UDim2.fromOffset(300, 165),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			GroupTransparency = 1,
			Parent = NewDialog.TintFrame,
			ZIndex = 2,
			ZLayer = "dialog",
			ThemeTag = {
				BackgroundColor3 = "Dialog",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ThemeTag = {
					Color = "DialogBorder",
				},
			}),
			NewDialog.Scale,
			NewDialog.Title,
			NewDialog.ButtonHolderFrame,
		})

		local RootMotor, RootTransparency = Creator.SpringMotor(1, NewDialog.Root, "GroupTransparency")

		function NewDialog:Open()
			Library.DialogOpen = true
			NewDialog.Scale.Scale = 1.1
			TintTransparency(0.75)
			RootTransparency(0)
			Scale(1)
		end

		function NewDialog:Close()
			Library.DialogOpen = false
			TintTransparency(1)
			RootTransparency(1)
			Scale(1.1)
			task.wait(0.15)
			if NewDialog.TintFrame and NewDialog.TintFrame.Parent then
				NewDialog.TintFrame:Destroy()
			end
		end

		function NewDialog:Button(Title, Callback)
			NewDialog.Buttons = NewDialog.Buttons + 1
			Title = Title or "Button"
			Callback = Callback or function() end

			local Button = Components.Button("", NewDialog.ButtonHolder, true)
			Button.Title.Text = Title

			for _, Btn in next, NewDialog.ButtonHolder:GetChildren() do
				if Btn:IsA("TextButton") then
					Btn.Size =
						UDim2.new(1 / NewDialog.Buttons, -(((NewDialog.Buttons - 1) * 10) / NewDialog.Buttons), 0, 32)
				end
			end

			Creator.AddSignal(Button.Frame.MouseButton1Click, function()
				Library:SafeCallback(Callback)
				pcall(function()
					NewDialog:Close()
				end)
			end)

			return Button
		end

		return NewDialog
	end

	return Dialog
end)()
Components.Notification = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	local Notification = {}

	function Notification:Init(GUI)
		Library.ActiveNotifications = Library.ActiveNotifications or {}

		Notification.Holder = New("Frame", {
			Position = UDim2.new(1, -20, 1, -20),
			Size = UDim2.new(0, 330, 1, -40),
			AnchorPoint = Vector2.new(1, 1),
			BackgroundTransparency = 1,
			Parent = GUI,
			ZIndex = 1,
			ZLayer = "notification",
		}, {
			New("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 10),
			}),
		})
	end

	function Notification:New(Config)
		Config.Title = Config.Title or "Title"
		Config.Content = Config.Content or "Content"
		Config.SubContent = Config.SubContent or ""
		Config.Duration = Config.Duration or nil
		local NewNotification = {
			Closed = false,
		}

		NewNotification.AcrylicPaint = Acrylic.AcrylicPaint()

		local resolvedIcon = nil
		if Config.Icon then
			resolvedIcon = Library:GetIcon(Config.Icon) or (Config.Icon:match("rbxasset") and Config.Icon or nil)
		end

		if resolvedIcon then
			NewNotification.IconIndicator = New("ImageLabel", {
				Image = resolvedIcon,
				Size = UDim2.fromOffset(20, 20),
				Position = UDim2.new(0, 13, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			})
		end

		NewNotification.Title = New("TextLabel", {
			Position = UDim2.new(0, resolvedIcon and 42 or 14, 0, 17),
			Text = Config.Title,
			RichText = true,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.SemiBold),
			TextSize = 13,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, resolvedIcon and -80 or -50, 0, 16),
			TextWrapped = false,
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewNotification.ContentLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Config.Content,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 14),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextWrapped = true,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewNotification.SubContentLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Config.SubContent,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 14),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextWrapped = true,
			ThemeTag = {
				TextColor3 = "SubText",
			},
		})

		NewNotification.LabelHolder = New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(resolvedIcon and 42 or 14, 40),
			Size = UDim2.new(1, resolvedIcon and -58 or -28, 0, 0),
		}, {
			New("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, 4),
			}),
			NewNotification.ContentLabel,
			NewNotification.SubContentLabel,
		})

		NewNotification.CloseButton = New("TextButton", {
			Text = "",
			Position = UDim2.new(1, -14, 0, 13),
			Size = UDim2.fromOffset(20, 20),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
		}, {
			New("ImageLabel", {
				Image = Components.Assets.Close,
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}),
		})

		NewNotification.Root = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 60),
			Position = UDim2.fromScale(1, 0),
			ZIndex = 3,
			ZLayer = "notification",
			ClipsDescendants = true,
		}, {
			NewNotification.AcrylicPaint.Frame,
			NewNotification.IconIndicator,
			NewNotification.Title,
			NewNotification.CloseButton,
			NewNotification.LabelHolder,
		})

		Creator.SetupMarquee(NewNotification.Title)

		if Config.Content == "" then
			NewNotification.ContentLabel.Visible = false
		end

		if Config.SubContent == "" then
			NewNotification.SubContentLabel.Visible = false
		end

		NewNotification.Holder = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 60),
			Parent = Notification.Holder,
			ZIndex = 2,
			ZLayer = "notification",
			ClipsDescendants = true,
		}, {
			NewNotification.Root,
		})

		local RootMotor = Flipper.GroupMotor.new({
			Scale = 1,
			Offset = 60,
		})

		RootMotor:onStep(function(Values)
			NewNotification.Root.Position = UDim2.new(Values.Scale, Values.Offset, 0, 0)
		end)

		Creator.AddSignal(NewNotification.CloseButton.MouseButton1Click, function()
			NewNotification:Close()
		end)
		function NewNotification:ApplyTransparency()
		end

		function NewNotification:Open()
			task.spawn(function()
				local ContentSize = NewNotification.LabelHolder.AbsoluteSize.Y
				local finalHeight = 52 + ContentSize
				NewNotification.Holder.Size = UDim2.new(1, 0, 0, finalHeight)
				NewNotification.Root.Size = UDim2.new(1, 0, 0, finalHeight)

				task.wait()
				
				local updatedContentSize = NewNotification.LabelHolder.AbsoluteSize.Y
				local updatedHeight = 52 + updatedContentSize
				NewNotification.Holder.Size = UDim2.new(1, 0, 0, updatedHeight)
				NewNotification.Root.Size = UDim2.new(1, 0, 0, updatedHeight)
				
				RootMotor:setGoal({
					Scale = Spring(0, { frequency = 4 }),
					Offset = Spring(0, { frequency = 4 }),
				})
			end)
		end

		function NewNotification:Close()
			if not NewNotification.Closed then
				NewNotification.Closed = true

				for i, notif in pairs(Library.ActiveNotifications or {}) do
					if notif == NewNotification then
						table.remove(Library.ActiveNotifications, i)
						break
					end
				end

				task.spawn(function()
					if Library.Unloaded then return end
					RootMotor:setGoal({
						Scale = Spring(1, { frequency = 5 }),
						Offset = Spring(60, { frequency = 5 }),
					})
					task.wait(0.4)
					if Library.Unloaded then return end
					if Library.UseAcrylic then
						NewNotification.AcrylicPaint.Model:Destroy()
					end
					NewNotification.Holder:Destroy()
				end)
			end
		end

		table.insert(Library.ActiveNotifications, NewNotification)

		NewNotification:Open()
		if Config.Duration then
			task.delay(Config.Duration, function()
				NewNotification:Close()
			end)
		end
		return NewNotification
	end

	return Notification
end)()
Components.Textbox = (function()
	local New = Creator.New

	return function(Parent, Acrylic)
		Acrylic = Acrylic or false
		local Textbox = {}

		Textbox.Input = New("TextBox", {
			FontFace = resolveFont(Library.Font),
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(10, 0),
			ThemeTag = {
				TextColor3 = "Text",
				PlaceholderColor3 = "SubText",
			},
		})

		Textbox.Container = New("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Position = UDim2.new(0, 6, 0, 0),
			Size = UDim2.new(1, -12, 1, 0),
		}, {
			Textbox.Input,
		})

		Textbox.Indicator = New("Frame", {
			Size = UDim2.new(1, -4, 0, 1),
			Position = UDim2.new(0, 2, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = Acrylic and 0.5 or 0,
			ThemeTag = {
				BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine",
			},
		})

		Textbox.Frame = New("Frame", {
			Size = UDim2.new(0, 0, 0, 30),
			BackgroundTransparency = Acrylic and 0.9 or 0,
			Parent = Parent,
			ThemeTag = {
				BackgroundColor3 = Acrylic and "Input" or "DialogInput",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = Acrylic and 0.5 or 0.65,
				ThemeTag = {
					Color = Acrylic and "InElementBorder" or "DialogButtonBorder",
				},
			}),
			Textbox.Indicator,
			Textbox.Container,
		})

		local function Update()
			local PADDING = 2
			local Reveal = Textbox.Container.AbsoluteSize.X

			if not Textbox.Input:IsFocused() or Textbox.Input.TextBounds.X <= Reveal - 2 * PADDING then
				Textbox.Input.Position = UDim2.new(0, PADDING, 0, 0)
			else
				local Cursor = Textbox.Input.CursorPosition
				if Cursor ~= -1 then
					local subtext = string.sub(Textbox.Input.Text, 1, Cursor - 1)
					local width = TextService:GetTextSize(
						subtext,
						Textbox.Input.TextSize,
						Textbox.Input.Font,
						Vector2.new(math.huge, math.huge)
					).X

					local CurrentCursorPos = Textbox.Input.Position.X.Offset + width
					if CurrentCursorPos < PADDING then
						Textbox.Input.Position = UDim2.fromOffset(PADDING - width, 0)
					elseif CurrentCursorPos > Reveal - PADDING - 1 then
						Textbox.Input.Position = UDim2.fromOffset(Reveal - width - PADDING - 1, 0)
					end
				end
			end
		end

		task.spawn(Update)

		Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("Text"), Update)
		Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("CursorPosition"), Update)

		Creator.AddSignal(Textbox.Input.Focused, function()
			Update()
			Textbox.Indicator.Size = UDim2.new(1, -2, 0, 2)
			Textbox.Indicator.Position = UDim2.new(0, 1, 1, 0)
			Textbox.Indicator.BackgroundTransparency = 0
			Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "InputFocused" or "DialogHolder" })
			Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = "InputIndicatorFocus" })
		end)

		Creator.AddSignal(Textbox.Input.FocusLost, function()
			Update()
			Textbox.Indicator.Size = UDim2.new(1, -4, 0, 1)
			Textbox.Indicator.Position = UDim2.new(0, 2, 1, 0)
			Textbox.Indicator.BackgroundTransparency = 0.5
			Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "Input" or "DialogInput" })
			Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine" })
		end)

		return Textbox
	end
end)()
Components.TitleBar = (function()
	local New = Creator.New
	local AddSignal = Creator.AddSignal

	local function parseColor(value)
		if typeof(value) == "Color3" then return value end
		if typeof(value) == "string" then
			local hex = value:gsub("#","")
			if #hex == 6 then
				local r = tonumber(hex:sub(1,2), 16) or 255
				local g = tonumber(hex:sub(3,4), 16) or 255
				local b = tonumber(hex:sub(5,6), 16) or 255
				return Color3.fromRGB(r,g,b)
			end
		end
		return Themes[Library.Theme].SubText or Color3.fromRGB(170,170,170)
	end

	return function(Config)
		local TitleBar = {}

		local function BarButton(Icon, Pos, Parent, Callback)
			local Button = {
				Callback = Callback or function() end,
			}

			Button.Frame = New("TextButton", {
				Size = UDim2.new(0, 34, 1, -8),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Parent = Parent,
				Position = Pos,
				Text = "",
				ThemeTag = {
					BackgroundColor3 = "Text",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 7),
				}),
				New("ImageLabel", {
					Image = Icon,
					Size = UDim2.fromOffset(16, 16),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Name = "Icon",
					ThemeTag = {
						ImageColor3 = "Text",
					},
				}),
			})

			local Motor, SetTransparency = Creator.SpringMotor(1, Button.Frame, "BackgroundTransparency")

			AddSignal(Button.Frame.MouseEnter, function()
				SetTransparency(0.94)
			end)
			AddSignal(Button.Frame.MouseLeave, function()
				SetTransparency(1, true)
			end)
			AddSignal(Button.Frame.MouseButton1Down, function()
				SetTransparency(0.96)
			end)
			AddSignal(Button.Frame.MouseButton1Up, function()
				SetTransparency(0.94)
			end)
			AddSignal(Button.Frame.MouseButton1Click, Button.Callback)

			Button.SetCallback = function(Func)
				Button.Callback = Func
			end

			return Button
		end

		TitleBar.Frame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 42),
			BackgroundTransparency = 1,
			Parent = Config.Parent,
		}, {
			New("Frame", {
				Name = "HeaderContent",
				Size = UDim2.new(1, -16, 1, 0),
				Position = UDim2.new(0, 12, 0, 0),
				BackgroundTransparency = 1,
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0, 5),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
				}),

				Config.Icon and New("ImageLabel", {
					Image = Config.Icon,
					Size = UDim2.fromOffset(20, 20),
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ThemeTag = {
						ImageColor3 = "Text",
					},
				}) or nil,

				not Config.Window.TabsInHeader and New("TextLabel", {
					RichText = true,
					Text = Config.Title,
					FontFace = resolveFont(Library.Font),
					TextSize = 12,
					TextXAlignment = "Left",
					TextYAlignment = "Center",
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					LayoutOrder = Config.Icon and 2 or 1,
					ThemeTag = {
						TextColor3 = "Text",
					},
				}) or nil,
				not Config.Window.TabsInHeader and Config.SubTitle and New("TextLabel", {
					RichText = true,
					Text = Config.SubTitle,
					TextTransparency = 0.4,
					FontFace = resolveFont(Library.Font),
					TextSize = 12,
					TextXAlignment = "Left",
					TextYAlignment = "Center",
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					LayoutOrder = Config.Icon and 3 or 2,
					ThemeTag = {
						TextColor3 = "Text",
					},
				}) or nil,

			}),
			New("Frame", {
				BackgroundTransparency = 0.5,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				ThemeTag = {
					BackgroundColor3 = "TitleBarLine",
				},
			}),
		})
		TitleBar.CloseButton = BarButton(Components.Assets.Close, UDim2.new(1, -4, 0, 4), TitleBar.Frame, function()
			Library.Window:Dialog({
				Title = "Close",
				Content = "Are you sure you want to unload the interface?",
				Buttons = {
					{
						Title = "Yes",
						Callback = function()
							Library:Destroy()
						end,
					},
					{
						Title = "No",
					},
				},
			})
		end)
		TitleBar.MaxButton = BarButton(Components.Assets.Max, UDim2.new(1, -40, 0, 4), TitleBar.Frame, function()
			Config.Window.Maximize(not Config.Window.Maximized)
		end)
		TitleBar.MinButton = BarButton(Components.Assets.Min, UDim2.new(1, -80, 0, 4), TitleBar.Frame, function()
			Library.Window:Minimize()
		end)

		if Config.Window.TabsInHeader then
			local HeaderContent = TitleBar.Frame:FindFirstChild("HeaderContent")
			if not HeaderContent then
				for _, child in ipairs(TitleBar.Frame:GetChildren()) do
					if child:IsA("Frame") and child.Name ~= "TitleBarLine" and child.Name ~= "" then
						HeaderContent = child
						break
					end
				end
			end
			if HeaderContent then
				if Config.Window.TabHolder and Config.Window.TabHolder.Parent and Config.Window.TabHolder.Parent ~= HeaderContent then
					Config.Window.TabHolder:Destroy()
				end
				Config.Window.TabHolder = New("ScrollingFrame", {
					Size = UDim2.new(1, -(Config.Icon and 150 or 120), 1, -8),
					Position = UDim2.new(0, Config.Icon and 30 or 12, 0, 4),
					BackgroundTransparency = 1,
					ScrollBarImageTransparency = 1,
					ScrollBarThickness = 0,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					Parent = HeaderContent,
					LayoutOrder = Config.Icon and 2 or 1,
					Visible = true,
				}, {
					New("UIListLayout", {
						Padding = UDim.new(0, 4),
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center,
					}),
				})
				Config.Window.HeaderSelector = New("Frame", {
					Size = UDim2.fromOffset(0, 2),
					BackgroundColor3 = Color3.fromRGB(76, 194, 255),
					Position = UDim2.fromOffset(0, 0),
					AnchorPoint = Vector2.new(0, 1),
					ZIndex = 11,
					Parent = Config.Window.TabHolder,
					Visible = true,
					ThemeTag = {
						BackgroundColor3 = "Accent",
					},
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(0, 1),
					}),
				})
			end
		end

		return TitleBar
	end
end)()
Components.Window = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	return function(Config)
		local Window = {
			Minimized = false,
			Maximized = false,
			Size = Config.Size,
			CurrentPos = 0,
			TabWidth = 0,
			Position = UDim2.fromOffset(0, 0),
			DropdownsOutsideWindow = Config.DropdownsOutsideWindow == true,
			TabsInHeader = Config.TabsInHeader == true,
		}

		Library.Window = Window

		local Dragging = false
		local DragInput, MousePos, StartPos
		local Resizing = false
		local ResizePos
		local MinimizeNotif = false

		Window.AcrylicPaint = Acrylic.AcrylicPaint()

		local function CenterWindow()
			local vp = Camera.ViewportSize
			local x = math.max(0, (vp.X - Window.Size.X.Offset) / 2)
			local y = math.max(0, (vp.Y - Window.Size.Y.Offset) / 2)
			Window.Position = UDim2.fromOffset(math.floor(x), math.floor(y))
			if Window.Root then
				Window.Root.Position = Window.Position
			end
		end
		Window.TabWidth = Config.TabWidth or 160

		local Selector = New("Frame", {
			Size = Window.TabsInHeader and UDim2.fromOffset(0, 4) or UDim2.fromOffset(4, 0),
			BackgroundColor3 = Color3.fromRGB(76, 194, 255),
			Position = Window.TabsInHeader and UDim2.fromOffset(0, 0) or UDim2.fromOffset(0, (Window.TabHolderTop or 45) + 0),
			AnchorPoint = Window.TabsInHeader and Vector2.new(0.5, 0) or Vector2.new(0, 0.5),
			ZIndex = 1,
			ThemeTag = {
				BackgroundColor3 = "Accent",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 9),
			}),
		})

		local ResizeStartFrame = New("Frame", {
			Size = UDim2.fromOffset(20, 20),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -20, 1, -2),
		})

		local SearchElements = {}
		local AllElements = {}

		local function UpdateElementVisibility(searchTerm)
			if not searchTerm then searchTerm = "" end
			
			local function normalizeText(text)
				if not text then return "" end
				text = tostring(text)
				text = string.gsub(text, "^%s+", "")
				text = string.gsub(text, "%s+$", "")
				text = string.gsub(text, "%s+", " ")
				
				local function RobustLower(str)
					if not str then return "" end
					str = tostring(str):lower()
					local upper = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
					local lower = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
					for i = 1, 33 do
						local uChar = utf8.char(utf8.codepoint(upper, utf8.offset(upper, i)))
						local lChar = utf8.char(utf8.codepoint(lower, utf8.offset(lower, i)))
						str = str:gsub(uChar, lChar)
					end
					return str
				end
				
				return RobustLower(text)
			end
			
			local function getElementValues(elementFrame)
				local values = {}
				
				local function addText(text)
					if text and text ~= "" then
						table.insert(values, tostring(text))
					end
				end
				
				local function findTextInDescendants(obj)
					if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
						addText(obj.Text)
					end
					for _, child in pairs(obj:GetChildren()) do
						findTextInDescendants(child)
					end
				end
				
				findTextInDescendants(elementFrame)
				
				return values
			end
			
			local function checkMatch(text, query)
				if query == "" then
					return true
				end
				
				local normalizedText = normalizeText(text)
				if normalizedText == "" then
					return false
				end
				
				local queryLower = normalizeText(query)
				if queryLower == "" then
					return true
				end
				
				if string.find(queryLower, "%s", 1) then
					local words = {}
					for word in string.gmatch(queryLower, "%S+") do
						if #word > 0 then
							table.insert(words, word)
						end
					end
					
					if #words == 0 then
						return true
					end
					
					for _, word in ipairs(words) do
						if not string.find(normalizedText, word, 1, true) then
							return false
						end
					end
					return true
				else
					return string.find(normalizedText, queryLower, 1, true) ~= nil
				end
			end
			
			local normalizedQuery = normalizeText(searchTerm)
			
			local matchedSectionFrames = {}
			local elementsInMatchedSections = {}
			
			for element, data in pairs(AllElements) do
				if element and element.Parent then
					if data.type == "Section" then
						local title = tostring(data.title or "")
						if normalizedQuery ~= "" and checkMatch(title, normalizedQuery) then
							matchedSectionFrames[element] = true
							if element:FindFirstChild("Container") then
								local container = element:FindFirstChild("Container")
								for _, child in pairs(container:GetChildren()) do
									if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
										elementsInMatchedSections[child] = true
									end
								end
							end
						end
					end
				end
			end
			
			for element, data in pairs(AllElements) do
				if element and element.Parent then
					if normalizedQuery == "" then
						element.Visible = true
					else
						local title = tostring(data.title or "")
						local desc = tostring(data.description or "")
						local matchesTitle = checkMatch(title, normalizedQuery)
						local matchesDesc = checkMatch(desc, normalizedQuery)
						local matchesValues = false
						
						local elementValues = getElementValues(element)
						for _, value in ipairs(elementValues) do
							if checkMatch(value, normalizedQuery) then
								matchesValues = true
								break
							end
						end
						
						local matchesSection = elementsInMatchedSections[element] == true
						
						if not matchesSection and data.section then
							for sectionFrame, _ in pairs(matchedSectionFrames) do
								if data.section == sectionFrame then
									matchesSection = true
									break
								end
							end
						end
						
						element.Visible = matchesTitle or matchesDesc or matchesValues or matchesSection
					end
				end
			end

			local searchTermForClosure = searchTerm
			task.spawn(function()
				task.wait(0.05)
				
				if not Window or not Window.ContainerHolder then return end
				
				for _, tabContainer in pairs(Window.ContainerHolder:GetChildren()) do
					if tabContainer:IsA("ScrollingFrame") then
						local containerLayout = tabContainer:FindFirstChild("UIListLayout")
						if containerLayout then
							local containerPadding = tabContainer:FindFirstChild("UIPadding")
							local paddingTop = containerPadding and containerPadding.PaddingTop.Offset or 1
							local paddingBottom = containerPadding and containerPadding.PaddingBottom.Offset or 1
							local contentSize = containerLayout.AbsoluteContentSize.Y + paddingTop + paddingBottom
							tabContainer.CanvasSize = UDim2.new(0, 0, 0, math.max(0, contentSize))
						end
						
						for _, section in pairs(tabContainer:GetChildren()) do
							if section:IsA("Frame") and section.Name ~= "UIPadding" then
								local sectionContainer = section:FindFirstChild("Container")
								
								if sectionContainer and sectionContainer:IsA("Frame") then
									local containerLayout = sectionContainer:FindFirstChild("UIListLayout")
									if containerLayout then
										local hasVisibleChild = false
										for _, element in pairs(sectionContainer:GetChildren()) do
											if not element:IsA("UIListLayout") and element.Visible then
												hasVisibleChild = true
												break
											end
										end
										
										if searchTermForClosure == "" or hasVisibleChild then
											section.Visible = true
											local containerPadding = sectionContainer:FindFirstChild("UIPadding")
											local containerPaddingTop = containerPadding and containerPadding.PaddingTop.Offset or 0
											local containerPaddingBottom = containerPadding and containerPadding.PaddingBottom.Offset or 0
											local containerContentSize = containerLayout.AbsoluteContentSize.Y + containerPaddingTop + containerPaddingBottom
											sectionContainer.Size = UDim2.new(1, 0, 0, math.max(0, containerContentSize))
										else
											section.Visible = false
											sectionContainer.Size = UDim2.new(1, 0, 0, 0)
										end
									end
								end
								
								local sectionLayout = section:FindFirstChild("UIListLayout")
								if sectionLayout then
									local sectionPadding = section:FindFirstChild("UIPadding")
									local sectionPaddingTop = sectionPadding and sectionPadding.PaddingTop.Offset or 0
									local sectionPaddingBottom = sectionPadding and sectionPadding.PaddingBottom.Offset or 0
									local sectionContentSize = sectionLayout.AbsoluteContentSize.Y + sectionPaddingTop + sectionPaddingBottom
									section.Size = UDim2.new(1, 0, 0, math.max(0, sectionContentSize + 25))
								end
							end
						end
					end
				end
			end)
		end

		local function RegisterElement(elementFrame, title, elementType, description)
			if elementFrame then
				local sectionFrame = nil
				local parent = elementFrame.Parent
				
				while parent do
					if parent:FindFirstChild("Container") then
						local sectionRoot = parent
						local sectionContainer = parent:FindFirstChild("Container")
						if sectionContainer and elementFrame.Parent == sectionContainer then
							sectionFrame = sectionRoot
							break
						end
					end
					parent = parent.Parent
				end
				
				AllElements[elementFrame] = {
					title = tostring(title or ""),
					type = elementType or "Element",
					description = tostring(description or ""),
					section = sectionFrame
				}
			end
		end

		Window.ShowSearch = (Config.Search == nil) and true or (Config.Search and true or false)

		local ImageAsset = Config.Image
		local hasImage = ImageAsset and type(ImageAsset) == "string" and ImageAsset ~= ""
		local imageSize = Window.TabWidth - 24
		local topOffset = 0

		local ImageFrame = hasImage and New("ImageLabel", {
			Size = UDim2.new(0, imageSize, 0, imageSize),
			Position = UDim2.new(0.5, 0, 0, topOffset),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			Image = ImageAsset,
			ZIndex = 5,
			Visible = true,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 6),
			}),
		}) or nil

		Window.HasImage = hasImage
		Window.ImageFrame = ImageFrame
		Window.ImageSize = imageSize
		Window.TopOffset = topOffset

		local searchOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
		local searchHeight = 28

		local tabHolderTop
		if hasImage then
			if Window.ShowSearch then
				tabHolderTop = imageSize + 10 + topOffset + searchHeight + 6
			else
				tabHolderTop = imageSize + 10 + topOffset
			end
		else
			if Window.ShowSearch then
				tabHolderTop = topOffset + searchHeight + 6
			else
				tabHolderTop = 45
			end
		end
		Window.TabHolderTop = tabHolderTop

		if not Window.TabsInHeader then
			Window.TabHolder = New("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, -(tabHolderTop + 6)),
				Position = UDim2.new(0, 0, 0, tabHolderTop),
				BackgroundTransparency = 1,
				ScrollBarImageTransparency = 1,
				ScrollBarThickness = 0,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0, 4),
				}),
			})
		end

		local SearchFrame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 28),
			Position = UDim2.new(0, 0, 0, searchOffset),
			BackgroundTransparency = 0.7,
			ZIndex = 10,
			Visible = Window.ShowSearch,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			ThemeTag = {
				BackgroundColor3 = "Element",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local SearchInput = New("TextBox", {
			FontFace = resolveFont(Library.Font),
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -36, 1, 0),
			Position = UDim2.new(0, 8, 0, 0),
			PlaceholderText = "Search...",
			PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
			ClearTextOnFocus = false,
			Text = "",
			Parent = SearchFrame,
			ThemeTag = {
				TextColor3 = "Text",
				PlaceholderColor3 = "SubText",
			},
		})

		local SearchIcon = New("ImageLabel", {
			Size = UDim2.fromOffset(16, 16),
			Position = UDim2.new(1, -13, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = Library:GetIcon("search"),
			Parent = SearchFrame,
			ImageTransparency = 0.3,
			ThemeTag = {
				ImageColor3 = "SubText",
			},
		})

		local SearchTextbox = {
			Input = SearchInput,
			Frame = SearchFrame,
		}

		Creator.AddSignal(SearchTextbox.Input:GetPropertyChangedSignal("Text"), function()
			local searchText = SearchTextbox.Input.Text or ""
			UpdateElementVisibility(searchText)
		end)

		Creator.AddSignal(SearchTextbox.Input.FocusLost, function(enterPressed)
		end)

		Creator.AddSignal(UserInputService.InputBegan, function(input, gameProcessed)
			if gameProcessed then return end
			if input.KeyCode == Enum.KeyCode.Escape and SearchTextbox.Input:IsFocused() then
				SearchTextbox.Input.Text = ""
				SearchTextbox.Input:ReleaseFocus()
			end
		end)

		Window.SearchElements = SearchElements
		Window.AllElements = AllElements
		Window.RegisterElement = RegisterElement
		Window.UpdateElementVisibility = UpdateElementVisibility

		local imageSize = Window.TabWidth - 24
		local topOffset = Window.TopOffset or 25
		local imageOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
		local searchHeight = 28
		local totalOffset = (Window.ShowSearch and searchHeight or 0) + imageOffset

		local TabFrame = New("Frame", {
			Size = UDim2.new(0, Window.TabWidth, 1, Window.ShowSearch and -63 or -31),
			Position = UDim2.new(0, 12, 0, Window.ShowSearch and 54 or 19),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Visible = not Window.TabsInHeader,
		}, {
			ImageFrame,
			SearchFrame,
			not Window.TabsInHeader and Window.TabHolder or nil,
			not Window.TabsInHeader and Selector or nil,
		})

		Window.TabFrame = TabFrame

		Window.TabDisplay = New("TextLabel", {
			RichText = true,
			Text = "Tab",
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.Medium),
			TextSize = 28,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, -Window.TabWidth - 52, 0, 32),
			Position = UDim2.fromOffset(Window.TabWidth + 30, 56),
			BackgroundTransparency = 1,
			Visible = not Window.TabsInHeader,
			TextWrapped = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Window.ContainerHolder = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		})

		Window.ContainerAnim = New("CanvasGroup", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
		})

		Window.ContainerCanvas = New("Frame", {
			Size = Window.TabsInHeader and UDim2.new(1, -32, 1, -102) or UDim2.new(1, -Window.TabWidth - 32, 1, -102),
			Position = Window.TabsInHeader and UDim2.fromOffset(16, 90) or UDim2.fromOffset(Window.TabWidth + 26, 90),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, {
			Window.ContainerAnim,
			Window.ContainerHolder
		})

		local backgroundTransparency = Config.BackgroundTransparency
		if backgroundTransparency == nil then
			backgroundTransparency = 0.5
		end
		Window.BackgroundTransparency = backgroundTransparency

		if not Library.Acrylic and Window.AcrylicPaint and Window.AcrylicPaint.Frame then
			local background = Window.AcrylicPaint.Frame:FindFirstChild("Background")
			if background then
				background.BackgroundTransparency = backgroundTransparency
			end
		end

		local backgroundImageTransparency = Config.BackgroundImageTransparency
		if backgroundImageTransparency == nil then
			backgroundImageTransparency = backgroundTransparency
		end
		Window.BackgroundImageTransparency = backgroundImageTransparency

		local rootChildren = {}
		
		if Config.BackgroundImage then
			local BackgroundImageFrame = New("ImageLabel", {
				Name = "BackgroundImage",
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(0, 0),
				BackgroundTransparency = 1,
				Image = Config.BackgroundImage,
				ImageTransparency = math.max(0, math.min(1, backgroundImageTransparency)),
				ZIndex = 0,
				ScaleType = Enum.ScaleType.Stretch,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})
			Window.BackgroundImage = BackgroundImageFrame
			table.insert(rootChildren, BackgroundImageFrame)
		end
		
		local MinimizeShade = New("Frame", {
			Name = "MinimizeShade",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 900,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		})
		Window.MinimizeShade = MinimizeShade
		
		table.insert(rootChildren, Window.AcrylicPaint.Frame)
		table.insert(rootChildren, Window.TabDisplay)
		table.insert(rootChildren, Window.ContainerCanvas)
		table.insert(rootChildren, TabFrame)
		table.insert(rootChildren, ResizeStartFrame)
		table.insert(rootChildren, MinimizeShade)

		Window.Root = New("Frame", {
			BackgroundTransparency = 1,
			Size = Window.Size,
			Position = Window.Position,
			Parent = Config.Parent,
			ZLayer = "base",
			ZIndex = 1,
		}, rootChildren)

		Window.RootScale = New("UIScale", {
			Scale = 1,
			Parent = Window.Root,
		})

		CenterWindow()
		Creator.AddSignal(Camera:GetPropertyChangedSignal("ViewportSize"), function()
			CenterWindow()
		end)


		Window.TitleBar = Components.TitleBar({
			Title = Config.Title,
			SubTitle = Config.SubTitle,
			Icon = Config.Icon,
			Parent = Window.Root,
			Window = Window,
			UserInfoTitle = Config.UserInfoTitle,
			UserInfo = Config.UserInfo,
			UserInfoSubtitle = Config.UserInfoSubtitle,
			UserInfoSubtitleColor = Config.UserInfoSubtitleColor,
		})

		Creator.SetupMarquee(Window.TabDisplay)

		if Config.UserInfo then
			local function parseColor(value)
				if typeof(value) == "Color3" then return value end
				return Themes[Library.Theme].SubText or Color3.fromRGB(170,170,170)
			end

		local userInfoHeight = 56
		Window.UserInfoHeight = userInfoHeight
		Window.UserInfoTop = Config.UserInfoTop
		
		local UserInfoSection = New("Frame", {
			Name = "UserInfoSection",
			Size = UDim2.new(1, 0, 0, userInfoHeight),
			Position = Config.UserInfoTop and UDim2.fromOffset(0, 0) or UDim2.new(0, 0, 1, -(userInfoHeight + 2)),
			BackgroundTransparency = 1,
			ZIndex = 15,
			Parent = TabFrame,
		})

		New("Frame", {
			Name = "UserInfoSeparator",
			BackgroundTransparency = 0.5,
			Size = UDim2.new(1, 0, 0, 1),
			Position = Config.UserInfoTop and UDim2.fromOffset(0, userInfoHeight + 4) or UDim2.new(0, 0, 1, -(userInfoHeight + 4)),
			ZIndex = 15,
			Parent = TabFrame,
			ThemeTag = {
				BackgroundColor3 = "TitleBarLine",
			},
		})

		local avatarSize = 36
		local avatarPadding = 12
		local Avatar = New("ImageLabel", {
			Name = "Avatar",
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(avatarSize, avatarSize),
			Position = UDim2.new(0, avatarPadding, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = "rbxassetid://0",
			ZIndex = 16,
			Parent = UserInfoSection,
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})

		pcall(function()
			local Players = game:GetService("Players")
			local content, isReady = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
			if isReady and content then
				Avatar.Image = content
			end
		end)

		local titleText = tostring((Config.UserInfoTitle ~= nil and Config.UserInfoTitle) or (LocalPlayer.Name or "User"))
		local subtitleText = (Config.UserInfoSubtitle ~= nil) and tostring(Config.UserInfoSubtitle) or ""

		local textLeftPadding = avatarSize + avatarPadding + 10
		local textRightPadding = 12

		New("TextLabel", {
			Name = "UserName",
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			FontFace = resolveFont(Library.Font),
			TextSize = 14,
			Text = titleText,
			Size = UDim2.new(1, -(textLeftPadding + textRightPadding), 0.5, 0),
			Position = UDim2.new(0, textLeftPadding, 0, 0),
			TextTruncate = Enum.TextTruncate.AtEnd,
			Parent = UserInfoSection,
			ThemeTag = { TextColor3 = "Text" },
		})

		New("TextLabel", {
			Name = "UserSubtitle",
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			FontFace = resolveFont(Library.Font),
			TextSize = 12,
			TextTransparency = 0.3,
			Text = subtitleText,
			TextColor3 = parseColor(Config.UserInfoSubtitleColor),
			Size = UDim2.new(1, -(textLeftPadding + textRightPadding), 0.5, 0),
			Position = UDim2.new(0, textLeftPadding, 0.5, 0),
			TextTruncate = Enum.TextTruncate.AtEnd,
			Parent = UserInfoSection,
		})

			if Config.UserInfoTop then
				local topOffset = Window.TopOffset or 0
				local imageOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
				TabFrame.Position = UDim2.new(0, 12, 0, 39)
				TabFrame.Size = UDim2.new(0, Window.TabWidth, 1, -(31 + imageOffset + userInfoHeight))
				local searchOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
				SearchFrame.Position = UDim2.new(0, 0, 0, userInfoHeight + 6 + searchOffset)
				if ImageFrame then
					ImageFrame.Position = UDim2.new(0.5, 0, 0, userInfoHeight + topOffset)
				end
				local newTabHolderTop = userInfoHeight + 6 + (hasImage and (imageSize + 10 + topOffset) or topOffset) + (Window.ShowSearch and (searchHeight + 6) or 0)
				Window.TabHolderTop = newTabHolderTop
				Window.TabHolder.Position = UDim2.new(0, 0, 0, newTabHolderTop)
				Window.TabHolder.Size = UDim2.new(1, 0, 1, -(newTabHolderTop + 6 + userInfoHeight))
				if Window.UpdateTabHolderLayout then
					Window:UpdateTabHolderLayout(newTabHolderTop)
				end
			else
				Window.TabHolder.Size = UDim2.new(1, 0, 1, -(tabHolderTop + 6 + userInfoHeight))
				if Window.UpdateTabHolderLayout then
					Window:UpdateTabHolderLayout(tabHolderTop)
				end
			end
		end

		if Library.UseAcrylic then
			Window.AcrylicPaint.AddParent(Window.Root)
		end

		local SizeMotor = Flipper.GroupMotor.new({
			X = Window.Size.X.Offset,
			Y = Window.Size.Y.Offset,
		})

		local PosMotor = Flipper.GroupMotor.new({
			X = Window.Position.X.Offset,
			Y = Window.Position.Y.Offset,
		})

		local CDDrag = 0
		Window.SelectorPosMotor = Flipper.SingleMotor.new(Window.TabsInHeader and 0 or 17)
		Window.SelectorSizeMotor = Flipper.SingleMotor.new(Window.TabsInHeader and 0 or 0)
		Window.ContainerBackMotor = Flipper.SingleMotor.new(0)
		Window.ContainerPosMotor = Flipper.SingleMotor.new(94)
		Window.ContainerXMotor = Flipper.SingleMotor.new(0)

		SizeMotor:onStep(function(values)
			task.wait(CDDrag / 10)
			Window.Root.Size = UDim2.new(0, values.X, 0, values.Y)
			task.spawn(function()
				task.wait(0.01)
				if Window.UpdateTabHolderLayout then
					Window:UpdateTabHolderLayout()
				end
			end)
		end)

		PosMotor:onStep(function(values)
			task.wait(CDDrag / 10)
			Window.Root.Position = UDim2.new(0, values.X, 0, values.Y)
		end)

		local LastValue = 0
		local LastTime = 0
		Window.SelectorPosMotor:onStep(function(Value)
			if Window.TabsInHeader then
				if Window.HeaderSelector and Window.TabHolder then
					local tabHolderPos = Window.TabHolder.AbsolutePosition.X
					local tabHolderParentPos = Window.TabHolder.Parent and Window.TabHolder.Parent.AbsolutePosition.X or 0
					local selectorX = Value
					Window.HeaderSelector.Position = UDim2.new(0, selectorX, 1, -2)
					Window.HeaderSelector.Visible = true
				end
			else
				local base = Window.TabHolderTop or 45
				local verticalInset = 16
				local selectorY = base + Value + verticalInset

				local searchOffset = Window.HasImage and (Window.ImageSize + Window.TopOffset + 10) or Window.TopOffset
				local searchTop = searchOffset
				local searchBottom = searchTop + 28

				if Window.HasImage and Window.ImageSize then
					local imageBottom = Window.ImageSize + Window.TopOffset + 10
					if selectorY < imageBottom then
						Selector.Visible = false
					return
				end
			end

			if Window.ShowSearch then
				if selectorY >= searchTop and selectorY <= searchBottom then
					Selector.Visible = false
					return
				end
			end

			if Window.UserInfoHeight then
				local tabFrameSize = Window.TabFrame and Window.TabFrame.Size.Y.Offset or 0
				local userInfoTop = Window.UserInfoTop and 0 or (tabFrameSize - Window.UserInfoHeight - 2)
				local userInfoBottom = userInfoTop + Window.UserInfoHeight
				
				if selectorY >= userInfoTop and selectorY <= userInfoBottom then
					Selector.Visible = false
					return
				end
			end

				Selector.Visible = true
				Selector.Position = UDim2.new(0, 0, 0, selectorY)
			end
			local Now = os.clock()
			local DeltaTime = Now - LastTime

			if LastValue ~= nil then
				if Window.TabsInHeader then
					if Window.HeaderSelector and TabModule.Tabs[TabModule.SelectedTab] then
						local tabFrame = TabModule.Tabs[TabModule.SelectedTab].Frame
						if tabFrame then
							Window.SelectorSizeMotor:setGoal(Spring(tabFrame.AbsoluteSize.X, { frequency = 6 }))
						end
					end
				else
					Window.SelectorSizeMotor:setGoal(Spring((math.abs(Value - LastValue) / (DeltaTime * 60)) + 16))
				end
				LastValue = Value
			end
			LastTime = Now
		end)

		Window.SelectorSizeMotor:onStep(function(Value)
			if Window.TabsInHeader then
				if Window.HeaderSelector then
					Window.HeaderSelector.Size = UDim2.new(0, Value, 0, 2)
				end
			else
				Selector.Size = UDim2.new(0, 4, 0, Value)
			end
		end)

		Window.ContainerBackMotor:onStep(function(Value)
			Window.ContainerAnim.GroupTransparency = Value
		end)

		local ContainerXValue = 0
		local ContainerYValue = 94

		local function UpdateContainerPosition()
			if Window.ContainerAnim then
				Window.ContainerAnim.Position = UDim2.fromOffset(ContainerXValue, ContainerYValue)
			end
		end

		Window.ContainerPosMotor:onStep(function(Value)
			ContainerYValue = Value
			UpdateContainerPosition()
		end)

		Window.ContainerXMotor:onStep(function(Value)
			ContainerXValue = Value
			UpdateContainerPosition()
		end)

		local OldSizeX
		local OldSizeY
		Window.Maximize = function(Value, NoPos, Instant)
			Window.Maximized = Value
			Window.TitleBar.MaxButton.Frame.Icon.Image = Value and Components.Assets.Restore or Components.Assets.Max

			if Value then
				OldSizeX = Window.Size.X.Offset
				OldSizeY = Window.Size.Y.Offset
			end
			local SizeX = Value and Camera.ViewportSize.X or OldSizeX
			local SizeY = Value and Camera.ViewportSize.Y or OldSizeY
			SizeMotor:setGoal({
				X = Flipper[Instant and "Instant" or "Spring"].new(SizeX, { frequency = 6 }),
				Y = Flipper[Instant and "Instant" or "Spring"].new(SizeY, { frequency = 6 }),
			})
			Window.Size = UDim2.fromOffset(SizeX, SizeY)

			if not NoPos then
				PosMotor:setGoal({
					X = Spring(Value and 0 or Window.Position.X.Offset, { frequency = 6 }),
					Y = Spring(Value and 0 or Window.Position.Y.Offset, { frequency = 6 }),
				})
			end
		end

		Creator.AddSignal(Window.TitleBar.Frame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = true
				MousePos = Input.Position
				StartPos = Window.Root.Position

				if Window.Maximized then
					StartPos = UDim2.fromOffset(
						Mouse.X - (Mouse.X * ((OldSizeX - 100) / Window.Root.AbsoluteSize.X)),
						Mouse.Y - (Mouse.Y * (OldSizeY / Window.Root.AbsoluteSize.Y))
					)
				end

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)

		Creator.AddSignal(Window.TitleBar.Frame.InputChanged, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseMovement
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = Input
			end
		end)

		Creator.AddSignal(ResizeStartFrame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Resizing = true
				ResizePos = Input.Position
			end
		end)

		Creator.AddSignal(UserInputService.InputChanged, function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				Window.Position = UDim2.fromOffset(StartPos.X.Offset + Delta.X, StartPos.Y.Offset + Delta.Y)
				PosMotor:setGoal({
					X = Instant(Window.Position.X.Offset),
					Y = Instant(Window.Position.Y.Offset),
				})

				if Window.Maximized then
					Window.Maximize(false, true, true)
				end
			end

			if
				(Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)
				and Resizing
			then
				local Delta = Input.Position - ResizePos
				local StartSize = Window.Size

				local TargetSize = Vector3.new(StartSize.X.Offset, StartSize.Y.Offset, 0) + Vector3.new(1, 1, 0) * Delta
				local TargetSizeClamped =
					Vector2.new(math.clamp(TargetSize.X, 470, 2048), math.clamp(TargetSize.Y, 380, 2048))

				SizeMotor:setGoal({
					X = Flipper.Instant.new(TargetSizeClamped.X),
					Y = Flipper.Instant.new(TargetSizeClamped.Y),
				})
			end
		end)

		Creator.AddSignal(UserInputService.InputEnded, function(Input)
			if Resizing == true or Input.UserInputType == Enum.UserInputType.Touch then
				Resizing = false
				Window.Size = UDim2.fromOffset(SizeMotor:getValue().X, SizeMotor:getValue().Y)
			end
		end)

		if Window.TabHolder then
			Creator.AddSignal(Window.TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				if Window.TabHolder and Window.TabHolder.UIListLayout then
					if Window.TabsInHeader then
						local padding = Window.TabHolder:FindFirstChild("UIPadding")
						local paddingLeft = padding and padding.PaddingLeft.Offset or 0
						local paddingRight = padding and padding.PaddingRight.Offset or 0
						local contentSize = Window.TabHolder.UIListLayout.AbsoluteContentSize.X + paddingLeft + paddingRight
						if contentSize > 0 then
							Window.TabHolder.CanvasSize = UDim2.new(0, contentSize, 0, 0)
						end
					else
						local padding = Window.TabHolder:FindFirstChild("UIPadding")
						local paddingTop = padding and padding.PaddingTop.Offset or 6
						local paddingBottom = padding and padding.PaddingBottom.Offset or 6
						local contentSize = Window.TabHolder.UIListLayout.AbsoluteContentSize.Y + paddingTop + paddingBottom
						if contentSize > 0 then
							Window.TabHolder.CanvasSize = UDim2.new(0, 0, 0, contentSize)
						end
					end
				end
			end)
		end

		Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if
				type(Library.MinimizeKeybind) == "table"
				and Library.MinimizeKeybind.Type == "Keybind"
				and not UserInputService:GetFocusedTextBox()
			then
				if Input.KeyCode.Name == Library.MinimizeKeybind.Value then
					-- handled by the keybind callback
				end
			elseif Input.KeyCode == Library.MinimizeKey and not UserInputService:GetFocusedTextBox() then
				Window:Minimize()
			end
		end)

		function Window:ToggleSearch()
			Window.ShowSearch = not Window.ShowSearch
			SearchFrame.Visible = Window.ShowSearch
			local topOffset = Window.TopOffset or 25
			local searchOffset = Window.HasImage and (Window.ImageSize + 10 + topOffset) or topOffset
			SearchFrame.Position = UDim2.new(0, 0, 0, searchOffset)
			local imageOffset = Window.HasImage and (Window.ImageSize + 10 + topOffset) or topOffset
			local searchHeight = 28
			local totalOffset = (Window.ShowSearch and searchHeight or 0) + imageOffset
			TabFrame.Size = UDim2.new(0, Window.TabWidth, 1, -(totalOffset + 31))

			if Window.UpdateTabHolderLayout then
				Window:UpdateTabHolderLayout()
			end
		end

		function Window:Minimize()
			Window.Minimized = not Window.Minimized

			if Window.Minimized then
				Dragging = false
				Resizing = false
			end

			local targetVisible = not Window.Minimized
			local shade = Window.MinimizeShade

			if shade then
				shade.BackgroundTransparency = targetVisible and 1 or 0.75
				shade.Visible = not targetVisible
			end

			if Window.RootScale then
				Window.Root.Visible = targetVisible
				Window.RootScale.Scale = targetVisible and 1 or 0.9
				if targetVisible and shade then
					shade.BackgroundTransparency = 1
					shade.Visible = false
				end
			else
				Window.Root.Visible = targetVisible
				if shade then
					if targetVisible then
						shade.BackgroundTransparency = 1
						shade.Visible = false
					else
						shade.BackgroundTransparency = 0.75
						shade.Visible = true
					end
				end
			end

			for _, Option in next, Library.Options do
				if Option and Option.Type == "Dropdown" and Option.Opened then
					pcall(function()
						Option:Close()
					end)
				end
			end
			if not MinimizeNotif then
				MinimizeNotif = true
				local Key = Library.MinimizeKeybind and Library.MinimizeKeybind.Value or Library.MinimizeKey.Name
				if not Mobile then Library:Notify({
					Title = "Interface",
					Content = "Press " .. Key .. " to toggle the interface.",
					Duration = 6
					})
				else 
					Library:Notify({
						Title = "Interface",
						Content = "Tap to the button to toggle the interface.",
						Duration = 6
					})
				end
			end

			if not RunService:IsStudio() and Library.Minimizer then
				pcall(function()
					if Mobile then
						local mobileButton = Library.Minimizer:FindFirstChild("TextButton")
						if mobileButton then
							local imageLabel = mobileButton:FindFirstChild("ImageLabel")
							if imageLabel then
								imageLabel.Image = Window.Minimized and Library:GetIcon("monitor-off") or Library:GetIcon("moon")
							end
						end
					else
						local desktopButton = Library.Minimizer:FindFirstChild("TextButton")
						if desktopButton then
							local imageLabel = desktopButton:FindFirstChild("ImageLabel")
							if imageLabel then
								imageLabel.Image = Window.Minimized and Library:GetIcon("monitor-off") or Library:GetIcon("moon")
							end
						end
					end
				end)
			end
		end

		function Window:Destroy()
			if Window.AllElements then
				Window.AllElements = nil
			end
			
			if Window.Tabs then
				for _, tab in pairs(Window.Tabs) do
					if tab then
						if tab.ContainerXMotor then
							pcall(function() tab.ContainerXMotor:destroy() end)
						end
						if tab.ContainerTransparencyMotor then
							pcall(function() tab.ContainerTransparencyMotor:destroy() end)
						end
						if tab.Motor then
							pcall(function() tab.Motor:destroy() end)
						end
						if tab.SubTabs then
							for _, subTab in pairs(tab.SubTabs) do
								if subTab.XMotor then
									pcall(function() subTab.XMotor:destroy() end)
								end
								if subTab.TransparencyMotor then
									pcall(function() subTab.TransparencyMotor:destroy() end)
								end
								if subTab.Motor then
									pcall(function() subTab.Motor:destroy() end)
								end
							end
						end
						if tab.Destroy then
							pcall(function()
								tab:Destroy()
							end)
						end
					end
				end
				Window.Tabs = {}
			end
			
			if Window.SelectorPosMotor then
				pcall(function() Window.SelectorPosMotor:destroy() end)
			end
			if Window.SelectorSizeMotor then
				pcall(function() Window.SelectorSizeMotor:destroy() end)
			end
			if Window.ContainerBackMotor then
				pcall(function() Window.ContainerBackMotor:destroy() end)
			end
			if Window.ContainerPosMotor then
				pcall(function() Window.ContainerPosMotor:destroy() end)
			end
			if Window.ContainerXMotor then
				pcall(function() Window.ContainerXMotor:destroy() end)
			end
			
			if Window.ContainerHolder then
				for _, container in pairs(Window.ContainerHolder:GetChildren()) do
					pcall(function()
						container:Destroy()
					end)
				end
			end

			if Window.DragLayer then
				pcall(function()
					Window.DragLayer:Destroy()
				end)
				Window.DragLayer = nil
			end
			
			if Library.UseAcrylic and Window.AcrylicPaint and Window.AcrylicPaint.Model then
				Window.AcrylicPaint.Model:Destroy()
			end
			
			if Window.Root then
				Window.Root:Destroy()
			end
			
			Window = nil
		end

		function Window:SetBackgroundImage(imageUrl, imageTransparency)
			if not Window.BackgroundImage then
				local imgTransparency = imageTransparency or Window.BackgroundImageTransparency or Window.BackgroundTransparency or 0.5
				local BackgroundImageFrame = New("ImageLabel", {
					Name = "BackgroundImage",
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
					Image = imageUrl,
					ImageTransparency = math.max(0, math.min(1, imgTransparency)),
					ZIndex = 0,
					ScaleType = Enum.ScaleType.Stretch,
					Parent = Window.Root,
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				})
				Window.BackgroundImage = BackgroundImageFrame
				if imageTransparency ~= nil then
					Window.BackgroundImageTransparency = imageTransparency
				end
			else
				Window.BackgroundImage.Image = imageUrl
				Window.BackgroundImage.ScaleType = Enum.ScaleType.Stretch
				if imageTransparency ~= nil then
					Window.BackgroundImageTransparency = imageTransparency
					Window.BackgroundImage.ImageTransparency = math.max(0, math.min(1, imageTransparency))
				end
			end
			Library:RefreshOpenDropdowns()
		end

		function Window:SetBackgroundTransparency(transparency)
			transparency = transparency or 0.5
			Window.BackgroundTransparency = transparency
			local base = clamp01(transparency)

			if Window.AcrylicPaint and Window.AcrylicPaint.Frame then
				local background = Window.AcrylicPaint.Frame:FindFirstChild("Background")
				if background then
					if Library.Acrylic and Library.UseAcrylic then
						background.BackgroundTransparency = computeAcrylicTransparency(base)
					else
						background.BackgroundTransparency = computeSolidTransparency(base)
					end
				end
				for _, child in ipairs(Window.AcrylicPaint.Frame:GetChildren()) do
					if child:IsA("ImageLabel") and child.Image == "rbxassetid://8992230677" then
						child.ImageTransparency = Library.Acrylic and Library.UseAcrylic
							and computeAcrylicTransparency(base)
							or computeSolidTransparency(base)
					elseif child:IsA("Frame") and child:FindFirstChildWhichIsA("UIGradient") then
						child.BackgroundTransparency = Library.Acrylic and Library.UseAcrylic
							and computeAcrylicTransparency(base)
							or computeSolidTransparency(base)
					end
				end
			end

			Library:RefreshOpenDropdowns()
		end

		function Window:SetBackgroundImageTransparency(transparency)
			transparency = transparency or 0.5
			Window.BackgroundImageTransparency = transparency
			if Window.BackgroundImage then
				Window.BackgroundImage.ImageTransparency = math.max(0, math.min(1, transparency))
			end

			Library:RefreshOpenDropdowns()
		end

		local DialogModule = Components.Dialog:Init(Window)
		function Window:Dialog(Config)
			local Dialog = DialogModule:Create()
			Dialog.Title.Text = Config.Title

			local ContentHolder = New("ScrollingFrame", {
				BackgroundTransparency = 1,
				ScrollBarImageTransparency = 0.7,
				ScrollBarThickness = 4,
				BottomImage = "rbxassetid://6889812791",
				MidImage = "rbxassetid://6889812721",
				TopImage = "rbxassetid://6276641225",
				Position = UDim2.fromOffset(20, 60),
				Size = UDim2.new(1, -40, 1, -110),
				CanvasSize = UDim2.fromOffset(0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				Parent = Dialog.Root,
			})

			local Content = New("TextLabel", {
				FontFace = resolveFont(Library.Font),
				Text = Config.Content,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextWrapped = true,
				Size = UDim2.new(1, -8, 0, 0),
				BackgroundTransparency = 1,
				Parent = ContentHolder,
				ThemeTag = { TextColor3 = "Text" },
			})

			New("UISizeConstraint", {
				MinSize = Vector2.new(300, 165),
				MaxSize = Vector2.new(620, math.huge),
				Parent = Dialog.Root,
			})

			local maxWidth = math.min(620, Window.Size.X.Offset - 120)
			local baseWidth = math.max(300, math.min(maxWidth, Content.TextBounds.X + 40))
			Dialog.Root.Size = UDim2.fromOffset(baseWidth, 165)
			ContentHolder.Size = UDim2.new(1, -40, 1, -110)
			task.defer(function()
				local contentHeight = Content.TextBounds.Y
				local desired = math.clamp(contentHeight + 110, 165, 420)
				Dialog.Root.Size = UDim2.fromOffset(baseWidth, desired)
				ContentHolder.CanvasSize = UDim2.fromOffset(0, contentHeight)
			end)

			for _, Button in next, Config.Buttons do
				Dialog:Button(Button.Title, Button.Callback)
			end

			Dialog:Open()
		end

		local TabModule = Components.Tab:Init(Window)
		function Window:AddTab(TabConfig)
			local tab = TabModule:New(TabConfig.Title, TabConfig.Icon, Window.TabHolder)
			return tab
		end

		function Window:SelectTab(Tab)
			TabModule:SelectTab(Tab)
		end

		if Window.TabHolder then
			Creator.AddSignal(Window.TabHolder:GetPropertyChangedSignal("CanvasPosition"), function()
				LastValue = TabModule:GetCurrentTabPos() + 16
				LastTime = 0
				Window.SelectorPosMotor:setGoal(Instant(TabModule:GetCurrentTabPos()))
			end)
		end


		return Window
	end
end)()

return Components
