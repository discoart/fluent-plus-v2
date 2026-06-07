local CACHE = {}
local PERSISTENT_FILE = "fluent_plus_icons.json"

local function getHttp()
	local ok, svc = pcall(function()
		return game:GetService("HttpService")
	end)
	return ok and svc
end

local function loadPersistent()
	local ok, data = pcall(function()
		local http = getHttp()
		if http and isfile and isfile(PERSISTENT_FILE) then
			return http:JSONDecode(readfile(PERSISTENT_FILE))
		end
	end)
	return (ok and type(data) == "table" and data) or {}
end

local PERSISTENT = loadPersistent()
for key, value in pairs(PERSISTENT) do
	if value ~= "" then
		CACHE[key] = value
	end
end

local persistTicker = 0

return {
	Get = function(name)
		return CACHE[name]
	end,

	Set = function(name, asset)
		CACHE[name] = asset or ""

		if asset and asset ~= "" then
			PERSISTENT[name] = asset
			persistTicker = persistTicker + 1
			if persistTicker % 3 == 0 then
				pcall(function()
					local http = getHttp()
					if http and writefile then
						writefile(PERSISTENT_FILE, http:JSONEncode(PERSISTENT))
					end
				end)
			end
		end
	end,

	Has = function(name)
		return CACHE[name] ~= nil
	end,
}
