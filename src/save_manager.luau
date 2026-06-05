local httpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local SaveManager = {} do



	SaveManager.Folder = ("%s%s"):format("Fluent", "Settings")


	SaveManager.Ignore = {}

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

	local function listfiles(path)
		return safeCall(_G.listfiles, path) or {}
	end


	function SaveManager:SetLibrary(library)


		self.Library = library


		self.Options = library.Options


	end


	SaveManager.Parser = {


		Toggle = {


			Save = function(idx, object) 


				return { type = "Toggle", idx = idx, value = object.Value } 


			end,


			Load = function(idx, data)


				if SaveManager.Options[idx] then 


					SaveManager.Options[idx]:SetValue(data.value)


				end


			end,


		},


		Slider = {


			Save = function(idx, object)


				return { type = "Slider", idx = idx, value = tostring(object.Value) }


			end,


			Load = function(idx, data)


				if SaveManager.Options[idx] then 


					SaveManager.Options[idx]:SetValue(data.value)


				end


			end,


		},


		Dropdown = {


			Save = function(idx, object)


				return { type = "Dropdown", idx = idx, value = object.Value, multi = object.Multi }


			end,


			Load = function(idx, data)


				if SaveManager.Options[idx] then 


					SaveManager.Options[idx]:SetValue(data.value)


				end


			end,


		},


		Colorpicker = {


			Save = function(idx, object)


				return { type = "Colorpicker", idx = idx, value = object.Value:ToHex(), transparency = object.Transparency }


			end,


			Load = function(idx, data)


				if SaveManager.Options[idx] then 


					SaveManager.Options[idx]:SetValueRGB(Color3.fromHex(data.value), data.transparency)


				end


			end,


		},


		Keybind = {


			Save = function(idx, object)


				return { type = "Keybind", idx = idx, mode = object.Mode, key = object.Value }


			end,


			Load = function(idx, data)


				if SaveManager.Options[idx] then 


					SaveManager.Options[idx]:SetValue(data.key, data.mode)


				end


			end,


		},





		Input = {


			Save = function(idx, object)


				return { type = "Input", idx = idx, text = object.Value }


			end,


			Load = function(idx, data)


				if SaveManager.Options[idx] and type(data.text) == "string" then


					SaveManager.Options[idx]:SetValue(data.text)


				end


			end,


		},


	}





	function SaveManager:SetIgnoreIndexes(list)


		for _, key in next, list do


			self.Ignore[key] = true


		end


	end


	function SaveManager:SetFolder(folder)


		self.Folder = folder;


		self:BuildFolderTree()


	end





	function SaveManager:Save(name)


		if (not name) then


			return false, "no config file is selected"


		end





		local fullPath = self.Folder .. "/" .. name .. ".json"





		local data = {


			objects = {}


		}








		for idx, option in next, SaveManager.Options do


			if self.Parser[option.Type] and not self.Ignore[idx] then


				table.insert(data.objects, self.Parser[option.Type].Save(idx, option))


			end


		end	





		local success, encoded = pcall(httpService.JSONEncode, httpService, data)


		if not success then


			return false, "failed to encode data"


		end





		writefile(fullPath, encoded)


		return true


	end





	if not RunService:IsStudio() then


		function SaveManager:Load(name)


			if (not name) then


				return false, "no config file is selected"


			end





			local file = self.Folder .. "/" .. name .. ".json"


			if not isfile(file) then return false, "Create Config Save File" end





			local success, decoded = pcall(httpService.JSONDecode, httpService, readfile(file))


			if not success then return false, "decode error" end





			for _, option in next, decoded.objects do


				if self.Parser[option.type] and not self.Ignore[option.idx] then


					task.spawn(function() self.Parser[option.type].Load(option.idx, option) end)


				end


			end





			self.Library.SettingLoaded = true





			return true, decoded


		end


	end





	SaveManager.IgnoreThemeSettings = function(self)


		self:SetIgnoreIndexes({ 


			"InterfaceTheme", "AcrylicToggle", "TransparentToggle", "MenuKeybind"


		})


	end





	function SaveManager:BuildFolderTree()
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





	function SaveManager:RefreshConfigList()


		local list = listfiles(self.Folder .. "/")





		local out = {}


		for i = 1, #list do


			local file = list[i]


			if file:sub(-5) == ".json" then


				local pos = file:find(".json", 1, true)


				local start = pos





				local char = file:sub(pos, pos)


				while char ~= "/" and char ~= "\\" and char ~= "" do


					pos = pos - 1


					char = file:sub(pos, pos)


				end





				if char == "/" or char == "\\" then


					local name = file:sub(pos + 1, start - 1)


					if name ~= "options" then


						table.insert(out, name)


					end


				end


			end


		end





		return out


	end





-- Removed duplicate SetLibrary





	if not RunService:IsStudio() then


		function SaveManager:LoadAutoloadConfig()


			if isfile(self.Folder .. "/autoload.txt") then


				local name = readfile(self.Folder .. "/autoload.txt")





				local success, err = self:Load(name)


				if not success then


					return self.Library:Notify({


						Title = "Interface",


						Content = "Config loader",


						SubContent = "Failed to load autoload config: " .. err,


						Duration = 7


					})


				end





				self.Library:Notify({


					Title = "Interface",


					Content = "Config loader",


					SubContent = string.format("Auto loaded config %q", name),


					Duration = 7


				})


			end


		end


	end





	function SaveManager:BuildConfigSection(tab)


		assert(self.Library, "Must set SaveManager.Library")





		local section = tab:AddSection("Configuration", "settings")





		section:AddInput("SaveManager_ConfigName",    { Title = "Config name" })


		section:AddDropdown("SaveManager_ConfigList", { Title = "Config list", Values = self:RefreshConfigList(), AllowNull = true })





		section:AddButton({


			Title = "Create config",


			Callback = function()


				local name = SaveManager.Options.SaveManager_ConfigName.Value





				if name:gsub(" ", "") == "" then 


					return self.Library:Notify({


						Title = "Interface",


						Content = "Config loader",


						SubContent = "Invalid config name (empty)",


						Duration = 7


					})


				end





				local success, err = self:Save(name)


				if not success then


					return self.Library:Notify({


						Title = "Interface",


						Content = "Config loader",


						SubContent = "Failed to save config: " .. err,


						Duration = 7


					})


				end





				self.Library:Notify({


					Title = "Interface",


					Content = "Config loader",


					SubContent = string.format("Created config %q", name),


					Duration = 7


				})





				SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())


				SaveManager.Options.SaveManager_ConfigList:SetValue(nil)


			end


		})





		section:AddButton({Title = "Load config", Callback = function()


			local name = SaveManager.Options.SaveManager_ConfigList.Value





			local success, err = self:Load(name)


			if not success then


				return self.Library:Notify({


					Title = "Interface",


					Content = "Config loader",


					SubContent = "Failed to load config: " .. err,


					Duration = 7


				})


			end





			self.Library:Notify({


				Title = "Interface",


				Content = "Config loader",


				SubContent = string.format("Loaded config %q", name),


				Duration = 7


			})


		end})





		section:AddButton({Title = "Save config", Callback = function()


			local name = SaveManager.Options.SaveManager_ConfigList.Value





			local success, err = self:Save(name)


			if not success then


				return self.Library:Notify({


					Title = "Interface",


					Content = "Config loader",


					SubContent = "Failed to overwrite config: " .. err,


					Duration = 7


				})


			end





			self.Library:Notify({


				Title = "Interface",


				Content = "Config loader",


				SubContent = string.format("Overwrote config %q", name),


				Duration = 7


			})


		end})





		section:AddButton({Title = "Refresh list", Callback = function()


			SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())


			SaveManager.Options.SaveManager_ConfigList:SetValue(nil)


		end})





		local AutoloadButton


		AutoloadButton = section:AddButton({Title = "Set as autoload", Description = "Current autoload config: none", Callback = function()


			local name = SaveManager.Options.SaveManager_ConfigList.Value


			writefile(self.Folder .. "/autoload.txt", name)


			AutoloadButton:SetDesc("Current autoload config: " .. name)


			self.Library:Notify({


				Title = "Interface",


				Content = "Config loader",


				SubContent = string.format("Set %q to auto load", name),


				Duration = 7


			})


		end})





		if isfile(self.Folder .. "/autoload.txt") then


			local name = readfile(self.Folder .. "/autoload.txt")


			AutoloadButton:SetDesc("Current autoload config: " .. name)


		end





		SaveManager:SetIgnoreIndexes({ "SaveManager_ConfigList", "SaveManager_ConfigName" })


	end





	if not RunService:IsStudio() then


		SaveManager:BuildFolderTree()


	end


end

return SaveManager
