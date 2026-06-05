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
	local cached = getIconAsset.Get(cacheKey)
	if cached then
		return cached
	end

	local url = set.url:format(iconName)
	local asset = Library:GetCustomAsset(url)
	if asset and asset ~= "" then
		getIconAsset.Set(cacheKey, asset)
	end
	return asset
end

function Library:GetCustomAsset(Value)
	if not Value or type(Value) ~= "string" or not Value:find("http") then
		return Value
	end

	local SafeName = Value:gsub("https?://", ""):gsub("[^%w%-_%.]", "_")
	local ext = Value:match("%.(%w+)%?") or Value:match("%.(%w+)$") or "png"
	local FileName = SafeName .. "." .. ext

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

return Library
