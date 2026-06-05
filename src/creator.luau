local Flipper = require("flipper")
local Library = require("library")
local Themes = require("themes")

local Creator = {
	Registry = {},
	Signals = {},
	TransparencyMotors = {},
	Motors = {},
	RandomNames = false,
	DefaultProperties = {
		ScreenGui = {
			ResetOnSpawn = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		},
		Frame = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
		ScrollingFrame = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			ScrollBarImageColor3 = Color3.new(0, 0, 0),
		},
		TextLabel = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			TextSize = 14,
		},
		TextButton = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			AutoButtonColor = false,
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 14,
		},
		TextBox = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			ClearTextOnFocus = false,
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 14,
		},
		ImageLabel = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
		ImageButton = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			AutoButtonColor = false,
		},
		CanvasGroup = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
	},
}

local function ApplyCustomProps(Object, Props)
	if Props.ThemeTag then
		Creator.AddThemeObject(Object, Props.ThemeTag)
	end
end

function Creator.AddSignal(Signal, Function)
	local Connected = Signal:Connect(Function)
	table.insert(Creator.Signals, Connected)
	return Connected
end

function Creator.RemoveSignal(Connection)
	if Connection then
		for i = #Creator.Signals, 1, -1 do
			if Creator.Signals[i] == Connection then
				table.remove(Creator.Signals, i)
				break
			end
		end
		pcall(function() Connection:Disconnect() end)
	end
end

function Creator.Disconnect()
	for Idx = #Creator.Signals, 1, -1 do
		local Connection = table.remove(Creator.Signals, Idx)
		if Connection and Connection.Disconnect then
			pcall(function() Connection:Disconnect() end)
		end
	end
	for Idx = #Creator.Motors, 1, -1 do
		local Motor = table.remove(Creator.Motors, Idx)
		if Motor and Motor.stop then
			pcall(function() Motor:stop() end)
		end
	end
	if Creator.TextElementConnections then
		for obj, conn in pairs(Creator.TextElementConnections) do
			if conn and conn.Disconnect then
				pcall(function() conn:Disconnect() end)
			end
		end
		Creator.TextElementConnections = {}
	end
	if Creator.TextElements then
		for obj, _ in pairs(Creator.TextElements) do
			Creator.TextElements[obj] = nil
		end
	end
	Creator.Registry = {}
	Creator.TransparencyMotors = {}
end

Creator.Themes = Themes
Creator.Theme = Creator.Theme or "Dark"

function Creator.GetThemeProperty(Property)
	local Theme = Creator.Themes[Creator.Theme]
	if Theme then
		return Theme[Property]
	end
	return Creator.Themes.Dark[Property]
end

function Creator.UpdateTheme()
	if not Creator.Themes[Creator.Theme] then
		Creator.Theme = "Dark"
	end

	for Instance, Object in next, Creator.Registry do
		for Property, ColorIdx in next, Object.Properties do
			local themeValue = Creator.GetThemeProperty(ColorIdx)
			if themeValue then
				Instance[Property] = themeValue
			end
		end
	end

	local transparency = Creator.GetThemeProperty("ElementTransparency")
	if transparency then
		for _, Motor in next, Creator.TransparencyMotors do
			Motor:setGoal(Flipper.Instant.new(transparency))
		end
	end
end

function Creator.AddThemeObject(Object, Properties)
	Creator.Registry[Object] = {
		Object = Object,
		Properties = Properties,
	}

	for Property, ColorIdx in next, Properties do
		local themeValue = Creator.GetThemeProperty(ColorIdx)
		if themeValue then
			Object[Property] = themeValue
		end
	end
	return Object
end

function Creator.OverrideTag(Object, Properties)
	if Creator.Registry[Object] then
		Creator.Registry[Object].Properties = Properties
		Creator.UpdateTheme()
	end
end



local MiniMessageColors = {
	["black"] = "#000000",
	["dark_blue"] = "#0000AA",
	["dark_green"] = "#00AA00",
	["dark_aqua"] = "#00AAAA",
	["dark_red"] = "#AA0000",
	["dark_purple"] = "#AA00AA",
	["gold"] = "#FFAA00",
	["gray"] = "#AAAAAA",
	["grey"] = "#AAAAAA",
	["dark_gray"] = "#555555",
	["dark_grey"] = "#555555",
	["blue"] = "#5555FF",
	["green"] = "#55FF55",
	["aqua"] = "#55FFFF",
	["cyan"] = "#55FFFF",
	["red"] = "#FF5555",
	["light_purple"] = "#FF55FF",
	["magenta"] = "#FF55FF",
	["yellow"] = "#FFFF55",
	["white"] = "#FFFFFF",
	["reset"] = "#FFFFFF",
	["orange"] = "#FFAA00",
	["pink"] = "#FF55FF",
	["lime"] = "#55FF55",
	["brown"] = "#AA5500",
}

local function MiniMessageToRichText(text)
	if type(text) ~= "string" or text == "" then
		return text
	end
	
	if not text:match("<[^>]+>") then
		return text
	end
	
	local result = text
	result = result:gsub("<br>", "\n")
	result = result:gsub("<br/>", "\n")
	result = result:gsub("<br />", "\n")
	result = result:gsub("<nl>", "\n")
	result = result:gsub("<newline>", "\n")
	
	result = result:gsub("<reset>", "</font></b></i></u></s>")
	
	result = result:gsub("<obfuscated>(.-)</obfuscated>", "%1")
	result = result:gsub("<obfuscated>", "")
	result = result:gsub("</obfuscated>", "")
	
	local function hexToRgb(hex)
		hex = hex:gsub("#", "")
		local r = tonumber("0x" .. hex:sub(1, 2))
		local g = tonumber("0x" .. hex:sub(3, 4))
		local b = tonumber("0x" .. hex:sub(5, 6))
		return r, g, b
	end
	
	local function rgbToHex(r, g, b)
		return string.format("#%02X%02X%02X", math.floor(r), math.floor(g), math.floor(b))
	end
	
	local function interpolateColor(color1Hex, color2Hex, t)
		local r1, g1, b1 = hexToRgb(color1Hex)
		local r2, g2, b2 = hexToRgb(color2Hex)
		local r = r1 + (r2 - r1) * t
		local g = g1 + (g2 - g1) * t
		local b = b1 + (b2 - b1) * t
		return rgbToHex(r, g, b)
	end
	
	for i = 1, 10 do
		local newResult = result:gsub("<gradient:([^>]+)>(.-)</gradient>", function(colorsStr, content)
			local colors = {}
			
			for colorMatch in colorsStr:gmatch("(#%x%x%x%x%x%x)") do
				table.insert(colors, colorMatch)
			end
			
			if #colors == 0 then
				for colorMatch in colorsStr:gmatch("(%x%x%x%x%x%x)") do
					table.insert(colors, "#" .. colorMatch)
				end
			end
			
			if #colors < 2 then
				if #colors == 1 then
					return '<font color="' .. colors[1] .. '">' .. content .. '</font>'
				else
					return content
				end
			end
			
			local cleanText = content:gsub("<[^>]+>", "")
			local textLength = #cleanText
			
			if textLength == 0 then
				return content
			end
			
			if textLength == 1 then
				return '<font color="' .. colors[1] .. '">' .. content .. '</font>'
			end
			
			local parts = {}
			local pos = 1
			local charIndex = 0
			
			while pos <= #content do
				if content:sub(pos, pos) == "<" then
					local tagEnd = content:find(">", pos)
					if tagEnd then
						local tag = content:sub(pos, tagEnd)
						table.insert(parts, {type = "tag", value = tag})
						pos = tagEnd + 1
					else
						table.insert(parts, {type = "char", value = content:sub(pos, pos), index = charIndex})
						charIndex = charIndex + 1
						pos = pos + 1
					end
				else
					local char = content:sub(pos, pos)
					table.insert(parts, {type = "char", value = char, index = charIndex})
					charIndex = charIndex + 1
					pos = pos + 1
				end
			end
			
			local function getGradientColor(t)
				t = math.max(0, math.min(1, t))
				
				if #colors == 2 then
					return interpolateColor(colors[1], colors[2], t)
				end
				
				local numSegments = #colors - 1
				local segmentSize = 1 / numSegments
				
				local segmentIndex = math.floor(t / segmentSize)
				if segmentIndex >= numSegments then
					segmentIndex = numSegments - 1
					t = 1.0
				end
				
				local segmentStart = segmentIndex * segmentSize
				local segmentEnd = (segmentIndex + 1) * segmentSize
				
				local segmentT = 0
				if segmentEnd > segmentStart then
					segmentT = (t - segmentStart) / (segmentEnd - segmentStart)
				else
					segmentT = (t >= segmentEnd) and 1.0 or 0.0
				end
				
				segmentT = math.max(0, math.min(1, segmentT))
				
				local color1Index = segmentIndex + 1
				local color2Index = segmentIndex + 2
				
				if color1Index < 1 then color1Index = 1 end
				if color2Index > #colors then color2Index = #colors end
				if color1Index > #colors then color1Index = #colors end
				
				return interpolateColor(colors[color1Index], colors[color2Index], segmentT)
			end
			
			local gradientText = ""
			local currentSegment = ""
			local currentColor = nil
			local segments = {}
			
			for _, part in ipairs(parts) do
				if part.type == "tag" then
					if currentSegment ~= "" and currentColor ~= nil then
						table.insert(segments, {text = currentSegment, color = currentColor})
						currentSegment = ""
						currentColor = nil
					end
					table.insert(segments, {text = part.value, color = nil})
				else
					local t = part.index / (textLength - 1)
					if textLength == 1 then t = 0 end
					local charColor = getGradientColor(t)
					
					if currentColor == charColor then
						currentSegment = currentSegment .. part.value
					else
						if currentSegment ~= "" and currentColor ~= nil then
							table.insert(segments, {text = currentSegment, color = currentColor})
						end
						currentSegment = part.value
						currentColor = charColor
					end
				end
			end
			
			if currentSegment ~= "" and currentColor ~= nil then
				table.insert(segments, {text = currentSegment, color = currentColor})
			end
			
			local hasTextSegments = false
			for _, segment in ipairs(segments) do
				if segment.text and segment.text ~= "" then
					hasTextSegments = true
					break
				end
			end
			
			if not hasTextSegments and textLength > 0 then
				local fallbackText = ""
				for i = 1, textLength do
					local t = (i - 1) / (textLength - 1)
					if textLength == 1 then t = 0 end
					local charColor = getGradientColor(t)
					local char = cleanText:sub(i, i)
					fallbackText = fallbackText .. '<font color="' .. charColor .. '">' .. char .. '</font>'
				end
				return fallbackText
			end
			
			for _, segment in ipairs(segments) do
				if segment.color and segment.text and segment.text ~= "" then
					gradientText = gradientText .. '<font color="' .. segment.color .. '">' .. segment.text .. '</font>'
				elseif segment.text then
					gradientText = gradientText .. segment.text
				end
			end
			
			if gradientText == "" or gradientText == nil or not gradientText:match('<font color=') then
				local fallbackText = ""
				for i = 1, textLength do
					local t = (i - 1) / (textLength - 1)
					if textLength == 1 then t = 0 end
					local charColor = getGradientColor(t)
					local char = cleanText:sub(i, i)
					fallbackText = fallbackText .. '<font color="' .. charColor .. '">' .. char .. '</font>'
				end
				return fallbackText
			end
			
			return gradientText
		end)
		if newResult == result then
			break
		end
		result = newResult
	end
	
	result = result:gsub("<color:(#%x%x%x%x%x%x)>(.-)</color>", '<font color="%1">%2</font>')
	result = result:gsub("<color:(#%x%x%x%x%x%x)>", '<font color="%1">')
	result = result:gsub("<color:(%x%x%x%x%x%x)>(.-)</color>", function(hex, content)
		return '<font color="#' .. hex .. '">' .. content .. '</font>'
	end)
	result = result:gsub("<color:(%x%x%x%x%x%x)>", function(hex)
		return '<font color="#' .. hex .. '">'
	end)
	result = result:gsub("</color>", "</font>")
	
	result = result:gsub("<(#%x%x%x%x%x%x)>(.-)</#%x%x%x%x%x%x>", '<font color="%1">%2</font>')
	result = result:gsub("<(#%x%x%x%x%x%x)>", '<font color="%1">')
	result = result:gsub("</(#%x%x%x%x%x%x)>", "</font>")
	
	local colorNames = {}
	for colorName, _ in pairs(MiniMessageColors) do
		table.insert(colorNames, colorName)
	end
	table.sort(colorNames, function(a, b) return #a > #b end)
	
	for _, colorName in ipairs(colorNames) do
		local hexColor = MiniMessageColors[colorName]
		result = result:gsub("<" .. colorName .. ">(.-)</" .. colorName .. ">", '<font color="' .. hexColor .. '">%1</font>')
		result = result:gsub("<" .. colorName .. ">", '<font color="' .. hexColor .. '">')
		result = result:gsub("</" .. colorName .. ">", "</font>")
	end
	
	result = result:gsub("<bold>(.-)</bold>", "<b>%1</b>")
	result = result:gsub("<bold>", "<b>")
	result = result:gsub("</bold>", "</b>")
	
	result = result:gsub("<italic>(.-)</italic>", "<i>%1</i>")
	result = result:gsub("<italic>", "<i>")
	result = result:gsub("</italic>", "</i>")
	
	result = result:gsub("<underline>(.-)</underline>", "<u>%1</u>")
	result = result:gsub("<underlined>(.-)</underlined>", "<u>%1</u>")
	result = result:gsub("<underline>", "<u>")
	result = result:gsub("<underlined>", "<u>")
	result = result:gsub("</underline>", "</u>")
	result = result:gsub("</underlined>", "</u>")
	
	result = result:gsub("<strikethrough>(.-)</strikethrough>", "<s>%1</s>")
	result = result:gsub("<strike>(.-)</strike>", "<s>%1</s>")
	result = result:gsub("<strikethrough>", "<s>")
	result = result:gsub("<strike>", "<s>")
	result = result:gsub("</strikethrough>", "</s>")
	result = result:gsub("</strike>", "</s>")
	
	result = result:gsub('<font color="[^"]+"></font>', "")
	
	result = result:gsub("</font></font>", "</font>")
	result = result:gsub("</b></b>", "</b>")
	result = result:gsub("</i></i>", "</i>")
	result = result:gsub("</u></u>", "</u>")
	result = result:gsub("</s></s>", "</s>")
	
	return result
end

Creator.TextElements = {}
Creator.TextElementConnections = {} -- Now stores object -> connection map

local function setupMiniMessageSupport(object, properties)
	if not (object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox")) then
		return
	end
	
	local richTextExplicitlySet = properties and properties.RichText ~= nil
	if not richTextExplicitlySet then
		object.RichText = true
	elseif properties.RichText == false then
		object.RichText = false
	end
	
	local lastText = object.Text or ""
	local isConverting = false
	
	local function convertTextIfNeeded(text)
		if not text or type(text) ~= "string" then
			return text
		end
		
		local hasRichTextTags = text:match('<font color="[^"]+">')
		
		if hasRichTextTags then
			return text
		end
		
		if text:match("<[^>]+>") then
		local hasMiniMessagePattern = 
			text:match("<%w+>") or
			text:match("<color:") or
			text:match("<#[%x%x%x%x%x%x]>") or
			text:match("<gradient:") or
			text:match("<reset>") or
			text:match("<obfuscated>") or
			text:match("</%w+>") or
			text:match("</color>")
			
			if hasMiniMessagePattern then
				if not object.RichText then
					object.RichText = true
				end
				return MiniMessageToRichText(text)
			end
		end
		
		return text
	end
	
	local connection
	connection = object:GetPropertyChangedSignal("Text"):Connect(function()
		if isConverting then
			return
		end
		
		local currentText = object.Text or ""
		
		if currentText ~= lastText then
			local converted = convertTextIfNeeded(currentText)
			if converted ~= currentText then
				isConverting = true
				object.Text = converted
				lastText = converted
				isConverting = false
			else
				lastText = currentText
			end
		end
	end)
	
	Creator.TextElementConnections[object] = connection
	Creator.TextElements[object] = true
	
	local destroyConn
	destroyConn = object.Destroying:Connect(function()
		destroyConn:Disconnect()
		if Creator.TextElementConnections[object] then
			Creator.TextElementConnections[object]:Disconnect()
			Creator.TextElementConnections[object] = nil
		end
		Creator.TextElements[object] = nil
	end)

	if object.Text then
		local converted = convertTextIfNeeded(object.Text)
		if converted ~= object.Text then
			object.Text = converted
			lastText = converted
		end
	end
end

local function resolveZIndex(value, layer)
	if type(value) ~= "number" then
		return value
	end

	local base = Library.ZIndexLayers.base or 0
	local layerOffset = layer and Library.ZIndexLayers[layer]
	if layerOffset then
		return base + layerOffset + value
	end

	if value >= base then
		return value
	end

	return base + value
end

function Creator.resolveFont(value, weight, style)
	if typeof(value) == "Font" then
		return value
	end
	if typeof(value) == "string" then
		if value:find("rbxasset://") or value:find("rbxassetid://") or value:find(".json") then
			return Font.new(value, weight or Enum.FontWeight.Regular, style or Enum.FontStyle.Normal)
		end
		-- Handle generic font names if needed
		local enumFont = Enum.Font[value] or Enum.Font.SourceSans
		return Font.fromEnum(enumFont, weight or Enum.FontWeight.Regular, style or Enum.FontStyle.Normal)
	end
	return Font.new("rbxasset://fonts/families/GothamSSm.json", weight or Enum.FontWeight.Regular, style or Enum.FontStyle.Normal)
end

local resolveFont = Creator.resolveFont

function Creator.GenerateName()
	local len = math.random(16, 28)
	local chars = {}
	for _ = 1, len do
		chars[_] = string.char(math.random(97, 122))
	end
	return table.concat(chars)
end

function Creator.New(Name, Properties, Children)
	local Object = Instance.new(Name)

	if Creator.RandomNames and Properties and not Properties.Name and not table.find({
		"UIListLayout", "UIPadding", "UIStroke", "UIGradient", "UICorner",
		"UISizeConstraint", "UIScale", "UIAspectRatioConstraint",
		"TextButton", "ImageLabel", "SpecialMesh"
	}, Name) then
		Object.Name = Creator.GenerateName()
	end

	for Name, Value in next, Creator.DefaultProperties[Name] or {} do
		Object[Name] = Value
	end

	local originalText = Properties and Properties.Text

	if Name == "TextLabel" or Name == "TextButton" or Name == "TextBox" then
		local fontValue = Properties and (Properties.FontFace or Properties.Font) or Library.Font
		Object.FontFace = resolveFont(fontValue)
	end

	for Name, Value in next, Properties or {} do
		if Name ~= "ThemeTag" and Name ~= "ZLayer" and Name ~= "Font" and Name ~= "FontFace" then
			if Name == "ZIndex" then
				Object[Name] = resolveZIndex(Value, Properties.ZLayer)
			else
				Object[Name] = Value
			end
		end
	end
	
	if originalText and type(originalText) == "string" and originalText:match("<[^>]+>") then
		Object.Text = MiniMessageToRichText(originalText)
		if Properties and Properties.RichText == nil then
			Object.RichText = true
		end
	end

	for _, Child in next, Children or {} do
		Child.Parent = Object
	end

	ApplyCustomProps(Object, Properties)
	
	setupMiniMessageSupport(Object, Properties)
	
	return Object
end

function Creator.SpringMotor(Initial, Instance, Prop, IgnoreDialogCheck, ResetOnThemeChange)
	IgnoreDialogCheck = IgnoreDialogCheck or false
	ResetOnThemeChange = ResetOnThemeChange or false
	local Motor = Flipper.SingleMotor.new(Initial)
	table.insert(Creator.Motors, Motor)
	Motor:onStep(function(value)
		Instance[Prop] = value
	end)

	if ResetOnThemeChange then
		table.insert(Creator.TransparencyMotors, Motor)
	end

	local function SetValue(Value, Ignore)
		Ignore = Ignore or false
		if not IgnoreDialogCheck then
			if not Ignore then
				if Prop == "BackgroundTransparency" and Library.DialogOpen then
					return
				end
			end
		end
		Motor:setGoal(Flipper.Spring.new(Value, { frequency = 8 }))
	end

	return Motor, SetValue
end

function Creator.SetupMarquee(Label)
	local ActiveTween = nil
	local UpdateThread = nil

	local Container = Instance.new("Frame")
	Container.Name = "MarqueeContainer"
	Container.BackgroundTransparency = 1
	Container.ClipsDescendants = true
	
	Label.TextWrapped = false
	Label.AutomaticSize = Enum.AutomaticSize.X

	local function Update()
		if UpdateThread then 
			task.cancel(UpdateThread)
			UpdateThread = nil 
		end
		Label.Position = UDim2.fromScale(0, 0)
		
		UpdateThread = task.spawn(function()
			while Label and Label.Parent do
				local TextWidth = Label.TextBounds.X
				local VisibleWidth = Container.AbsoluteSize.X

				if TextWidth > VisibleWidth and VisibleWidth > 0 then
					local Diff = TextWidth - VisibleWidth
					local Speed = 35
					local Duration = Diff / Speed
					
					Label.Position = UDim2.fromScale(0, 0)
					task.wait(3) -- Start latency
					
					-- Slower, smoother marquee
					ActiveTween = game:GetService("TweenService"):Create(Label, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {
						Position = UDim2.new(0, -Diff - 5, 0, 0)
					})
					ActiveTween:Play()
					ActiveTween.Completed:Wait()
					
					task.wait(3) -- Latency at end
					
					-- Smoothly return instead of snapping
					ActiveTween = game:GetService("TweenService"):Create(Label, TweenInfo.new(Duration * 0.5, Enum.EasingStyle.Quad), {
						Position = UDim2.new(0, 0, 0, 0)
					})
					ActiveTween:Play()
					ActiveTween.Completed:Wait()
					task.wait(1)
				else
					task.wait(1)
				end
			end
		end)
	end

	Creator.AddSignal(Label:GetPropertyChangedSignal("Text"), Update)
	Creator.AddSignal(Label:GetPropertyChangedSignal("TextBounds"), Update)
	Creator.AddSignal(Container:GetPropertyChangedSignal("AbsoluteSize"), Update)
	
	local function Start()
		if not Label.Parent then return end
		if Label.Parent == Container then return end
		
		Container.Size = Label.Size
		Container.Position = Label.Position
		Container.LayoutOrder = Label.LayoutOrder
		Container.ZIndex = Label.ZIndex
		Container.Visible = Label.Visible
		Container.AnchorPoint = Label.AnchorPoint
		
		if Label.Parent and Label.Parent ~= Container then
			pcall(function()
				Container.Parent = Label.Parent
				Label.Parent = Container
			end)
		end
		Label.AnchorPoint = Vector2.new(0, 0)
		Label.Position = UDim2.fromScale(0, 0)
		Label.Size = UDim2.new(1, 0, 1, 0)
		Update()
	end

	if Label.Parent then
		Start()
	else
		local conn
		conn = Label:GetPropertyChangedSignal("Parent"):Connect(function()
			if Label.Parent and Label.Parent ~= Container then
				conn:Disconnect()
				Start()
			end
		end)
		table.insert(Creator.Signals, conn)
	end
end

Library.Creator = Creator

Library.MiniMessageToRichText = MiniMessageToRichText

return Creator
