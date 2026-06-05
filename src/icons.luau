local CACHE = {}

return {
	Get = function(name)
		return CACHE[name]
	end,
	Set = function(name, asset)
		CACHE[name] = asset
	end,
}
