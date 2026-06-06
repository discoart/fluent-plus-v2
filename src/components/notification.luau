local Creator = require("creator")
local Library = require("library")
local Flipper = require("flipper")
local resolveFont = Creator.resolveFont

return function(Components)
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New
	local Acrylic = require("acrylic")

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

	Components.Notification = (function()
		return Notification
	end)()
end
