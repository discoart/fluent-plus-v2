local Creator = require("creator")
local Library = require("library")
local Localization = require("localization")
local resolveFont = Creator.resolveFont

return function(Components)
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
		return Library.Themes[Library.Theme].SubText or Color3.fromRGB(170,170,170)
	end

	Components.TitleBar = (function()
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

				not Config.Window.TabsInHeader and (function()
					local lbl = New("TextLabel", {
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
					})
					Localization:registerText(lbl, "Text", Config.Title)
					return lbl
				end)() or nil,
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
end
