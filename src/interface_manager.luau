local Acrylic = require("acrylic")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local GUI = nil
local CoreGui = game:GetService("CoreGui")
if CoreGui then
	GUI = CoreGui:FindFirstChild("RobloxGui") or CoreGui
end

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local Components = require("components")
local Library = require("library")

local InterfaceManager = {} do
	InterfaceManager.Folder = ("%s%s"):format("Fluent", "Settings")

	local function safeCall(func, ...)
		if func then
			local success, result = pcall(func, ...)
			if success then return result end
		end
		return nil
	end

	local function isfolder(path)
		return safeCall(_G.isfolder, path) == true
	end

	local function makefolder(path)
		safeCall(_G.makefolder, path)
	end

	local function isfile(path)
		return safeCall(_G.isfile, path) == true
	end

	local function readfile(path)
		return safeCall(_G.readfile, path) or ""
	end

	local function writefile(path, content)
		safeCall(_G.writefile, path, content)
	end

	InterfaceManager.Settings = {

		Acrylic = true,

		Transparency = true,

		MenuKeybind = "M"

	}

	function InterfaceManager:SetTheme(name)

		InterfaceManager.Settings.Theme = name

	end

	function InterfaceManager:SetFolder(folder)

		self.Folder = folder;

		self:BuildFolderTree()

	end

	function InterfaceManager:SetLibrary(library)

		self.Library = library

	end

	function InterfaceManager:BuildFolderTree()
		if not self.Folder then return end
		local paths = {}
		local parts = self.Folder:split("/")
		for idx = 1, #parts do
			local path = table.concat(parts, "/", 1, idx)
			if path ~= "" then
				paths[#paths + 1] = path
			end
		end

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function InterfaceManager:SaveSettings()

		writefile(self.Folder .. "/options.json", httpService:JSONEncode(InterfaceManager.Settings))

	end

	function InterfaceManager:LoadSettings()

		local path = self.Folder .. "/options.json"

		if isfile(path) then
			local data = readfile(path)
			local success, decoded = pcall(httpService.JSONDecode, httpService, data)

			if success then
				for i, v in next, decoded do
					InterfaceManager.Settings[i] = v
				end
			end
		end

	end

	function InterfaceManager:BuildInterfaceSection(tab)

		assert(self.Library, "Must set InterfaceManager.Library")

		local Library = self.Library

		local Settings = InterfaceManager.Settings

		InterfaceManager:LoadSettings()

		local section = tab:AddSection("Interface", "monitor")

		local InterfaceTheme = section:AddDropdown("InterfaceTheme", {

			Title = "Theme",

			Description = "Changes the interface theme.",

			Values = Library.Themes,

			Default = self.Library.Theme,

			Callback = function(Value)

				Library:SetTheme(Value)

				Settings.Theme = Value

				InterfaceManager:SaveSettings()

			end

		})

		InterfaceTheme:SetValue(Settings.Theme)

		if Library.UseAcrylic and not Mobile then

			section:AddToggle("AcrylicToggle", {

				Title = "Acrylic",

				Description = "The blurred background requires graphic quality 8+",

				Default = Settings.Acrylic,

				Callback = function(Value)

					Library:ToggleAcrylic(Value)

					Settings.Acrylic = Value

					InterfaceManager:SaveSettings()

				end

			})

		elseif Mobile then

			Settings.Acrylic = false

		end

		section:AddSlider("WindowTransparency", {

			Title = "Window Transparency",

			Description = "Adjusts the window transparency.",

			Default = 1,

			Min = 0,

			Max = 3,

			Rounding = 1,

			Callback = function(Value)

				Library:SetWindowTransparency(Value)

			end

		})

		local MenuKeybind = section:AddKeybind("MenuKeybind", { Title = "Minimize Bind", Default = Library.MinimizeKey.Name or Settings.MenuKeybind })

		MenuKeybind:OnChanged(function()

			Settings.MenuKeybind = MenuKeybind.Value

			InterfaceManager:SaveSettings()

		end)

		Library.MinimizeKeybind = MenuKeybind

	end

end

Library.CreateWindow = function(self, Config)

	assert(Config.Title, "Window - Missing Title")

	if Library.Window then

		print("You cannot create more than one window.")

		return

	end

	Library.MinimizeKey = Config.MinimizeKey or Enum.KeyCode.LeftControl

	Library.UseAcrylic = Config.Acrylic or false
	Library.Acrylic = Config.Acrylic or false

	if Mobile then
		Library.UseAcrylic = false
		Library.Acrylic = false
		Config.Acrylic = false
	end

	Library.Theme = Config.Theme or "Dark"
	Library.Font = Config.Font or Library.Font
	Library.Creator.RandomNames = Config.RandomNames or false

	if Config.BackgroundImage == nil then
		Config.BackgroundImage = "rbxassetid://13196113628"
	end

	if Config.BackgroundTransparency == nil then
		Config.BackgroundTransparency = 0.5
	end

	if Config.Acrylic then

		Acrylic.init()

	end

	local Icon = Config.Icon

	local resolvedIcon = Library:GetIcon(Icon)
	if resolvedIcon and resolvedIcon ~= "" then
		Icon = resolvedIcon
	end

	if Icon == "" or Icon == nil then
		Icon = nil
	end

	local Window = Components.Window({

		Parent = GUI or Library.GUI,

		Size = Config.Size,

		Title = Config.Title,

		Icon = Icon,

		Image = Config.Image,

		BackgroundImage = Config.BackgroundImage,

		BackgroundTransparency = Config.BackgroundTransparency,

		BackgroundImageTransparency = Config.BackgroundImageTransparency,

		SubTitle = Config.SubTitle,

		TabWidth = Config.TabWidth,

		DropdownsOutsideWindow = Config.DropdownsOutsideWindow,

		Search = Config.Search,

		UserInfoTitle = Config.UserInfoTitle,

		UserInfo = Config.UserInfo,

		UserInfoTop = Config.UserInfoTop,

		UserInfoSubtitle = Config.UserInfoSubtitle,

		UserInfoSubtitleColor = Config.UserInfoSubtitleColor,

	})

	Library.Window = Window

	table.insert(Library.Windows, Window)

	InterfaceManager:SetTheme(Config.Theme)

	Library:SetTheme(Config.Theme)

	return Window

end

return InterfaceManager

