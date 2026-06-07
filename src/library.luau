local Themes = require("themes")
local getIconAsset = require("icons")

local Library = {
	Version = "1.2.2",

	OpenFrames = {},
	Options = {},
	Themes = Themes.Names,
	Windows = {},

	Window = nil,
	WindowFrame = nil,
	Unloaded = false,

	Creator = nil,

	DialogOpen = false,
	UseAcrylic = false,
	Acrylic = false,
	Transparency = true,
	MinimizeKeybind = nil,
	MinimizeKey = Enum.KeyCode.LeftControl,
	Font = "rbxasset://fonts/families/GothamSSm.json",
	MetricsEnabled = true,
	ExposeGlobals = true,
}

function Library:RefreshOpenDropdowns()
	-- Close all open dropdowns when opening a new one
	self:CloseAllDropdowns()
end

function Library:ApplyBackdropToDropdown(Dropdown)
	-- Apply backdrop effect to dropdown
	-- This function is called when dropdown is opened
	if Dropdown and Dropdown.HolderCanvas then
		-- Bring to front by setting high z-index
		local maxZIndex = 100000
		Dropdown.HolderCanvas.ZIndex = maxZIndex
		
		if Dropdown.HolderFrame then
			Dropdown.HolderFrame.ZIndex = maxZIndex + 1
		end
		
		-- Add to open frames if not already there
		if not table.find(self.OpenFrames, Dropdown.HolderCanvas) then
			table.insert(self.OpenFrames, Dropdown.HolderCanvas)
		end
	end
end

-- Close all open dropdowns
function Library:CloseAllDropdowns()
	for _, frame in pairs(self.OpenFrames) do
		if frame and frame:IsA("Frame") then
			frame.Visible = false
			
			for _, dropdownObj in pairs(self.Options) do
				if dropdownObj and dropdownObj.Type == "Dropdown" and dropdownObj.HolderCanvas == frame then
					dropdownObj.Opened = false
					break
				end
			end
		end
	end
	table.clear(self.OpenFrames)
end

-- Close other dropdowns except the specified one
function Library:CloseOtherDropdowns(currentDropdown)
	local currentCanvas = currentDropdown and currentDropdown.HolderCanvas
	for i = #self.OpenFrames, 1, -1 do
		local frame = self.OpenFrames[i]
		if frame ~= currentCanvas then
			frame.Visible = false
			
			for _, dropdownObj in pairs(self.Options) do
				if dropdownObj and dropdownObj.Type == "Dropdown" and dropdownObj.HolderCanvas == frame then
					dropdownObj.Opened = false
					break
				end
			end
			table.remove(self.OpenFrames, i)
		end
	end
end

-- Bring dropdown to front
function Library:BringDropdownToFront(dropdown)
	if dropdown and dropdown.HolderCanvas then
		-- Set very high z-index to ensure it's on top
		dropdown.HolderCanvas.ZIndex = 100000
		
		if dropdown.HolderFrame then
			dropdown.HolderFrame.ZIndex = 100001
		end
		
		-- Close all other dropdowns (but not this one)
		self:CloseOtherDropdowns(dropdown)
		
		-- Add this one back
		if not table.find(self.OpenFrames, dropdown.HolderCanvas) then
			table.insert(self.OpenFrames, dropdown.HolderCanvas)
		end
	end
end

-- Format number with commas for readability
function Library:FormatNumber(num)
	if not num or type(num) ~= "number" then
		return "0"
	end
	
	if num >= 1000000 then
		return string.format("%.1fM", num / 1000000)
	elseif num >= 1000 then
		return string.format("%.1fK", num / 1000)
	else
		return tostring(math.floor(num))
	end
end

local ICON_SETS = {
	lucide = {
		url = "https://raw.githubusercontent.com/lucide-icons/lucide/main/icons/%s.svg",
		ext = "svg",
	},
	hero = {
		url = "https://raw.githubusercontent.com/tailwindlabs/heroicons/master/src/24/outline/%s.svg",
		ext = "svg",
	},
	phosphor = {
		url = "https://raw.githubusercontent.com/phosphor-icons/core/main/assets/regular/%s.svg",
		ext = "svg",
	},
	tabler = {
		url = "https://raw.githubusercontent.com/tabler/tabler-icons/main/icons/outline/%s.svg",
		ext = "svg",
	},
	bootstrap = {
		url = "https://raw.githubusercontent.com/twbs/icons/main/icons/%s.svg",
		ext = "svg",
	},
	feather = {
		url = "https://raw.githubusercontent.com/feathericons/feather/master/icons/%s.svg",
		ext = "svg",
	},
	material = {
		url = "https://raw.githubusercontent.com/Templarian/MaterialDesign/master/svg/%s.svg",
		ext = "svg",
	},
}

function Library:GetIcon(Name)
	if not Name or Name == "" then
		return ""
	end

	local setName, iconName = Name:match("^(%w+)/(.+)$")
	if not setName then
		setName = "lucide"
		iconName = Name:lower():gsub("^lucide%-", "")
	end

	local set = ICON_SETS[setName]
	if not set then
		return ""
	end

	local cacheKey = setName .. "/" .. iconName
	if getIconAsset.Has(cacheKey) then
		return getIconAsset.Get(cacheKey)
	end

	local url = set.url:format(iconName)
	local asset = Library:GetCustomAsset(url)
	getIconAsset.Set(cacheKey, asset)
	return asset
end

function Library:PreloadIcons(names)
	for _, name in ipairs(names) do
		task.spawn(function()
			self:GetIcon(name)
		end)
	end
end

function Library:GetCustomAsset(Value)
	if not Value or type(Value) ~= "string" or not Value:find("http") then
		return Value
	end

	local SafeName = Value:match("/([^/]+)%??$") or Value
	SafeName = SafeName:gsub("[^%w%-_%.]", "_"):gsub("%.%.", "."):gsub("^%.", ""):gsub("%.$", "")
	local ext = SafeName:match("%.(%w+)$") or "png"
	SafeName = SafeName:gsub("%..-$", "")
	local hash = 0
	for i = 1, #Value do
		hash = (hash * 31 + Value:byte(i)) % 2147483647
	end
	local FileName = tostring(hash) .. "_" .. SafeName .. "." .. ext

	local hasFile = false
	pcall(function()
		if isfile and isfile(FileName) then
			hasFile = true
		end
	end)

	local function validContent(data)
		if type(data) ~= "string" or #data < 50 then
			return false
		end
		-- SVG starts with <svg
		if data:sub(1, 4) == "<svg" then
			return true
		end
		-- PNG starts with magic bytes 137 80 78 71
		local b1, b2, b3, b4 = data:byte(1, 4)
		if b1 == 137 and b2 == 80 and b3 == 78 and b4 == 71 then
			return true
		end
		return false
	end

	if not hasFile then
		local body = nil

		-- Method 1: executor-specific HTTP (syn.request / http.request / etc.)
		local http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
		if http then
			local ok, res = pcall(function()
				return http({ Url = Value, Method = "GET" })
			end)
			if ok and res and res.StatusCode == 200 and validContent(res.Body) then
				body = res.Body
			end
		end

		-- Method 2: game:HttpGet fallback
		if not body then
			local ok, res = pcall(game.HttpGet, game, Value)
			if ok and validContent(res) then
				body = res
			end
		end

		if not body then
			return ""
		end

		pcall(function()
			if writefile then
				writefile(FileName, body)
			end
		end)
	end

	local asset = ""
	pcall(function()
		if getcustomasset then
			asset = getcustomasset(FileName)
		end
	end)
	return asset
end

local CUSTOM_THEMES_CACHE_FILE = "fluent_plus_custom_themes.json"

local function getHttpService()
	local ok, svc = pcall(function()
		return game:GetService("HttpService")
	end)
	return ok and svc
end

local function jsonColorToColor3(value)
	if type(value) ~= "table" then
		return nil
	end
	local r, g, b = value.r, value.g, value.b
	if r and g and b then
		return Color3.fromRGB(r, g, b)
	end
	return nil
end

local function jsonToTheme(name, colors)
	local theme = { Name = name }
	for key, value in pairs(colors) do
		if key == "AcrylicGradient" and type(value) == "table" then
			local top = value.top or value[1] or { r = 0, g = 0, b = 0 }
			local bottom = value.bottom or value[2] or { r = 0, g = 0, b = 0 }
			theme[key] = ColorSequence.new(
				Color3.fromRGB(top.r, top.g, top.b),
				Color3.fromRGB(bottom.r, bottom.g, bottom.b)
			)
		elseif type(value) == "table" and value.r then
			theme[key] = jsonColorToColor3(value)
		else
			theme[key] = value
		end
	end
	return theme
end

Library.CustomThemes = {}

local function loadCachedThemes()
	local ok, data = pcall(function()
		local http = getHttpService()
		if http and isfile and isfile(CUSTOM_THEMES_CACHE_FILE) then
			return http:JSONDecode(readfile(CUSTOM_THEMES_CACHE_FILE))
		end
	end)
	return (ok and type(data) == "table" and data) or {}
end

local cachedThemes = loadCachedThemes()
for id, themeData in pairs(cachedThemes) do
	Library.CustomThemes[id] = jsonToTheme(themeData.name or id, themeData.colors or {})
end

local function saveCachedThemes()
	pcall(function()
		local http = getHttpService()
		if http and writefile then
			local data = {}
			for id, theme in pairs(Library.CustomThemes) do
				data[id] = { name = theme.Name, colors = theme._rawColors }
			end
			writefile(CUSTOM_THEMES_CACHE_FILE, http:JSONEncode(data))
		end
	end)
end

function Library:FetchTheme(id)
	if not id or #id ~= 12 then
		return nil, "Invalid theme ID"
	end

	if Library.CustomThemes[id] then
		return Library.CustomThemes[id]
	end

	local url = "https://api.fluentplus.com/themes/" .. id
	local body = nil

	local http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
	if http then
		local ok, res = pcall(function()
			return http({ Url = url, Method = "GET" })
		end)
		if ok and res and res.StatusCode == 200 and res.Body then
			body = res.Body
		end
	end

	if not body then
		local ok, res = pcall(game.HttpGet, game, url)
		if ok then
			body = res
		end
	end

	if not body then
		return nil, "Network error"
	end

	local httpService = getHttpService()
	if not httpService then
		return nil, "HttpService unavailable"
	end

	local ok, data = pcall(function()
		return httpService:JSONDecode(body)
	end)
	if not ok or not data or not data.colors then
		return nil, "Invalid response from server"
	end

	local theme = jsonToTheme(data.name or id, data.colors)
	theme._rawColors = data.colors
	Library.CustomThemes[id] = theme
	saveCachedThemes()
	return theme
end

function Library:ApplyCustomTheme(id)
	local theme, err = self:FetchTheme(id)
	if not theme then
		return false, err
	end

	local Creator = self.Creator
	if not Creator then
		return false, "Library not initialized"
	end

	Creator.Themes[id] = theme
	if not table.find(self.Themes, id) then
		table.insert(self.Themes, id)
	end
	self:SetTheme(id)
	return true
end

return Library
