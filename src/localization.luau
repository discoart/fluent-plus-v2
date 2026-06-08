local Translator = require("translation")
local Library = require("library")

local Localization = {
	CurrentLanguage = "en",
	Registry = {},
	Callbacks = {},
	Translating = false,
	TranslationCache = {},
	Languages = {
		{ Code = "en", Name = "ENG" },
		{ Code = "ru", Name = "RU" },
		{ Code = "de", Name = "DE" },
		{ Code = "fr", Name = "FR" },
		{ Code = "es", Name = "ES" },
		{ Code = "pt", Name = "PT" },
		{ Code = "it", Name = "IT" },
		{ Code = "nl", Name = "NL" },
		{ Code = "pl", Name = "PL" },
		{ Code = "ja", Name = "JP" },
		{ Code = "ko", Name = "KR" },
		{ Code = "zh", Name = "CN" },
		{ Code = "ar", Name = "SA" },
		{ Code = "tr", Name = "TR" },
		{ Code = "sv", Name = "SE" },
		{ Code = "da", Name = "DK" },
		{ Code = "fi", Name = "FI" },
		{ Code = "no", Name = "NO" },
		{ Code = "cs", Name = "CZ" },
		{ Code = "hu", Name = "HU" },
		{ Code = "ro", Name = "RO" },
		{ Code = "uk", Name = "UA" },
		{ Code = "el", Name = "GR" },
		{ Code = "he", Name = "IL" },
		{ Code = "th", Name = "TH" },
		{ Code = "vi", Name = "VN" },
		{ Code = "id", Name = "ID" },
		{ Code = "ms", Name = "MY" },
		{ Code = "hi", Name = "IN" },
		{ Code = "bn", Name = "BD" },
		{ Code = "ta", Name = "LK" },
		{ Code = "te", Name = "TG" },
		{ Code = "mr", Name = "MH" },
		{ Code = "gu", Name = "GJ" },
		{ Code = "pa", Name = "PB" },
		{ Code = "ur", Name = "PK" },
		{ Code = "fa", Name = "IR" },
		{ Code = "ca", Name = "CT" },
		{ Code = "eu", Name = "PV" },
		{ Code = "gl", Name = "GA" },
		{ Code = "sr", Name = "RS" },
		{ Code = "hr", Name = "HR" },
		{ Code = "bg", Name = "BG" },
		{ Code = "sk", Name = "SK" },
		{ Code = "sl", Name = "SI" },
		{ Code = "lt", Name = "LT" },
		{ Code = "lv", Name = "LV" },
		{ Code = "et", Name = "EE" },
		{ Code = "hy", Name = "AM" },
		{ Code = "ka", Name = "GE" },
		{ Code = "az", Name = "AZ" },
		{ Code = "kk", Name = "KZ" },
		{ Code = "uz", Name = "UZ" },
		{ Code = "mn", Name = "MN" },
		{ Code = "ne", Name = "NP" },
		{ Code = "si", Name = "LK" },
		{ Code = "km", Name = "KH" },
		{ Code = "lo", Name = "LA" },
		{ Code = "my", Name = "MM" },
		{ Code = "am", Name = "ET" },
		{ Code = "sw", Name = "TZ" },
		{ Code = "af", Name = "ZA" },
		{ Code = "tl", Name = "PH" },
		{ Code = "mt", Name = "MT" },
		{ Code = "is", Name = "IS" },
	},
}

function Localization:getLanguageValues()
	local values = {}
	for _, lang in ipairs(self.Languages) do
		table.insert(values, self:formatLanguage(lang))
	end
	return values
end

function Localization:formatLanguage(lang)
	local flag = string.upper(lang.Name)
	local flagStr = ""
	for i = 1, #flag do
		local byte = flag:byte(i)
		if byte >= 65 and byte <= 90 then
			flagStr = flagStr .. string.char(240) .. string.char(159) .. string.char(byte - 65 + 133) .. string.char(byte - 65 + 128)
		end
	end
	return flagStr .. " " .. lang.Name
end

function Localization:findByFormatted(formatted)
	for _, lang in ipairs(self.Languages) do
		if self:formatLanguage(lang) == formatted then
			return lang
		end
	end
	return self.Languages[1]
end

function Localization:registerText(instance, property, text)
	if not instance or not property or not text then
		return
	end
	if self.Registry[instance] then
		self.Registry[instance].text = text
	else
		self.Registry[instance] = {
			property = property,
			text = text,
		}
		local conn
		conn = instance.Destroying:Connect(function()
			conn:Disconnect()
			self.Registry[instance] = nil
		end)
	end
end

function Localization:unregister(instance)
	self.Registry[instance] = nil
end

local function showNotify(title, content, subContent, duration)
	local ok = pcall(function()
		if Library and Library.SafeCallback then
			Library:Notify({
				Title = title,
				Content = content,
				SubContent = subContent,
				Duration = duration or 5,
			})
		end
	end)
	return ok
end

function Localization:setLanguage(code)
	self.CurrentLanguage = code
	Translator.DefaultTarget = code
	self:translateAll()
end

function Localization:translateAll()
	if self.Translating then
		return
	end
	self.Translating = true

	task.spawn(function()
		self.TranslationCache = self.TranslationCache or {}

		local pending = {}
		local count = 0
		for instance, data in pairs(self.Registry) do
			if instance and instance.Parent then
				local key = data.text
				if not self.TranslationCache[key] then
					self.TranslationCache[key] = true
					pending[key] = data.text
					count = count + 1
				end
			end
		end

		local failed = 0
		if count > 0 then
			for key, original in pairs(pending) do
				local ok, result = pcall(function()
					return Translator:Translate(original, self.CurrentLanguage)
				end)
				if ok and result and result ~= "" then
					self.TranslationCache[key] = result
				else
					self.TranslationCache[key] = original
					failed = failed + 1
				end
			end
		end

		for instance, data in pairs(self.Registry) do
			if instance and instance.Parent then
				local translated = self.TranslationCache[data.text]
				if translated and translated ~= true then
					pcall(function()
						instance[data.property] = translated
					end)
				end
			end
		end

		if failed > 0 then
			showNotify(
				"Translation",
				"Failed to translate " .. failed .. " text(s)",
				"Some texts kept original language. Check network or try another provider.",
				6
			)
		elseif count > 0 then
			showNotify(
				"Language",
				"Changed to " .. self.CurrentLanguage:upper(),
				"All interface texts have been translated.",
				3
			)
		end

		for _, callback in ipairs(self.Callbacks) do
			pcall(callback, self.CurrentLanguage)
		end

		self.Translating = false
	end)
end

function Localization:onLanguageChanged(callback)
	table.insert(self.Callbacks, callback)
end

Library.Localization = Localization

return Localization
