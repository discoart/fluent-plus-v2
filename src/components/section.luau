local Creator = require("creator")
local Library = require("library")
local resolveFont = Creator.resolveFont

return function(Components)
	local New = Creator.New

	Components.Section = (function()
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
end
