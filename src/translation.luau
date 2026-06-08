local HttpService = game:GetService("HttpService")

local Translation = {
	Providers = {},
	Cache = {},
	CacheKey = "FluentPlus_TranslationCache",
	Queue = {},
	QueueTimer = nil,
	QueueDelay = 0.5,
	MaxBatchSize = 5,
	Enabled = false,
	DefaultTarget = "en",
}

local function httpRequest(method, url, contentType, body)
	local http = (syn and syn.request) or (http_request) or (http and http.request) or request
	if http then
		local req = { Url = url, Method = method }
		if contentType then
			req.Headers = { ["Content-Type"] = contentType }
		end
		if body then
			req.Body = body
		end
		local ok, res = pcall(function()
			return http(req)
		end)
		if ok and res and res.StatusCode == 200 and res.Body then
			return res.Body
		end
	end

	if method == "GET" then
		local ok, res = pcall(function()
			return game:HttpGet(url)
		end)
		return ok and res or nil
	elseif method == "POST" and body then
		local ok, res = pcall(function()
			return game:HttpPost(url, body, contentType or "application/json")
		end)
		return ok and res or nil
	end

	return nil
end

local function httpGet(url)
	return httpRequest("GET", url)
end

local function httpPost(url, body, contentType)
	return httpRequest("POST", url, contentType, body)
end

local Providers = {}

function Providers.Google(text, source, target, apiKey)
	if apiKey then
		local url = "https://translation.googleapis.com/language/translate/v2"
			.. "?q=" .. HttpService:UrlEncode(text)
			.. "&source=" .. source
			.. "&target=" .. target
			.. "&key=" .. apiKey

		local body = httpGet(url)
		if body then
			local ok, decoded = pcall(function()
				return HttpService:JSONDecode(body)
			end)
			if ok and decoded and decoded.data and decoded.data.translations then
				return decoded.data.translations[1].translatedText
			end
		end
	end

	local url = "https://translate.googleapis.com/translate_a/single"
		.. "?client=gtx"
		.. "&sl=" .. source
		.. "&tl=" .. target
		.. "&dt=t"
		.. "&q=" .. HttpService:UrlEncode(text)

	local body = httpGet(url)
	if body then
		local ok, decoded = pcall(function()
			return HttpService:JSONDecode(body)
		end)
		if ok and decoded and decoded[1] and decoded[1][1] and decoded[1][1][1] then
			return decoded[1][1][1]
		end
	end
	return nil
end

function Providers.MyMemory(text, source, target)
	local url = "https://api.mymemory.translated.net/get"
		.. "?q=" .. HttpService:UrlEncode(text)
		.. "&langpair=" .. source .. "|" .. target

	local body = httpGet(url)
	if body then
		local ok, decoded = pcall(function()
			return HttpService:JSONDecode(body)
		end)
		if ok and decoded and decoded.responseData and decoded.responseData.translatedText then
			return decoded.responseData.translatedText
		end
	end
	return nil
end

function Providers.LibreTranslate(text, source, target, apiKey, endpoint)
	local url = (endpoint or "https://libretranslate.com") .. "/translate"
	local payload = {
		q = text,
		source = source,
		target = target,
		format = "text",
	}
	if apiKey then
		payload.api_key = apiKey
	end

	local body = httpPost(url, HttpService:JSONEncode(payload), "application/json")
	if body then
		local ok, decoded = pcall(function()
			return HttpService:JSONDecode(body)
		end)
		if ok and decoded and decoded.translatedText then
			return decoded.translatedText
		end
	end
	return nil
end

function Providers.DeepL(text, source, target, apiKey)
	local url = "https://api-free.deepl.com/v2/translate"
	local params = {
		auth_key = apiKey,
		text = text,
		target_lang = target:upper(),
	}
	if source and source ~= "auto" then
		params.source_lang = source:upper()
	end

	local form = {}
	for k, v in pairs(params) do
		table.insert(form, HttpService:UrlEncode(tostring(k)) .. "=" .. HttpService:UrlEncode(tostring(v)))
	end
	local bodyLines = table.concat(form, "&")

	local body = httpPost(url, bodyLines, "application/x-www-form-urlencoded")
	if body then
		local ok, decoded = pcall(function()
			return HttpService:JSONDecode(body)
		end)
		if ok and decoded and decoded.translations and decoded.translations[1] then
			return decoded.translations[1].text
		end
	end
	return nil
end

local function generateCacheKey(text, source, target)
	local hash = 0
	for i = 1, #text do
		hash = (hash * 31 + text:byte(i)) % 2147483647
	end
	return tostring(hash) .. "_" .. source .. "_" .. target
end

function Translation:GetCached(text, source, target)
	local key = generateCacheKey(text, source, target)
	if self.Cache[key] then
		return self.Cache[key]
	end

	local ok, data = pcall(function()
		if isfile and isfile(self.CacheKey) then
			local cached = HttpService:JSONDecode(readfile(self.CacheKey))
			return cached and cached[key] or nil
		end
		return nil
	end)

	if ok and data then
		self.Cache[key] = data
		return data
	end

	return nil
end

function Translation:SetCached(text, source, target, result)
	local key = generateCacheKey(text, source, target)
	self.Cache[key] = result

	pcall(function()
		if writefile then
			local existing = {}
			if isfile and isfile(self.CacheKey) then
				existing = HttpService:JSONDecode(readfile(self.CacheKey))
			end
			existing[key] = result
			writefile(self.CacheKey, HttpService:JSONEncode(existing))
		end
	end)
end

function Translation:DetectLanguage(text)
	local url = "https://translate.googleapis.com/translate_a/single"
		.. "?client=gtx"
		.. "&sl=auto"
		.. "&tl=en"
		.. "&dt=t"
		.. "&q=" .. HttpService:UrlEncode(text)

	local body = httpGet(url)
	if body then
		local ok, decoded = pcall(function()
			return HttpService:JSONDecode(body)
		end)
		if ok and decoded and decoded[2] then
			return decoded[2]
		end
	end
	return nil
end

function Translation:Translate(text, target, source)
	if not self.Enabled then
		return text
	end

	source = source or "auto"
	target = target or self.DefaultTarget

	if not text or #text == 0 then
		return text
	end

	local cached = self:GetCached(text, source, target)
	if cached then
		return cached
	end

	for _, provider in ipairs(self.Providers) do
		local result
		if provider.name == "DeepL" and provider.apiKey then
			result = Providers.DeepL(text, source, target, provider.apiKey)
		elseif provider.name == "Google" then
			result = Providers.Google(text, source, target, provider.apiKey)
		elseif provider.name == "MyMemory" then
			result = Providers.MyMemory(text, source, target)
		elseif provider.name == "LibreTranslate" then
			result = Providers.LibreTranslate(text, source, target, provider.apiKey, provider.endpoint)
		elseif provider.custom then
			result = provider.custom(text, source, target)
		end

		if result then
			self:SetCached(text, source, target, result)
			return result
		end
	end

	return nil
end

function Translation:TranslateAsync(texts, target, source, callback)
	if not self.Enabled then
		if callback then
			callback(texts)
		end
		return texts
	end

	source = source or "auto"
	target = target or self.DefaultTarget

	local results = {}
	local pending = 0

	for i, text in ipairs(texts) do
		local cached = self:GetCached(text, source, target)
		if cached then
			results[i] = cached
		else
			table.insert(self.Queue, {
				index = i,
				text = text,
				source = source,
				target = target,
				results = results,
				callback = callback,
				total = #texts,
			})
			pending = pending + 1
		end
	end

	for i, text in ipairs(texts) do
		if not results[i] then
			results[i] = text
		end
	end

	if pending == 0 then
		if callback then
			callback(results)
		end
		return results
	end

	if not self.QueueTimer then
		self:FlushQueue()
	end

	return results
end

function Translation:FlushQueue()
	if #self.Queue == 0 then
		self.QueueTimer = nil
		return
	end

	local batch = {}
	for i = #self.Queue, 1, -1 do
		if #batch >= self.MaxBatchSize then break end
		table.insert(batch, table.remove(self.Queue, i))
	end

	local textArgs = {}
	local providersCopy = {}

	for _, item in ipairs(batch) do
		table.insert(textArgs, item.text)
		providersCopy[item.index] = item
	end

	for _, item in ipairs(batch) do
		local result = self:Translate(item.text, item.target, item.source)
		item.results[item.index] = result or item.text
	end

	local callbacksDone = {}
	for _, item in ipairs(batch) do
		if item.callback and not callbacksDone[item.callback] then
			callbacksDone[item.callback] = true
			item.callback(item.results)
		end
	end

	if #self.Queue > 0 then
		self.QueueTimer = task.delay(self.QueueDelay, function()
			self:FlushQueue()
		end)
	else
		self.QueueTimer = nil
	end
end

function Translation:Configure(config)
	if not config then
		return
	end

	self.Enabled = config.Enabled ~= false
	self.DefaultTarget = config.DefaultTarget or "en"
	self.Providers = {}

	if config.LibreTranslate then
		local lt = config.LibreTranslate
		table.insert(self.Providers, {
			name = "LibreTranslate",
			priority = 10,
			apiKey = type(lt) == "string" and lt or lt.apiKey,
			endpoint = type(lt) == "string" and "https://libretranslate.com" or lt.endpoint or "https://libretranslate.com",
		})
	end

	if config.DeepL then
		table.insert(self.Providers, {
			name = "DeepL",
			priority = 20,
			apiKey = config.DeepL,
		})
	end

	if config.Google then
		table.insert(self.Providers, {
			name = "Google",
			priority = 30,
			apiKey = type(config.Google) == "string" and #config.Google > 0 and config.Google or nil,
		})
	end

	if config.MyMemory ~= false then
		table.insert(self.Providers, {
			name = "MyMemory",
			priority = 100,
		})
	end

	if #self.Providers == 0 then
		table.insert(self.Providers, {
			name = "Google",
			priority = 1,
		})
	end

	table.sort(self.Providers, function(a, b)
		return a.priority < b.priority
	end)
end

return Translation