--[[
███████╗██╗░░░░░██╗░░░██╗███████╗███╗░░██╗████████╗  ██████╗░██╗░░░░░██╗░░░██╗░██████╗
██╔════╝██║░░░░░██║░░░██║██╔════╝████╗░██║╚══██╔══╝  ██╔══██╗██║░░░░░██║░░░██║██╔════╝
█████╗░░██║░░░░░██║░░░██║█████╗░░██╔██╗██║░░░██║░░░  ██████╔╝██║░░░░░██║░░░██║╚█████╗░
██╔══╝░░██║░░░░░██║░░░██║██╔══╝░░██║╚████║░░░██║░░░  ██╔═══╝░██║░░░░░██║░░░██║░╚═══██╗
██║░░░░░███████╗╚██████╔╝███████╗██║░╚███║░░░██║░░░  ██║░░░░░███████╗╚██████╔╝██████╔╝
╚═╝░░░░░╚══════╝░╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░  ╚═╝░░░░░╚══════╝░╚═════╝░╚═════╝░

Fluent Plus v0.0.1
https://fluent-pl.us
]]--

local Themes = {
	Names = {
		string.char(68,97,114,107),
		string.char(68,97,114,107,101,114),
		string.char(65,77,79,76,69,68),
		string.char(76,105,103,104,116),
		string.char(66,97,108,108,111,111,110),
		string.char(83,111,102,116,67,114,101,97,109),
		string.char(65,113,117,97),
		string.char(65,109,101,116,104,121,115,116),
		string.char(82,111,115,101),
		string.char(77,105,100,110,105,103,104,116),
		string.char(70,111,114,101,115,116),
		string.char(83,117,110,115,101,116),
		string.char(79,99,101,97,110),
		string.char(69,109,101,114,97,108,100),
		string.char(83,97,112,112,104,105,114,101),
		string.char(67,108,111,117,100),
		string.char(71,114,97,112,101),
		string.char(66,108,111,111,100,121),
		string.char(65,114,99,116,105,99),
		string.char(78,101,98,117,108,97)
	},
	Dark = {
		Name = string.char(68,97,114,107),
		Accent = Color3.fromRGB(96, 205, 255),
		AcrylicMain = Color3.fromRGB(60, 60, 60),
		AcrylicBorder = Color3.fromRGB(90, 90, 90),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
		AcrylicNoise = 0.9,
		TitleBarLine = Color3.fromRGB(75, 75, 75),
		Tab = Color3.fromRGB(120, 120, 120),
		Element = Color3.fromRGB(120, 120, 120),
		ElementBorder = Color3.fromRGB(35, 35, 35),
		InElementBorder = Color3.fromRGB(90, 90, 90),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(120, 120, 120),
		ToggleToggled = Color3.fromRGB(42, 42, 42),
		SliderRail = Color3.fromRGB(120, 120, 120),
		DropdownFrame = Color3.fromRGB(160, 160, 160),
		DropdownHolder = Color3.fromRGB(45, 45, 45),
		DropdownBorder = Color3.fromRGB(35, 35, 35),
		DropdownOption = Color3.fromRGB(120, 120, 120),
		Keybind = Color3.fromRGB(120, 120, 120),
		Input = Color3.fromRGB(160, 160, 160),
		InputFocused = Color3.fromRGB(10, 10, 10),
		InputIndicator = Color3.fromRGB(150, 150, 150),
		InputIndicatorFocus = Color3.fromRGB(96, 205, 255),
		Dialog = Color3.fromRGB(45, 45, 45),
		DialogHolder = Color3.fromRGB(35, 35, 35),
		DialogHolderLine = Color3.fromRGB(30, 30, 30),
		DialogButton = Color3.fromRGB(45, 45, 45),
		DialogButtonBorder = Color3.fromRGB(80, 80, 80),
		DialogBorder = Color3.fromRGB(70, 70, 70),
		DialogInput = Color3.fromRGB(55, 55, 55),
		DialogInputLine = Color3.fromRGB(160, 160, 160),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(120, 120, 120),
		HoverChange = 0.07,
	},
	Darker = {
		Name = string.char(68,97,114,107,101,114),
		Accent = Color3.fromRGB(56, 109, 223),
		AcrylicMain = Color3.fromRGB(30, 30, 30),
		AcrylicBorder = Color3.fromRGB(60, 60, 60),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(17, 17, 17), Color3.fromRGB(18, 18, 18)),
		AcrylicNoise = 0.94,
		TitleBarLine = Color3.fromRGB(65, 65, 65),
		Tab = Color3.fromRGB(100, 100, 100),
		Element = Color3.fromRGB(70, 70, 70),
		ElementBorder = Color3.fromRGB(25, 25, 25),
		InElementBorder = Color3.fromRGB(55, 55, 55),
		ElementTransparency = 0.82,
		DropdownFrame = Color3.fromRGB(120, 120, 120),
		DropdownHolder = Color3.fromRGB(35, 35, 35),
		DropdownBorder = Color3.fromRGB(25, 25, 25),
		Dialog = Color3.fromRGB(35, 35, 35),
		DialogHolder = Color3.fromRGB(25, 25, 25),
		DialogHolderLine = Color3.fromRGB(20, 20, 20),
		DialogButton = Color3.fromRGB(35, 35, 35),
		DialogButtonBorder = Color3.fromRGB(55, 55, 55),
		DialogBorder = Color3.fromRGB(50, 50, 50),
		DialogInput = Color3.fromRGB(45, 45, 45),
		DialogInputLine = Color3.fromRGB(120, 120, 120),
		ToggleSlider = Color3.fromRGB(100, 100, 100),
		ToggleToggled = Color3.fromRGB(42, 42, 42),
		SliderRail = Color3.fromRGB(100, 100, 100),
		DropdownOption = Color3.fromRGB(100, 100, 100),
		Keybind = Color3.fromRGB(100, 100, 100),
		Input = Color3.fromRGB(130, 130, 130),
		InputFocused = Color3.fromRGB(10, 10, 10),
		InputIndicator = Color3.fromRGB(120, 120, 120),
		InputIndicatorFocus = Color3.fromRGB(56, 109, 223),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(100, 100, 100),
		HoverChange = 0.07,
	},
	AMOLED = {
		Name = string.char(65,77,79,76,69,68),
		Accent = Color3.fromRGB(255, 255, 255),
		AcrylicMain = Color3.fromRGB(0, 0, 0),
		AcrylicBorder = Color3.fromRGB(20, 20, 20),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)),
		AcrylicNoise = 1,
		TitleBarLine = Color3.fromRGB(25, 25, 25),
		Tab = Color3.fromRGB(40, 40, 40),
		Element = Color3.fromRGB(15, 15, 15),
		ElementBorder = Color3.fromRGB(0, 0, 0),
		InElementBorder = Color3.fromRGB(40, 40, 40),
		ElementTransparency = 0.95,
		ToggleSlider = Color3.fromRGB(40, 40, 40),
		ToggleToggled = Color3.fromRGB(255, 255, 255),
		SliderRail = Color3.fromRGB(40, 40, 40),
		DropdownFrame = Color3.fromRGB(20, 20, 20),
		DropdownHolder = Color3.fromRGB(0, 0, 0),
		DropdownBorder = Color3.fromRGB(0, 0, 0),
		DropdownOption = Color3.fromRGB(40, 40, 40),
		Keybind = Color3.fromRGB(40, 40, 40),
		Input = Color3.fromRGB(40, 40, 40),
		InputFocused = Color3.fromRGB(0, 0, 0),
		InputIndicator = Color3.fromRGB(60, 60, 60),
		InputIndicatorFocus = Color3.fromRGB(255, 255, 255),
		Dialog = Color3.fromRGB(0, 0, 0),
		DialogHolder = Color3.fromRGB(0, 0, 0),
		DialogHolderLine = Color3.fromRGB(20, 20, 20),
		DialogButton = Color3.fromRGB(15, 15, 15),
		DialogButtonBorder = Color3.fromRGB(30, 30, 30),
		DialogBorder = Color3.fromRGB(27, 27, 27),
		DialogInput = Color3.fromRGB(15, 15, 15),
		DialogInputLine = Color3.fromRGB(60, 60, 60),
		Text = Color3.fromRGB(255, 255, 255),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(40, 40, 40),
		HoverChange = 0.04
	},
	Light = {
		Name = string.char(76,105,103,104,116),
		Accent = Color3.fromRGB(0, 103, 192),
		AcrylicMain = Color3.fromRGB(200, 200, 200),
		AcrylicBorder = Color3.fromRGB(120, 120, 120),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
		AcrylicNoise = 0.96,
		TitleBarLine = Color3.fromRGB(160, 160, 160),
		Tab = Color3.fromRGB(90, 90, 90),
		Element = Color3.fromRGB(255, 255, 255),
		ElementBorder = Color3.fromRGB(180, 180, 180),
		InElementBorder = Color3.fromRGB(150, 150, 150),
		ElementTransparency = 0.65,
		ToggleSlider = Color3.fromRGB(40, 40, 40),
		ToggleToggled = Color3.fromRGB(255, 255, 255),
		SliderRail = Color3.fromRGB(40, 40, 40),
		DropdownFrame = Color3.fromRGB(200, 200, 200),
		DropdownHolder = Color3.fromRGB(240, 240, 240),
		DropdownBorder = Color3.fromRGB(200, 200, 200),
		DropdownOption = Color3.fromRGB(150, 150, 150),
		Keybind = Color3.fromRGB(120, 120, 120),
		Input = Color3.fromRGB(200, 200, 200),
		InputFocused = Color3.fromRGB(100, 100, 100),
		InputIndicator = Color3.fromRGB(80, 80, 80),
		InputIndicatorFocus = Color3.fromRGB(0, 103, 192),
		Dialog = Color3.fromRGB(255, 255, 255),
		DialogHolder = Color3.fromRGB(240, 240, 240),
		DialogHolderLine = Color3.fromRGB(228, 228, 228),
		DialogButton = Color3.fromRGB(255, 255, 255),
		DialogButtonBorder = Color3.fromRGB(190, 190, 190),
		DialogBorder = Color3.fromRGB(140, 140, 140),
		DialogInput = Color3.fromRGB(250, 250, 250),
		DialogInputLine = Color3.fromRGB(160, 160, 160),
		Text = Color3.fromRGB(0, 0, 0),
		SubText = Color3.fromRGB(40, 40, 40),
		Hover = Color3.fromRGB(50, 50, 50),
		HoverChange = 0.16,
	},
	Balloon = {
		Name = string.char(66,97,108,108,111,111,110),
		Accent = Color3.fromRGB(100, 170, 255),
		AcrylicMain = Color3.fromRGB(189, 224, 255),
		AcrylicBorder = Color3.fromRGB(160, 227, 255),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(240, 250, 255), Color3.fromRGB(210, 235, 250)),
		AcrylicNoise = 1,
		TitleBarLine = Color3.fromRGB(150, 200, 255),
		Tab = Color3.fromRGB(153, 185, 255),
		Element = Color3.fromRGB(160, 200, 255),
		ElementBorder = Color3.fromRGB(130, 170, 230),
		InElementBorder = Color3.fromRGB(120, 174, 240),
		ElementTransparency = 0.80,
		ToggleSlider = Color3.fromRGB(93, 163, 255),
		ToggleToggled = Color3.fromRGB(60, 112, 180),
		SliderRail = Color3.fromRGB(170, 220, 255),
		DropdownFrame = Color3.fromRGB(175, 235, 255),
		DropdownHolder = Color3.fromRGB(200, 220, 240),
		DropdownBorder = Color3.fromRGB(130, 170, 230),
		DropdownOption = Color3.fromRGB(146, 202, 255),
		Keybind = Color3.fromRGB(170, 220, 255),
		Input = Color3.fromRGB(170, 220, 255),
		InputFocused = Color3.fromRGB(75, 95, 140),
		InputIndicator = Color3.fromRGB(190, 250, 255),
		InputIndicatorFocus = Color3.fromRGB(100, 170, 255),
		Dialog = Color3.fromRGB(189, 230, 255),
		DialogHolder = Color3.fromRGB(201, 239, 255),
		DialogHolderLine = Color3.fromRGB(197, 236, 250),
		DialogButton = Color3.fromRGB(219, 252, 255),
		DialogButtonBorder = Color3.fromRGB(160, 200, 255),
		DialogBorder = Color3.fromRGB(175, 220, 255),
		DialogInput = Color3.fromRGB(160, 200, 255),
		DialogInputLine = Color3.fromRGB(185, 230, 255),
		Text = Color3.fromRGB(30, 30, 30),
		SubText = Color3.fromRGB(90, 90, 90),
		Hover = Color3.fromRGB(170, 220, 255),
		HoverChange = 0.03
	},
	SoftCream = {
		Name = string.char(83,111,102,116,67,114,101,97,109),
		Accent = Color3.fromRGB(206, 163, 90),
		AcrylicMain = Color3.fromRGB(255, 245, 220),
		AcrylicBorder = Color3.fromRGB(255, 230, 200),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 245, 220), Color3.fromRGB(255, 235, 210)),
		AcrylicNoise = 0.93,
		TitleBarLine = Color3.fromRGB(255, 220, 190),
		Tab = Color3.fromRGB(199, 165, 112),
		Element = Color3.fromRGB(255, 216, 161),
		ElementBorder = Color3.fromRGB(234, 193, 111),
		InElementBorder = Color3.fromRGB(255, 212, 143),
		ElementTransparency = 0.80,
		ToggleSlider = Color3.fromRGB(214, 175, 97),
		ToggleToggled = Color3.fromRGB(200, 160, 100),
		SliderRail = Color3.fromRGB(255, 220, 190),
		DropdownFrame = Color3.fromRGB(255, 228, 164),
		DropdownHolder = Color3.fromRGB(250, 240, 225),
		DropdownBorder = Color3.fromRGB(255, 210, 180),
		DropdownOption = Color3.fromRGB(255, 190, 115),
		Keybind = Color3.fromRGB(255, 220, 190),
		Input = Color3.fromRGB(255, 220, 190),
		InputFocused = Color3.fromRGB(180, 140, 80),
		InputIndicator = Color3.fromRGB(255, 250, 205),
		InputIndicatorFocus = Color3.fromRGB(255, 236, 158),
		Dialog = Color3.fromRGB(255, 255, 240),
		DialogHolder = Color3.fromRGB(255, 245, 220),
		DialogHolderLine = Color3.fromRGB(255, 240, 210),
		DialogButton = Color3.fromRGB(255, 255, 240),
		DialogButtonBorder = Color3.fromRGB(255, 210, 180),
		DialogBorder = Color3.fromRGB(255, 220, 190),
		DialogInput = Color3.fromRGB(255, 210, 180),
		DialogInputLine = Color3.fromRGB(255, 225, 205),
		Text = Color3.fromRGB(30, 30, 30),
		SubText = Color3.fromRGB(90, 90, 90),
		Hover = Color3.fromRGB(255, 220, 190),
		HoverChange = 0.03
	},
	Aqua = {
		Name = string.char(65,113,117,97),
		Accent = Color3.fromRGB(38, 166, 178),
		AcrylicMain = Color3.fromRGB(18, 54, 61),
		AcrylicBorder = Color3.fromRGB(80, 118, 130),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(41, 101, 139), Color3.fromRGB(11, 132, 128)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(68, 135, 136),
		Tab = Color3.fromRGB(126, 175, 180),
		Element = Color3.fromRGB(66, 130, 160),
		ElementBorder = Color3.fromRGB(40, 100, 122),
		InElementBorder = Color3.fromRGB(75, 109, 110),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(100, 152, 160),
		ToggleToggled = Color3.fromRGB(25, 70, 95),
		SliderRail = Color3.fromRGB(115, 150, 160),
		DropdownFrame = Color3.fromRGB(158, 194, 200),
		DropdownHolder = Color3.fromRGB(39, 99, 116),
		DropdownBorder = Color3.fromRGB(33, 119, 120),
		DropdownOption = Color3.fromRGB(121, 152, 160),
		Keybind = Color3.fromRGB(108, 153, 160),
		Input = Color3.fromRGB(112, 156, 160),
		InputFocused = Color3.fromRGB(14, 35, 40),
		InputIndicator = Color3.fromRGB(137, 181, 190),
		InputIndicatorFocus = Color3.fromRGB(38, 166, 178),
		Dialog = Color3.fromRGB(27, 113, 130),
		DialogHolder = Color3.fromRGB(33, 99, 109),
		DialogHolderLine = Color3.fromRGB(34, 81, 86),
		DialogButton = Color3.fromRGB(27, 128, 130),
		DialogButtonBorder = Color3.fromRGB(62, 100, 110),
		DialogBorder = Color3.fromRGB(26, 86, 100),
		DialogInput = Color3.fromRGB(36, 107, 105),
		DialogInputLine = Color3.fromRGB(70, 120, 130),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(112, 155, 160),
		HoverChange = 0.04,
	},
	Amethyst = {
		Name = string.char(65,109,101,116,104,121,115,116),
		Accent = Color3.fromRGB(126, 44, 182),
		AcrylicMain = Color3.fromRGB(40, 12, 71),
		AcrylicBorder = Color3.fromRGB(85, 45, 120),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(34, 19, 49), Color3.fromRGB(41, 24, 57)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(95, 55, 130),
		Tab = Color3.fromRGB(135, 75, 170),
		Element = Color3.fromRGB(115, 55, 150),
		ElementBorder = Color3.fromRGB(60, 35, 85),
		InElementBorder = Color3.fromRGB(85, 45, 110),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(135, 65, 160),
		ToggleToggled = Color3.fromRGB(59, 30, 79),
		SliderRail = Color3.fromRGB(135, 65, 160),
		DropdownFrame = Color3.fromRGB(145, 85, 170),
		DropdownHolder = Color3.fromRGB(50, 30, 70),
		DropdownBorder = Color3.fromRGB(60, 35, 85),
		DropdownOption = Color3.fromRGB(135, 65, 160),
		Keybind = Color3.fromRGB(135, 65, 160),
		Input = Color3.fromRGB(135, 65, 160),
		InputFocused = Color3.fromRGB(25, 15, 35),
		InputIndicator = Color3.fromRGB(155, 85, 180),
		InputIndicatorFocus = Color3.fromRGB(126, 44, 182),
		Dialog = Color3.fromRGB(50, 30, 70),
		DialogHolder = Color3.fromRGB(40, 25, 60),
		DialogHolderLine = Color3.fromRGB(35, 20, 55),
		DialogButton = Color3.fromRGB(50, 30, 70),
		DialogButtonBorder = Color3.fromRGB(90, 50, 120),
		DialogBorder = Color3.fromRGB(80, 45, 110),
		DialogInput = Color3.fromRGB(60, 35, 80),
		DialogInputLine = Color3.fromRGB(145, 75, 170),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(135, 65, 160),
		HoverChange = 0.04
	},
	Rose = {
		Name = string.char(82,111,115,101),
		Accent = Color3.fromRGB(219, 48, 123),
		AcrylicMain = Color3.fromRGB(35, 25, 30),
		AcrylicBorder = Color3.fromRGB(145, 35, 75),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(65, 25, 45), Color3.fromRGB(75, 30, 50)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(150, 65, 95),
		Tab = Color3.fromRGB(190, 85, 115),
		Element = Color3.fromRGB(170, 60, 90),
		ElementBorder = Color3.fromRGB(95, 35, 55),
		InElementBorder = Color3.fromRGB(120, 50, 70),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(190, 75, 105),
		ToggleToggled = Color3.fromRGB(45, 15, 25),
		SliderRail = Color3.fromRGB(190, 75, 105),
		DropdownFrame = Color3.fromRGB(200, 95, 125),
		DropdownHolder = Color3.fromRGB(75, 30, 45),
		DropdownBorder = Color3.fromRGB(95, 35, 55),
		DropdownOption = Color3.fromRGB(190, 75, 105),
		Keybind = Color3.fromRGB(190, 75, 105),
		Input = Color3.fromRGB(190, 75, 105),
		InputFocused = Color3.fromRGB(35, 15, 20),
		InputIndicator = Color3.fromRGB(210, 95, 125),
		InputIndicatorFocus = Color3.fromRGB(219, 48, 123),
		Dialog = Color3.fromRGB(75, 30, 45),
		DialogHolder = Color3.fromRGB(65, 25, 40),
		DialogHolderLine = Color3.fromRGB(60, 20, 35),
		DialogButton = Color3.fromRGB(75, 30, 45),
		DialogButtonBorder = Color3.fromRGB(115, 45, 65),
		DialogBorder = Color3.fromRGB(105, 40, 60),
		DialogInput = Color3.fromRGB(85, 35, 50),
		DialogInputLine = Color3.fromRGB(200, 85, 115),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(190, 75, 105),
		HoverChange = 0.04
	},
	Midnight = {
		Name = string.char(77,105,100,110,105,103,104,116),
		Accent = Color3.fromRGB(52, 50, 178),
		AcrylicMain = Color3.fromRGB(20, 20, 20),
		AcrylicBorder = Color3.fromRGB(83, 83, 130),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(1, 1, 39), Color3.fromRGB(6, 6, 54)),
		AcrylicNoise = 0.96,
		TitleBarLine = Color3.fromRGB(77, 75, 126),
		Tab = Color3.fromRGB(126, 127, 180),
		Element = Color3.fromRGB(111, 108, 160),
		ElementBorder = Color3.fromRGB(32, 32, 59),
		InElementBorder = Color3.fromRGB(85, 83, 110),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(120, 117, 160),
		ToggleToggled = Color3.fromRGB(30, 12, 68),
		SliderRail = Color3.fromRGB(117, 117, 160),
		DropdownFrame = Color3.fromRGB(161, 161, 200),
		DropdownHolder = Color3.fromRGB(35, 36, 80),
		DropdownBorder = Color3.fromRGB(32, 30, 65),
		DropdownOption = Color3.fromRGB(116, 116, 160),
		Keybind = Color3.fromRGB(110, 123, 160),
		Input = Color3.fromRGB(116, 112, 160),
		InputFocused = Color3.fromRGB(20, 10, 30),
		InputIndicator = Color3.fromRGB(136, 140, 190),
		InputIndicatorFocus = Color3.fromRGB(52, 50, 178),
		Dialog = Color3.fromRGB(37, 37, 80),
		DialogHolder = Color3.fromRGB(24, 24, 65),
		DialogHolderLine = Color3.fromRGB(25, 26, 60),
		DialogButton = Color3.fromRGB(46, 44, 80),
		DialogButtonBorder = Color3.fromRGB(71, 72, 110),
		DialogBorder = Color3.fromRGB(72, 70, 100),
		DialogInput = Color3.fromRGB(55, 55, 85),
		DialogInputLine = Color3.fromRGB(133, 131, 190),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(119, 121, 160),
		HoverChange = 0.04,
	},
	Forest = {
		Name = string.char(70,111,114,101,115,116),
		Accent = Color3.fromRGB(46, 141, 70),
		AcrylicMain = Color3.fromRGB(20, 35, 25),
		AcrylicBorder = Color3.fromRGB(50, 90, 60),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(15, 35, 20), Color3.fromRGB(20, 40, 25)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(60, 100, 70),
		Tab = Color3.fromRGB(80, 140, 90),
		Element = Color3.fromRGB(70, 120, 80),
		ElementBorder = Color3.fromRGB(30, 50, 35),
		InElementBorder = Color3.fromRGB(60, 90, 70),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(90, 150, 100),
		ToggleToggled = Color3.fromRGB(19, 57, 21),
		SliderRail = Color3.fromRGB(90, 150, 100),
		DropdownFrame = Color3.fromRGB(100, 160, 110),
		DropdownHolder = Color3.fromRGB(35, 60, 40),
		DropdownBorder = Color3.fromRGB(30, 50, 35),
		DropdownOption = Color3.fromRGB(90, 150, 100),
		Keybind = Color3.fromRGB(90, 150, 100),
		Input = Color3.fromRGB(90, 150, 100),
		InputFocused = Color3.fromRGB(15, 25, 18),
		InputIndicator = Color3.fromRGB(110, 170, 120),
		InputIndicatorFocus = Color3.fromRGB(46, 141, 70),
		Dialog = Color3.fromRGB(35, 60, 40),
		DialogHolder = Color3.fromRGB(30, 50, 35),
		DialogHolderLine = Color3.fromRGB(25, 45, 30),
		DialogButton = Color3.fromRGB(35, 60, 40),
		DialogButtonBorder = Color3.fromRGB(70, 110, 80),
		DialogBorder = Color3.fromRGB(60, 100, 70),
		DialogInput = Color3.fromRGB(45, 70, 50),
		DialogInputLine = Color3.fromRGB(100, 160, 110),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(90, 150, 100),
		HoverChange = 0.04
	},
	Sunset = {
		Name = string.char(83,117,110,115,101,116),
		Accent = Color3.fromRGB(255, 128, 0),
		AcrylicMain = Color3.fromRGB(40, 25, 25),
		AcrylicBorder = Color3.fromRGB(130, 80, 60),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(70, 35, 20), Color3.fromRGB(60, 30, 20)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(140, 90, 70),
		Tab = Color3.fromRGB(180, 120, 90),
		Element = Color3.fromRGB(160, 100, 70),
		ElementBorder = Color3.fromRGB(70, 40, 30),
		InElementBorder = Color3.fromRGB(110, 70, 50),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(180, 110, 80),
		ToggleToggled = Color3.fromRGB(62, 34, 21),
		SliderRail = Color3.fromRGB(180, 110, 80),
		DropdownFrame = Color3.fromRGB(190, 130, 100),
		DropdownHolder = Color3.fromRGB(60, 35, 25),
		DropdownBorder = Color3.fromRGB(70, 40, 30),
		DropdownOption = Color3.fromRGB(180, 110, 80),
		Keybind = Color3.fromRGB(180, 110, 80),
		Input = Color3.fromRGB(180, 110, 80),
		InputFocused = Color3.fromRGB(30, 20, 15),
		InputIndicator = Color3.fromRGB(200, 130, 100),
		InputIndicatorFocus = Color3.fromRGB(255, 128, 0),
		Dialog = Color3.fromRGB(60, 35, 25),
		DialogHolder = Color3.fromRGB(50, 30, 20),
		DialogHolderLine = Color3.fromRGB(45, 25, 15),
		DialogButton = Color3.fromRGB(60, 35, 25),
		DialogButtonBorder = Color3.fromRGB(100, 65, 45),
		DialogBorder = Color3.fromRGB(90, 55, 40),
		DialogInput = Color3.fromRGB(70, 45, 35),
		DialogInputLine = Color3.fromRGB(190, 120, 90),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(180, 110, 80),
		HoverChange = 0.04
	},
	Ocean = {
		Name = string.char(79,99,101,97,110),
		Accent = Color3.fromRGB(0, 141, 255),
		AcrylicMain = Color3.fromRGB(20, 25, 40),
		AcrylicBorder = Color3.fromRGB(40, 60, 100),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(15, 25, 45), Color3.fromRGB(20, 30, 50)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(50, 70, 120),
		Tab = Color3.fromRGB(70, 90, 160),
		Element = Color3.fromRGB(60, 80, 140),
		ElementBorder = Color3.fromRGB(30, 40, 70),
		InElementBorder = Color3.fromRGB(50, 60, 100),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(80, 100, 170),
		ToggleToggled = Color3.fromRGB(11, 35, 67),
		SliderRail = Color3.fromRGB(80, 100, 170),
		DropdownFrame = Color3.fromRGB(90, 110, 180),
		DropdownHolder = Color3.fromRGB(25, 35, 60),
		DropdownBorder = Color3.fromRGB(30, 40, 70),
		DropdownOption = Color3.fromRGB(80, 100, 170),
		Keybind = Color3.fromRGB(80, 100, 170),
		Input = Color3.fromRGB(80, 100, 170),
		InputFocused = Color3.fromRGB(15, 20, 35),
		InputIndicator = Color3.fromRGB(100, 120, 190),
		InputIndicatorFocus = Color3.fromRGB(0, 141, 255),
		Dialog = Color3.fromRGB(25, 35, 60),
		DialogHolder = Color3.fromRGB(20, 30, 55),
		DialogHolderLine = Color3.fromRGB(15, 25, 50),
		DialogButton = Color3.fromRGB(25, 35, 60),
		DialogButtonBorder = Color3.fromRGB(45, 65, 110),
		DialogBorder = Color3.fromRGB(40, 60, 100),
		DialogInput = Color3.fromRGB(35, 45, 70),
		DialogInputLine = Color3.fromRGB(90, 110, 180),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(80, 100, 170),
		HoverChange = 0.04
	},
	Emerald = {
		Name = string.char(69,109,101,114,97,108,100),
		Accent = Color3.fromRGB(0, 168, 107),
		AcrylicMain = Color3.fromRGB(20, 35, 30),
		AcrylicBorder = Color3.fromRGB(30, 100, 80),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(20, 55, 45), Color3.fromRGB(25, 60, 50)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(40, 110, 90),
		Tab = Color3.fromRGB(50, 130, 100),
		Element = Color3.fromRGB(40, 120, 95),
		ElementBorder = Color3.fromRGB(25, 75, 60),
		InElementBorder = Color3.fromRGB(35, 85, 70),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(45, 130, 100),
		ToggleToggled = Color3.fromRGB(15, 40, 30),
		SliderRail = Color3.fromRGB(45, 130, 100),
		DropdownFrame = Color3.fromRGB(55, 140, 110),
		DropdownHolder = Color3.fromRGB(20, 70, 55),
		DropdownBorder = Color3.fromRGB(25, 75, 60),
		DropdownOption = Color3.fromRGB(45, 130, 100),
		Keybind = Color3.fromRGB(45, 130, 100),
		Input = Color3.fromRGB(45, 130, 100),
		InputFocused = Color3.fromRGB(10, 35, 25),
		InputIndicator = Color3.fromRGB(55, 150, 120),
		InputIndicatorFocus = Color3.fromRGB(0, 168, 107),
		Dialog = Color3.fromRGB(20, 70, 55),
		DialogHolder = Color3.fromRGB(15, 65, 50),
		DialogHolderLine = Color3.fromRGB(15, 60, 45),
		DialogButton = Color3.fromRGB(20, 70, 55),
		DialogButtonBorder = Color3.fromRGB(30, 90, 70),
		DialogBorder = Color3.fromRGB(25, 85, 65),
		DialogInput = Color3.fromRGB(25, 75, 60),
		DialogInputLine = Color3.fromRGB(50, 140, 110),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(45, 130, 100),
		HoverChange = 0.04
	},
	Sapphire = {
		Name = string.char(83,97,112,112,104,105,114,101),
		Accent = Color3.fromRGB(0, 105, 255),
		AcrylicMain = Color3.fromRGB(24, 30, 85),
		AcrylicBorder = Color3.fromRGB(25, 80, 150),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(13, 33, 94), Color3.fromRGB(21, 44, 127)),
		AcrylicNoise = 0.88,
		TitleBarLine = Color3.fromRGB(50, 120, 200),
		Tab = Color3.fromRGB(60, 140, 220),
		Element = Color3.fromRGB(42, 98, 176),
		ElementBorder = Color3.fromRGB(23, 66, 113),
		InElementBorder = Color3.fromRGB(27, 65, 126),
		ElementTransparency = 0.85,
		ToggleSlider = Color3.fromRGB(50, 140, 210),
		ToggleToggled = Color3.fromRGB(20, 50, 80),
		SliderRail = Color3.fromRGB(50, 140, 210),
		DropdownFrame = Color3.fromRGB(60, 150, 230),
		DropdownHolder = Color3.fromRGB(15, 60, 100),
		DropdownBorder = Color3.fromRGB(30, 90, 140),
		DropdownOption = Color3.fromRGB(50, 140, 210),
		Keybind = Color3.fromRGB(50, 140, 210),
		Input = Color3.fromRGB(50, 140, 210),
		InputFocused = Color3.fromRGB(15, 40, 60),
		InputIndicator = Color3.fromRGB(60, 160, 240),
		InputIndicatorFocus = Color3.fromRGB(0, 105, 255),
		Dialog = Color3.fromRGB(10, 60, 100),
		DialogHolder = Color3.fromRGB(15, 50, 90),
		DialogHolderLine = Color3.fromRGB(15, 45, 80),
		DialogButton = Color3.fromRGB(10, 60, 100),
		DialogButtonBorder = Color3.fromRGB(30, 100, 160),
		DialogBorder = Color3.fromRGB(20, 80, 130),
		DialogInput = Color3.fromRGB(30, 90, 140),
		DialogInputLine = Color3.fromRGB(55, 150, 230),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(50, 140, 210),
		HoverChange = 0.05
	},
	Cloud = {
		Name = string.char(67,108,111,117,100),
		Accent = Color3.fromRGB(27, 114, 138),
		AcrylicMain = Color3.fromRGB(13, 62, 77),
		AcrylicBorder = Color3.fromRGB(80, 118, 130),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(51, 74, 83), Color3.fromRGB(4, 47, 66)),
		AcrylicNoise = 0.94,
		TitleBarLine = Color3.fromRGB(97, 97, 97),
		Tab = Color3.fromRGB(126, 175, 180),
		Element = Color3.fromRGB(66, 130, 160),
		ElementBorder = Color3.fromRGB(40, 100, 122),
		InElementBorder = Color3.fromRGB(75, 109, 110),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(100, 152, 160),
		ToggleToggled = Color3.fromRGB(26, 59, 80),
		SliderRail = Color3.fromRGB(115, 150, 160),
		DropdownFrame = Color3.fromRGB(158, 194, 200),
		DropdownHolder = Color3.fromRGB(39, 99, 116),
		DropdownBorder = Color3.fromRGB(33, 119, 120),
		DropdownOption = Color3.fromRGB(121, 152, 160),
		Keybind = Color3.fromRGB(108, 153, 160),
		Input = Color3.fromRGB(112, 156, 160),
		InputFocused = Color3.fromRGB(14, 35, 40),
		InputIndicator = Color3.fromRGB(137, 181, 190),
		InputIndicatorFocus = Color3.fromRGB(27, 114, 138),
		Dialog = Color3.fromRGB(11, 75, 88),
		DialogHolder = Color3.fromRGB(18, 77, 93),
		DialogHolderLine = Color3.fromRGB(33, 76, 86),
		DialogButton = Color3.fromRGB(43, 72, 80),
		DialogButtonBorder = Color3.fromRGB(62, 100, 110),
		DialogBorder = Color3.fromRGB(26, 86, 100),
		DialogInput = Color3.fromRGB(4, 97, 107),
		DialogInputLine = Color3.fromRGB(70, 120, 130),
		Text = Color3.fromRGB(209, 240, 233),
		SubText = Color3.fromRGB(170, 170, 170),
		Hover = Color3.fromRGB(112, 155, 160),
		HoverChange = 0.04,
	},
	Grape = {
		Name = string.char(71,114,97,112,101),
		Accent = Color3.fromRGB(180, 90, 220),
		AcrylicMain = Color3.fromRGB(8, 4, 15),
		AcrylicBorder = Color3.fromRGB(25, 12, 35),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(10, 5, 20), Color3.fromRGB(12, 6, 22)),
		AcrylicNoise = 0.98,
		TitleBarLine = Color3.fromRGB(30, 15, 40),
		Tab = Color3.fromRGB(50, 25, 60),
		Element = Color3.fromRGB(40, 20, 50),
		ElementBorder = Color3.fromRGB(15, 8, 25),
		InElementBorder = Color3.fromRGB(35, 18, 45),
		ElementTransparency = 0.95,
		ToggleSlider = Color3.fromRGB(50, 25, 60),
		ToggleToggled = Color3.fromRGB(12, 6, 22),
		SliderRail = Color3.fromRGB(50, 25, 60),
		DropdownFrame = Color3.fromRGB(70, 35, 80),
		DropdownHolder = Color3.fromRGB(15, 8, 25),
		DropdownBorder = Color3.fromRGB(20, 10, 30),
		DropdownOption = Color3.fromRGB(50, 25, 60),
		Keybind = Color3.fromRGB(50, 25, 60),
		Input = Color3.fromRGB(50, 25, 60),
		InputFocused = Color3.fromRGB(8, 4, 15),
		InputIndicator = Color3.fromRGB(90, 45, 100),
		InputIndicatorFocus = Color3.fromRGB(180, 90, 220),
		Dialog = Color3.fromRGB(15, 8, 25),
		DialogHolder = Color3.fromRGB(12, 6, 22),
		DialogHolderLine = Color3.fromRGB(10, 5, 20),
		DialogButton = Color3.fromRGB(15, 8, 25),
		DialogButtonBorder = Color3.fromRGB(30, 15, 40),
		DialogBorder = Color3.fromRGB(25, 12, 35),
		DialogInput = Color3.fromRGB(20, 10, 30),
		DialogInputLine = Color3.fromRGB(70, 35, 80),
		Text = Color3.fromRGB(230, 220, 240),
		SubText = Color3.fromRGB(160, 140, 180),
		Hover = Color3.fromRGB(50, 25, 60),
		HoverChange = 0.02
	},
	Bloody = {
		Name = string.char(66,108,111,111,100,121),
		Accent = Color3.fromRGB(144, 0, 0),
		AcrylicMain = Color3.fromRGB(61, 0, 0),
		AcrylicBorder = Color3.fromRGB(86, 0, 0),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(90, 0, 0), Color3.fromRGB(100, 0, 0)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(126, 0, 0),
		Tab = Color3.fromRGB(134, 0, 0),
		Element = Color3.fromRGB(156, 0, 0),
		ElementBorder = Color3.fromRGB(91, 0, 0),
		InElementBorder = Color3.fromRGB(106, 0, 0),
		ElementTransparency = 0.86,
		ToggleSlider = Color3.fromRGB(130, 5, 5),
		ToggleToggled = Color3.fromRGB(66, 0, 0),
		SliderRail = Color3.fromRGB(150, 30, 30),
		DropdownFrame = Color3.fromRGB(150, 30, 30),
		DropdownHolder = Color3.fromRGB(79, 0, 0),
		DropdownBorder = Color3.fromRGB(116, 0, 0),
		DropdownOption = Color3.fromRGB(150, 30, 30),
		Keybind = Color3.fromRGB(150, 30, 30),
		Input = Color3.fromRGB(150, 30, 30),
		InputFocused = Color3.fromRGB(40, 10, 10),
		InputIndicator = Color3.fromRGB(113, 1, 1),
		InputIndicatorFocus = Color3.fromRGB(144, 0, 0),
		Dialog = Color3.fromRGB(85, 0, 1),
		DialogHolder = Color3.fromRGB(77, 0, 8),
		DialogHolderLine = Color3.fromRGB(88, 4, 4),
		DialogButton = Color3.fromRGB(115, 14, 21),
		DialogButtonBorder = Color3.fromRGB(83, 0, 1),
		DialogBorder = Color3.fromRGB(43, 4, 5),
		DialogInput = Color3.fromRGB(108, 20, 21),
		DialogInputLine = Color3.fromRGB(91, 1, 1),
		Text = Color3.fromRGB(240, 240, 240),
		SubText = Color3.fromRGB(131, 131, 131),
		Hover = Color3.fromRGB(181, 0, 0),
		HoverChange = 0.04
	},
	Arctic = {
		Name = string.char(65,114,99,116,105,99),
		Accent = Color3.fromRGB(64, 224, 255),
		AcrylicMain = Color3.fromRGB(10, 18, 25),
		AcrylicBorder = Color3.fromRGB(35, 55, 70),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(15, 25, 35), Color3.fromRGB(18, 30, 40)),
		AcrylicNoise = 0.94,
		TitleBarLine = Color3.fromRGB(45, 70, 90),
		Tab = Color3.fromRGB(70, 110, 140),
		Element = Color3.fromRGB(60, 95, 120),
		ElementBorder = Color3.fromRGB(60, 95, 120),
		InElementBorder = Color3.fromRGB(70, 110, 140),
		ElementTransparency = 0.88,
		ToggleSlider = Color3.fromRGB(90, 140, 180),
		ToggleToggled = Color3.fromRGB(15, 25, 35),
		SliderRail = Color3.fromRGB(90, 140, 180),
		DropdownFrame = Color3.fromRGB(110, 170, 220),
		DropdownHolder = Color3.fromRGB(30, 45, 60),
		DropdownBorder = Color3.fromRGB(60, 95, 120),
		DropdownOption = Color3.fromRGB(90, 140, 180),
		Keybind = Color3.fromRGB(90, 140, 180),
		Input = Color3.fromRGB(90, 140, 180),
		InputFocused = Color3.fromRGB(10, 18, 25),
		InputIndicator = Color3.fromRGB(130, 200, 255),
		InputIndicatorFocus = Color3.fromRGB(64, 224, 255),
		Dialog = Color3.fromRGB(30, 45, 60),
		DialogHolder = Color3.fromRGB(18, 30, 40),
		DialogHolderLine = Color3.fromRGB(15, 25, 35),
		DialogButton = Color3.fromRGB(30, 45, 60),
		DialogButtonBorder = Color3.fromRGB(45, 70, 90),
		DialogBorder = Color3.fromRGB(40, 60, 80),
		DialogInput = Color3.fromRGB(35, 55, 70),
		DialogInputLine = Color3.fromRGB(110, 170, 220),
		Text = Color3.fromRGB(240, 250, 255),
		SubText = Color3.fromRGB(180, 200, 220),
		Hover = Color3.fromRGB(90, 140, 180),
		HoverChange = 0.04
	},
	Nebula = {
		Name = string.char(78,101,98,117,108,97),
		Accent = Color3.fromRGB(255, 26, 141),
		AcrylicMain = Color3.fromRGB(50, 20, 60),
		AcrylicBorder = Color3.fromRGB(100, 40, 110),
		AcrylicGradient = ColorSequence.new(Color3.fromRGB(55, 25, 65), Color3.fromRGB(60, 30, 70)),
		AcrylicNoise = 0.92,
		TitleBarLine = Color3.fromRGB(120, 50, 130),
		Tab = Color3.fromRGB(160, 70, 170),
		Element = Color3.fromRGB(140, 60, 150),
		ElementBorder = Color3.fromRGB(60, 25, 70),
		InElementBorder = Color3.fromRGB(130, 55, 140),
		ElementTransparency = 0.87,
		ToggleSlider = Color3.fromRGB(160, 70, 170),
		ToggleToggled = Color3.fromRGB(50, 20, 60),
		SliderRail = Color3.fromRGB(160, 70, 170),
		DropdownFrame = Color3.fromRGB(180, 90, 190),
		DropdownHolder = Color3.fromRGB(60, 25, 70),
		DropdownBorder = Color3.fromRGB(70, 30, 80),
		DropdownOption = Color3.fromRGB(160, 70, 170),
		Keybind = Color3.fromRGB(160, 70, 170),
		Input = Color3.fromRGB(160, 70, 170),
		InputFocused = Color3.fromRGB(40, 15, 50),
		InputIndicator = Color3.fromRGB(200, 100, 210),
		InputIndicatorFocus = Color3.fromRGB(255, 26, 141),
		Dialog = Color3.fromRGB(60, 25, 70),
		DialogHolder = Color3.fromRGB(50, 20, 60),
		DialogHolderLine = Color3.fromRGB(45, 15, 55),
		DialogButton = Color3.fromRGB(60, 25, 70),
		DialogButtonBorder = Color3.fromRGB(110, 45, 120),
		DialogBorder = Color3.fromRGB(100, 40, 110),
		DialogInput = Color3.fromRGB(70, 30, 80),
		DialogInputLine = Color3.fromRGB(180, 90, 190),
		Text = Color3.fromRGB(255, 240, 250),
		SubText = Color3.fromRGB(220, 180, 230),
		Hover = Color3.fromRGB(160, 70, 170),
		HoverChange = 0.05
	}

}

return Themes

local CACHE = {}

return {
	Get = function(name)
		return CACHE[name]
	end,
	Set = function(name, asset)
		CACHE[name] = asset
	end,
}

local Themes =
local getIconAsset =

local Library = {
	Version = string.char(49,46,50,46,50),

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
	Font = string.char(114,98,120,97,115,115,101,116,58,47,47,102,111,110,116,115,47,102,97,109,105,108,105,101,115,47,71,111,116,104,97,109,83,83,109,46,106,115,111,110),
	MetricsEnabled = true,
	ExposeGlobals = true,
}

function Library:RefreshOpenDropdowns()

	self:CloseAllDropdowns()
end

function Library:ApplyBackdropToDropdown(Dropdown)


	if Dropdown and Dropdown.HolderCanvas then

		local maxZIndex = 100000
		Dropdown.HolderCanvas.ZIndex = maxZIndex

		if Dropdown.HolderFrame then
			Dropdown.HolderFrame.ZIndex = maxZIndex + 1
		end


		if not table.find(self.OpenFrames, Dropdown.HolderCanvas) then
			table.insert(self.OpenFrames, Dropdown.HolderCanvas)
		end
	end
end

function Library:CloseAllDropdowns()
	for _, frame in pairs(self.OpenFrames) do
		if frame and frame:IsA(string.char(70,114,97,109,101)) then
			frame.Visible = false

			for _, dropdownObj in pairs(self.Options) do
				if dropdownObj and dropdownObj.Type == string.char(68,114,111,112,100,111,119,110) and dropdownObj.HolderCanvas == frame then
					dropdownObj.Opened = false
					break
				end
			end
		end
	end
	table.clear(self.OpenFrames)
end

function Library:CloseOtherDropdowns(currentDropdown)
	local currentCanvas = currentDropdown and currentDropdown.HolderCanvas
	for i = #self.OpenFrames, 1, -1 do
		local frame = self.OpenFrames[i]
		if frame ~= currentCanvas then
			frame.Visible = false

			for _, dropdownObj in pairs(self.Options) do
				if dropdownObj and dropdownObj.Type == string.char(68,114,111,112,100,111,119,110) and dropdownObj.HolderCanvas == frame then
					dropdownObj.Opened = false
					break
				end
			end
			table.remove(self.OpenFrames, i)
		end
	end
end

function Library:BringDropdownToFront(dropdown)
	if dropdown and dropdown.HolderCanvas then


		local DropdownScrollFrame = New(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101), {
			Size = UDim2.new(1, -5, 1, -10),
			Position = UDim2.fromOffset(5, 5),
			BackgroundTransparency = 1,
			BottomImage = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,54,56,56,57,56,49,50,55,57,49),
			MidImage = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,54,56,56,57,56,49,50,55,50,49),
			TopImage = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,54,50,55,54,54,52,49,50,50,53),
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			ScrollBarImageTransparency = 0.95,
			ScrollBarThickness = 4,
			BorderSizePixel = 0,
			CanvasSize = UDim2.fromScale(0, 0),
            ZIndex = DROPDOWN_Z_INDEX + 2,
		}, {
			DropdownListLayout,
		})

		local SearchBar
		local SearchBox
		local DropdownHolderCanvas, DropdownHolderFrame
		local function RecalculateListPosition()
			if not DropdownHolderCanvas or not DropdownInner then return end

            local viewportSize = Camera.ViewportSize
            local gui = Library.GUI
            local guiAbsPos = gui.AbsolutePosition

            local row = DropdownFrame.Frame
            local btn = DropdownInner
            local list = DropdownHolderCanvas


            if row.AbsoluteSize.Y == 0 then task.wait() end

            local rowAbsPos = row.AbsolutePosition
            local rowAbsSize = row.AbsoluteSize
            local btnAbsPos = btn.AbsolutePosition
            local btnAbsSize = btn.AbsoluteSize
            local listAbsSize = list.AbsoluteSize


            local targetY = (btnAbsPos.Y - guiAbsPos.Y) + btnAbsSize.Y + 6
            local targetX = (btnAbsPos.X - guiAbsPos.X)


            if targetY + listAbsSize.Y > viewportSize.Y - 20 then
                targetY = (btnAbsPos.Y - guiAbsPos.Y) - listAbsSize.Y - 6
            end


            targetX = math.clamp(targetX, 5, (viewportSize.X - guiAbsPos.X) - listAbsSize.X - 5)

            list.Position = UDim2.fromOffset(targetX, targetY)
		end

		local function RecalculateListSize()
            local visibleCount = 0
            for _, element in next, DropdownScrollFrame:GetChildren() do
                if not element:IsA(string.char(85,73,76,105,115,116,76,97,121,111,117,116)) and element.Visible then
                    visibleCount = visibleCount + 1
                end
            end

            local itemHeight = 32
            local padding = 3
            local searchHeight = Dropdown.Search and 38 or 0
            local innerMargins = 10
            local estimatedContent = (visibleCount > 0) and (visibleCount * itemHeight + (visibleCount - 1) * padding + innerMargins + searchHeight) or (innerMargins + searchHeight)
            local maxHeight = 392
            local targetHeight = math.min(estimatedContent, maxHeight)

            DropdownHolderCanvas.Size = UDim2.fromOffset(DropdownInner.AbsoluteSize.X, targetHeight)
		end

		local function RecalculateCanvasSize()
			DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0, DropdownListLayout.AbsoluteContentSize.Y)
		end

		if Dropdown.Search then
			SearchBar = New(string.char(70,114,97,109,101), {
				Size = UDim2.new(1, -10, 0, 28),
				Position = UDim2.fromOffset(5, 5),
				BackgroundTransparency = 0.7,
				BackgroundColor3 = Color3.fromRGB(20, 20, 20),
				ThemeTag = { BackgroundColor3 = string.char(69,108,101,109,101,110,116) },
				ZIndex = DROPDOWN_Z_INDEX + 2,
			}, {
				New(string.char(85,73,67,111,114,110,101,114), { CornerRadius = UDim.new(0, 4) }),
			})

			SearchBox = New(string.char(84,101,120,116,66,111,120), {
				FontFace = resolveFont(Library.Font),
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -36, 1, 0),
				Position = UDim2.new(0, 10, 0, 0),
				PlaceholderText = string.char(83,101,97,114,99,104,46,46,46),
				PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
				ClearTextOnFocus = false,
				Text = "",
				Parent = SearchBar,
				ThemeTag = {
					TextColor3 = string.char(84,101,120,116),
					PlaceholderColor3 = string.char(83,117,98,84,101,120,116),
				},
				ZIndex = DROPDOWN_Z_INDEX + 3,
			})

			local SearchIcon = New(string.char(73,109,97,103,101,76,97,98,101,108), {
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.new(1, -13, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			Image = Library:GetIcon(string.char(115,101,97,114,99,104)),
			Parent = SearchBar,
			ImageTransparency = 0.3,
			ZIndex = DROPDOWN_Z_INDEX + 4,
				ThemeTag = {
					ImageColor3 = string.char(83,117,98,84,101,120,116),
				},
			})

			DropdownScrollFrame.Position = UDim2.fromOffset(5, 38)
			DropdownScrollFrame.Size = UDim2.new(1, -5, 1, -43)

			local function ApplyFilter()
				local function RobustLower(str)
					if not str then return "" end
					str = tostring(str):lower()
					local upper = string.char(1040,1041,1042,1043,1044,1045,1025,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071)
					local lower = string.char(1072,1073,1074,1075,1076,1077,1105,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103)
					for i = 1, 33 do
						local uChar = utf8.char(utf8.codepoint(upper, utf8.offset(upper, i)))
						local lChar = utf8.char(utf8.codepoint(lower, utf8.offset(lower, i)))
						str = str:gsub(uChar, lChar)
					end
					return str
				end

				local success, text = pcall(function() return RobustLower(SearchBox.Text) end)
				if not success then text = "" end

				for _, element in next, DropdownScrollFrame:GetChildren() do
					if not element:IsA(string.char(85,73,76,105,115,116,76,97,121,111,117,116)) then
						local label = element:FindFirstChild(string.char(66,117,116,116,111,110,76,97,98,101,108))
						local value = label and label.Text or ""
						element.Visible = text == "" or RobustLower(value):find(text, 1, true) ~= nil
					end
				end

				RecalculateCanvasSize()
				RecalculateListSize()
				RecalculateListPosition()
			end

			Dropdown.ApplyFilter = ApplyFilter
			Creator.AddSignal(SearchBox:GetPropertyChangedSignal(string.char(84,101,120,116)), ApplyFilter)
		end

		local DropdownHolderFrame = New(string.char(70,114,97,109,101), {
			Size = UDim2.fromScale(1, 1),
            ZIndex = DROPDOWN_Z_INDEX + 1,
			ThemeTag = {
				BackgroundColor3 = string.char(68,114,111,112,100,111,119,110,72,111,108,100,101,114),
			},
		}, {
            SearchBar,
			DropdownScrollFrame,
			New(string.char(85,73,67,111,114,110,101,114), {
				CornerRadius = UDim.new(0, 7),
			}),
			New(string.char(85,73,83,116,114,111,107,101), {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = string.char(68,114,111,112,100,111,119,110,66,111,114,100,101,114),
				},
			}),
			New(string.char(73,109,97,103,101,76,97,98,101,108), {
				BackgroundTransparency = 1,
				Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,53,53,53,52,50,51,54,56,48,53),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(23, 23, 277, 277),
				Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
				Position = UDim2.fromOffset(-15, -15),
				ImageColor3 = Color3.fromRGB(0, 0, 0),
				ImageTransparency = 0.1,
			}),
		})

		DropdownHolderCanvas = New(string.char(70,114,97,109,101), {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(180, 300),
			Parent = self.Library.GUI,
			Visible = false,
            ZIndex = DROPDOWN_Z_INDEX,
		}, {
			DropdownHolderFrame,
			New(string.char(85,73,83,105,122,101,67,111,110,115,116,114,97,105,110,116), {
				MinSize = Vector2.new(160, 0),
			}),
		})
		table.insert(Library.OpenFrames, DropdownHolderCanvas)

        Dropdown.HolderCanvas = DropdownHolderCanvas
        Dropdown.HolderFrame = DropdownHolderFrame

		RecalculateListPosition()
		RecalculateListSize()

		Creator.AddSignal(DropdownInner:GetPropertyChangedSignal(string.char(65,98,115,111,108,117,116,101,80,111,115,105,116,105,111,110)), RecalculateListPosition)

		local function checkSelected(obj)
			if not obj then return true end
			if (obj.Type == "Tab" or obj.Type == string.char(83,117,98,84,97,98)) and not obj.Selected then
				return false
			end
			if obj.Parent then return checkSelected(obj.Parent) end
			return true
		end

		Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
                if not checkSelected(Parent) then return end

                local mousePos = Input.UserInputType == Enum.UserInputType.MouseButton1 and Vector2.new(Mouse.X, Mouse.Y) or Vector2.new(Input.Position.X, Input.Position.Y)
				local AbsPos, AbsSize = DropdownHolderFrame.AbsolutePosition, DropdownHolderFrame.AbsoluteSize
                local innerAbsPos, innerAbsSize = DropdownInner.AbsolutePosition, DropdownInner.AbsoluteSize

				local clickedInsideDropdown = mousePos.X >= AbsPos.X and mousePos.X <= AbsPos.X + AbsSize.X and mousePos.Y >= AbsPos.Y and mousePos.Y <= AbsPos.Y + AbsSize.Y
                local clickedInsideInner = mousePos.X >= innerAbsPos.X and mousePos.X <= innerAbsPos.X + innerAbsSize.X and mousePos.Y >= innerAbsPos.Y and mousePos.Y <= innerAbsPos.Y + innerAbsSize.Y

                if clickedInsideInner and not Dropdown.Locked then
                    if Dropdown.Opened then
                        Dropdown:Close()
                    else
                        Dropdown:Open()
                    end
                elseif not clickedInsideDropdown and not clickedInsideInner then
                    if Dropdown.Opened then
                        Dropdown:Close()
                    end
                end
			end
		end)

		local ScrollFrame = self.ScrollFrame
		function Dropdown:Open()
            if Dropdown.Opened then return end


			Library:CloseOtherDropdowns(Dropdown)

			Dropdown.Opened = true
			DropdownHolderCanvas.Visible = true

            SetIcoRotation(180)


            RecalculateListSize()
            RecalculateCanvasSize()
            task.wait()
            RecalculateListSize()
            RecalculateListPosition()


			Library:BringDropdownToFront(Dropdown)

			TweenService:Create(
				DropdownHolderFrame,
				TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{ Size = UDim2.fromScale(1, 1) }
			):Play()
		end

		function Dropdown:Close()
            if not Dropdown.Opened then return end
			Dropdown.Opened = false
			DropdownHolderFrame.Size = UDim2.fromScale(1, 0.6)
			DropdownHolderCanvas.Visible = false
            SetIcoRotation(0)
            Dropdown:Display()
		end

		function Dropdown:Display()
			local Values = Dropdown.Values
			local Str = ""

			if Config.Multi then
				for Idx, Value in next, Values do
					if Dropdown.Value[Value] then
						Str = Str .. Value .. ", "
					end
				end
				Str = Str:sub(1, #Str - 2)
			else
				Str = Dropdown.Value or ""
			end

			DropdownDisplay.Text = (Str == "" and "
		end

		function Dropdown:GetActiveValues()
			if Config.Multi then
				local T = {}

				for Value, Bool in next, Dropdown.Value do
					table.insert(T, Value)
				end

				return T
			else
				return Dropdown.Value and 1 or 0
			end
		end

		function Dropdown:BuildDropdownList()
			local Values = Dropdown.Values
			local Buttons = {}

			for _, Element in next, DropdownScrollFrame:GetChildren() do
				if not Element:IsA(string.char(85,73,76,105,115,116,76,97,121,111,117,116)) then
					Element:Destroy()
				end
			end

			local Count = 0

			for Idx, Value in next, Values do
				local Table = {}

				Count = Count + 1

				local ButtonSelector = New(string.char(70,114,97,109,101), {
					Size = UDim2.fromOffset(4, 14),
					BackgroundColor3 = Color3.fromRGB(76, 194, 255),
					Position = UDim2.fromOffset(-1, 16),
					AnchorPoint = Vector2.new(0, 0.5),
					ThemeTag = {
						BackgroundColor3 = string.char(65,99,99,101,110,116),
					},
				}, {
					New(string.char(85,73,67,111,114,110,101,114), {
						CornerRadius = UDim.new(0, 2),
					}),
				})

				local ButtonLabel = New(string.char(84,101,120,116,76,97,98,101,108), {
					FontFace = resolveFont(Library.Font),
					Text = Value,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromOffset(10, 0),
					Name = string.char(66,117,116,116,111,110,76,97,98,101,108),
					ThemeTag = {
						TextColor3 = string.char(84,101,120,116),
					},
				})

				local Button = New(string.char(84,101,120,116,66,117,116,116,111,110), {
					Size = UDim2.new(1, -5, 0, 32),
					BackgroundTransparency = 1,
					ZIndex = DROPDOWN_Z_INDEX + 3,
					Text = "",
					Parent = DropdownScrollFrame,
					ThemeTag = {
						BackgroundColor3 = string.char(68,114,111,112,100,111,119,110,79,112,116,105,111,110),
					},
				}, {
					ButtonSelector,
					ButtonLabel,
					New(string.char(85,73,67,111,114,110,101,114), {
						CornerRadius = UDim.new(0, 6),
					}),
				})

				local Selected

				if Config.Multi then
					Selected = Dropdown.Value[Value]
				else
					Selected = Dropdown.Value == Value
				end

				local BackMotor, SetBackTransparency = Creator.SpringMotor(1, Button, string.char(66,97,99,107,103,114,111,117,110,100,84,114,97,110,115,112,97,114,101,110,99,121))
				local SelMotor, SetSelTransparency = Creator.SpringMotor(1, ButtonSelector, string.char(66,97,99,107,103,114,111,117,110,100,84,114,97,110,115,112,97,114,101,110,99,121))
				local SelectorSizeMotor = Flipper.SingleMotor.new(6)

				SelectorSizeMotor:onStep(function(value)
					ButtonSelector.Size = UDim2.new(0, 4, 0, value)
				end)

				Creator.AddSignal(Button.MouseEnter, function()
					SetBackTransparency(Selected and 0.85 or 0.89)
				end)
				Creator.AddSignal(Button.MouseLeave, function()
					SetBackTransparency(Selected and 0.89 or 1)
				end)
				Creator.AddSignal(Button.MouseButton1Down, function()
					SetBackTransparency(0.92)
				end)
				Creator.AddSignal(Button.MouseButton1Up, function()
					SetBackTransparency(Selected and 0.85 or 0.89)
				end)

				function Table:UpdateButton()
					if Config.Multi then
						Selected = Dropdown.Value[Value]
						if Selected then
							SetBackTransparency(0.89)
						end
					else
						Selected = Dropdown.Value == Value
						SetBackTransparency(Selected and 0.89 or 1)
					end

					SelectorSizeMotor:setGoal(Flipper.Spring.new(Selected and 14 or 6, { frequency = 6 }))
					SetSelTransparency(Selected and 0 or 1)
				end

				AddSignal(Button.Activated, function()
					local Try = not Selected

					if Dropdown:GetActiveValues() == 1 and not Try and not Config.AllowNull then
					else
						if Config.Multi then
							Selected = Try
							Dropdown.Value[Value] = Selected and true or nil
						else
							Selected = Try
							Dropdown.Value = Selected and Value or nil

							for _, OtherButton in next, Buttons do
								OtherButton:UpdateButton()
							end
						end

						Table:UpdateButton()
						Dropdown:Display()

						Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
						Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
					end
				end)

				Table:UpdateButton()
				Dropdown:Display()

				Buttons[Button] = Table
			end

			RecalculateCanvasSize()
			RecalculateListSize()

			if Dropdown.ApplyFilter then
				Dropdown.ApplyFilter()
			end
		end

		function Dropdown:SetValues(NewValues)
			if NewValues then
				Dropdown.Values = NewValues
			end

			Dropdown:BuildDropdownList()
		end

		function Dropdown:OnChanged(Func)
			Dropdown.Changed = Func
			Func(Dropdown.Value)
		end

		function Dropdown:SetValue(Val)
			if Dropdown.Multi then
				local nTable = {}

				for Value, Bool in next, Val do
					if table.find(Dropdown.Values, Value) then
						nTable[Value] = true
					end
				end

				Dropdown.Value = nTable
			else
				if not Val then
					Dropdown.Value = nil
				elseif table.find(Dropdown.Values, Val) then
					Dropdown.Value = Val
				end
			end

			Dropdown:BuildDropdownList()

			Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
			Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
		end

		function Dropdown:Destroy()
			DropdownFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Dropdown:BuildDropdownList()
		Dropdown:Display()

		local Defaults = {}

		if type(Config.Default) == string.char(115,116,114,105,110,103) then
			local Idx = table.find(Dropdown.Values, Config.Default)
			if Idx then
				table.insert(Defaults, Idx)
			end
		elseif type(Config.Default) == string.char(116,97,98,108,101) then
			for _, Value in next, Config.Default do
				local Idx = table.find(Dropdown.Values, Value)
				if Idx then
					table.insert(Defaults, Idx)
				end
			end
		elseif type(Config.Default) == string.char(110,117,109,98,101,114) and Dropdown.Values[Config.Default] ~= nil then
			table.insert(Defaults, Config.Default)
		end

		if next(Defaults) then
			for i = 1, #Defaults do
				local Index = Defaults[i]
				if Config.Multi then
					Dropdown.Value[Dropdown.Values[Index]] = true
				else
					Dropdown.Value = Dropdown.Values[Index]
				end

				if not Config.Multi then
					break
				end
			end

			Dropdown:BuildDropdownList()
			Dropdown:Display()
		end

		Library.Options[Idx] = Dropdown
		return Dropdown
	end

	return Element
end)()
ElementsTable.Paragraph = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = string.char(80,97,114,97,103,114,97,112,104)

	function Element:New(Config)
		Config.Content = Config.Content or ""

		local Paragraph = Components.Element(Config.Title, Config.Content, self.Container, false, Config)
		Paragraph.Frame.BackgroundTransparency = 0.92
		Paragraph.Border.Transparency = 0.6

		Paragraph.SetTitle = Paragraph.SetTitle
		Paragraph.SetDesc = Paragraph.SetDesc
		Paragraph.Visible = Paragraph.Visible
		Paragraph.Elements = Paragraph

		return Element
	end

	return Element
end)()
ElementsTable.Slider = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = string.char(83,108,105,100,101,114)

	function Element:New(Idx, Config)
		assert(Config.Title, string.char(83,108,105,100,101,114,32,45,32,77,105,115,115,105,110,103,32,84,105,116,108,101,46))
		assert(Config.Default, string.char(83,108,105,100,101,114,32,45,32,77,105,115,115,105,110,103,32,100,101,102,97,117,108,116,32,118,97,108,117,101,46))
		assert(Config.Min, string.char(83,108,105,100,101,114,32,45,32,77,105,115,115,105,110,103,32,109,105,110,105,109,117,109,32,118,97,108,117,101,46))
		assert(Config.Max, string.char(83,108,105,100,101,114,32,45,32,77,105,115,115,105,110,103,32,109,97,120,105,109,117,109,32,118,97,108,117,101,46))
		assert(Config.Rounding, string.char(83,108,105,100,101,114,32,45,32,77,105,115,115,105,110,103,32,114,111,117,110,100,105,110,103,32,118,97,108,117,101,46))

		local Slider = {
			Value = nil,
			Min = Config.Min,
			Max = Config.Max,
			Rounding = Config.Rounding,
			Callback = Config.Callback or function(Value) end,
			Type = string.char(83,108,105,100,101,114),
			_currentWidthTween = nil,
		}

		local Dragging = false
		local inputVisible = false

		local SliderFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		SliderFrame.DescLabel.Size = UDim2.new(1, -150, 0, 16)
		SliderFrame.TitleHolder.Size = UDim2.new(1, -150, 0, 16)

		Slider.Elements = SliderFrame
		Slider.SetTitle = SliderFrame.SetTitle
		Slider.SetDesc = SliderFrame.SetDesc
		Slider.Visible = SliderFrame.Visible

		local SliderDot = New(string.char(73,109,97,103,101,76,97,98,101,108), {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, -7, 0.5, 0),
			Size = UDim2.fromOffset(14, 14),
			Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,50,50,54,54,57,52,54,49,50,56),
			Active = true,
			ThemeTag = {
				ImageColor3 = string.char(65,99,99,101,110,116),
			},
		})

		local SliderRail = New(string.char(70,114,97,109,101), {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(7, 0),
			Size = UDim2.new(1, -14, 1, 0),
			Active = true,
		}, {
			SliderDot,
		})

		local SliderFill = New(string.char(70,114,97,109,101), {
			Size = UDim2.new(0, 0, 1, 0),
			ThemeTag = {
				BackgroundColor3 = string.char(65,99,99,101,110,116),
			},
		}, {
			New(string.char(85,73,67,111,114,110,101,114), {
				CornerRadius = UDim.new(1, 0),
			}),
		})

		local SliderDisplay = New(string.char(84,101,120,116,76,97,98,101,108), {
			FontFace = resolveFont(Library.Font),
			Text = string.char(86,97,108,117,101),
			TextSize = 12,
			TextWrapped = false,
			TextXAlignment = Enum.TextXAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 28, 0, 14),
			Position = UDim2.new(0, -4, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			TextTransparency = 0,
			ThemeTag = {
				TextColor3 = string.char(83,117,98,84,101,120,116),
			},
		})

		local SliderInput = New(string.char(84,101,120,116,66,111,120), {
			FontFace = resolveFont(Library.Font),
			Text = "",
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(0, 28, 0, 20),
			Position = UDim2.new(0, -4, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			PlaceholderText = "",
			ClearTextOnFocus = false,
			Visible = true,
			TextWrapped = false,
			TextTransparency = 1,
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = string.char(84,101,120,116),
				BackgroundColor3 = string.char(69,108,101,109,101,110,116),
			},
		}, {
			New(string.char(85,73,67,111,114,110,101,114), {
				CornerRadius = UDim.new(0, 4),
			}),
			New(string.char(85,73,83,116,114,111,107,101), {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = 1,
				Thickness = 1,
				ThemeTag = {
					Color = string.char(68,114,111,112,100,111,119,110,66,111,114,100,101,114),
				}
			}),
		})

		local SliderInner = New(string.char(70,114,97,109,101), {
			Size = UDim2.new(1, 0, 0, 4),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			BackgroundTransparency = 0.4,
			Parent = SliderFrame.Frame,
			ThemeTag = {
				BackgroundColor3 = string.char(83,108,105,100,101,114,82,97,105,108),
			},
		}, {
			New(string.char(85,73,67,111,114,110,101,114), {
				CornerRadius = UDim.new(1, 0),
			}),
			New(string.char(85,73,83,105,122,101,67,111,110,115,116,114,97,105,110,116), {
				MaxSize = Vector2.new(100, math.huge),
			}),
			SliderDisplay,
			SliderInput,
			SliderFill,
			SliderRail,
		})

		local isHovering = false

		local function calculateInputWidth(text)
			local textSize = game:GetService(string.char(84,101,120,116,83,101,114,118,105,99,101)):GetTextSize(
				text or "0",
				12,
				Enum.Font.SourceSans,
				Vector2.new(1000, 14)
			)
			return math.clamp(textSize.X + 16, 32, 80)
		end

		local function updateInputWidth(text, animate)
			local targetWidth = calculateInputWidth(text)
			local currentWidth = SliderInput.Size.X.Offset

			if animate and math.abs(targetWidth - currentWidth) > 0.5 then
				TweenService:Create(SliderInput, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, targetWidth, 0, 20)
				}):Play()
				TweenService:Create(SliderDisplay, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, targetWidth, 0, 14)
				}):Play()
			else
				SliderInput.Size = UDim2.new(0, targetWidth, 0, 20)
				SliderDisplay.Size = UDim2.new(0, targetWidth, 0, 14)
			end
		end

		Creator.AddSignal(SliderFrame.Frame.MouseEnter, function()
			isHovering = true
			if not SliderInput:IsFocused() then
				SliderInput.Text = tostring(Slider.Value)
				updateInputWidth(tostring(Slider.Value), true)
				inputVisible = true

				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

				TweenService:Create(SliderDisplay, tweenInfo, {
					TextTransparency = 1,
				}):Play()

				TweenService:Create(SliderInput, tweenInfo, {
					TextTransparency = 0,
					BackgroundTransparency = 0.5,
				}):Play()

				TweenService:Create(SliderInput.UIStroke, tweenInfo, {
					Transparency = 0.6
				}):Play()
			end
		end)

		Creator.AddSignal(SliderFrame.Frame.MouseLeave, function()
			isHovering = false
			if not SliderInput:IsFocused() then
				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

				SliderDisplay.Text = SliderInput.Text
				updateInputWidth(SliderDisplay.Text, true)

				TweenService:Create(SliderInput, tweenInfo, {
					TextTransparency = 1,
					BackgroundTransparency = 1,
				}):Play()

				TweenService:Create(SliderInput.UIStroke, tweenInfo, {
					Transparency = 1
				}):Play()

				TweenService:Create(SliderDisplay, tweenInfo, {
					TextTransparency = 0,
				}):Play()
			end
		end)

		Creator.AddSignal(SliderInput.Changed, function(property)
			if property == string.char(84,101,120,116) then
				local text = SliderInput.Text
				local cleanText = text:gsub(string.char(91,94,37,100,37,46,37,45,93), "")
				if cleanText:find("%-") and cleanText:find("%-") ~= 1 then
					cleanText = cleanText:gsub("%-", "")
				end
				local dotCount = 0
				cleanText = cleanText:gsub("%.", function()
					dotCount = dotCount + 1
					return dotCount == 1 and "." or ""
				end)

				if cleanText ~= text then
					SliderInput.Text = cleanText
					return
				end

				if isHovering or SliderInput:IsFocused() then
					updateInputWidth(cleanText, true)
				end
			end
		end)

		Creator.AddSignal(SliderInput.FocusLost, function(enterPressed)
			local inputValue = tonumber(SliderInput.Text)
			if inputValue then
				Slider:SetValue(inputValue)
			else
				SliderInput.Text = tostring(Slider.Value)
				updateInputWidth(tostring(Slider.Value), true)
			end

			if not isHovering then
				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

				TweenService:Create(SliderInput, tweenInfo, {
					TextTransparency = 1,
					BackgroundTransparency = 1
				}):Play()

				TweenService:Create(SliderInput.UIStroke, tweenInfo, {
					Transparency = 1
				}):Play()

				task.wait(0.2)
				SliderDisplay.Visible = true
				inputVisible = false
			end
		end)

		Creator.AddSignal(SliderInput.Focused, function()
			SliderInput.Text = tostring(Slider.Value)
			updateInputWidth(tostring(Slider.Value), false)
		end)

		Creator.AddSignal(SliderInput.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = false
			end
		end)

		local MoveConn, EndConn

		Creator.AddSignal(SliderDot.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = true

				if MoveConn then MoveConn:Disconnect() end
				if EndConn then EndConn:Disconnect() end

				MoveConn = UserInputService.InputChanged:Connect(function(MoveInput)
					if MoveInput.UserInputType == Enum.UserInputType.MouseMovement or MoveInput.UserInputType == Enum.UserInputType.Touch then
						local SizeScale = math.clamp((MoveInput.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
						Slider:SetValue(Slider.Min + ((Slider.Max - Slider.Min) * SizeScale))
					end
				end)

				EndConn = UserInputService.InputEnded:Connect(function(EndInput)
					if EndInput.UserInputType == Enum.UserInputType.MouseButton1 or EndInput.UserInputType == Enum.UserInputType.Touch then
						Dragging = false
						if MoveConn then MoveConn:Disconnect() MoveConn = nil end
						if EndConn then EndConn:Disconnect() EndConn = nil end
					end
				end)
			end
		end)

		Creator.AddSignal(SliderDot.InputEnded, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = false
			end
		end)

		Creator.AddSignal(SliderFrame.Frame.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				local SizeScale = math.clamp((Input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
				Slider:SetValue(Slider.Min + ((Slider.Max - Slider.Min) * SizeScale))
			end
		end)

		Creator.AddSignal(SliderFrame.Frame.InputEnded, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = false
			end
		end)

		Creator.AddSignal(SliderRail.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				local SizeScale = math.clamp((Input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
				Slider:SetValue(Slider.Min + ((Slider.Max - Slider.Min) * SizeScale))
			end
		end)

		Creator.AddSignal(SliderRail.InputEnded, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = false
			end
		end)

		local GlobalInputEnded = Creator.AddSignal(UserInputService.InputEnded, function(Input)
			if Dragging and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
				Dragging = false
			end
		end)

		function Slider:OnChanged(Func)
			Slider.Changed = Func
			Func(Slider.Value)
		end

		function Slider:SetValue(Value)
			self.Value = Library:Round(math.clamp(Value, Slider.Min, Slider.Max), Slider.Rounding)
			SliderDot.Position = UDim2.new((self.Value - Slider.Min) / (Slider.Max - Slider.Min), -7, 0.5, 0)
			SliderFill.Size = UDim2.fromScale((self.Value - Slider.Min) / (Slider.Max - Slider.Min), 1)
			SliderDisplay.Text = tostring(self.Value)

			if inputVisible or SliderInput:IsFocused() then
				SliderInput.Text = tostring(self.Value)
				updateInputWidth(tostring(self.Value), not SliderInput:IsFocused())
			end
			if not inputVisible and not SliderInput:IsFocused() then
				SliderInput.Text = tostring(self.Value)
			end

			Library:SafeCallback(Slider.Callback, self.Value)
			Library:SafeCallback(Slider.Changed, self.Value)
		end

		function Slider:Destroy()
			if self._currentWidthTween then
				self._currentWidthTween:Cancel()
				self._currentWidthTween = nil
			end
			if GlobalInputEnded then
				Creator.RemoveSignal(GlobalInputEnded)
			end
			SliderFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Slider:SetValue(Config.Default)

		Library.Options[Idx] = Slider
		return Slider
	end

	return Element
end)()
ElementsTable.Keybind = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = string.char(75,101,121,98,105,110,100)

	function Element:New(Idx, Config)
		assert(Config.Title, string.char(75,101,121,66,105,110,100,32,45,32,77,105,115,115,105,110,103,32,84,105,116,108,101))
		assert(Config.Default, string.char(75,101,121,66,105,110,100,32,45,32,77,105,115,115,105,110,103,32,100,101,102,97,117,108,116,32,118,97,108,117,101,46))

		local Keybind = {
			Value = Config.Default,
			Toggled = false,
			Mode = Config.Mode or string.char(84,111,103,103,108,101),
			Type = string.char(75,101,121,98,105,110,100),
			Callback = Config.Callback or function(Value) end,
			ChangedCallback = Config.ChangedCallback or function(New) end,
		}

		local Picking = false

		local KeybindFrame = Components.Element(Config.Title, Config.Description, self.Container, true)
		KeybindFrame.TitleHolder.Size = UDim2.new(1, -85, 0, 16)
		if KeybindFrame.DescLabel then
			KeybindFrame.DescLabel.Size = UDim2.new(1, -85, 0, 16)
		end

		Keybind.SetTitle = KeybindFrame.SetTitle
		Keybind.SetDesc = KeybindFrame.SetDesc
		Keybind.Visible = KeybindFrame.Visible
		Keybind.Elements = KeybindFrame

		local KeybindDisplayLabel = New(string.char(84,101,120,116,76,97,98,101,108), {
			FontFace = resolveFont(Library.Font),
			Text = Config.Default,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Center,
			Size = UDim2.new(0, 0, 0, 14),
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = string.char(84,101,120,116),
			},
		})

		local KeybindDisplayFrame = New(string.char(84,101,120,116,66,117,116,116,111,110), {
			Size = UDim2.fromOffset(0, 30),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.9,
			Parent = KeybindFrame.Frame,
			AutomaticSize = Enum.AutomaticSize.X,
			ThemeTag = {
				BackgroundColor3 = string.char(75,101,121,98,105,110,100),
			},
		}, {
			New(string.char(85,73,67,111,114,110,101,114), {
				CornerRadius = UDim.new(0, 5),
			}),
			New(string.char(85,73,80,97,100,100,105,110,103), {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			}),
			New(string.char(85,73,83,116,114,111,107,101), {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = string.char(73,110,69,108,101,109,101,110,116,66,111,114,100,101,114),
				},
			}),
			KeybindDisplayLabel,
		})

		function Keybind:GetState()
			if UserInputService:GetFocusedTextBox() and Keybind.Mode ~= string.char(65,108,119,97,121,115) then
				return false
			end

			if Keybind.Mode == string.char(65,108,119,97,121,115) then
				return true
			elseif Keybind.Mode == string.char(72,111,108,100) then
				if Keybind.Value == string.char(78,111,110,101) then
					return false
				end

				local Key = Keybind.Value

				if Key == string.char(77,111,117,115,101,76,101,102,116) or Key == string.char(77,111,117,115,101,82,105,103,104,116) then
					return Key == string.char(77,111,117,115,101,76,101,102,116) and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
						or Key == string.char(77,111,117,115,101,82,105,103,104,116)
						and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
				else
					return UserInputService:IsKeyDown(Enum.KeyCode[Keybind.Value])
				end
			else
				return Keybind.Toggled
			end
		end

		function Keybind:SetValue(Key, Mode)
			Key = Key or Keybind.Key
			Mode = Mode or Keybind.Mode

			KeybindDisplayLabel.Text = Key
			Keybind.Value = Key
			Keybind.Mode = Mode
		end

		function Keybind:OnClick(Callback)
			Keybind.Clicked = Callback
		end

		function Keybind:OnChanged(Callback)
			Keybind.Changed = Callback
			Callback(Keybind.Value)
		end

		function Keybind:DoClick()
			Library:SafeCallback(Keybind.Callback, Keybind.Toggled)
			Library:SafeCallback(Keybind.Clicked, Keybind.Toggled)
		end

		local PickEvent, PickEndedEvent

		Creator.AddSignal(KeybindDisplayFrame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Picking = true
				KeybindDisplayLabel.Text = "..."

				if PickEvent then PickEvent:Disconnect() PickEvent = nil end
				if PickEndedEvent then PickEndedEvent:Disconnect() PickEndedEvent = nil end

				task.wait(0.2)

				PickEvent = UserInputService.InputBegan:Connect(function(Input)
					local Key

					if Input.UserInputType == Enum.UserInputType.Keyboard then
						Key = Input.KeyCode.Name
					elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
						Key = string.char(77,111,117,115,101,76,101,102,116)
					elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
						Key = string.char(77,111,117,115,101,82,105,103,104,116)
					end

					PickEndedEvent = UserInputService.InputEnded:Connect(function(Input)
						if
							Input.KeyCode.Name == Key
							or Key == string.char(77,111,117,115,101,76,101,102,116) and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == string.char(77,111,117,115,101,82,105,103,104,116) and Input.UserInputType == Enum.UserInputType.MouseButton2
						then
							Picking = false

							KeybindDisplayLabel.Text = Key
							Keybind.Value = Key

							Library:SafeCallback(Keybind.ChangedCallback, Input.KeyCode or Input.UserInputType)
							Library:SafeCallback(Keybind.Changed, Input.KeyCode or Input.UserInputType)

							if PickEvent then PickEvent:Disconnect() PickEvent = nil end
							if PickEndedEvent then PickEndedEvent:Disconnect() PickEndedEvent = nil end
						end
					end)
				end)
			end
		end)

		local GlobalInputBegan = Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if not Picking and not UserInputService:GetFocusedTextBox() then
				if Keybind.Mode == string.char(84,111,103,103,108,101) then
					local Key = Keybind.Value

					if Key == string.char(77,111,117,115,101,76,101,102,116) or Key == string.char(77,111,117,115,101,82,105,103,104,116) then
						if
							Key == string.char(77,111,117,115,101,76,101,102,116) and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == string.char(77,111,117,115,101,82,105,103,104,116) and Input.UserInputType == Enum.UserInputType.MouseButton2
						then
							Keybind.Toggled = not Keybind.Toggled
							Keybind:DoClick()
						end
					elseif Input.UserInputType == Enum.UserInputType.Keyboard then
						if Input.KeyCode.Name == Key then
							Keybind.Toggled = not Keybind.Toggled
							Keybind:DoClick()
						end
					end
				end
			end
		end)

		function Keybind:Destroy()
			if GlobalInputBegan then
				Creator.RemoveSignal(GlobalInputBegan)
			end
			KeybindFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Library.Options[Idx] = Keybind
		return Keybind
	end

	return Element
end)()
ElementsTable.Colorpicker = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = string.char(67,111,108,111,114,112,105,99,107,101,114)

	function Element:New(Idx, Config)
		assert(Config.Title, string.char(67,111,108,111,114,112,105,99,107,101,114,32,45,32,77,105,115,115,105,110,103,32,84,105,116,108,101))
		assert(Config.Default, string.char(65,100,100,67,111,108,111,114,80,105,99,107,101,114,58,32,77,105,115,115,105,110,103,32,100,101,102,97,117,108,116,32,118,97,108,117,101,46))

		local Colorpicker = {
			Value = Config.Default,
			Transparency = Config.Transparency or 0,
			Type = string.char(67,111,108,111,114,112,105,99,107,101,114),
			Title = type(Config.Title) == string.char(115,116,114,105,110,103) and Config.Title or string.char(67,111,108,111,114,112,105,99,107,101,114),
			Callback = Config.Callback or function(Color) end,
		}

		function Colorpicker:SetHSVFromRGB(Color)
			local H, S, V = Color3.toHSV(Color)
			Colorpicker.Hue = H
			Colorpicker.Sat = S
			Colorpicker.Vib = V
		end

		Colorpicker:SetHSVFromRGB(Colorpicker.Value)

		local ColorpickerFrame = Components.Element(Config.Title, Config.Description, self.Container, true)
		ColorpickerFrame.TitleHolder.Size = UDim2.new(1, -54, 0, 16)
		if ColorpickerFrame.DescLabel then
			ColorpickerFrame.DescLabel.Size = UDim2.new(1, -54, 0, 16)
		end

		Colorpicker.SetTitle = ColorpickerFrame.SetTitle
		Colorpicker.SetDesc = ColorpickerFrame.SetDesc
		Colorpicker.Visible = ColorpickerFrame.Visible
		Colorpicker.Elements = ColorpickerFrame

		local DisplayFrameColor = New(string.char(70,114,97,109,101), {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Colorpicker.Value,
			Parent = ColorpickerFrame.Frame,
		}, {
			New(string.char(85,73,67,111,114,110,101,114), {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local DisplayFrame = New(string.char(73,109,97,103,101,76,97,98,101,108), {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Parent = ColorpickerFrame.Frame,
			Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,52,50,48,52,50,51,49,53,50,50),
			ImageTransparency = 0.45,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(40, 40),
		}, {
			New(string.char(85,73,67,111,114,110,101,114), {
				CornerRadius = UDim.new(0, 4),
			}),
			DisplayFrameColor,
		})

		local function CreateColorDialog()
			local Dialog = Components.Dialog:Create()
			Dialog.Title.Text = Colorpicker.Title
			Dialog.Root.Size = UDim2.fromOffset(430, 330)

			local Hue, Sat, Vib = Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib
			local Transparency = Colorpicker.Transparency

			local function CreateInput()
				local Box = Components.Textbox()
				Box.Frame.Parent = Dialog.Root
				Box.Frame.Size = UDim2.new(0, 90, 0, 32)

				return Box
			end

			local function CreateInputLabel(Text, Pos)
				return New(string.char(84,101,120,116,76,97,98,101,108), {
FontFace = resolveFont(Library.Font),
					Text = Text,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 32),
					Position = Pos,
					BackgroundTransparency = 1,
					Parent = Dialog.Root,
					ThemeTag = {
						TextColor3 = string.char(84,101,120,116),
					},
				})
			end

			local function GetRGB()
				local Value = Color3.fromHSV(Hue, Sat, Vib)
				return { R = math.floor(Value.r * 255), G = math.floor(Value.g * 255), B = math.floor(Value.b * 255) }
			end

			local SatCursor = New(string.char(73,109,97,103,101,76,97,98,101,108), {
				Size = UDim2.new(0, 18, 0, 18),
				ScaleType = Enum.ScaleType.Fit,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,52,56,48,53,54,51,57,48,48,48),
			})

			local SatVibMap = New(string.char(73,109,97,103,101,76,97,98,101,108), {
				Size = UDim2.fromOffset(180, 160),
				Position = UDim2.fromOffset(20, 55),
				Image = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,52,49,53,53,56,48,49,50,53,50),
				BackgroundColor3 = Colorpicker.Value,
				BackgroundTransparency = 0,
				Parent = Dialog.Root,
			}, {
				New(string.char(85,73,67,111,114,110,101,114), {
					CornerRadius = UDim.new(0, 4),
				}),
				SatCursor,
			})

			local OldColorFrame = New(string.char(70,114,97,109,101), {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = Colorpicker.Transparency,
			}, {
				New(string.char(85,73,67,111,114,110,101,114), {
					CornerRadius = UDim.new(0, 4),
				}),
			})
			local OldColorFrameChecker = New(string.char(73,109,97,103,101,76,97,98,101,108), {
				Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,52,50,48,52,50,51,49,53,50,50),
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(112, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New(string.char(85,73,67,111,114,110,101,114), {
					CornerRadius = UDim.new(0, 4),
				}),
				New(string.char(85,73,83,116,114,111,107,101), {
					Thickness = 2,
					Transparency = 0.75,
				}),
				OldColorFrame,
			})

			local DialogDisplayFrame = New(string.char(70,114,97,109,101), {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
			}, {
				New(string.char(85,73,67,111,114,110,101,114), {
					CornerRadius = UDim.new(0, 4),
				}),
			})

			local DialogDisplayFrameChecker = New(string.char(73,109,97,103,101,76,97,98,101,108), {
				Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,52,50,48,52,50,51,49,53,50,50),
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(20, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New(string.char(85,73,67,111,114,110,101,114), {
					CornerRadius = UDim.new(0, 4),
				}),
				New(string.char(85,73,83,116,114,111,107,101), {
					Thickness = 2,
					Transparency = 0.75,
				}),
				DialogDisplayFrame,
			})

			local HueSliderGradient = New(string.char(85,73,71,114,97,100,105,101,110,116), {
				Color = ColorSequence.new(HUE_SEQUENCE_TABLE),
				Rotation = 90,
			})

			local HueDragHolder = New(string.char(70,114,97,109,101), {
				Size = UDim2.new(1, 0, 1, -10),
				Position = UDim2.fromOffset(0, 5),
				BackgroundTransparency = 1,
			})

			local HueDrag = New(string.char(73,109,97,103,101,76,97,98,101,108), {
				Size = UDim2.fromOffset(14, 14),
				Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,50,50,54,54,57,52,54,49,50,56),
				Parent = HueDragHolder,
				ThemeTag = {
					ImageColor3 = string.char(68,105,97,108,111,103,73,110,112,117,116),
				},
			})

			local HueSlider = New(string.char(70,114,97,109,101), {
				Size = UDim2.fromOffset(12, 190),
				Position = UDim2.fromOffset(210, 55),
				Parent = Dialog.Root,
			}, {
				New(string.char(85,73,67,111,114,110,101,114), {
					CornerRadius = UDim.new(1, 0),
				}),
				HueSliderGradient,
				HueDragHolder,
			})

			local HexInput = CreateInput()
			HexInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 55)
			CreateInputLabel("Hex", UDim2.fromOffset(Config.Transparency and 360 or 340, 55))

			local RedInput = CreateInput()
			RedInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 95)
			CreateInputLabel("Red", UDim2.fromOffset(Config.Transparency and 360 or 340, 95))

			local GreenInput = CreateInput()
			GreenInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 135)
			CreateInputLabel(string.char(71,114,101,101,110), UDim2.fromOffset(Config.Transparency and 360 or 340, 135))

			local BlueInput = CreateInput()
			BlueInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 175)
			CreateInputLabel(string.char(66,108,117,101), UDim2.fromOffset(Config.Transparency and 360 or 340, 175))

			local AlphaInput
			if Config.Transparency then
				AlphaInput = CreateInput()
				AlphaInput.Frame.Position = UDim2.fromOffset(260, 215)
				CreateInputLabel(string.char(65,108,112,104,97), UDim2.fromOffset(360, 215))
			end

			local TransparencySlider, TransparencyDrag, TransparencyColor
			if Config.Transparency then
				local TransparencyDragHolder = New(string.char(70,114,97,109,101), {
					Size = UDim2.new(1, 0, 1, -10),
					Position = UDim2.fromOffset(0, 5),
					BackgroundTransparency = 1,
				})

				TransparencyDrag = New(string.char(73,109,97,103,101,76,97,98,101,108), {
					Size = UDim2.fromOffset(14, 14),
					Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,50,50,54,54,57,52,54,49,50,56),
					Parent = TransparencyDragHolder,
					ThemeTag = {
						ImageColor3 = string.char(68,105,97,108,111,103,73,110,112,117,116),
					},
				})

				TransparencyColor = New(string.char(70,114,97,109,101), {
					Size = UDim2.fromScale(1, 1),
				}, {
					New(string.char(85,73,71,114,97,100,105,101,110,116), {
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}),
						Rotation = 270,
					}),
					New(string.char(85,73,67,111,114,110,101,114), {
						CornerRadius = UDim.new(1, 0),
					}),
				})

				TransparencySlider = New(string.char(70,114,97,109,101), {
					Size = UDim2.fromOffset(12, 190),
					Position = UDim2.fromOffset(230, 55),
					Parent = Dialog.Root,
					BackgroundTransparency = 1,
				}, {
					New(string.char(85,73,67,111,114,110,101,114), {
						CornerRadius = UDim.new(1, 0),
					}),
					New(string.char(73,109,97,103,101,76,97,98,101,108), {
						Image = string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,52,50,48,52,50,51,49,53,50,50),
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Parent = Dialog.Root,
					}, {
						New(string.char(85,73,67,111,114,110,101,114), {
							CornerRadius = UDim.new(1, 0),
						}),
					}),
					TransparencyColor,
					TransparencyDragHolder,
				})
			end

			local function Display()
				SatVibMap.BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)
				HueDrag.Position = UDim2.new(0, -1, Hue, -6)
				SatCursor.Position = UDim2.new(Sat, 0, 1 - Vib, 0)
				DialogDisplayFrame.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)

				HexInput.Input.Text = "#" .. Color3.fromHSV(Hue, Sat, Vib):ToHex()
				RedInput.Input.Text = GetRGB()["R"]
				GreenInput.Input.Text = GetRGB()["G"]
				BlueInput.Input.Text = GetRGB()["B"]

				if Config.Transparency then
					TransparencyColor.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)
					DialogDisplayFrame.BackgroundTransparency = Transparency
					TransparencyDrag.Position = UDim2.new(0, -1, 1 - Transparency, -6)
					AlphaInput.Input.Text = Library:Round((1 - Transparency) * 100, 0) .. "%"
				end
			end

			Creator.AddSignal(HexInput.Input.FocusLost, function(Enter)
				if Enter then
					local Success, Result = pcall(Color3.fromHex, HexInput.Input.Text)
					if Success and typeof(Result) == string.char(67,111,108,111,114,51) then
						Hue, Sat, Vib = Color3.toHSV(Result)
					end
				end
				Display()
			end)

			Creator.AddSignal(RedInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result = pcall(Color3.fromRGB, RedInput.Input.Text, CurrentColor["G"], CurrentColor["B"])
					if Success and typeof(Result) == string.char(67,111,108,111,114,51) then
						local val = tonumber(RedInput.Input.Text)
						if val and val >= 0 and val <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			Creator.AddSignal(GreenInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result =
						pcall(Color3.fromRGB, CurrentColor["R"], GreenInput.Input.Text, CurrentColor["B"])
					if Success and typeof(Result) == string.char(67,111,108,111,114,51) then
						local val = tonumber(GreenInput.Input.Text)
						if val and val >= 0 and val <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			Creator.AddSignal(BlueInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result =
						pcall(Color3.fromRGB, CurrentColor["R"], CurrentColor["G"], BlueInput.Input.Text)
					if Success and typeof(Result) == string.char(67,111,108,111,114,51) then
						local val = tonumber(BlueInput.Input.Text)
						if val and val >= 0 and val <= 255 then
							Hue, Sat, Vib = Color3.toHSV(Result)
						end
					end
				end
				Display()
			end)

			if Config.Transparency then
				Creator.AddSignal(AlphaInput.Input.FocusLost, function(Enter)
					if Enter then
						pcall(function()
							local Value = tonumber(AlphaInput.Input.Text)
							if Value >= 0 and Value <= 100 then
								Transparency = 1 - Value * 0.01
							end
						end)
					end
					Display()
				end)
			end

			local SatMoveConn, SatEndConn

			Creator.AddSignal(SatVibMap.InputBegan, function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					local function UpdateSatVib(MoveInput)
						local MinX = SatVibMap.AbsolutePosition.X
						local MaxX = MinX + SatVibMap.AbsoluteSize.X
						local MouseX = math.clamp(MoveInput.Position.X, MinX, MaxX)

						local MinY = SatVibMap.AbsolutePosition.Y
						local MaxY = MinY + SatVibMap.AbsoluteSize.Y
						local MouseY = math.clamp(MoveInput.Position.Y, MinY, MaxY)

						Sat = (MouseX - MinX) / (MaxX - MinX)
						Vib = 1 - ((MouseY - MinY) / (MaxY - MinY))
						Display()
					end

					UpdateSatVib(Input)

					if SatMoveConn then SatMoveConn:Disconnect() end
					if SatEndConn then SatEndConn:Disconnect() end

					SatMoveConn = UserInputService.InputChanged:Connect(function(MoveInput)
						if MoveInput.UserInputType == Enum.UserInputType.MouseMovement or MoveInput.UserInputType == Enum.UserInputType.Touch then
							UpdateSatVib(MoveInput)
						end
					end)

					SatEndConn = UserInputService.InputEnded:Connect(function(EndInput)
						if EndInput.UserInputType == Enum.UserInputType.MouseButton1 or EndInput.UserInputType == Enum.UserInputType.Touch then
							if SatMoveConn then SatMoveConn:Disconnect() SatMoveConn = nil end
							if SatEndConn then SatEndConn:Disconnect() SatEndConn = nil end
						end
					end)
				end
			end)

			local HueMoveConn, HueEndConn

			Creator.AddSignal(HueSlider.InputBegan, function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					local function UpdateHue(MoveInput)
						local MinY = HueSlider.AbsolutePosition.Y
						local MaxY = MinY + HueSlider.AbsoluteSize.Y
						local MouseY = math.clamp(MoveInput.Position.Y, MinY, MaxY)

						Hue = ((MouseY - MinY) / (MaxY - MinY))
						Display()
					end

					UpdateHue(Input)

					if HueMoveConn then HueMoveConn:Disconnect() end
					if HueEndConn then HueEndConn:Disconnect() end

					HueMoveConn = UserInputService.InputChanged:Connect(function(MoveInput)
						if MoveInput.UserInputType == Enum.UserInputType.MouseMovement or MoveInput.UserInputType == Enum.UserInputType.Touch then
							UpdateHue(MoveInput)
						end
					end)

					HueEndConn = UserInputService.InputEnded:Connect(function(EndInput)
						if EndInput.UserInputType == Enum.UserInputType.MouseButton1 or EndInput.UserInputType == Enum.UserInputType.Touch then
							if HueMoveConn then HueMoveConn:Disconnect() HueMoveConn = nil end
							if HueEndConn then HueEndConn:Disconnect() HueEndConn = nil end
						end
					end)
				end
			end)

			if Config.Transparency then
				Creator.AddSignal(TransparencySlider.InputBegan, function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local MinY = TransparencySlider.AbsolutePosition.Y
							local MaxY = MinY + TransparencySlider.AbsoluteSize.Y
							local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

							Transparency = 1 - ((MouseY - MinY) / (MaxY - MinY))
							Display()

							RenderStepped:Wait()
						end
					end
				end)
			end

			Display()

			Dialog:Button(string.char(68,111,110,101), function()
				Colorpicker:SetValue({ Hue, Sat, Vib }, Transparency)
			end)
			Dialog:Button(string.char(67,97,110,99,101,108))
			Dialog:Open()
		end

		function Colorpicker:Display()
			Colorpicker.Value = Color3.fromHSV(Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib)

			DisplayFrameColor.BackgroundColor3 = Colorpicker.Value
			DisplayFrameColor.BackgroundTransparency = Colorpicker.Transparency

			Library:SafeCallback(Colorpicker.Callback, Colorpicker.Value)
			Library:SafeCallback(Colorpicker.Changed, Colorpicker.Value)
		end

		function Colorpicker:SetValue(HSV, Transparency)
			local Color = Color3.fromHSV(HSV[1], HSV[2], HSV[3])

			Colorpicker.Transparency = Transparency or 0
			Colorpicker:SetHSVFromRGB(Color)
			Colorpicker:Display()
		end

		function Colorpicker:SetValueRGB(Color, Transparency)
			Colorpicker.Transparency = Transparency or 0
			Colorpicker:SetHSVFromRGB(Color)
			Colorpicker:Display()
		end

		function Colorpicker:OnChanged(Func)
			Colorpicker.Changed = Func
			Func(Colorpicker.Value)
		end

		function Colorpicker:Destroy()
			ColorpickerFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Creator.AddSignal(ColorpickerFrame.Frame.MouseButton1Click, function()
			CreateColorDialog()
		end)

		Creator.AddSignal(ColorpickerFrame.Frame.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.Touch then
				CreateColorDialog()
			end
		end)

		Colorpicker:Display()

		Library.Options[Idx] = Colorpicker
		return Colorpicker
	end

	return Element
end)()
ElementsTable.Input = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = string.char(73,110,112,117,116)

	function Element:New(Idx, Config)
		assert(Config.Title, string.char(73,110,112,117,116,32,45,32,77,105,115,115,105,110,103,32,84,105,116,108,101))
		Config.Callback = Config.Callback or function() end

		local Input = {
			Value = Config.Default or "",
			Numeric = Config.Numeric or false,
			Finished = Config.Finished or false,
			Callback = Config.Callback or function(Value) end,
			Type = string.char(73,110,112,117,116),
		}

		local InputFrame = Components.Element(Config.Title, Config.Description, self.Container, false)
		InputFrame.TitleHolder.Size = UDim2.new(1, -180, 0, 16)
		if InputFrame.DescLabel then
			InputFrame.DescLabel.Size = UDim2.new(1, -180, 0, 16)
		end

		Input.SetTitle = InputFrame.SetTitle
		Input.SetDesc = InputFrame.SetDesc
		Input.Visible = InputFrame.Visible
		Input.Elements = InputFrame

		local Textbox = Components.Textbox(InputFrame.Frame, true)
		Textbox.Frame.Position = UDim2.new(1, -10, 0.5, 0)
		Textbox.Frame.AnchorPoint = Vector2.new(1, 0.5)
		Textbox.Frame.Size = UDim2.fromOffset(160, 30)
		Textbox.Input.Text = Config.Default or ""
		Textbox.Input.PlaceholderText = Config.Placeholder or ""

		local Box = Textbox.Input

		function Input:SetValue(Text)
			if Config.MaxLength and #Text > Config.MaxLength then
				Text = Text:sub(1, Config.MaxLength)
			end

			if Input.Numeric then
				if (not tonumber(Text)) and Text:len() > 0 then
					Text = Input.Value
				end
			end

			Input.Value = Text
			Box.Text = Text

			Library:SafeCallback(Input.Callback, Input.Value)
			Library:SafeCallback(Input.Changed, Input.Value)
		end

		if Input.Finished then
			AddSignal(Box.FocusLost, function(enter)
				if not enter then
					return
				end
				Input:SetValue(Box.Text)
			end)
		else
			AddSignal(Box:GetPropertyChangedSignal(string.char(84,101,120,116)), function()
				Input:SetValue(Box.Text)
			end)
		end

		function Input:OnChanged(Func)
			Input.Changed = Func
			Func(Input.Value)
		end

		function Input:Destroy()
			InputFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Library.Options[Idx] = Input
		return Input
	end

	return Element
end)()

ElementsTable.Discord = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = string.char(68,105,115,99,111,114,100)

	function Element:New(Idx, Config)
		assert(Config.Invite, string.char(68,105,115,99,111,114,100,32,45,32,77,105,115,115,105,110,103,32,73,110,118,105,116,101))

		local Discord = {
			Type = string.char(68,105,115,99,111,114,100),
			Config = Config
		}


		local DiscordFrame = Components.Element(string.char(76,111,97,100,105,110,103,46,46,46), "", self.Container, true, Config)
		DiscordFrame.LabelHolder.Size = UDim2.new(1, -150, 0, 0)
		DiscordFrame.LabelHolder.Position = UDim2.new(0, 55, 0, 0)
		DiscordFrame.DescLabel.Visible = false


        local IconContainer = New(string.char(70,114,97,109,101), {
            Name = string.char(73,99,111,110,67,111,110,116,97,105,110,101,114),
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.new(0, 10, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            Parent = DiscordFrame.Frame,
        }, {
            New(string.char(85,73,67,111,114,110,101,114), { CornerRadius = UDim.new(0, 8) }),
            New(string.char(85,73,83,116,114,111,107,101), {
                Thickness = 1,
                ThemeTag = { Color = string.char(69,108,101,109,101,110,116,66,111,114,100,101,114) },
            }),
        })

        local ServerIcon = New(string.char(73,109,97,103,101,76,97,98,101,108), {
            Name = string.char(83,101,114,118,101,114,73,99,111,110),
            Size = UDim2.fromScale(0.85, 0.85),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "",
            Parent = IconContainer,
        }, {
            New(string.char(85,73,67,111,114,110,101,114), { CornerRadius = UDim.new(0, 6) }),
        })


        local MemberLabel = New(string.char(84,101,120,116,76,97,98,101,108), {
            Name = string.char(77,101,109,98,101,114,76,97,98,101,108),
            TextSize = 11,
            FontFace = resolveFont(Library.Font),
            Text = string.char(76,111,97,100,105,110,103,46,46,46),
            TextColor3 = Color3.fromRGB(200, 200, 200),
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2.new(1, -80, 0.5, 0),
            AnchorPoint = Vector2.new(1, 0.5),
            Parent = DiscordFrame.Frame,
        })


		local JoinButton = New(string.char(84,101,120,116,66,117,116,116,111,110), {
			Size = UDim2.fromOffset(55, 24),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.88,
			Text = string.char(74,111,105,110),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 12,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.Medium),
			Parent = DiscordFrame.Frame,
			AutoButtonColor = false,
			ThemeTag = {
				BackgroundColor3 = string.char(69,108,101,109,101,110,116),
			},
		}, {
			New(string.char(85,73,67,111,114,110,101,114), { CornerRadius = UDim.new(0, 6) }),
		})

		Creator.AddSignal(JoinButton.MouseEnter, function()
			TweenService:Create(JoinButton, TweenInfo.new(0.15), {
				BackgroundTransparency = 0.82
			}):Play()
		end)
		Creator.AddSignal(JoinButton.MouseLeave, function()
			TweenService:Create(JoinButton, TweenInfo.new(0.15), {
				BackgroundTransparency = 0.88
			}):Play()
		end)


		Creator.AddSignal(JoinButton.MouseButton1Click, function()
			if setclipboard then
				setclipboard(Config.Invite)
			end
			Library:Notify({
				Title = string.char(68,105,115,99,111,114,100),
				Content = string.char(73,110,118,105,116,101,32,108,105,110,107,32,99,111,112,105,101,100,33),
				Duration = 2,
			})
		end)


        task.spawn(function()
            local InviteCode = Config.Invite:match(string.char(100,105,115,99,111,114,100,37,46,103,103,47,40,91,37,119,37,45,95,93,43,41))
                or Config.Invite:match(string.char(100,105,115,99,111,114,100,37,46,99,111,109,47,105,110,118,105,116,101,47,40,91,37,119,37,45,95,93,43,41))
                or Config.Invite:match(string.char(100,105,115,99,111,114,100,97,112,112,37,46,99,111,109,47,105,110,118,105,116,101,47,40,91,37,119,37,45,95,93,43,41))
                or Config.Invite:match(string.char(47,40,91,37,119,37,45,95,93,43,41,36))
                or Config.Invite:match(string.char(40,91,37,119,37,45,95,93,43,41,36))
                or Config.Invite

            local http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            if not http then
                warn(string.char(69,120,112,108,111,105,116,32,100,111,101,115,32,110,111,116,32,115,117,112,112,111,114,116,32,72,84,84,80,32,114,101,113,117,101,115,116,115))
                DiscordFrame:SetTitle(string.char(68,105,115,99,111,114,100,32,69,114,114,111,114))
                DiscordFrame:SetDesc(string.char(69,120,112,108,111,105,116,32,100,111,101,115,32,110,111,116,32,115,117,112,112,111,114,116,32,72,84,84,80,32,114,101,113,117,101,115,116,115,46))
                return
            end

            local url = string.char(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,99,111,109,47,97,112,105,47,118,49,48,47,105,110,118,105,116,101,115,47) .. InviteCode .. string.char(63,119,105,116,104,95,99,111,117,110,116,115,61,116,114,117,101)
            local success, response = pcall(function()
                return http({ Url = url, Method = "GET" })
            end)

            if not success or response.StatusCode ~= 200 then
                warn(string.char(82,101,113,117,101,115,116,32,101,114,114,111,114,58), response and response.StatusCode)
                DiscordFrame:SetTitle(string.char(68,105,115,99,111,114,100,32,69,114,114,111,114))
                DiscordFrame:SetDesc(string.char(70,97,105,108,101,100,32,116,111,32,102,101,116,99,104,32,115,101,114,118,101,114,32,105,110,102,111,46,32,40) .. tostring(response and response.StatusCode or string.char(85,110,107,110,111,119,110)) .. ")")
                return
            end

            local data
            local success_json = pcall(function()
                data = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101)):JSONDecode(response.Body)
            end)

            if success_json and data and data.guild then
                DiscordFrame:SetTitle(data.guild.name)


                if data.approximate_member_count then
                    local count = data.approximate_member_count
                    if count >= 1000000 then
                        MemberLabel.Text = string.format(string.char(37,46,49,102,77,32,109,101,109,98,101,114,115), count / 1000000)
                    elseif count >= 1000 then
                        MemberLabel.Text = string.format(string.char(37,46,49,102,75,32,109,101,109,98,101,114,115), count / 1000)
                    else
                        MemberLabel.Text = tostring(count) .. string.char(32,109,101,109,98,101,114,115)
                    end
                else
                    MemberLabel.Text = string.char(74,111,105,110,32,110,111,119)
                end


                if data.guild.icon then
                    local iconUrl = string.format(string.char(104,116,116,112,115,58,47,47,99,100,110,46,100,105,115,99,111,114,100,97,112,112,46,99,111,109,47,105,99,111,110,115,47,37,115,47,37,115,46,112,110,103,63,115,105,122,101,61,50,53,54), data.guild.id, data.guild.icon)
                    local successIcon, asset = pcall(function()
                        return Library:GetCustomAsset(iconUrl)
                    end)

                    if successIcon and asset and asset ~= "" then
                        ServerIcon.Image = asset
                        IconContainer.Visible = true
                        DiscordFrame.LabelHolder.Position = UDim2.fromOffset(55, 0)


                        ServerIcon.ImageTransparency = 1
                        TweenService:Create(ServerIcon, TweenInfo.new(0.25), {
                            ImageTransparency = 0
                       	}):Play()
                    end
                end
            else
                DiscordFrame:SetTitle(string.char(68,105,115,99,111,114,100))
                MemberLabel.Text = string.char(73,110,118,97,108,105,100,32,105,110,118,105,116,101)
            end
        end)

		Library.Options[Idx] = Discord
		return Discord
	end

	return Element
end)()

return ElementsTable

local Creator =
local ElementsTable =
local Library =
local RunService = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))

local Elements = {}
Elements.__index = Elements
Elements.__namecall = function(Table, Key, ...)
	return Elements[Key](...)
end

for _, ElementComponent in pairs(ElementsTable) do
	Elements["Add" .. ElementComponent.__type] = function(self, Idx, Config)
		ElementComponent.Container = self.Container
		ElementComponent.Type = self.Type
		ElementComponent.ScrollFrame = self.ScrollFrame
		ElementComponent.Library = Library

		return ElementComponent:New(Idx, Config, self)
	end
end

function Elements:AddSplit()
	local New = Creator.New
	local SplitContainer = {}

	local SplitFrame = New(string.char(70,114,97,109,101), {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		Parent = self.Container,
		LayoutOrder = 7,
	}, {
		New(string.char(85,73,76,105,115,116,76,97,121,111,117,116), {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
	})

	local LeftContainer = New(string.char(70,114,97,109,101), {
		Size = UDim2.new(0.5, -2.5, 0, 0),
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		ClipsDescendants = true,
	})

	local RightContainer = New(string.char(70,114,97,109,101), {
		Size = UDim2.new(0.5, -2.5, 0, 0),
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		ClipsDescendants = true,
	})

	LeftContainer.Parent = SplitFrame
	RightContainer.Parent = SplitFrame

	local leftElement = nil
	local rightElement = nil

	local function updateSizes()
		local leftHeight = leftElement and leftElement.Frame and leftElement.Frame.AbsoluteSize.Y or 0
		local rightHeight = rightElement and rightElement.Frame and rightElement.Frame.AbsoluteSize.Y or 0
		local maxHeight = math.max(leftHeight, rightHeight)

		if maxHeight > 0 then
			LeftContainer.Size = UDim2.new(0.5, -2.5, 0, maxHeight)
			RightContainer.Size = UDim2.new(0.5, -2.5, 0, maxHeight)
			SplitFrame.Size = UDim2.new(1, 0, 0, maxHeight)
		end
	end

	local LeftSection = {
		Type = string.char(83,101,99,116,105,111,110),
		Container = LeftContainer,
		ScrollFrame = self.ScrollFrame,
		HasElement = false,
		Parent = self,
	}

	local RightSection = {
		Type = string.char(83,101,99,116,105,111,110),
		Container = RightContainer,
		ScrollFrame = self.ScrollFrame,
		HasElement = false,
		Parent = self,
	}

	for _, ElementComponent in pairs(ElementsTable) do
		LeftSection["Add" .. ElementComponent.__type] = function(self, Idx, Config)
			if LeftSection.HasElement then
				warn((function()local s=""for _,v in ipairs{83,112,108,105,116,32,115,101,99,116,105,111,110,32,97,108,114,101,97,100,121,32,104,97,115,32,97,32,108,101,102,116,32,101,108,101,109,101,110,116,46,32,79,110,108,121,32,111,110,101,32,101,108,101,109,101,110,116,32,112,101,114,32,115,105,100,101,32,105,115,32,97,108,108,111,119,101,100,46}do s=s..string.char(v)end;return s end)())
				return nil
			end
			local configCopy = {}
			for k, v in pairs(Config or {}) do
				configCopy[k] = v
			end
			configCopy.Description = nil
			ElementComponent.Container = LeftContainer
			ElementComponent.Type = string.char(83,101,99,116,105,111,110)
			ElementComponent.ScrollFrame = LeftSection.ScrollFrame
			ElementComponent.Library = Library
			local element = ElementComponent:New(Idx, configCopy, LeftSection)
			if element and element.Frame then
				element.Frame.Size = UDim2.new(1, 0, 0, 0)
				Creator.AddSignal(element.Frame:GetPropertyChangedSignal(string.char(65,98,115,111,108,117,116,101,83,105,122,101)), updateSizes)
				if element.Elements then
					if element.Elements.DescLabel then
						element.Elements.DescLabel.Visible = false
						element.Elements.DescLabel.Text = ""
						element.Elements.DescLabel.Size = UDim2.new(0, 0, 0, 0)
					end
					if element.Elements.LabelHolder then
						task.wait()
						if element.Elements.DescLabel and element.Elements.DescLabel.Parent == element.Elements.LabelHolder then
							element.Elements.DescLabel:Destroy()
						end
					end
				end
				if element.SetDesc then
					element:SetDesc("")
				end
				if element.Type == string.char(83,108,105,100,101,114) and element.Elements and element.Elements.Frame then
					task.wait()
					for _, child in pairs(element.Elements.Frame:GetChildren()) do
						if child:IsA(string.char(70,114,97,109,101)) then
							local sizeConstraint = child:FindFirstChild(string.char(85,73,83,105,122,101,67,111,110,115,116,114,97,105,110,116))
							if sizeConstraint and (sizeConstraint.MaxSize.X == 150 or sizeConstraint.MaxSize.X == 130 or sizeConstraint.MaxSize.X == 100) then
								sizeConstraint.MaxSize = Vector2.new(100, math.huge)
							end
						end
					end
					if element.Elements.DescLabel then
						element.Elements.DescLabel.Size = UDim2.new(1, -120, 0, 14)
					end
				end
			end
			leftElement = element
			LeftSection.HasElement = true
			updateSizes()
			return element
		end
		RightSection["Add" .. ElementComponent.__type] = function(self, Idx, Config)
			if RightSection.HasElement then
				warn((function()local s=""for _,v in ipairs{83,112,108,105,116,32,115,101,99,116,105,111,110,32,97,108,114,101,97,100,121,32,104,97,115,32,97,32,114,105,103,104,116,32,101,108,101,109,101,110,116,46,32,79,110,108,121,32,111,110,101,32,101,108,101,109,101,110,116,32,112,101,114,32,115,105,100,101,32,105,115,32,97,108,108,111,119,101,100,46}do s=s..string.char(v)end;return s end)())
				return nil
			end
			local configCopy = {}
			for k, v in pairs(Config or {}) do
				configCopy[k] = v
			end
			configCopy.Description = nil
			ElementComponent.Container = RightContainer
			ElementComponent.Type = string.char(83,101,99,116,105,111,110)
			ElementComponent.ScrollFrame = RightSection.ScrollFrame
			ElementComponent.Library = Library
			local element = ElementComponent:New(Idx, configCopy, RightSection)
			if element and element.Frame then
				element.Frame.Size = UDim2.new(1, 0, 0, 0)
				Creator.AddSignal(element.Frame:GetPropertyChangedSignal(string.char(65,98,115,111,108,117,116,101,83,105,122,101)), updateSizes)
				if element.Elements then
					if element.Elements.DescLabel then
						element.Elements.DescLabel.Visible = false
						element.Elements.DescLabel.Text = ""
						element.Elements.DescLabel.Size = UDim2.new(0, 0, 0, 0)
					end
					if element.Elements.LabelHolder then
						task.wait()
						if element.Elements.DescLabel and element.Elements.DescLabel.Parent == element.Elements.LabelHolder then
							element.Elements.DescLabel:Destroy()
						end
					end
				end
				if element.SetDesc then
					element:SetDesc("")
				end
				if element.Type == string.char(83,108,105,100,101,114) and element.Elements and element.Elements.Frame then
					task.wait()
					for _, child in pairs(element.Elements.Frame:GetChildren()) do
						if child:IsA(string.char(70,114,97,109,101)) then
							local sizeConstraint = child:FindFirstChild(string.char(85,73,83,105,122,101,67,111,110,115,116,114,97,105,110,116))
							if sizeConstraint and (sizeConstraint.MaxSize.X == 150 or sizeConstraint.MaxSize.X == 130 or sizeConstraint.MaxSize.X == 100) then
								sizeConstraint.MaxSize = Vector2.new(100, math.huge)
							end
						end
					end
					if element.Elements.DescLabel then
						element.Elements.DescLabel.Size = UDim2.new(1, -120, 0, 14)
					end
				end
			end
			rightElement = element
			RightSection.HasElement = true
			updateSizes()
			return element
		end
	end

	setmetatable(LeftSection, Elements)
	setmetatable(RightSection, Elements)

	SplitContainer.Left = LeftSection
	SplitContainer.Right = RightSection
	SplitContainer.Frame = SplitFrame

	return SplitContainer
end

Library.Elements = Elements

if RunService:IsStudio() then
	makefolder = function(...) return end;
	makefile = function(...) return end;
	isfile = function(...) return false end;
	isfolder = function(...) return false end;
	readfile = function(...) return "" end;
	writefile = function(...) return end;
	listfiles = function (...) return {} end;
end

return Elements

local httpService = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local RunService = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))
local SaveManager = {} do

	SaveManager.Folder = (string.char(37,115,37,115)):format(string.char(70,108,117,101,110,116), string.char(83,101,116,116,105,110,103,115))

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

				return { type = string.char(84,111,103,103,108,101), idx = idx, value = object.Value }

			end,

			Load = function(idx, data)

				if SaveManager.Options[idx] then

					SaveManager.Options[idx]:SetValue(data.value)

				end

			end,

		},

		Slider = {

			Save = function(idx, object)

				return { type = string.char(83,108,105,100,101,114), idx = idx, value = tostring(object.Value) }

			end,

			Load = function(idx, data)

				if SaveManager.Options[idx] then

					SaveManager.Options[idx]:SetValue(data.value)

				end

			end,

		},

		Dropdown = {

			Save = function(idx, object)

				return { type = string.char(68,114,111,112,100,111,119,110), idx = idx, value = object.Value, multi = object.Multi }

			end,

			Load = function(idx, data)

				if SaveManager.Options[idx] then

					SaveManager.Options[idx]:SetValue(data.value)

				end

			end,

		},

		Colorpicker = {

			Save = function(idx, object)

				return { type = string.char(67,111,108,111,114,112,105,99,107,101,114), idx = idx, value = object.Value:ToHex(), transparency = object.Transparency }

			end,

			Load = function(idx, data)

				if SaveManager.Options[idx] then

					SaveManager.Options[idx]:SetValueRGB(Color3.fromHex(data.value), data.transparency)

				end

			end,

		},

		Keybind = {

			Save = function(idx, object)

				return { type = string.char(75,101,121,98,105,110,100), idx = idx, mode = object.Mode, key = object.Value }

			end,

			Load = function(idx, data)

				if SaveManager.Options[idx] then

					SaveManager.Options[idx]:SetValue(data.key, data.mode)

				end

			end,

		},

		Input = {

			Save = function(idx, object)

				return { type = string.char(73,110,112,117,116), idx = idx, text = object.Value }

			end,

			Load = function(idx, data)

				if SaveManager.Options[idx] and type(data.text) == string.char(115,116,114,105,110,103) then

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

			return false, string.char(110,111,32,99,111,110,102,105,103,32,102,105,108,101,32,105,115,32,115,101,108,101,99,116,101,100)

		end

		local fullPath = self.Folder .. "/" .. name .. string.char(46,106,115,111,110)

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

			return false, string.char(102,97,105,108,101,100,32,116,111,32,101,110,99,111,100,101,32,100,97,116,97)

		end

		writefile(fullPath, encoded)

		return true

	end

	if not RunService:IsStudio() then

		function SaveManager:Load(name)

			if (not name) then

				return false, string.char(110,111,32,99,111,110,102,105,103,32,102,105,108,101,32,105,115,32,115,101,108,101,99,116,101,100)

			end

			local file = self.Folder .. "/" .. name .. string.char(46,106,115,111,110)

			if not isfile(file) then return false, string.char(67,114,101,97,116,101,32,67,111,110,102,105,103,32,83,97,118,101,32,70,105,108,101) end

			local success, decoded = pcall(httpService.JSONDecode, httpService, readfile(file))

			if not success then return false, string.char(100,101,99,111,100,101,32,101,114,114,111,114) end

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

			string.char(73,110,116,101,114,102,97,99,101,84,104,101,109,101), string.char(65,99,114,121,108,105,99,84,111,103,103,108,101), string.char(84,114,97,110,115,112,97,114,101,110,116,84,111,103,103,108,101), string.char(77,101,110,117,75,101,121,98,105,110,100)

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

			if file:sub(-5) == string.char(46,106,115,111,110) then

				local pos = file:find(string.char(46,106,115,111,110), 1, true)

				local start = pos

				local char = file:sub(pos, pos)

				while char ~= "/" and char ~= "\\" and char ~= "" do

					pos = pos - 1

					char = file:sub(pos, pos)

				end

				if char == "/" or char == "\\" then

					local name = file:sub(pos + 1, start - 1)

					if name ~= string.char(111,112,116,105,111,110,115) then

						table.insert(out, name)

					end

				end

			end

		end

		return out

	end

	if not RunService:IsStudio() then

		function SaveManager:LoadAutoloadConfig()

			if isfile(self.Folder .. string.char(47,97,117,116,111,108,111,97,100,46,116,120,116)) then

				local name = readfile(self.Folder .. string.char(47,97,117,116,111,108,111,97,100,46,116,120,116))

				local success, err = self:Load(name)

				if not success then

					return self.Library:Notify({

						Title = string.char(73,110,116,101,114,102,97,99,101),

						Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

						SubContent = string.char(70,97,105,108,101,100,32,116,111,32,108,111,97,100,32,97,117,116,111,108,111,97,100,32,99,111,110,102,105,103,58,32) .. err,

						Duration = 7

					})

				end

				self.Library:Notify({

					Title = string.char(73,110,116,101,114,102,97,99,101),

					Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

					SubContent = string.format(string.char(65,117,116,111,32,108,111,97,100,101,100,32,99,111,110,102,105,103,32,37,113), name),

					Duration = 7

				})

			end

		end

	end

	function SaveManager:BuildConfigSection(tab)

		assert(self.Library, string.char(77,117,115,116,32,115,101,116,32,83,97,118,101,77,97,110,97,103,101,114,46,76,105,98,114,97,114,121))

		local section = tab:AddSection(string.char(67,111,110,102,105,103,117,114,97,116,105,111,110), string.char(115,101,116,116,105,110,103,115))

		section:AddInput(string.char(83,97,118,101,77,97,110,97,103,101,114,95,67,111,110,102,105,103,78,97,109,101),    { Title = string.char(67,111,110,102,105,103,32,110,97,109,101) })

		section:AddDropdown(string.char(83,97,118,101,77,97,110,97,103,101,114,95,67,111,110,102,105,103,76,105,115,116), { Title = string.char(67,111,110,102,105,103,32,108,105,115,116), Values = self:RefreshConfigList(), AllowNull = true })

		section:AddButton({

			Title = string.char(67,114,101,97,116,101,32,99,111,110,102,105,103),

			Callback = function()

				local name = SaveManager.Options.SaveManager_ConfigName.Value

				if name:gsub(" ", "") == "" then

					return self.Library:Notify({

						Title = string.char(73,110,116,101,114,102,97,99,101),

						Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

						SubContent = string.char(73,110,118,97,108,105,100,32,99,111,110,102,105,103,32,110,97,109,101,32,40,101,109,112,116,121,41),

						Duration = 7

					})

				end

				local success, err = self:Save(name)

				if not success then

					return self.Library:Notify({

						Title = string.char(73,110,116,101,114,102,97,99,101),

						Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

						SubContent = string.char(70,97,105,108,101,100,32,116,111,32,115,97,118,101,32,99,111,110,102,105,103,58,32) .. err,

						Duration = 7

					})

				end

				self.Library:Notify({

					Title = string.char(73,110,116,101,114,102,97,99,101),

					Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

					SubContent = string.format(string.char(67,114,101,97,116,101,100,32,99,111,110,102,105,103,32,37,113), name),

					Duration = 7

				})

				SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())

				SaveManager.Options.SaveManager_ConfigList:SetValue(nil)

			end

		})

		section:AddButton({Title = string.char(76,111,97,100,32,99,111,110,102,105,103), Callback = function()

			local name = SaveManager.Options.SaveManager_ConfigList.Value

			local success, err = self:Load(name)

			if not success then

				return self.Library:Notify({

					Title = string.char(73,110,116,101,114,102,97,99,101),

					Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

					SubContent = string.char(70,97,105,108,101,100,32,116,111,32,108,111,97,100,32,99,111,110,102,105,103,58,32) .. err,

					Duration = 7

				})

			end

			self.Library:Notify({

				Title = string.char(73,110,116,101,114,102,97,99,101),

				Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

				SubContent = string.format(string.char(76,111,97,100,101,100,32,99,111,110,102,105,103,32,37,113), name),

				Duration = 7

			})

		end})

		section:AddButton({Title = string.char(83,97,118,101,32,99,111,110,102,105,103), Callback = function()

			local name = SaveManager.Options.SaveManager_ConfigList.Value

			local success, err = self:Save(name)

			if not success then

				return self.Library:Notify({

					Title = string.char(73,110,116,101,114,102,97,99,101),

					Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

					SubContent = string.char(70,97,105,108,101,100,32,116,111,32,111,118,101,114,119,114,105,116,101,32,99,111,110,102,105,103,58,32) .. err,

					Duration = 7

				})

			end

			self.Library:Notify({

				Title = string.char(73,110,116,101,114,102,97,99,101),

				Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

				SubContent = string.format(string.char(79,118,101,114,119,114,111,116,101,32,99,111,110,102,105,103,32,37,113), name),

				Duration = 7

			})

		end})

		section:AddButton({Title = string.char(82,101,102,114,101,115,104,32,108,105,115,116), Callback = function()

			SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())

			SaveManager.Options.SaveManager_ConfigList:SetValue(nil)

		end})

		local AutoloadButton

		AutoloadButton = section:AddButton({Title = string.char(83,101,116,32,97,115,32,97,117,116,111,108,111,97,100), Description = string.char(67,117,114,114,101,110,116,32,97,117,116,111,108,111,97,100,32,99,111,110,102,105,103,58,32,110,111,110,101), Callback = function()

			local name = SaveManager.Options.SaveManager_ConfigList.Value

			writefile(self.Folder .. string.char(47,97,117,116,111,108,111,97,100,46,116,120,116), name)

			AutoloadButton:SetDesc(string.char(67,117,114,114,101,110,116,32,97,117,116,111,108,111,97,100,32,99,111,110,102,105,103,58,32) .. name)

			self.Library:Notify({

				Title = string.char(73,110,116,101,114,102,97,99,101),

				Content = string.char(67,111,110,102,105,103,32,108,111,97,100,101,114),

				SubContent = string.format(string.char(83,101,116,32,37,113,32,116,111,32,97,117,116,111,32,108,111,97,100), name),

				Duration = 7

			})

		end})

		if isfile(self.Folder .. string.char(47,97,117,116,111,108,111,97,100,46,116,120,116)) then

			local name = readfile(self.Folder .. string.char(47,97,117,116,111,108,111,97,100,46,116,120,116))

			AutoloadButton:SetDesc(string.char(67,117,114,114,101,110,116,32,97,117,116,111,108,111,97,100,32,99,111,110,102,105,103,58,32) .. name)

		end

		SaveManager:SetIgnoreIndexes({ string.char(83,97,118,101,77,97,110,97,103,101,114,95,67,111,110,102,105,103,76,105,115,116), string.char(83,97,118,101,77,97,110,97,103,101,114,95,67,111,110,102,105,103,78,97,109,101) })

	end

	if not RunService:IsStudio() then

		SaveManager:BuildFolderTree()

	end

end

return SaveManager

local Acrylic =
local UserInputService = game:GetService(string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local RunService = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))
local httpService = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local GUI = nil
local CoreGui = game:GetService(string.char(67,111,114,101,71,117,105))
if CoreGui then
	GUI = CoreGui:FindFirstChild(string.char(82,111,98,108,111,120,71,117,105)) or CoreGui
end

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled
local fischbypass = game.GameId == 5750914919

local Components =
local Library =

local InterfaceManager = {} do
	InterfaceManager.Folder = (string.char(37,115,37,115)):format(string.char(70,108,117,101,110,116), string.char(83,101,116,116,105,110,103,115))

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

		writefile(self.Folder .. string.char(47,111,112,116,105,111,110,115,46,106,115,111,110), httpService:JSONEncode(InterfaceManager.Settings))

	end

	function InterfaceManager:LoadSettings()

		local path = self.Folder .. string.char(47,111,112,116,105,111,110,115,46,106,115,111,110)

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

		assert(self.Library, string.char(77,117,115,116,32,115,101,116,32,73,110,116,101,114,102,97,99,101,77,97,110,97,103,101,114,46,76,105,98,114,97,114,121))

		local Library = self.Library

		local Settings = InterfaceManager.Settings

		InterfaceManager:LoadSettings()

		local section = tab:AddSection(string.char(73,110,116,101,114,102,97,99,101), string.char(109,111,110,105,116,111,114))

		local InterfaceTheme = section:AddDropdown(string.char(73,110,116,101,114,102,97,99,101,84,104,101,109,101), {

			Title = string.char(84,104,101,109,101),

			Description = string.char(67,104,97,110,103,101,115,32,116,104,101,32,105,110,116,101,114,102,97,99,101,32,116,104,101,109,101,46),

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

			section:AddToggle(string.char(65,99,114,121,108,105,99,84,111,103,103,108,101), {

				Title = string.char(65,99,114,121,108,105,99),

				Description = string.char(84,104,101,32,98,108,117,114,114,101,100,32,98,97,99,107,103,114,111,117,110,100,32,114,101,113,117,105,114,101,115,32,103,114,97,112,104,105,99,32,113,117,97,108,105,116,121,32,56,43),

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

		section:AddSlider(string.char(87,105,110,100,111,119,84,114,97,110,115,112,97,114,101,110,99,121), {

			Title = string.char(87,105,110,100,111,119,32,84,114,97,110,115,112,97,114,101,110,99,121),

			Description = string.char(65,100,106,117,115,116,115,32,116,104,101,32,119,105,110,100,111,119,32,116,114,97,110,115,112,97,114,101,110,99,121,46),

			Default = 1,

			Min = 0,

			Max = 3,

			Rounding = 1,

			Callback = function(Value)

				Library:SetWindowTransparency(Value)

			end

		})

		local MenuKeybind = section:AddKeybind(string.char(77,101,110,117,75,101,121,98,105,110,100), { Title = string.char(77,105,110,105,109,105,122,101,32,66,105,110,100), Default = Library.MinimizeKey.Name or Settings.MenuKeybind })

		MenuKeybind:OnChanged(function()

			Settings.MenuKeybind = MenuKeybind.Value

			InterfaceManager:SaveSettings()

		end)

		Library.MinimizeKeybind = MenuKeybind

	end

end

Library.CreateWindow = function(self, Config)

	assert(Config.Title, string.char(87,105,110,100,111,119,32,45,32,77,105,115,115,105,110,103,32,84,105,116,108,101))

	if Library.Window then

		print(string.char(89,111,117,32,99,97,110,110,111,116,32,99,114,101,97,116,101,32,109,111,114,101,32,116,104,97,110,32,111,110,101,32,119,105,110,100,111,119,46))

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

	Library.Theme = Config.Theme or string.char(68,97,114,107)
	Library.Font = Config.Font or Library.Font
	Library.Creator.RandomNames = Config.RandomNames or false

	if Config.BackgroundImage == nil then
		Config.BackgroundImage = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,51,49,57,54,49,49,51,54,50,56)
	end

	if Config.BackgroundTransparency == nil then
		Config.BackgroundTransparency = 0.5
	end

	if Config.Acrylic then

		Acrylic.init()

	end

	local Icon = Config.Icon

	if not fischbypass then

		local resolvedIcon = Library:GetIcon(Icon)
		if resolvedIcon and resolvedIcon ~= "" then

			Icon = resolvedIcon

		end

		if Icon == "" or Icon == nil then

			Icon = nil

		end

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

local Lighting = game:GetService(string.char(76,105,103,104,116,105,110,103))
local RunService = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))
local LocalPlayer = game:GetService(string.char(80,108,97,121,101,114,115)).LocalPlayer
local UserInputService = game:GetService(string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local TweenService = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
local TextService = game:GetService(string.char(84,101,120,116,83,101,114,118,105,99,101))
local Camera = game:GetService(string.char(87,111,114,107,115,112,97,99,101)).CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local httpService = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local RenderStepped = RunService.RenderStepped
local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end

local Themes =
local Library =
local Flipper =
local Creator =
local Acrylic =
local Components =
local ElementsTable =
local Elements =
local SaveManager =
local InterfaceManager =

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
		targetParent = game:GetService(string.char(67,111,114,101,71,117,105))
	end
end)

if not targetParent then
	targetParent = LocalPlayer:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))
end

local guiName = ""
for _ = 1, math.random(12, 20) do guiName = guiName .. string.char(math.random(97, 122)) end

local GUI = New(string.char(83,99,114,101,101,110,71,117,105), {
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
		local _, i = Event:find(string.char(58,37,100,43,58,32))

		if not i then
			return Library:Notify({
				Title = string.char(73,110,116,101,114,102,97,99,101),
				Content = string.char(67,97,108,108,98,97,99,107,32,101,114,114,111,114),
				SubContent = Event,
				Duration = 5,
			})
		end

		return Library:Notify({
			Title = string.char(73,110,116,101,114,102,97,99,101),
			Content = string.char(67,97,108,108,98,97,99,107,32,101,114,114,111,114),
			SubContent = Event:sub(i + 1),
			Duration = 5,
		})
	end
end
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

	local iconAsset = Library:GetIcon(string.char(109,111,111,110))

	if type(Config.Icon) == string.char(115,116,114,105,110,103) and Config.Icon ~= "" then

		pcall(function()

			local resolved = Library:GetIcon(Config.Icon)

			if resolved and resolved ~= "" then

				iconAsset = resolved

			elseif string.match(Config.Icon, string.char(94,114,98,120,97,115,115,101,116,105,100,58,47,47,37,100,43,36)) then

				iconAsset = Config.Icon

			end

		end)

	end

	local useAcrylic = (Config.Acrylic == true)

	local cornerRadius = tonumber(Config.Corner)

	local backgroundTransparency = (typeof(Config.Transparency) == string.char(110,117,109,98,101,114)) and math.clamp(Config.Transparency, 0, 1) or 0

	local draggableWhole = (Config.Draggable == true)

	local holder

	local function createButton(isDesktop)

		return New(string.char(84,101,120,116,66,117,116,116,111,110), {

			Name = string.char(77,105,110,105,109,105,122,101,66,117,116,116,111,110),

			Size = UDim2.new(1, 0, 1, 0),

			BorderSizePixel = 0,

			BackgroundTransparency = backgroundTransparency or 0,

			AutoButtonColor = true,

			ThemeTag = {

				BackgroundColor3 = string.char(69,108,101,109,101,110,116),

			},

		}, {

			New(string.char(85,73,67,111,114,110,101,114), { CornerRadius = UDim.new(0, cornerRadius or (isDesktop and 14 or 12)) }),

			New(string.char(85,73,83,116,114,111,107,101), {

				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,

				Transparency = isDesktop and 0.6 or 0.7,

				Thickness = isDesktop and 2 or 1.5,

				ThemeTag = {

					Color = string.char(69,108,101,109,101,110,116,66,111,114,100,101,114),

				},

			}),

			New(string.char(73,109,97,103,101,76,97,98,101,108), {

				Name = string.char(73,99,111,110),

				Image = iconAsset,

				Size = UDim2.new(0.8, 0, 0.8, 0),

				Position = UDim2.new(0.5, 0, 0.5, 0),

				AnchorPoint = Vector2.new(0.5, 0.5),

				BackgroundTransparency = 1,

				ThemeTag = {

					ImageColor3 = string.char(84,101,120,116),

				},

			}, {

				New(string.char(85,73,65,115,112,101,99,116,82,97,116,105,111,67,111,110,115,116,114,97,105,110,116), { AspectRatio = 1, AspectType = Enum.AspectType.FitWithinMaxSize }),

				New(string.char(85,73,67,111,114,110,101,114), { CornerRadius = UDim.new(0, 0) })

			}),

		})

	end

	if isMobile then

		holder = New(string.char(70,114,97,109,101), {

			Name = string.char(70,108,117,101,110,116,77,105,110,105,109,105,122,101,114),

			Parent = parentGui,

			Size = Config.Size or UDim2.fromOffset(36, 36),

			Position = Config.Position or UDim2.new(0.45, 0, 0.025, 0),

			BackgroundTransparency = 1,

			ZIndex = 999999999,

			Visible = (Config.Visible ~= false),

		})

	else

		holder = New(string.char(70,114,97,109,101), {

			Name = string.char(70,108,117,101,110,116,77,105,110,105,109,105,122,101,114),

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

				if descendant.ClassName == string.char(85,73,67,111,114,110,101,114) then

					descendant.CornerRadius = desiredCorner

				elseif descendant.ClassName == string.char(73,109,97,103,101,76,97,98,101,108) then

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

	local button = holder:FindFirstChildOfClass(string.char(84,101,120,116,66,117,116,116,111,110))

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
	if Library.Window and table.find(Library.Themes, Value) then
		Library.Theme = Value
		Creator.Theme = Value
		Creator.UpdateTheme()
		Library:RefreshOpenDropdowns()
	end
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
		local background = Library.Window.AcrylicPaint.Frame:FindFirstChild(string.char(66,97,99,107,103,114,111,117,110,100))
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
			local background = Library.Window.AcrylicPaint.Frame:FindFirstChild(string.char(66,97,99,107,103,114,111,117,110,100))
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

local MinimizeButton = New(string.char(84,101,120,116,66,117,116,116,111,110), {

	BackgroundColor3 = Color3.fromRGB(25, 25, 30),

	Size = UDim2.new(1, 0, 1, 0),

	BorderSizePixel = 0,

	BackgroundTransparency = 0.05,

}, {

	New(string.char(85,73,67,111,114,110,101,114), {

		CornerRadius = UDim.new(0, 14),

	}),

	New(string.char(85,73,71,114,97,100,105,101,110,116), {

		Color = ColorSequence.new{

			ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),

			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))

		},

		Rotation = 45,

	}),

	New(string.char(85,73,83,116,114,111,107,101), {

		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,

		Color = Color3.fromRGB(100, 150, 255),

		Transparency = 0.6,

		Thickness = 2,

	}),

	New(string.char(70,114,97,109,101), {

		BackgroundColor3 = Color3.fromRGB(100, 150, 255),

		BackgroundTransparency = 0.9,

		Size = UDim2.new(1, -6, 1, -6),

		Position = UDim2.new(0, 3, 0, 3),

		BorderSizePixel = 0,

	}, {

		New(string.char(85,73,67,111,114,110,101,114), {

			CornerRadius = UDim.new(0, 11),

		}),

	}),

	New(string.char(70,114,97,109,101), {

		BackgroundColor3 = Color3.fromRGB(255, 255, 255),

		BackgroundTransparency = 0.94,

		Size = UDim2.new(0.7, 0, 0.3, 0),

		Position = UDim2.new(0.15, 0, 0.1, 0),

		BorderSizePixel = 0,

	}, {

		New(string.char(85,73,67,111,114,110,101,114), {

			CornerRadius = UDim.new(0, 8),

		}),

	}),

	New(string.char(73,109,97,103,101,76,97,98,101,108), {

		Image = Library:GetIcon(string.char(109,111,111,110)),

		Size = UDim2.new(0.8, 0, 0.8, 0),

		Position = UDim2.new(0.5, 0, 0.5, 0),

		AnchorPoint = Vector2.new(0.5, 0.5),

		BackgroundTransparency = 1,

		ImageColor3 = Color3.fromRGB(255, 255, 255),

		ImageTransparency = 0.1,

	}, {

		New(string.char(85,73,65,115,112,101,99,116,82,97,116,105,111,67,111,110,115,116,114,97,105,110,116), {

			AspectRatio = 1,

			AspectType = Enum.AspectType.FitWithinMaxSize,

		})

	})

})

local MobileMinimizeButton = New(string.char(84,101,120,116,66,117,116,116,111,110), {

	BackgroundColor3 = Color3.fromRGB(25, 25, 30),

	Size = UDim2.new(1, 0, 1, 0),

	BorderSizePixel = 0,

	BackgroundTransparency = 0.05,

}, {

	New(string.char(85,73,67,111,114,110,101,114), {

		CornerRadius = UDim.new(0, 12),

	}),

	New(string.char(85,73,71,114,97,100,105,101,110,116), {

		Color = ColorSequence.new{

			ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),

			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))

		},

		Rotation = 45,

	}),

	New(string.char(85,73,83,116,114,111,107,101), {

		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,

		Color = Color3.fromRGB(100, 150, 255),

		Transparency = 0.7,

		Thickness = 1.5,

	}),

	New(string.char(70,114,97,109,101), {

		BackgroundColor3 = Color3.fromRGB(100, 150, 255),

		BackgroundTransparency = 0.92,

		Size = UDim2.new(1, -4, 1, -4),

		Position = UDim2.new(0, 2, 0, 2),

		BorderSizePixel = 0,

	}, {

		New(string.char(85,73,67,111,114,110,101,114), {

			CornerRadius = UDim.new(0, 10),

		}),

	}),

	New(string.char(73,109,97,103,101,76,97,98,101,108), {

		Image = Library:GetIcon(string.char(109,111,111,110)),

		Size = UDim2.new(0.8, 0, 0.8, 0),

		Position = UDim2.new(0.5, 0, 0.5, 0),

		AnchorPoint = Vector2.new(0.5, 0.5),

		BackgroundTransparency = 1,

		ImageColor3 = Color3.fromRGB(255, 255, 255),

		ImageTransparency = 0.1,

	}, {

		New(string.char(85,73,65,115,112,101,99,116,82,97,116,105,111,67,111,110,115,116,114,97,105,110,116), {

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

local Fluent, SaveManager, InterfaceManager, Mobile =

_G.Fluent = Fluent
_G.SaveManager = SaveManager
_G.InterfaceManager = InterfaceManager

return Fluent, SaveManager, InterfaceManager, Mobile