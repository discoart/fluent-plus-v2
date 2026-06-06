local Creator = require("creator")
local Library = require("library")
local Flipper = require("flipper")
local resolveFont = Creator.resolveFont
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Acrylic = require("acrylic")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

return function(Components)
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New
	local TweenService = game:GetService("TweenService")
	local Camera = workspace.CurrentCamera
	local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

	local function clamp01(value)
		return math.clamp(value or 0, 0, 1)
	end

	local function computeAcrylicTransparency(base)
		return clamp01(base or 0.5)
	end

	local function computeSolidTransparency(base)
		base = clamp01(base or 0.5)
		if base < 1 then
			local reduction = base > 0.7 and 0.2 or 0.3
			return clamp01(base - reduction)
		end
		return base
	end

	Components.Window = (function()
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
					return Library.Themes[Library.Theme].SubText or Color3.fromRGB(170,170,170)
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
end
