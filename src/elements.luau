local Creator = require("creator")
local Library = require("library")
local Flipper = require("flipper")

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local RenderStepped = RunService.RenderStepped
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local LocalPlayer = game:GetService("Players").LocalPlayer

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local New = Creator.New
local Components = require("components")
local Acrylic = require("acrylic")
local Window

local HUE_SEQUENCE_TABLE = (function()
	local t = {}
	for Color = 0, 1, 0.1 do
		table.insert(t, ColorSequenceKeypoint.new(Color, Color3.fromHSV(Color, 1, 1)))
	end
	return t
end)()

local ElementsTable = {}
local AddSignal = Creator.AddSignal
local resolveFont = Creator.resolveFont

ElementsTable.Button = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Button"

	function Element:New(Idx, Config)
		if type(Idx) == "table" then
			Config = Idx
			Idx = nil
		end
		assert(Config.Title, "Button - Missing Title")
		Config.Callback = Config.Callback or function() end

		local ButtonFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		ButtonFrame.TitleHolder.Size = UDim2.new(1, -34, 0, 16)
		if ButtonFrame.DescLabel then
			ButtonFrame.DescLabel.Size = UDim2.new(1, -34, 0, 16)
		end

		local ButtonIco = New("ImageLabel", {
			Image = Library:GetIcon("chevron-right"),
			Size = UDim2.fromOffset(16, 16),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			BackgroundTransparency = 1,
			Parent = ButtonFrame.Frame,
			ThemeTag = {
				ImageColor3 = "Text",
			},
		})

		Creator.AddSignal(ButtonFrame.Frame.MouseButton1Click, function()
			Library:SafeCallback(Config.Callback)
		end)

		return ButtonFrame
	end

	return Element
end)()
ElementsTable.Toggle = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Toggle"

	function Element:New(Idx, Config)
		assert(Config.Title, "Toggle - Missing Title")

		local Toggle = {
			Value = Config.Default or false,
			Locked = Config.Locked or false,
			Callback = Config.Callback or function(Value) end,
			Type = "Toggle",
		}

		local ToggleFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		ToggleFrame.DescLabel.Size = UDim2.new(1, -54, 0, 16)
		ToggleFrame.TitleHolder.Size = UDim2.new(1, -54, 0, 16)

		Toggle.SetTitle = ToggleFrame.SetTitle
		Toggle.SetDesc = ToggleFrame.SetDesc
		Toggle.Visible = ToggleFrame.Visible
		Toggle.Elements = ToggleFrame

		local ToggleCircle = New("ImageLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromOffset(14, 14),
			Position = UDim2.new(0, 2, 0.5, 0),
			Image = "http://www.roblox.com/asset/?id=12266946128",
			ImageTransparency = 0.5,
			ThemeTag = {
				ImageColor3 = "ToggleSlider",
			},
		})

		local ToggleBorder = New("UIStroke", {
			Transparency = 0.5,
			ThemeTag = {
				Color = "ToggleSlider",
			},
		})

		local ToggleSlider = New("Frame", {
			Size = UDim2.fromOffset(36, 18),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Parent = ToggleFrame.Frame,
			BackgroundTransparency = 1,
			ThemeTag = {
				BackgroundColor3 = "Accent",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 9),
			}),
			ToggleBorder,
			ToggleCircle,
		})

		local lockedShaking = false
		local function playLockedShake()
			if lockedShaking then return end
			lockedShaking = true
			local origin = ToggleCircle.Position
			local ox = origin.X.Offset
			local offsets = { 4, -4, 3, -3, 2, -2, 0 }
			local function step(i)
				if i > #offsets then
					ToggleCircle.Position = origin
					lockedShaking = false
					return
				end
				TweenService:Create(
					ToggleCircle,
					TweenInfo.new(0.04, Enum.EasingStyle.Linear),
					{ Position = UDim2.new(origin.X.Scale, ox + offsets[i], origin.Y.Scale, origin.Y.Offset) }
				):Play()
				task.delay(0.04, function() step(i + 1) end)
			end
			step(1)
		end

		local function updateLockVisuals()
			TweenService:Create(
				ToggleFrame.Frame,
				TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ BackgroundTransparency = Toggle.Locked and 0.8 or 0 }
			):Play()
		end

		function Toggle:OnChanged(Func)
			Toggle.Changed = Func
			Func(Toggle.Value)
		end

		function Toggle:Lock(State)
			Toggle.Locked = State
			updateLockVisuals()
		end

		function Toggle:SetValue(Value)
			if Toggle.Locked then return end
			Value = not not Value
			Toggle.Value = Value

			Creator.OverrideTag(ToggleBorder, { Color = Toggle.Value and "Accent" or "ToggleSlider" })
			Creator.OverrideTag(ToggleCircle, { ImageColor3 = Toggle.Value and "ToggleToggled" or "ToggleSlider" })
			TweenService:Create(
				ToggleCircle,
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Position = UDim2.new(0, Toggle.Value and 19 or 2, 0.5, 0) }
			):Play()
			TweenService:Create(
				ToggleSlider,
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ BackgroundTransparency = Toggle.Value and 0.45 or 1 }
			):Play()
			ToggleCircle.ImageTransparency = Toggle.Value and 0 or 0.5

			Library:SafeCallback(Toggle.Callback, Toggle.Value)
			Library:SafeCallback(Toggle.Changed, Toggle.Value)
		end

		function Toggle:Destroy()
			ToggleFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Creator.AddSignal(ToggleFrame.Frame.MouseButton1Click, function()
			if Toggle.Locked then
				playLockedShake()
				return
			end
			Toggle:SetValue(not Toggle.Value)
		end)

		if Toggle.Locked then
			updateLockVisuals()
		end

		Toggle:SetValue(Toggle.Value)

		Library.Options[Idx] = Toggle
		return Toggle
	end

	return Element
end)()
ElementsTable.Dropdown = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Dropdown"

	function Element:New(Idx, Config, Parent)
		assert(self.Library, "Dropdown - Missing Library context")
		local Library = self.Library

		local Dropdown = {
			Values = Config.Values,
			Value = Config.Default,
			Multi = Config.Multi,
			Buttons = {},
			Opened = false,
			Type = "Dropdown",
			Callback = Config.Callback or function() end,
			Search = (Config.Search == nil) and true or Config.Search,
			KeepSearch = Config.KeepSearch == true,
            Locked = Config.Locked or false,
		}

		local DropdownFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		DropdownFrame.DescLabel.Size = UDim2.new(1, -170, 0, 14)

		Dropdown.SetTitle = DropdownFrame.SetTitle
		Dropdown.SetDesc = DropdownFrame.SetDesc
        Dropdown.Visible = DropdownFrame.Visible
        Dropdown.Elements = DropdownFrame

		local DropdownDisplay = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = "Value",
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -40, 1, 0),
			Position = UDim2.new(0, 8, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		local DropdownIco = New("ImageLabel", {
			Image = Library:GetIcon("chevron-down"),
			Size = UDim2.fromOffset(16, 16),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -8, 0.5, 0),
			BackgroundTransparency = 1,
			ThemeTag = {
				ImageColor3 = "SubText",
			},
		})

		local IcoMotor, SetIcoRotation = Creator.SpringMotor(0, DropdownIco, "Rotation")

		local DropdownInner = New("TextButton", {
			Size = UDim2.fromOffset(180, 30),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.9,
			Parent = DropdownFrame.Frame,
			ThemeTag = {
				BackgroundColor3 = "DropdownFrame",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 5),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = "InElementBorder",
				},
			}),
			DropdownIco,
			DropdownDisplay,
		})

		local DropdownListLayout = New("UIListLayout", {
			Padding = UDim.new(0, 3),
		})

		local DROPDOWN_Z_INDEX = 100000 -- Hardcoded high offset to ensure it's above normal window layers

		local DropdownScrollFrame = New("ScrollingFrame", {
			Size = UDim2.new(1, -5, 1, -10),
			Position = UDim2.fromOffset(5, 5),
			BackgroundTransparency = 1,
			BottomImage = "rbxassetid://6889812791",
			MidImage = "rbxassetid://6889812721",
			TopImage = "rbxassetid://6276641225",
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			ScrollBarImageTransparency = 0.95,
			ScrollBarThickness = 4,
			BorderSizePixel = 0,
			CanvasSize = UDim2.fromScale(0, 0),
            ZIndex = DROPDOWN_Z_INDEX + 2,
		}, {
			DropdownListLayout,
		})

		local SearchBar
		local SearchBox
		local DropdownHolderCanvas, DropdownHolderFrame
		local function RecalculateListPosition()
			if not DropdownHolderCanvas or not DropdownInner then return end
            
            local viewportSize = Camera.ViewportSize
            local gui = Library.GUI
            local guiAbsPos = gui.AbsolutePosition
            
            local row = DropdownFrame.Frame
            local btn = DropdownInner
            local list = DropdownHolderCanvas
            
            -- Defensive wait for layout
            if row.AbsoluteSize.Y == 0 then task.wait() end

            local rowAbsPos = row.AbsolutePosition
            local rowAbsSize = row.AbsoluteSize
            local btnAbsPos = btn.AbsolutePosition
            local btnAbsSize = btn.AbsoluteSize
            local listAbsSize = list.AbsoluteSize

            -- Calculate relative to button instead of row for a tighter fit
            local targetY = (btnAbsPos.Y - guiAbsPos.Y) + btnAbsSize.Y + 6
            local targetX = (btnAbsPos.X - guiAbsPos.X)
            
            -- Flip logic: if opens off-screen, open above the button instead
            if targetY + listAbsSize.Y > viewportSize.Y - 20 then
                targetY = (btnAbsPos.Y - guiAbsPos.Y) - listAbsSize.Y - 6
            end
            
            -- Bounds safety for X
            targetX = math.clamp(targetX, 5, (viewportSize.X - guiAbsPos.X) - listAbsSize.X - 5)
            
            list.Position = UDim2.fromOffset(targetX, targetY)
		end

		local function RecalculateListSize()
            local visibleCount = 0
            for _, element in next, DropdownScrollFrame:GetChildren() do
                if not element:IsA("UIListLayout") and element.Visible then
                    visibleCount = visibleCount + 1
                end
            end
            
            local itemHeight = 32
            local padding = 3
            local searchHeight = Dropdown.Search and 38 or 0
            local innerMargins = 10
            local estimatedContent = (visibleCount > 0) and (visibleCount * itemHeight + (visibleCount - 1) * padding + innerMargins + searchHeight) or (innerMargins + searchHeight)
            local maxHeight = 392
            local targetHeight = math.min(estimatedContent, maxHeight)
            
            DropdownHolderCanvas.Size = UDim2.fromOffset(DropdownInner.AbsoluteSize.X, targetHeight)
		end

		local function RecalculateCanvasSize()
			DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0, DropdownListLayout.AbsoluteContentSize.Y)
		end

		if Dropdown.Search then
			SearchBar = New("Frame", {
				Size = UDim2.new(1, -10, 0, 28),
				Position = UDim2.fromOffset(5, 5),
				BackgroundTransparency = 0.7,
				BackgroundColor3 = Color3.fromRGB(20, 20, 20),
				ThemeTag = { BackgroundColor3 = "Element" },
				ZIndex = DROPDOWN_Z_INDEX + 2,
			}, {
				New("UICorner", { CornerRadius = UDim.new(0, 4) }),
			})

			SearchBox = New("TextBox", {
				FontFace = resolveFont(Library.Font),
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -36, 1, 0),
				Position = UDim2.new(0, 10, 0, 0),
				PlaceholderText = "Search...",
				PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
				ClearTextOnFocus = false,
				Text = "",
				Parent = SearchBar,
				ThemeTag = {
					TextColor3 = "Text",
					PlaceholderColor3 = "SubText",
				},
				ZIndex = DROPDOWN_Z_INDEX + 3,
			})

			local SearchIcon = New("ImageLabel", {
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.new(1, -13, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			Image = Library:GetIcon("search"),
			Parent = SearchBar,
			ImageTransparency = 0.3,
			ZIndex = DROPDOWN_Z_INDEX + 4,
				ThemeTag = {
					ImageColor3 = "SubText",
				},
			})

			DropdownScrollFrame.Position = UDim2.fromOffset(5, 38)
			DropdownScrollFrame.Size = UDim2.new(1, -5, 1, -43)

			local function ApplyFilter()
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

				local success, text = pcall(function() return RobustLower(SearchBox.Text) end)
				if not success then text = "" end

				for _, element in next, DropdownScrollFrame:GetChildren() do
					if not element:IsA("UIListLayout") then
						local label = element:FindFirstChild("ButtonLabel")
						local value = label and label.Text or ""
						element.Visible = text == "" or RobustLower(value):find(text, 1, true) ~= nil
					end
				end
				
				RecalculateCanvasSize()
				RecalculateListSize()
				RecalculateListPosition()
			end
			
			Dropdown.ApplyFilter = ApplyFilter
			Creator.AddSignal(SearchBox:GetPropertyChangedSignal("Text"), ApplyFilter)
		end

-- Helper functions moved up above filtering logic

		local DropdownHolderFrame = New("Frame", {
			Size = UDim2.fromScale(1, 1),
            ZIndex = DROPDOWN_Z_INDEX + 1,
			ThemeTag = {
				BackgroundColor3 = "DropdownHolder",
			},
		}, {
            SearchBar,
			DropdownScrollFrame,
			New("UICorner", {
				CornerRadius = UDim.new(0, 7),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = "DropdownBorder",
				},
			}),
			New("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "http://www.roblox.com/asset/?id=5554236805",
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(23, 23, 277, 277),
				Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
				Position = UDim2.fromOffset(-15, -15),
				ImageColor3 = Color3.fromRGB(0, 0, 0),
				ImageTransparency = 0.1,
			}),
		})

		DropdownHolderCanvas = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(180, 300),
			Parent = self.Library.GUI,
			Visible = false,
            ZIndex = DROPDOWN_Z_INDEX,
		}, {
			DropdownHolderFrame,
			New("UISizeConstraint", {
				MinSize = Vector2.new(160, 0),
			}),
		})
		table.insert(Library.OpenFrames, DropdownHolderCanvas)

        Dropdown.HolderCanvas = DropdownHolderCanvas
        Dropdown.HolderFrame = DropdownHolderFrame

-- Helper functions moved up

		RecalculateListPosition()
		RecalculateListSize()

		Creator.AddSignal(DropdownInner:GetPropertyChangedSignal("AbsolutePosition"), RecalculateListPosition)

		local function checkSelected(obj)
			if not obj then return true end
			if (obj.Type == "Tab" or obj.Type == "SubTab") and not obj.Selected then
				return false
			end
			if obj.Parent then return checkSelected(obj.Parent) end
			return true
		end

		Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
                if not checkSelected(Parent) then return end
                
                local mousePos = Input.UserInputType == Enum.UserInputType.MouseButton1 and Vector2.new(Mouse.X, Mouse.Y) or Vector2.new(Input.Position.X, Input.Position.Y)
				local AbsPos, AbsSize = DropdownHolderFrame.AbsolutePosition, DropdownHolderFrame.AbsoluteSize
                local innerAbsPos, innerAbsSize = DropdownInner.AbsolutePosition, DropdownInner.AbsoluteSize
                
				local clickedInsideDropdown = mousePos.X >= AbsPos.X and mousePos.X <= AbsPos.X + AbsSize.X and mousePos.Y >= AbsPos.Y and mousePos.Y <= AbsPos.Y + AbsSize.Y
                local clickedInsideInner = mousePos.X >= innerAbsPos.X and mousePos.X <= innerAbsPos.X + innerAbsSize.X and mousePos.Y >= innerAbsPos.Y and mousePos.Y <= innerAbsPos.Y + innerAbsSize.Y
                
                if clickedInsideInner and not Dropdown.Locked then
                    if Dropdown.Opened then
                        Dropdown:Close()
                    else
                        Dropdown:Open()
                    end
                elseif not clickedInsideDropdown and not clickedInsideInner then
                    if Dropdown.Opened then
                        Dropdown:Close()
                    end
                end
			end
		end)

		local ScrollFrame = self.ScrollFrame
		function Dropdown:Open()
            if Dropdown.Opened then return end
			
			-- Close other dropdowns before opening this one (but not this one)
			Library:CloseOtherDropdowns(Dropdown)
			
			Dropdown.Opened = true
			DropdownHolderCanvas.Visible = true
            
            SetIcoRotation(180)

            -- Ensure size and layout is calculated before positioning
            RecalculateListSize()
            RecalculateCanvasSize()
            task.wait()
            RecalculateListSize()
            RecalculateListPosition()
			
			-- Bring to front
			Library:BringDropdownToFront(Dropdown)
			
			TweenService:Create(
				DropdownHolderFrame,
				TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{ Size = UDim2.fromScale(1, 1) }
			):Play()
		end

		function Dropdown:Close()
            if not Dropdown.Opened then return end
			Dropdown.Opened = false
			DropdownHolderFrame.Size = UDim2.fromScale(1, 0.6)
			DropdownHolderCanvas.Visible = false
            SetIcoRotation(0)
            Dropdown:Display()
		end

		function Dropdown:Display()
			local Values = Dropdown.Values
			local Str = ""

			if Config.Multi then
				for Idx, Value in next, Values do
					if Dropdown.Value[Value] then
						Str = Str .. Value .. ", "
					end
				end
				Str = Str:sub(1, #Str - 2)
			else
				Str = Dropdown.Value or ""
			end

			DropdownDisplay.Text = (Str == "" and "--" or Str)
		end

		function Dropdown:GetActiveValues()
			if Config.Multi then
				local T = {}

				for Value, Bool in next, Dropdown.Value do
					table.insert(T, Value)
				end

				return T
			else
				return Dropdown.Value and 1 or 0
			end
		end

		function Dropdown:BuildDropdownList()
			local Values = Dropdown.Values
			local Buttons = {}

			for _, Element in next, DropdownScrollFrame:GetChildren() do
				if not Element:IsA("UIListLayout") then
					Element:Destroy()
				end
			end

			local Count = 0

			for Idx, Value in next, Values do
				local Table = {}

				Count = Count + 1

				local ButtonSelector = New("Frame", {
					Size = UDim2.fromOffset(4, 14),
					BackgroundColor3 = Color3.fromRGB(76, 194, 255),
					Position = UDim2.fromOffset(-1, 16),
					AnchorPoint = Vector2.new(0, 0.5),
					ThemeTag = {
						BackgroundColor3 = "Accent",
					},
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(0, 2),
					}),
				})

				local ButtonLabel = New("TextLabel", {
					FontFace = resolveFont(Library.Font),
					Text = Value,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromOffset(10, 0),
					Name = "ButtonLabel",
					ThemeTag = {
						TextColor3 = "Text",
					},
				})

				local Button = New("TextButton", {
					Size = UDim2.new(1, -5, 0, 32),
					BackgroundTransparency = 1,
					ZIndex = DROPDOWN_Z_INDEX + 3,
					Text = "",
					Parent = DropdownScrollFrame,
					ThemeTag = {
						BackgroundColor3 = "DropdownOption",
					},
				}, {
					ButtonSelector,
					ButtonLabel,
					New("UICorner", {
						CornerRadius = UDim.new(0, 6),
					}),
				})

				local Selected

				if Config.Multi then
					Selected = Dropdown.Value[Value]
				else
					Selected = Dropdown.Value == Value
				end

				local BackMotor, SetBackTransparency = Creator.SpringMotor(1, Button, "BackgroundTransparency")
				local SelMotor, SetSelTransparency = Creator.SpringMotor(1, ButtonSelector, "BackgroundTransparency")
				local SelectorSizeMotor = Flipper.SingleMotor.new(6)

				SelectorSizeMotor:onStep(function(value)
					ButtonSelector.Size = UDim2.new(0, 4, 0, value)
				end)

				Creator.AddSignal(Button.MouseEnter, function()
					SetBackTransparency(Selected and 0.85 or 0.89)
				end)
				Creator.AddSignal(Button.MouseLeave, function()
					SetBackTransparency(Selected and 0.89 or 1)
				end)
				Creator.AddSignal(Button.MouseButton1Down, function()
					SetBackTransparency(0.92)
				end)
				Creator.AddSignal(Button.MouseButton1Up, function()
					SetBackTransparency(Selected and 0.85 or 0.89)
				end)

				function Table:UpdateButton()
					if Config.Multi then
						Selected = Dropdown.Value[Value]
						if Selected then
							SetBackTransparency(0.89)
						end
					else
						Selected = Dropdown.Value == Value
						SetBackTransparency(Selected and 0.89 or 1)
					end

					SelectorSizeMotor:setGoal(Flipper.Spring.new(Selected and 14 or 6, { frequency = 6 }))
					SetSelTransparency(Selected and 0 or 1)
				end

				AddSignal(Button.Activated, function()
					local Try = not Selected

					if Dropdown:GetActiveValues() == 1 and not Try and not Config.AllowNull then
					else
						if Config.Multi then
							Selected = Try
							Dropdown.Value[Value] = Selected and true or nil
						else
							Selected = Try
							Dropdown.Value = Selected and Value or nil

							for _, OtherButton in next, Buttons do
								OtherButton:UpdateButton()
							end
						end

						Table:UpdateButton()
						Dropdown:Display()

						Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
						Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
					end
				end)

				Table:UpdateButton()
				Dropdown:Display()

				Buttons[Button] = Table
			end

			RecalculateCanvasSize()
			RecalculateListSize()
			
			if Dropdown.ApplyFilter then
				Dropdown.ApplyFilter()
			end
		end

		function Dropdown:SetValues(NewValues)
			if NewValues then
				Dropdown.Values = NewValues
			end

			Dropdown:BuildDropdownList()
		end

		function Dropdown:OnChanged(Func)
			Dropdown.Changed = Func
			Func(Dropdown.Value)
		end

		function Dropdown:SetValue(Val)
			if Dropdown.Multi then
				local nTable = {}

				for Value, Bool in next, Val do
					if table.find(Dropdown.Values, Value) then
						nTable[Value] = true
					end
				end

				Dropdown.Value = nTable
			else
				if not Val then
					Dropdown.Value = nil
				elseif table.find(Dropdown.Values, Val) then
					Dropdown.Value = Val
				end
			end

			Dropdown:BuildDropdownList()

			Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
			Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
		end

		function Dropdown:Destroy()
			DropdownFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Dropdown:BuildDropdownList()
		Dropdown:Display()

		local Defaults = {}

		if type(Config.Default) == "string" then
			local Idx = table.find(Dropdown.Values, Config.Default)
			if Idx then
				table.insert(Defaults, Idx)
			end
		elseif type(Config.Default) == "table" then
			for _, Value in next, Config.Default do
				local Idx = table.find(Dropdown.Values, Value)
				if Idx then
					table.insert(Defaults, Idx)
				end
			end
		elseif type(Config.Default) == "number" and Dropdown.Values[Config.Default] ~= nil then
			table.insert(Defaults, Config.Default)
		end

		if next(Defaults) then
			for i = 1, #Defaults do
				local Index = Defaults[i]
				if Config.Multi then
					Dropdown.Value[Dropdown.Values[Index]] = true
				else
					Dropdown.Value = Dropdown.Values[Index]
				end

				if not Config.Multi then
					break
				end
			end

			Dropdown:BuildDropdownList()
			Dropdown:Display()
		end

		Library.Options[Idx] = Dropdown
		return Dropdown
	end

	return Element
end)()
ElementsTable.Paragraph = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Paragraph"

	function Element:New(Config)
		Config.Content = Config.Content or ""

		local Paragraph = Components.Element(Config.Title, Config.Content, self.Container, false, Config)
		Paragraph.Frame.BackgroundTransparency = 0.92
		Paragraph.Border.Transparency = 0.6

		Paragraph.SetTitle = Paragraph.SetTitle
		Paragraph.SetDesc = Paragraph.SetDesc
		Paragraph.Visible = Paragraph.Visible
		Paragraph.Elements = Paragraph

		return Element
	end

	return Element
end)()
ElementsTable.Slider = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Slider"

	function Element:New(Idx, Config)
		assert(Config.Title, "Slider - Missing Title.")
		assert(Config.Default ~= nil, "Slider - Missing default value.")
		assert(Config.Min ~= nil, "Slider - Missing minimum value.")
		assert(Config.Max ~= nil, "Slider - Missing maximum value.")
		assert(Config.Rounding ~= nil, "Slider - Missing rounding value.")

		local Slider = {
			Value = nil,
			Min = Config.Min,
			Max = Config.Max,
			Rounding = Config.Rounding,
			Callback = Config.Callback or function(Value) end,
			Type = "Slider",
			_currentWidthTween = nil,
		}

		local Dragging = false
		local inputVisible = false

		local SliderFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		SliderFrame.DescLabel.Size = UDim2.new(1, -150, 0, 16)
		SliderFrame.TitleHolder.Size = UDim2.new(1, -150, 0, 16)

		Slider.Elements = SliderFrame
		Slider.SetTitle = SliderFrame.SetTitle
		Slider.SetDesc = SliderFrame.SetDesc
		Slider.Visible = SliderFrame.Visible

		local SliderDot = New("ImageLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, -7, 0.5, 0),
			Size = UDim2.fromOffset(14, 14),
			Image = "http://www.roblox.com/asset/?id=12266946128",
			Active = true,
			ThemeTag = {
				ImageColor3 = "Accent",
			},
		})

		local SliderRail = New("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(7, 0),
			Size = UDim2.new(1, -14, 1, 0),
			Active = true,
		}, {
			SliderDot,
		})

		local SliderFill = New("Frame", {
			Size = UDim2.new(0, 0, 1, 0),
			ThemeTag = {
				BackgroundColor3 = "Accent",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(1, 0),
			}),
		})

		local SliderDisplay = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = "Value",
			TextSize = 12,
			TextWrapped = false,
			TextXAlignment = Enum.TextXAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 28, 0, 14),
			Position = UDim2.new(0, -4, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			TextTransparency = 0,
			ThemeTag = {
				TextColor3 = "SubText",
			},
		})

		local SliderInput = New("TextBox", {
			FontFace = resolveFont(Library.Font),
			Text = "",
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(0, 28, 0, 20),
			Position = UDim2.new(0, -4, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			PlaceholderText = "",
			ClearTextOnFocus = false,
			Visible = true,
			TextWrapped = false,
			TextTransparency = 1,
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = "Text",
				BackgroundColor3 = "Element",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = 1,
				Thickness = 1,
				ThemeTag = {
					Color = "DropdownBorder",
				}
			}),
		})

		local SliderInner = New("Frame", {
			Size = UDim2.new(1, 0, 0, 4),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			BackgroundTransparency = 0.4,
			Parent = SliderFrame.Frame,
			ThemeTag = {
				BackgroundColor3 = "SliderRail",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(1, 0),
			}),
			New("UISizeConstraint", {
				MaxSize = Vector2.new(100, math.huge),
			}),
			SliderDisplay,
			SliderInput,
			SliderFill,
			SliderRail,
		})

		local isHovering = false

		local function calculateInputWidth(text)
			local textSize = game:GetService("TextService"):GetTextSize(
				text or "0",
				12,
				Enum.Font.SourceSans,
				Vector2.new(1000, 14)
			)
			return math.clamp(textSize.X + 16, 32, 80)
		end

		local function updateInputWidth(text, animate)
			local targetWidth = calculateInputWidth(text)
			local currentWidth = SliderInput.Size.X.Offset

			if animate and math.abs(targetWidth - currentWidth) > 0.5 then
				TweenService:Create(SliderInput, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, targetWidth, 0, 20)
				}):Play()
				TweenService:Create(SliderDisplay, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, targetWidth, 0, 14)
				}):Play()
			else
				SliderInput.Size = UDim2.new(0, targetWidth, 0, 20)
				SliderDisplay.Size = UDim2.new(0, targetWidth, 0, 14)
			end
		end

		Creator.AddSignal(SliderFrame.Frame.MouseEnter, function()
			isHovering = true
			if not SliderInput:IsFocused() then
				SliderInput.Text = tostring(Slider.Value)
				updateInputWidth(tostring(Slider.Value), true)
				inputVisible = true

				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

				TweenService:Create(SliderDisplay, tweenInfo, {
					TextTransparency = 1,
				}):Play()

				TweenService:Create(SliderInput, tweenInfo, {
					TextTransparency = 0,
					BackgroundTransparency = 0.5,
				}):Play()

				TweenService:Create(SliderInput.UIStroke, tweenInfo, {
					Transparency = 0.6
				}):Play()
			end
		end)

		Creator.AddSignal(SliderFrame.Frame.MouseLeave, function()
			isHovering = false
			if not SliderInput:IsFocused() then
				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				
				SliderDisplay.Text = SliderInput.Text
				updateInputWidth(SliderDisplay.Text, true)

				TweenService:Create(SliderInput, tweenInfo, {
					TextTransparency = 1,
					BackgroundTransparency = 1,
				}):Play()

				TweenService:Create(SliderInput.UIStroke, tweenInfo, {
					Transparency = 1
				}):Play()

				TweenService:Create(SliderDisplay, tweenInfo, {
					TextTransparency = 0,
				}):Play()
			end
		end)

		Creator.AddSignal(SliderInput.Changed, function(property)
			if property == "Text" then
				local text = SliderInput.Text
				local cleanText = text:gsub("[^%d%.%-]", "")
				if cleanText:find("%-") and cleanText:find("%-") ~= 1 then
					cleanText = cleanText:gsub("%-", "")
				end
				local dotCount = 0
				cleanText = cleanText:gsub("%.", function()
					dotCount = dotCount + 1
					return dotCount == 1 and "." or ""
				end)

				if cleanText ~= text then
					SliderInput.Text = cleanText
					return
				end

				if isHovering or SliderInput:IsFocused() then
					updateInputWidth(cleanText, true)
				end
			end
		end)

		Creator.AddSignal(SliderInput.FocusLost, function(enterPressed)
			local inputValue = tonumber(SliderInput.Text)
			if inputValue then
				Slider:SetValue(inputValue)
			else
				SliderInput.Text = tostring(Slider.Value)
				updateInputWidth(tostring(Slider.Value), true)
			end

			if not isHovering then
				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

				TweenService:Create(SliderInput, tweenInfo, {
					TextTransparency = 1,
					BackgroundTransparency = 1
				}):Play()

				TweenService:Create(SliderInput.UIStroke, tweenInfo, {
					Transparency = 1
				}):Play()

				task.wait(0.2)
				SliderDisplay.Visible = true
				inputVisible = false
			end
		end)

		Creator.AddSignal(SliderInput.Focused, function()
			SliderInput.Text = tostring(Slider.Value)
			updateInputWidth(tostring(Slider.Value), false)
		end)

		Creator.AddSignal(SliderInput.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = false
			end
		end)

		local MoveConn, EndConn

		Creator.AddSignal(SliderDot.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = true

				if MoveConn then MoveConn:Disconnect() end
				if EndConn then EndConn:Disconnect() end

				MoveConn = UserInputService.InputChanged:Connect(function(MoveInput)
					if MoveInput.UserInputType == Enum.UserInputType.MouseMovement or MoveInput.UserInputType == Enum.UserInputType.Touch then
						local SizeScale = math.clamp((MoveInput.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
						Slider:SetValue(Slider.Min + ((Slider.Max - Slider.Min) * SizeScale))
					end
				end)

				EndConn = UserInputService.InputEnded:Connect(function(EndInput)
					if EndInput.UserInputType == Enum.UserInputType.MouseButton1 or EndInput.UserInputType == Enum.UserInputType.Touch then
						Dragging = false
						if MoveConn then MoveConn:Disconnect() MoveConn = nil end
						if EndConn then EndConn:Disconnect() EndConn = nil end
					end
				end)
			end
		end)

		Creator.AddSignal(SliderDot.InputEnded, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = false
			end
		end)

-- Removed global InputChanged listener for performance

		Creator.AddSignal(SliderFrame.Frame.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				local SizeScale = math.clamp((Input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
				Slider:SetValue(Slider.Min + ((Slider.Max - Slider.Min) * SizeScale))
			end
		end)

		Creator.AddSignal(SliderFrame.Frame.InputEnded, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = false
			end
		end)

		Creator.AddSignal(SliderRail.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				local SizeScale = math.clamp((Input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
				Slider:SetValue(Slider.Min + ((Slider.Max - Slider.Min) * SizeScale))
			end
		end)

		Creator.AddSignal(SliderRail.InputEnded, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = false
			end
		end)

		local GlobalInputEnded = Creator.AddSignal(UserInputService.InputEnded, function(Input)
			if Dragging and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
				Dragging = false
			end
		end)

		function Slider:OnChanged(Func)
			Slider.Changed = Func
			Func(Slider.Value)
		end

		function Slider:SetValue(Value)
			self.Value = Library:Round(math.clamp(Value, Slider.Min, Slider.Max), Slider.Rounding)
			SliderDot.Position = UDim2.new((self.Value - Slider.Min) / (Slider.Max - Slider.Min), -7, 0.5, 0)
			SliderFill.Size = UDim2.fromScale((self.Value - Slider.Min) / (Slider.Max - Slider.Min), 1)
			SliderDisplay.Text = tostring(self.Value)

			if inputVisible or SliderInput:IsFocused() then
				SliderInput.Text = tostring(self.Value)
				updateInputWidth(tostring(self.Value), not SliderInput:IsFocused())
			end
			if not inputVisible and not SliderInput:IsFocused() then
				SliderInput.Text = tostring(self.Value)
			end

			Library:SafeCallback(Slider.Callback, self.Value)
			Library:SafeCallback(Slider.Changed, self.Value)
		end

		function Slider:Destroy()
			if self._currentWidthTween then
				self._currentWidthTween:Cancel()
				self._currentWidthTween = nil
			end
			if GlobalInputEnded then
				Creator.RemoveSignal(GlobalInputEnded)
			end
			SliderFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Slider:SetValue(Config.Default)

		Library.Options[Idx] = Slider
		return Slider
	end

	return Element
end)()
ElementsTable.Keybind = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Keybind"

	function Element:New(Idx, Config)
		assert(Config.Title, "KeyBind - Missing Title")
		assert(Config.Default, "KeyBind - Missing default value.")

		local Keybind = {
			Value = Config.Default,
			Toggled = false,
			Mode = Config.Mode or "Toggle",
			Type = "Keybind",
			Callback = Config.Callback or function(Value) end,
			ChangedCallback = Config.ChangedCallback or function(New) end,
		}

		local Picking = false

		local KeybindFrame = Components.Element(Config.Title, Config.Description, self.Container, true)
		KeybindFrame.TitleHolder.Size = UDim2.new(1, -85, 0, 16)
		if KeybindFrame.DescLabel then
			KeybindFrame.DescLabel.Size = UDim2.new(1, -85, 0, 16)
		end

		Keybind.SetTitle = KeybindFrame.SetTitle
		Keybind.SetDesc = KeybindFrame.SetDesc
		Keybind.Visible = KeybindFrame.Visible
		Keybind.Elements = KeybindFrame

		local KeybindDisplayLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Config.Default,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Center,
			Size = UDim2.new(0, 0, 0, 14),
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		local KeybindDisplayFrame = New("TextButton", {
			Size = UDim2.fromOffset(0, 30),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.9,
			Parent = KeybindFrame.Frame,
			AutomaticSize = Enum.AutomaticSize.X,
			ThemeTag = {
				BackgroundColor3 = "Keybind",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 5),
			}),
			New("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = "InElementBorder",
				},
			}),
			KeybindDisplayLabel,
		})

		function Keybind:GetState()
			if UserInputService:GetFocusedTextBox() and Keybind.Mode ~= "Always" then
				return false
			end

			if Keybind.Mode == "Always" then
				return true
			elseif Keybind.Mode == "Hold" then
				if Keybind.Value == "None" then
					return false
				end

				local Key = Keybind.Value

				if Key == "MouseLeft" or Key == "MouseRight" then
					return Key == "MouseLeft" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
						or Key == "MouseRight"
						and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
				else
					return UserInputService:IsKeyDown(Enum.KeyCode[Keybind.Value])
				end
			else
				return Keybind.Toggled
			end
		end

		function Keybind:SetValue(Key, Mode)
			Key = Key or Keybind.Value
			Mode = Mode or Keybind.Mode

			KeybindDisplayLabel.Text = Key
			Keybind.Value = Key
			Keybind.Mode = Mode
		end

		function Keybind:OnClick(Callback)
			Keybind.Clicked = Callback
		end

		function Keybind:OnChanged(Callback)
			Keybind.Changed = Callback
			Callback(Keybind.Value)
		end

		function Keybind:DoClick()
			Library:SafeCallback(Keybind.Callback, Keybind.Toggled)
			Library:SafeCallback(Keybind.Clicked, Keybind.Toggled)
		end

		local PickEvent, PickEndedEvent

		Creator.AddSignal(KeybindDisplayFrame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Picking = true
				KeybindDisplayLabel.Text = "..."

				if PickEvent then PickEvent:Disconnect() PickEvent = nil end
				if PickEndedEvent then PickEndedEvent:Disconnect() PickEndedEvent = nil end

				task.wait(0.2)

				PickEvent = UserInputService.InputBegan:Connect(function(Input)
					local Key

					if Input.UserInputType == Enum.UserInputType.Keyboard then
						Key = Input.KeyCode.Name
					elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
						Key = "MouseLeft"
					elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
						Key = "MouseRight"
					end

					PickEndedEvent = UserInputService.InputEnded:Connect(function(Input)
						if
							Input.KeyCode.Name == Key
							or Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
						then
							Picking = false

							KeybindDisplayLabel.Text = Key
							Keybind.Value = Key

							Library:SafeCallback(Keybind.ChangedCallback, Input.KeyCode or Input.UserInputType)
							Library:SafeCallback(Keybind.Changed, Input.KeyCode or Input.UserInputType)

							if PickEvent then PickEvent:Disconnect() PickEvent = nil end
							if PickEndedEvent then PickEndedEvent:Disconnect() PickEndedEvent = nil end
						end
					end)
				end)
			end
		end)

		local GlobalInputBegan = Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if not Picking and not UserInputService:GetFocusedTextBox() then
				if Keybind.Mode == "Toggle" then
					local Key = Keybind.Value

					if Key == "MouseLeft" or Key == "MouseRight" then
						if
							Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
						then
							Keybind.Toggled = not Keybind.Toggled
							Keybind:DoClick()
						end
					elseif Input.UserInputType == Enum.UserInputType.Keyboard then
						if Input.KeyCode.Name == Key then
							Keybind.Toggled = not Keybind.Toggled
							Keybind:DoClick()
						end
					end
				end
			end
		end)

		function Keybind:Destroy()
			if GlobalInputBegan then
				Creator.RemoveSignal(GlobalInputBegan)
			end
			KeybindFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Library.Options[Idx] = Keybind
		return Keybind
	end

	return Element
end)()
ElementsTable.Colorpicker = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Colorpicker"

	function Element:New(Idx, Config)
		assert(Config.Title, "Colorpicker - Missing Title")
		assert(Config.Default, "AddColorPicker: Missing default value.")

		local Colorpicker = {
			Value = Config.Default,
			Transparency = Config.Transparency or 0,
			Type = "Colorpicker",
			Title = type(Config.Title) == "string" and Config.Title or "Colorpicker",
			Callback = Config.Callback or function(Color) end,
		}

		function Colorpicker:SetHSVFromRGB(Color)
			local H, S, V = Color3.toHSV(Color)
			Colorpicker.Hue = H
			Colorpicker.Sat = S
			Colorpicker.Vib = V
		end

		Colorpicker:SetHSVFromRGB(Colorpicker.Value)

		local ColorpickerFrame = Components.Element(Config.Title, Config.Description, self.Container, true)
		ColorpickerFrame.TitleHolder.Size = UDim2.new(1, -54, 0, 16)
		if ColorpickerFrame.DescLabel then
			ColorpickerFrame.DescLabel.Size = UDim2.new(1, -54, 0, 16)
		end

		Colorpicker.SetTitle = ColorpickerFrame.SetTitle
		Colorpicker.SetDesc = ColorpickerFrame.SetDesc
		Colorpicker.Visible = ColorpickerFrame.Visible
		Colorpicker.Elements = ColorpickerFrame

		local DisplayFrameColor = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Colorpicker.Value,
			Parent = ColorpickerFrame.Frame,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local DisplayFrame = New("ImageLabel", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Parent = ColorpickerFrame.Frame,
			Image = "http://www.roblox.com/asset/?id=14204231522",
			ImageTransparency = 0.45,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(40, 40),
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			DisplayFrameColor,
		})

		local function CreateColorDialog()
			local Dialog = Components.Dialog:Create()
			Dialog.Title.Text = Colorpicker.Title
			Dialog.Root.Size = UDim2.fromOffset(430, 330)

			local Hue, Sat, Vib = Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib
			local Transparency = Colorpicker.Transparency

			local function CreateInput()
				local Box = Components.Textbox()
				Box.Frame.Parent = Dialog.Root
				Box.Frame.Size = UDim2.new(0, 90, 0, 32)

				return Box
			end

			local function CreateInputLabel(Text, Pos)
				return New("TextLabel", {
FontFace = resolveFont(Library.Font),
					Text = Text,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 32),
					Position = Pos,
					BackgroundTransparency = 1,
					Parent = Dialog.Root,
					ThemeTag = {
						TextColor3 = "Text",
					},
				})
			end

			local function GetRGB()
				local Value = Color3.fromHSV(Hue, Sat, Vib)
				return { R = math.floor(Value.r * 255), G = math.floor(Value.g * 255), B = math.floor(Value.b * 255) }
			end

			local SatCursor = New("ImageLabel", {
				Size = UDim2.new(0, 18, 0, 18),
				ScaleType = Enum.ScaleType.Fit,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = "http://www.roblox.com/asset/?id=4805639000",
			})

			local SatVibMap = New("ImageLabel", {
				Size = UDim2.fromOffset(180, 160),
				Position = UDim2.fromOffset(20, 55),
				Image = "rbxassetid://4155801252",
				BackgroundColor3 = Colorpicker.Value,
				BackgroundTransparency = 0,
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				SatCursor,
			})

			local OldColorFrame = New("Frame", {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = Colorpicker.Transparency,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
			})
			local OldColorFrameChecker = New("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(112, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				New("UIStroke", {
					Thickness = 2,
					Transparency = 0.75,
				}),
				OldColorFrame,
			})

			local DialogDisplayFrame = New("Frame", {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
			})

			local DialogDisplayFrameChecker = New("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(20, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				New("UIStroke", {
					Thickness = 2,
					Transparency = 0.75,
				}),
				DialogDisplayFrame,
			})

			local HueSliderGradient = New("UIGradient", {
				Color = ColorSequence.new(HUE_SEQUENCE_TABLE),
				Rotation = 90,
			})

			local HueDragHolder = New("Frame", {
				Size = UDim2.new(1, 0, 1, -10),
				Position = UDim2.fromOffset(0, 5),
				BackgroundTransparency = 1,
			})

			local HueDrag = New("ImageLabel", {
				Size = UDim2.fromOffset(14, 14),
				Image = "http://www.roblox.com/asset/?id=12266946128",
				Parent = HueDragHolder,
				ThemeTag = {
					ImageColor3 = "DialogInput",
				},
			})

			local HueSlider = New("Frame", {
				Size = UDim2.fromOffset(12, 190),
				Position = UDim2.fromOffset(210, 55),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
				HueSliderGradient,
				HueDragHolder,
			})

			local HexInput = CreateInput()
			HexInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 55)
			CreateInputLabel("Hex", UDim2.fromOffset(Config.Transparency and 360 or 340, 55))

			local RedInput = CreateInput()
			RedInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 95)
			CreateInputLabel("Red", UDim2.fromOffset(Config.Transparency and 360 or 340, 95))

			local GreenInput = CreateInput()
			GreenInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 135)
			CreateInputLabel("Green", UDim2.fromOffset(Config.Transparency and 360 or 340, 135))

			local BlueInput = CreateInput()
			BlueInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 175)
			CreateInputLabel("Blue", UDim2.fromOffset(Config.Transparency and 360 or 340, 175))

			local AlphaInput
			if Config.Transparency then
				AlphaInput = CreateInput()
				AlphaInput.Frame.Position = UDim2.fromOffset(260, 215)
				CreateInputLabel("Alpha", UDim2.fromOffset(360, 215))
			end

			local TransparencySlider, TransparencyDrag, TransparencyColor
			if Config.Transparency then
				local TransparencyDragHolder = New("Frame", {
					Size = UDim2.new(1, 0, 1, -10),
					Position = UDim2.fromOffset(0, 5),
					BackgroundTransparency = 1,
				})

				TransparencyDrag = New("ImageLabel", {
					Size = UDim2.fromOffset(14, 14),
					Image = "http://www.roblox.com/asset/?id=12266946128",
					Parent = TransparencyDragHolder,
					ThemeTag = {
						ImageColor3 = "DialogInput",
					},
				})

				TransparencyColor = New("Frame", {
					Size = UDim2.fromScale(1, 1),
				}, {
					New("UIGradient", {
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}),
						Rotation = 270,
					}),
					New("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
				})

				TransparencySlider = New("Frame", {
					Size = UDim2.fromOffset(12, 190),
					Position = UDim2.fromOffset(230, 55),
					Parent = Dialog.Root,
					BackgroundTransparency = 1,
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
					New("ImageLabel", {
						Image = "http://www.roblox.com/asset/?id=14204231522",
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Parent = Dialog.Root,
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(1, 0),
						}),
					}),
					TransparencyColor,
					TransparencyDragHolder,
				})
			end

			local function Display()
				SatVibMap.BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)
				HueDrag.Position = UDim2.new(0, -1, Hue, -6)
				SatCursor.Position = UDim2.new(Sat, 0, 1 - Vib, 0)
				DialogDisplayFrame.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)

				HexInput.Input.Text = "#" .. Color3.fromHSV(Hue, Sat, Vib):ToHex()
				RedInput.Input.Text = GetRGB()["R"]
				GreenInput.Input.Text = GetRGB()["G"]
				BlueInput.Input.Text = GetRGB()["B"]

				if Config.Transparency then
					TransparencyColor.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)
					DialogDisplayFrame.BackgroundTransparency = Transparency
					TransparencyDrag.Position = UDim2.new(0, -1, 1 - Transparency, -6)
					AlphaInput.Input.Text = Library:Round((1 - Transparency) * 100, 0) .. "%"
				end
			end

			Creator.AddSignal(HexInput.Input.FocusLost, function(Enter)
				if Enter then
					local Success, Result = pcall(Color3.fromHex, HexInput.Input.Text)
					if Success and typeof(Result) == "Color3" then
						Hue, Sat, Vib = Color3.toHSV(Result)
					end
				end
				Display()
			end)

			Creator.AddSignal(RedInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result = pcall(Color3.fromRGB, RedInput.Input.Text, CurrentColor["G"], CurrentColor["B"])
					if Success and typeof(Result) == "Color3" then
						local val = tonumber(RedInput.Input.Text)
						if val and val >= 0 and val <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			Creator.AddSignal(GreenInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result =
						pcall(Color3.fromRGB, CurrentColor["R"], GreenInput.Input.Text, CurrentColor["B"])
					if Success and typeof(Result) == "Color3" then
						local val = tonumber(GreenInput.Input.Text)
						if val and val >= 0 and val <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			Creator.AddSignal(BlueInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result =
						pcall(Color3.fromRGB, CurrentColor["R"], CurrentColor["G"], BlueInput.Input.Text)
					if Success and typeof(Result) == "Color3" then
						local val = tonumber(BlueInput.Input.Text)
						if val and val >= 0 and val <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			if Config.Transparency then
				Creator.AddSignal(AlphaInput.Input.FocusLost, function(Enter)
					if Enter then
						pcall(function()
							local Value = tonumber(AlphaInput.Input.Text)
							if Value >= 0 and Value <= 100 then
								Transparency = 1 - Value * 0.01
							end
						end)
					end
					Display()
				end)
			end

			local SatMoveConn, SatEndConn

			Creator.AddSignal(SatVibMap.InputBegan, function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					local function UpdateSatVib(MoveInput)
						local MinX = SatVibMap.AbsolutePosition.X
						local MaxX = MinX + SatVibMap.AbsoluteSize.X
						local MouseX = math.clamp(MoveInput.Position.X, MinX, MaxX)

						local MinY = SatVibMap.AbsolutePosition.Y
						local MaxY = MinY + SatVibMap.AbsoluteSize.Y
						local MouseY = math.clamp(MoveInput.Position.Y, MinY, MaxY)

						Sat = (MouseX - MinX) / (MaxX - MinX)
						Vib = 1 - ((MouseY - MinY) / (MaxY - MinY))
						Display()
					end

					UpdateSatVib(Input)

					if SatMoveConn then SatMoveConn:Disconnect() end
					if SatEndConn then SatEndConn:Disconnect() end

					SatMoveConn = UserInputService.InputChanged:Connect(function(MoveInput)
						if MoveInput.UserInputType == Enum.UserInputType.MouseMovement or MoveInput.UserInputType == Enum.UserInputType.Touch then
							UpdateSatVib(MoveInput)
						end
					end)

					SatEndConn = UserInputService.InputEnded:Connect(function(EndInput)
						if EndInput.UserInputType == Enum.UserInputType.MouseButton1 or EndInput.UserInputType == Enum.UserInputType.Touch then
							if SatMoveConn then SatMoveConn:Disconnect() SatMoveConn = nil end
							if SatEndConn then SatEndConn:Disconnect() SatEndConn = nil end
						end
					end)
				end
			end)

			local HueMoveConn, HueEndConn

			Creator.AddSignal(HueSlider.InputBegan, function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					local function UpdateHue(MoveInput)
						local MinY = HueSlider.AbsolutePosition.Y
						local MaxY = MinY + HueSlider.AbsoluteSize.Y
						local MouseY = math.clamp(MoveInput.Position.Y, MinY, MaxY)

						Hue = ((MouseY - MinY) / (MaxY - MinY))
						Display()
					end

					UpdateHue(Input)

					if HueMoveConn then HueMoveConn:Disconnect() end
					if HueEndConn then HueEndConn:Disconnect() end

					HueMoveConn = UserInputService.InputChanged:Connect(function(MoveInput)
						if MoveInput.UserInputType == Enum.UserInputType.MouseMovement or MoveInput.UserInputType == Enum.UserInputType.Touch then
							UpdateHue(MoveInput)
						end
					end)

					HueEndConn = UserInputService.InputEnded:Connect(function(EndInput)
						if EndInput.UserInputType == Enum.UserInputType.MouseButton1 or EndInput.UserInputType == Enum.UserInputType.Touch then
							if HueMoveConn then HueMoveConn:Disconnect() HueMoveConn = nil end
							if HueEndConn then HueEndConn:Disconnect() HueEndConn = nil end
						end
					end)
				end
			end)

			if Config.Transparency then
				Creator.AddSignal(TransparencySlider.InputBegan, function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local MinY = TransparencySlider.AbsolutePosition.Y
							local MaxY = MinY + TransparencySlider.AbsoluteSize.Y
							local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

							Transparency = 1 - ((MouseY - MinY) / (MaxY - MinY))
							Display()

							RenderStepped:Wait()
						end
					end
				end)
			end

			Display()

			Dialog:Button("Done", function()
				Colorpicker:SetValue({ Hue, Sat, Vib }, Transparency)
			end)
			Dialog:Button("Cancel")
			Dialog:Open()
		end

		function Colorpicker:Display()
			Colorpicker.Value = Color3.fromHSV(Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib)

			DisplayFrameColor.BackgroundColor3 = Colorpicker.Value
			DisplayFrameColor.BackgroundTransparency = Colorpicker.Transparency

			Library:SafeCallback(Colorpicker.Callback, Colorpicker.Value)
			Library:SafeCallback(Colorpicker.Changed, Colorpicker.Value)
		end

		function Colorpicker:SetValue(HSV, Transparency)
			local Color = Color3.fromHSV(HSV[1], HSV[2], HSV[3])

			Colorpicker.Transparency = Transparency or 0
			Colorpicker:SetHSVFromRGB(Color)
			Colorpicker:Display()
		end

		function Colorpicker:SetValueRGB(Color, Transparency)
			Colorpicker.Transparency = Transparency or 0
			Colorpicker:SetHSVFromRGB(Color)
			Colorpicker:Display()
		end

		function Colorpicker:OnChanged(Func)
			Colorpicker.Changed = Func
			Func(Colorpicker.Value)
		end

		function Colorpicker:Destroy()
			ColorpickerFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Creator.AddSignal(ColorpickerFrame.Frame.MouseButton1Click, function()
			CreateColorDialog()
		end)

		Creator.AddSignal(ColorpickerFrame.Frame.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				CreateColorDialog()
			end
		end)

		Colorpicker:Display()

		Library.Options[Idx] = Colorpicker
		return Colorpicker
	end

	return Element
end)()
ElementsTable.Input = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Input"

	function Element:New(Idx, Config)
		assert(Config.Title, "Input - Missing Title")
		Config.Callback = Config.Callback or function() end

		local Input = {
			Value = Config.Default or "",
			Numeric = Config.Numeric or false,
			Finished = Config.Finished or false,
			Callback = Config.Callback or function(Value) end,
			Type = "Input",
		}

		local InputFrame = Components.Element(Config.Title, Config.Description, self.Container, false)
		InputFrame.TitleHolder.Size = UDim2.new(1, -180, 0, 16)
		if InputFrame.DescLabel then
			InputFrame.DescLabel.Size = UDim2.new(1, -180, 0, 16)
		end

		Input.SetTitle = InputFrame.SetTitle
		Input.SetDesc = InputFrame.SetDesc
		Input.Visible = InputFrame.Visible
		Input.Elements = InputFrame

		local Textbox = Components.Textbox(InputFrame.Frame, true)
		Textbox.Frame.Position = UDim2.new(1, -10, 0.5, 0)
		Textbox.Frame.AnchorPoint = Vector2.new(1, 0.5)
		Textbox.Frame.Size = UDim2.fromOffset(160, 30)
		Textbox.Input.Text = Config.Default or ""
		Textbox.Input.PlaceholderText = Config.Placeholder or ""

		local Box = Textbox.Input

		function Input:SetValue(Text)
			if Config.MaxLength and #Text > Config.MaxLength then
				Text = Text:sub(1, Config.MaxLength)
			end

			if Input.Numeric then
				if (not tonumber(Text)) and Text:len() > 0 then
					Text = Input.Value
				end
			end

			Input.Value = Text
			Box.Text = Text

			Library:SafeCallback(Input.Callback, Input.Value)
			Library:SafeCallback(Input.Changed, Input.Value)
		end

		if Input.Finished then
			AddSignal(Box.FocusLost, function(enter)
				if not enter then
					return
				end
				Input:SetValue(Box.Text)
			end)
		else
			AddSignal(Box:GetPropertyChangedSignal("Text"), function()
				Input:SetValue(Box.Text)
			end)
		end

		function Input:OnChanged(Func)
			Input.Changed = Func
			Func(Input.Value)
		end

		function Input:Destroy()
			InputFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Library.Options[Idx] = Input
		return Input
	end

	return Element
end)()

ElementsTable.Discord = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Discord"

	function Element:New(Idx, Config)
		assert(Config.Invite, "Discord - Missing Invite")

		local Discord = {
			Type = "Discord",
			Config = Config
		}

		-- Create Discord element without description
		local DiscordFrame = Components.Element("Loading...", "", self.Container, true, Config)
		DiscordFrame.LabelHolder.Size = UDim2.new(1, -150, 0, 0)
		DiscordFrame.LabelHolder.Position = UDim2.new(0, 55, 0, 0)
		DiscordFrame.DescLabel.Visible = false

        -- Server icon with Discord-style border
        local IconContainer = New("Frame", {
            Name = "IconContainer",
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.new(0, 10, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            Parent = DiscordFrame.Frame,
        }, {
            New("UICorner", { CornerRadius = UDim.new(0, 8) }),
            New("UIStroke", {
                Thickness = 1,
                ThemeTag = { Color = "ElementBorder" },
            }),
        })

        local ServerIcon = New("ImageLabel", {
            Name = "ServerIcon",
            Size = UDim2.fromScale(0.85, 0.85),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "",
            Parent = IconContainer,
        }, {
            New("UICorner", { CornerRadius = UDim.new(0, 6) }),
        })

		-- Member count label
        local MemberLabel = New("TextLabel", {
            Name = "MemberLabel",
            TextSize = 11,
            FontFace = resolveFont(Library.Font),
            Text = "Loading...",
            TextColor3 = Color3.fromRGB(200, 200, 200),
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2.new(1, -80, 0.5, 0),
            AnchorPoint = Vector2.new(1, 0.5),
            Parent = DiscordFrame.Frame,
        })

		-- Join button matching element style
		local JoinButton = New("TextButton", {
			Size = UDim2.fromOffset(55, 24),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.88,
			Text = "Join",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 12,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.Medium),
			Parent = DiscordFrame.Frame,
			AutoButtonColor = false,
			ThemeTag = {
				BackgroundColor3 = "Element",
			},
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 6) }),
		})

		Creator.AddSignal(JoinButton.MouseEnter, function()
			TweenService:Create(JoinButton, TweenInfo.new(0.15), {
				BackgroundTransparency = 0.82
			}):Play()
		end)
		Creator.AddSignal(JoinButton.MouseLeave, function()
			TweenService:Create(JoinButton, TweenInfo.new(0.15), {
				BackgroundTransparency = 0.88
			}):Play()
		end)

		-- Click to copy invite link
		Creator.AddSignal(JoinButton.MouseButton1Click, function()
			if setclipboard then
				setclipboard(Config.Invite)
			end
			Library:Notify({
				Title = "Discord",
				Content = "Invite link copied!",
				Duration = 2,
			})
		end)

        -- Fetch Discord server info
        task.spawn(function()
            local InviteCode = Config.Invite:match("discord%.gg/([%w%-_]+)") 
                or Config.Invite:match("discord%.com/invite/([%w%-_]+)")
                or Config.Invite:match("discordapp%.com/invite/([%w%-_]+)")
                or Config.Invite:match("/([%w%-_]+)$")
                or Config.Invite:match("([%w%-_]+)$")
                or Config.Invite

            local http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            if not http then
                warn("Exploit does not support HTTP requests")
                DiscordFrame:SetTitle("Discord Error")
                DiscordFrame:SetDesc("Exploit does not support HTTP requests.")
                return
            end

            local url = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true"
            local success, response = pcall(function()
                return http({ Url = url, Method = "GET" })
            end)

            if not success or response.StatusCode ~= 200 then
                warn("Request error:", response and response.StatusCode)
                DiscordFrame:SetTitle("Discord Error")
                DiscordFrame:SetDesc("Failed to fetch server info. (" .. tostring(response and response.StatusCode or "Unknown") .. ")")
                return
            end

            local data
            local success_json = pcall(function()
                data = game:GetService("HttpService"):JSONDecode(response.Body)
            end)

            if success_json and data and data.guild then
                DiscordFrame:SetTitle(data.guild.name)
                
                -- Show member count
                if data.approximate_member_count then
                    local count = data.approximate_member_count
                    if count >= 1000000 then
                        MemberLabel.Text = string.format("%.1fM members", count / 1000000)
                    elseif count >= 1000 then
                        MemberLabel.Text = string.format("%.1fK members", count / 1000)
                    else
                        MemberLabel.Text = tostring(count) .. " members"
                    end
                else
                    MemberLabel.Text = "Join now"
                end

                -- Load server icon
                if data.guild.icon then
                    local iconUrl = string.format("https://cdn.discordapp.com/icons/%s/%s.png?size=256", data.guild.id, data.guild.icon)
                    local successIcon, asset = pcall(function()
                        return Library:GetCustomAsset(iconUrl)
                    end)

                    if successIcon and asset and asset ~= "" then
                        ServerIcon.Image = asset
                        IconContainer.Visible = true
                        DiscordFrame.LabelHolder.Position = UDim2.fromOffset(55, 0)
                        
                        -- Fade in animation
                        ServerIcon.ImageTransparency = 1
                        TweenService:Create(ServerIcon, TweenInfo.new(0.25), {
                            ImageTransparency = 0
                       	}):Play()
                    end
                end
            else
                DiscordFrame:SetTitle("Discord")
                MemberLabel.Text = "Invalid invite"
            end
        end)

		Library.Options[Idx] = Discord
		return Discord
	end

	return Element
end)()

return ElementsTable
