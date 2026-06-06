local Creator = require("creator")
local Library = require("library")
local Flipper = require("flipper")
local resolveFont = Creator.resolveFont

return function(Components)
	local New = Creator.New
	local Spring = Flipper.Spring.new

	Components.Element = (function()
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
end
