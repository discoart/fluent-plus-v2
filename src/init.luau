--[[

███████╗██╗░░░░░██╗░░░██╗███████╗███╗░░██╗████████╗  ██████╗░██╗░░░░░██╗░░░██╗░██████╗
██╔════╝██║░░░░░██║░░░██║██╔════╝████╗░██║╚══██╔══╝  ██╔══██╗██║░░░░░██║░░░██║██╔════╝
█████╗░░██║░░░░░██║░░░██║█████╗░░██╔██╗██║░░░██║░░░  ██████╔╝██║░░░░░██║░░░██║╚█████╗░
██╔══╝░░██║░░░░░██║░░░██║██╔══╝░░██║╚████║░░░██║░░░  ██╔═══╝░██║░░░░░██║░░░██║░╚═══██╗
██║░░░░░███████╗╚██████╔╝███████╗██║░╚███║░░░██║░░░  ██║░░░░░███████╗╚██████╔╝██████╔╝
╚═╝░░░░░╚══════╝░╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░  ╚═╝░░░░░╚══════╝░╚═════╝░╚═════╝░

A modified version of Fluent
https://fluent-pl.us

]]

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local httpService = game:GetService("HttpService")

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local RenderStepped = RunService.RenderStepped
local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end

local Themes = require("themes")
local Library = require("library")
local Flipper = require("flipper")
local Creator = require("creator")
local Acrylic = require("acrylic")
local Components = require("components")
local ElementsTable = require("elements")
local Elements = require("elements_registry")
local SaveManager = require("save_manager")
local InterfaceManager = require("interface_manager")

local ZINDEX_BASE = 10000000 
Library.ZIndexLayers = {
	base = ZINDEX_BASE,
	dropdown = 50000,
	dialog = 90000,
	notification = 70000,
	tooltip = 100000,
}

local New = Creator.New

local targetParent = nil
pcall(function()
	if gethui then
		targetParent = gethui()
	else
		targetParent = game:GetService("CoreGui")
	end
end)

if not targetParent then
	targetParent = LocalPlayer:WaitForChild("PlayerGui")
end

local guiName = ""
for _ = 1, math.random(12, 20) do guiName = guiName .. string.char(math.random(97, 122)) end

local GUI = New("ScreenGui", {
	Name = guiName,
	Parent = targetParent,
	IgnoreGuiInset = true,
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 2147483647,
})
Library.GUI = GUI
ProtectGui(GUI)

function Library:SafeCallback(Function, ...)
	if not Function then
		return
	end

	local Success, Event = pcall(Function, ...)
	if not Success then
		local _, i = Event:find(":%d+: ")

		if not i then
			return Library:Notify({
				Title = "Interface",
				Content = "Callback error",
				SubContent = Event,
				Duration = 5,
			})
		end

		return Library:Notify({
			Title = "Interface",
			Content = "Callback error",
			SubContent = Event:sub(i + 1),
			Duration = 5,
		})
	end
end--?
function Library:Round(Number, Factor)
	if Factor == 0 then
		return math.floor(Number)
	end
	Number = tostring(Number)
	return Number:find("%.") and tonumber(Number:sub(1, Number:find("%.") + Factor)) or Number
end

local NotificationModule = Components.Notification
NotificationModule:Init(GUI)

local New = Creator.New

function Library:CreateMinimizer(Config)

	Config = Config or {}

	if self.Minimizer and self.Minimizer.Parent then

		return self.Minimizer

	end

	local parentGui = Library.GUI or GUI

	if parentGui then parentGui.DisplayOrder = 1000 end

	local isMobile = Mobile and true or false

	Library:PreloadIcons({
		"moon", "x", "minus", "maximize-2", "minimize-2",
		"search", "chevron-right", "chevron-down", "monitor-off",
	})

	local iconAsset = Library:GetIcon("moon")

	if type(Config.Icon) == "string" and Config.Icon ~= "" then

		pcall(function()

			local resolved = Library:GetIcon(Config.Icon)

			if resolved and resolved ~= "" then

				iconAsset = resolved

			elseif string.match(Config.Icon, "^rbxassetid://%d+$") then

				iconAsset = Config.Icon

			end

		end)

	end

	local useAcrylic = (Config.Acrylic == true)

	local cornerRadius = tonumber(Config.Corner)

	local backgroundTransparency = (typeof(Config.Transparency) == "number") and math.clamp(Config.Transparency, 0, 1) or 0

	local draggableWhole = (Config.Draggable == true)

	local holder

	local function createButton(isDesktop)

		return New("TextButton", {

			Name = "MinimizeButton",

			Size = UDim2.new(1, 0, 1, 0),

			BorderSizePixel = 0,

			BackgroundTransparency = backgroundTransparency or 0,

			AutoButtonColor = true,

			ThemeTag = {

				BackgroundColor3 = "Element",

			},

		}, {

			New("UICorner", { CornerRadius = UDim.new(0, cornerRadius or (isDesktop and 14 or 12)) }),

			New("UIStroke", {

				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,

				Transparency = isDesktop and 0.6 or 0.7,

				Thickness = isDesktop and 2 or 1.5,

				ThemeTag = {

					Color = "ElementBorder",

				},

			}),

			New("ImageLabel", {

				Name = "Icon",

				Image = iconAsset,

				Size = UDim2.new(0.8, 0, 0.8, 0),

				Position = UDim2.new(0.5, 0, 0.5, 0),

				AnchorPoint = Vector2.new(0.5, 0.5),

				BackgroundTransparency = 1,

				ThemeTag = {

					ImageColor3 = "Text",

				},

			}, {

				New("UIAspectRatioConstraint", { AspectRatio = 1, AspectType = Enum.AspectType.FitWithinMaxSize }),

				New("UICorner", { CornerRadius = UDim.new(0, 0) })

			}),

		})

	end

	if isMobile then

		holder = New("Frame", {

			Name = "FluentMinimizer",

			Parent = parentGui,

			Size = Config.Size or UDim2.fromOffset(36, 36),

			Position = Config.Position or UDim2.new(0.45, 0, 0.025, 0),

			BackgroundTransparency = 1,

			ZIndex = 999999999,

			Visible = (Config.Visible ~= false),

		})

	else

		holder = New("Frame", {

			Name = "FluentMinimizer",

			Parent = parentGui,

			Size = Config.Size or UDim2.fromOffset(36, 36),

			Position = Config.Position or UDim2.new(0, 300, 0, 20),

			BackgroundTransparency = 1,

			ZIndex = 999999999,

			Visible = (Config.Visible ~= false),

		})

	end

	if useAcrylic then

		local miniAcrylic = Acrylic.AcrylicPaint()

		miniAcrylic.Frame.Parent = holder

		miniAcrylic.Frame.Size = UDim2.fromScale(1, 1)

		pcall(function() miniAcrylic.AddParent(holder) end)

		local desiredCorner = UDim.new(0, cornerRadius or 0)

		pcall(function()

			for _, descendant in ipairs(miniAcrylic.Frame:GetDescendants()) do

				if descendant.ClassName == "UICorner" then

					descendant.CornerRadius = desiredCorner

				elseif descendant.ClassName == "ImageLabel" then

					descendant.Size = UDim2.fromScale(1, 1)

					descendant.Position = UDim2.new(0.5, 0, 0.5, 0)

					descendant.AnchorPoint = Vector2.new(0.5, 0.5)

				end

			end

		end)

		self.MinimizerAcrylic = miniAcrylic

	end

	local btnInstance = createButton(not isMobile)

	btnInstance.Parent = holder

	btnInstance.ZIndex = (holder.ZIndex or 0) + 1

	local button = holder:FindFirstChildOfClass("TextButton")

	if button then

		local isDragging = false

		local dragStart, dragOffset

		if draggableWhole then
			local dragMoveConn, dragEndConn

			Creator.AddSignal(button.InputBegan, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					isDragging = true

					local pos = Input.Position
					dragStart = Vector2.new(pos.X, pos.Y)
					dragOffset = holder.Position

					if dragMoveConn then dragMoveConn:Disconnect() end
					if dragEndConn then dragEndConn:Disconnect() end

					dragMoveConn = UserInputService.InputChanged:Connect(function(MoveInput)
						if isDragging and dragStart and dragOffset and holder and holder.Parent then
							local delta = Vector2.new(MoveInput.Position.X, MoveInput.Position.Y) - dragStart
							local newX = dragOffset.X.Offset + delta.X
							local newY = dragOffset.Y.Offset + delta.Y
							local viewport = workspace.Camera.ViewportSize
							local size = holder.AbsoluteSize

							if newX < 0 then newX = 0 end
							if newY < 0 then newY = 0 end
							if newX > viewport.X - size.X then newX = viewport.X - size.X end
							if newY > viewport.Y - size.Y then newY = viewport.Y - size.Y end
							holder.Position = UDim2.new(0, newX, 0, newY)
						end
					end)

					dragEndConn = UserInputService.InputEnded:Connect(function(EndInput)
						if EndInput.UserInputType == Enum.UserInputType.MouseButton1 or EndInput.UserInputType == Enum.UserInputType.Touch then
							isDragging = false
							dragStart = nil
							dragOffset = nil
							if dragMoveConn then dragMoveConn:Disconnect() dragMoveConn = nil end
							if dragEndConn then dragEndConn:Disconnect() dragEndConn = nil end
						end
					end)
				end
			end)
		end
		Creator.AddSignal(button.MouseButton1Click, function()

			task.wait(0.1)

			if not isDragging and Library.Window then

				Library.Window:Minimize()

			end

		end)

	end

	self.Minimizer = holder

	return holder

end

function Library:SetTheme(Value)
	if not Library.Window then
		return
	end

	local themeData = Themes[Value] or Library.CustomThemes[Value]
	if not themeData and not table.find(Library.Themes, Value) then
		return
	end

	Library.Theme = Value
	if themeData then
		if themeData.UseBackground then
			if themeData.BackgroundVideo then
				Library.Window:SetBackgroundVideo(themeData.BackgroundVideo)
			elseif themeData.BackgroundImage then
				local asset = Library:GetCustomAsset(themeData.BackgroundImage)
				if asset and asset ~= "" then
					Library.Window:SetBackgroundImage(asset)
				end
			end
		else
			Library.Window:ClearBackground()
		end
	end

	if Library.CustomThemes[Value] and not Creator.Themes[Value] then
		Creator.Themes[Value] = themeData
	end
	Creator.Theme = Value
	Creator.UpdateTheme()
	Library:RefreshOpenDropdowns()
end

function Library:Destroy()

	if Library.Window then

		Library.Unloaded = true

		if Library.UseAcrylic then

			Library.Window.AcrylicPaint.Model:Destroy()

		end

		Creator.Disconnect()

		for i = #Library.Windows, 1, -1 do
			local window = Library.Windows[i]
			if window and window.Destroy then
				window:Destroy()
			end
		end
		Library.Windows = {}

		if Library.ActiveNotifications then
			for i = #Library.ActiveNotifications, 1, -1 do
				local notif = Library.ActiveNotifications[i]
				if notif and notif.Close then
					pcall(function()
						notif:Close()
					end)
				end
			end
			Library.ActiveNotifications = {}
		end

		if Library.Options then
			for idx, option in pairs(Library.Options) do
				if option then
					if option.Destroy then
						pcall(function()
							option:Destroy()
						end)
					end
				end
			end
			Library.Options = {}
		end

		if Library.OpenFrames then
			for i = #Library.OpenFrames, 1, -1 do
				local frame = Library.OpenFrames[i]
				if frame then
					pcall(function()
						frame:Destroy()
					end)
				end
			end
			Library.OpenFrames = {}
		end

		if Creator.TransparencyMotors then
			for i = #Creator.TransparencyMotors, 1, -1 do
				local motor = Creator.TransparencyMotors[i]
				if motor and motor.destroy then
					pcall(function()
						motor:destroy()
					end)
				end
			end
			Creator.TransparencyMotors = {}
		end

		Library.GUI:Destroy()

		Library.Window = nil
	end

end

function Library:ToggleAcrylic(Value)
	if not Library.Window or not Library.UseAcrylic then
		return
	end

	Library.Acrylic = Value

	if Library.Window.AcrylicPaint and Library.Window.AcrylicPaint.SetVisibility then
		Library.Window.AcrylicPaint.SetVisibility(Value)
	end

	Library:RefreshOpenDropdowns()
end

function Library:ToggleTransparency(Value)
	if not Library.Window or not Library.UseAcrylic then
		return
	end

	if Library.Window.AcrylicPaint and Library.Window.AcrylicPaint.Frame then
		local background = Library.Window.AcrylicPaint.Frame:FindFirstChild("Background")
		local target = Value and 0.35 or 0
		if background then
			background.BackgroundTransparency = target
		else
			Library.Window.AcrylicPaint.Frame.BackgroundTransparency = target
		end
	end

	Library:RefreshOpenDropdowns()
end

function Library:SetWindowTransparency(Value)

	if Library.Window then

		Value = math.clamp(Value, 0, 3)

		local transparency = math.max(0, math.min(1, Value * 0.3))
		
		if Library.Window.AcrylicPaint and Library.Window.AcrylicPaint.Frame then
			local background = Library.Window.AcrylicPaint.Frame:FindFirstChild("Background")
			if background then
				background.BackgroundTransparency = transparency
			else
				Library.Window.AcrylicPaint.Frame.BackgroundTransparency = transparency
			end
		end
		
		Library.Window.BackgroundTransparency = transparency
		
		if Library.Window.BackgroundImage then
			Library.Window.BackgroundImage.ImageTransparency = transparency
		end

		Library:RefreshOpenDropdowns()
	end
end

function Library:Notify(Config)

	return NotificationModule:New(Config)

end

function Library:DisableMetrics()
	Library.MetricsEnabled = false
end

Fluent = Library

if Library.ExposeGlobals and getgenv then
	getgenv().Fluent = Library
end

local MinimizeButton = New("TextButton", {

	BackgroundColor3 = Color3.fromRGB(25, 25, 30),

	Size = UDim2.new(1, 0, 1, 0),

	BorderSizePixel = 0,

	BackgroundTransparency = 0.05, 

}, {

	New("UICorner", {

		CornerRadius = UDim.new(0, 14),

	}),

	New("UIGradient", {

		Color = ColorSequence.new{

			ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),

			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))

		},

		Rotation = 45,

	}),

	New("UIStroke", {

		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,

		Color = Color3.fromRGB(100, 150, 255),

		Transparency = 0.6,

		Thickness = 2,

	}),

	New("Frame", {

		BackgroundColor3 = Color3.fromRGB(100, 150, 255),

		BackgroundTransparency = 0.9,

		Size = UDim2.new(1, -6, 1, -6),

		Position = UDim2.new(0, 3, 0, 3),

		BorderSizePixel = 0,

	}, {

		New("UICorner", {

			CornerRadius = UDim.new(0, 11),

		}),

	}),

	New("Frame", {

		BackgroundColor3 = Color3.fromRGB(255, 255, 255),

		BackgroundTransparency = 0.94,

		Size = UDim2.new(0.7, 0, 0.3, 0),

		Position = UDim2.new(0.15, 0, 0.1, 0),

		BorderSizePixel = 0,

	}, {

		New("UICorner", {

			CornerRadius = UDim.new(0, 8),

		}),

	}),

	New("ImageLabel", {

		Image = Library:GetIcon("moon"),

		Size = UDim2.new(0.8, 0, 0.8, 0),

		Position = UDim2.new(0.5, 0, 0.5, 0),

		AnchorPoint = Vector2.new(0.5, 0.5),

		BackgroundTransparency = 1,

		ImageColor3 = Color3.fromRGB(255, 255, 255),

		ImageTransparency = 0.1,

	}, {

		New("UIAspectRatioConstraint", {

			AspectRatio = 1,

			AspectType = Enum.AspectType.FitWithinMaxSize,

		})

	})

})

local MobileMinimizeButton = New("TextButton", {

	BackgroundColor3 = Color3.fromRGB(25, 25, 30),

	Size = UDim2.new(1, 0, 1, 0),

	BorderSizePixel = 0,

	BackgroundTransparency = 0.05,

}, {

	New("UICorner", {

		CornerRadius = UDim.new(0, 12),

	}),

	New("UIGradient", {

		Color = ColorSequence.new{

			ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),

			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))

		},

		Rotation = 45,

	}),

	New("UIStroke", {

		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,

		Color = Color3.fromRGB(100, 150, 255),

		Transparency = 0.7,

		Thickness = 1.5,

	}),

	New("Frame", {

		BackgroundColor3 = Color3.fromRGB(100, 150, 255),

		BackgroundTransparency = 0.92,

		Size = UDim2.new(1, -4, 1, -4),

		Position = UDim2.new(0, 2, 0, 2),

		BorderSizePixel = 0,

	}, {

		New("UICorner", {

			CornerRadius = UDim.new(0, 10),

		}),

	}),

	New("ImageLabel", {

		Image = Library:GetIcon("moon"),

		Size = UDim2.new(0.8, 0, 0.8, 0),

		Position = UDim2.new(0.5, 0, 0.5, 0),

		AnchorPoint = Vector2.new(0.5, 0.5),

		BackgroundTransparency = 1,

		ImageColor3 = Color3.fromRGB(255, 255, 255),

		ImageTransparency = 0.1,

	}, {

		New("UIAspectRatioConstraint", {

			AspectRatio = 1,

			AspectType = Enum.AspectType.FitWithinMaxSize,

		})

	})

})

local Minimizer = nil

local isDragging = false

local dragStart = nil

local dragOffset = nil

local activeDragInput = nil

Creator.AddSignal(MinimizeButton.InputBegan, function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1 then

		isDragging = true

		dragStart = Vector2.new(Input.Position.X, Input.Position.Y)

		dragOffset = (Library.Minimizer or Minimizer).Position

		activeDragInput = Input

		local connection

		connection = Input.Changed:Connect(function()

			if Input.UserInputState == Enum.UserInputState.End then

				isDragging = false

				dragStart = nil

				dragOffset = nil

				activeDragInput = nil

				connection:Disconnect()

			end

		end)

	end

end)

Creator.AddSignal(MobileMinimizeButton.InputBegan, function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then

		isDragging = true

		dragStart = Vector2.new(Input.Position.X, Input.Position.Y)

		dragOffset = (Library.Minimizer or Minimizer).Position

		activeDragInput = Input

		local connection

		connection = Input.Changed:Connect(function()

			if Input.UserInputState == Enum.UserInputState.End then

				isDragging = false

				dragStart = nil

				dragOffset = nil

				activeDragInput = nil

				connection:Disconnect()

			end

		end)

	end

end)

local debugCount = 0

Creator.AddSignal(RunService.Heartbeat, function()

	local activeMin = Library.Minimizer or Minimizer

	if isDragging and dragStart and dragOffset and activeMin and activeMin.Parent and activeDragInput then

		debugCount = debugCount + 1

		local currentMousePos = Vector2.new(activeDragInput.Position.X, activeDragInput.Position.Y)

		local delta = currentMousePos - dragStart

		local newX = dragOffset.X.Offset + delta.X

		local newY = dragOffset.Y.Offset + delta.Y

		local viewportSize = workspace.Camera.ViewportSize

		local minimizerSize = activeMin.AbsoluteSize

		if newX < 0 then newX = 0 end

		if newY < 0 then newY = 0 end

		if newX > viewportSize.X - minimizerSize.X then 

			newX = viewportSize.X - minimizerSize.X 

		end

		if newY > viewportSize.Y - minimizerSize.Y then 

			newY = viewportSize.Y - minimizerSize.Y 

		end

		activeMin.Position = UDim2.new(0, newX, 0, newY)

	end

end)

Creator.AddSignal(MinimizeButton.MouseButton1Click, function()

	task.wait(0.1)

	if not isDragging then

		Library.Window:Minimize()

	end

end)

Creator.AddSignal(MobileMinimizeButton.MouseButton1Click, function()

	task.wait(0.1)

	if not isDragging then

		Library.Window:Minimize()

	end

end)

local Fluent = Library
if Library.ExposeGlobals then
	_G.Fluent = Library
	_G.SaveManager = SaveManager
	_G.InterfaceManager = InterfaceManager
end

SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

return Library, SaveManager, InterfaceManager, Mobile
