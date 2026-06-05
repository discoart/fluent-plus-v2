local Themes = {
	Names = {
		"Dark",
		"Darker", 
		"AMOLED",
		"Light",
		"Balloon",
		"SoftCream",
		"Aqua", 
		"Amethyst",
		"Rose",
		"Midnight",
		"Forest",
		"Sunset", 
		"Ocean",
		"Emerald",
		"Sapphire",
		"Cloud",
		"Grape",
		"Bloody",
		"Arctic",
		"Nebula"
	},
	Dark = {
		Name = "Dark",
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
		Name = "Darker",
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
		Name = "AMOLED",
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
		Name = "Light",
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
		Name = "Balloon",
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
		Name = "SoftCream",
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
		Name = "Aqua",
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
		Name = "Amethyst",
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
		Name = "Rose",
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
		Name = "Midnight",
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
		Name = "Forest",
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
		Name = "Sunset",
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
		Name = "Ocean",
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
		Name = "Emerald",
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
		Name = "Sapphire",
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
		Name = "Cloud",
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
		Name = "Grape",
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
		Name = "Bloody",
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
		Name = "Arctic",
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
		Name = "Nebula",
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

local SingleMotor = 
local GroupMotor = 
local Instant = 
local Linear = 
local Spring = 

local function isMotor(value)
	local motorType = tostring(value):match("^Motor%((.+)%)$")
	if motorType then
		return true, motorType
	else
		return false
	end
end

return {
	SingleMotor = SingleMotor,
	GroupMotor = GroupMotor,
	Instant = Instant,
	Linear = Linear,
	Spring = Spring,
	isMotor = isMotor,
}

local Flipper = 
local Library = 
local Themes = 

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

local Creator = 
local Library = 

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local function map(value, inMin, inMax, outMin, outMax)
	return (value - inMin) * (outMax - outMin) / (inMax - inMin) + outMin
end

local function viewportPointToWorld(location, distance)
	local unitRay = Workspace.CurrentCamera:ScreenPointToRay(location.X, location.Y)
	return unitRay.Origin + unitRay.Direction * distance
end

local function getOffset()
	local viewportSizeY = Workspace.CurrentCamera.ViewportSize.Y
	return map(viewportSizeY, 0, 2560, 8, 56)
end

local viewportPointToWorld, getOffset = unpack({ viewportPointToWorld, getOffset })

local BlurFolder = Instance.new("Folder")
BlurFolder.Name = tostring(math.random(1, 99))
do
	local function attachToCurrentCamera()
		local cam = Workspace.CurrentCamera
		if cam and BlurFolder.Parent ~= cam then
			BlurFolder.Parent = cam
		end
	end
	attachToCurrentCamera()
	Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(attachToCurrentCamera)
end

local function createAcrylic()
	local Part = Creator.New("Part", {
		Name = "Body",
		Color = Color3.new(0, 0, 0),
		Material = Enum.Material.Glass,
		Size = Vector3.new(1, 1, 0),
		Anchored = true,
		CanCollide = false,
		Locked = true,
		CastShadow = false,
		Transparency = 0.98,
	}, {
		Creator.New("SpecialMesh", {
			Name = "Mesh",
			MeshType = Enum.MeshType.Brick,
			Offset = Vector3.new(0, 0, -0.000001),
		}),
	})

	return Part
end

function AcrylicBlur()
	local function createAcrylicBlur(distance)
		local cleanups = {}

		distance = distance or 0.001
		local positions = {
			topLeft = Vector2.new(),
			topRight = Vector2.new(),
			bottomRight = Vector2.new(),
		}
		local model = createAcrylic()
		model.Parent = BlurFolder

		local function updatePositions(size, position)
			positions.topLeft = position
			positions.topRight = position + Vector2.new(size.X, 0)
			positions.bottomRight = position + size
		end

		local function render()
			local camera = Workspace.CurrentCamera
			if not camera then
				return
			end

			local topLeft = positions.topLeft
			local topRight = positions.topRight
			local bottomRight = positions.bottomRight

			local topLeft3D = viewportPointToWorld(topLeft, distance)
			local topRight3D = viewportPointToWorld(topRight, distance)
			local bottomRight3D = viewportPointToWorld(bottomRight, distance)

			local width = (topRight3D - topLeft3D).Magnitude
			local height = (topRight3D - bottomRight3D).Magnitude

			model.CFrame = CFrame.fromMatrix((topLeft3D + bottomRight3D) / 2, camera.CFrame.RightVector, camera.CFrame.UpVector, -camera.CFrame.LookVector)
			model.Mesh.Scale = Vector3.new(width, height, 0)
		end

		local function onChange(rbx)
			local offset = getOffset()
			local size = rbx.AbsoluteSize - Vector2.new(offset, offset)
			local position = rbx.AbsolutePosition + Vector2.new(offset / 2, offset / 2)

			updatePositions(size, position)
			task.spawn(render)
		end

		local function renderOnChange()
			local camera = Workspace.CurrentCamera
			if not camera then
				return
			end
			table.insert(cleanups, camera:GetPropertyChangedSignal("CFrame"):Connect(render))
			task.spawn(render)
		end

		model.Destroying:Connect(function()
			for _, item in cleanups do
				pcall(function()
					item:Disconnect()
				end)
			end
		end)

		renderOnChange()

		return onChange, model
	end

	return function(distance)
		local Blur = {}
		local onChange, model = createAcrylicBlur(distance)

		local comp = Creator.New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
		})

		Creator.AddSignal(comp:GetPropertyChangedSignal("AbsolutePosition"), function()
			onChange(comp)
		end)

		Creator.AddSignal(comp:GetPropertyChangedSignal("AbsoluteSize"), function()
			onChange(comp)
		end)

		Blur.AddParent = function(Parent)
			Creator.AddSignal(Parent:GetPropertyChangedSignal("Visible"), function()
				Blur.SetVisibility(Parent.Visible)
			end)
		end

		Blur.SetVisibility = function(Value)
			model.Transparency = Value and 0.98 or 1
		end

		Blur.Frame = comp
		Blur.Model = model

		return Blur
	end
end

function AcrylicPaint()
	local New = Creator.New
	local AcrylicBlur = AcrylicBlur()

	return function(props)
		local AcrylicPaint = {}

		AcrylicPaint.Frame = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 0.9,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
		}, {
			New("ImageLabel", {
				Image = "rbxassetid://8992230677",
				ScaleType = "Slice",
				SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 120, 1, 116),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				ImageColor3 = Color3.fromRGB(0, 0, 0),
				ImageTransparency = 0.7,
			}),

			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),

			New("Frame", {
				BackgroundTransparency = 0.45,
				Size = UDim2.fromScale(1, 1),
				Name = "Background",
				ThemeTag = {
					BackgroundColor3 = "AcrylicMain",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			}),

			New("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.4,
				Size = UDim2.fromScale(1, 1),
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),

				New("UIGradient", {
					Rotation = 90,
					ThemeTag = {
						Color = "AcrylicGradient",
					},
				}),
			}),

			New("ImageLabel", {
				Image = "rbxassetid://9968344105",
				ImageTransparency = 0.98,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.new(0, 128, 0, 128),
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			}),

			New("ImageLabel", {
				Image = "rbxassetid://9968344227",
				ImageTransparency = 0.9,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.new(0, 128, 0, 128),
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageTransparency = "AcrylicNoise",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			}),

			New("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ZIndex = 2,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				New("UIStroke", {
					Transparency = 0.5,
					Thickness = 1,
					ThemeTag = {
						Color = "AcrylicBorder",
					},
				}),
			}),
		})

		local Blur

		if Library.UseAcrylic then
			Blur = AcrylicBlur()
			Blur.Frame.Parent = AcrylicPaint.Frame
			AcrylicPaint.Model = Blur.Model
			AcrylicPaint.AddParent = Blur.AddParent
			AcrylicPaint.SetVisibility = Blur.SetVisibility
		end

		return AcrylicPaint
	end
end

Acrylic = {
	AcrylicBlur = AcrylicBlur(),
	CreateAcrylic = createAcrylic,
	AcrylicPaint = AcrylicPaint(),
}

function Acrylic.init()
	local baseEffect = Instance.new("DepthOfFieldEffect")
	baseEffect.FarIntensity = 0
	baseEffect.InFocusRadius = 0.1
	baseEffect.NearIntensity = 1

	local depthOfFieldDefaults = {}

	function Acrylic.Enable()
		for object, _ in pairs(depthOfFieldDefaults) do
			object.Enabled = false
		end
		baseEffect.Parent = Lighting
	end

	function Acrylic.Disable()
		for object, data in pairs(depthOfFieldDefaults) do
			object.Enabled = data.enabled
		end
		baseEffect.Parent = nil
	end

	local function registerDefaults()
		local function register(object)
			if object:IsA("DepthOfFieldEffect") then
				depthOfFieldDefaults[object] = { enabled = object.Enabled }
			end
		end

		for _, child in pairs(Lighting:GetChildren()) do
			register(child)
		end

		if Workspace.CurrentCamera then
			for _, child in pairs(Workspace.CurrentCamera:GetChildren()) do
				register(child)
			end
		end
	end

	registerDefaults()
	Acrylic.Enable()
end

return Acrylic

local Creator = 
local Library = 
local Flipper = 
local resolveFont = Creator.resolveFont

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local fischbypass
if game.GameId == 5750914919 then
	fischbypass = true
end

local Components = {
	Assets = {
		Close = Library:GetIcon("x"),
		Min = Library:GetIcon("minus"),
		Max = Library:GetIcon("maximize-2"),
		Restore = Library:GetIcon("minimize-2"),
	},
}

Components.Element = (function()
	local New = Creator.New

	local Spring = Flipper.Spring.new

	return function(Title, Desc, Parent, Hover, Options)
		local Element = {}
		local Options = Options or {}

		Element.TitleLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Title,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Element.TitleHolder = New("Frame", {
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = 2,
		}, {
			Element.TitleLabel
		})
		Creator.SetupMarquee(Element.TitleLabel)

		Element.Header = New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 0, 16),
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 5),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
		})

		if Options and Options.Icon then
			local iconImage = Options.Icon
			pcall(function()
				if Library and Library.GetIcon then
					local resolved = Library:GetIcon(Options.Icon)
					if resolved then iconImage = resolved end
				end
			end)
			Element.IconImage = New("ImageLabel", {
				Image = iconImage,
				Size = UDim2.fromOffset(16, 16),
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			})
			Element.IconImage.Parent = Element.Header
		end

		Element.TitleHolder.Parent = Element.Header

		Element.DescLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Desc,
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			ThemeTag = {
				TextColor3 = "SubText",
			},
		})

		Element.LabelHolder = New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -28, 0, 0),
		}, {
			New("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
			New("UIPadding", {
				PaddingBottom = UDim.new(0, 13),
				PaddingTop = UDim.new(0, 13),
			}),
			Element.Header,
			Element.DescLabel,
		})

		Element.Border = New("UIStroke", {
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(0, 0, 0),
			ThemeTag = {
				Color = "ElementBorder",
			},
		})

		Element.Frame = New("TextButton", {
			Visible = Options.Visible and Options.Visible or true,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 0.89,
			BackgroundColor3 = Color3.fromRGB(130, 130, 130),
			Parent = Parent,
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = "",
			LayoutOrder = 7,
			ThemeTag = {
				BackgroundColor3 = "Element",
				BackgroundTransparency = "ElementTransparency",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			Element.Border,
			Element.LabelHolder,
		})

		function Element:SetTitle(Set)
			Element.TitleLabel.Text = Set
			local hasTitle = (Set ~= nil and Set ~= "")
			Element.Header.Visible = hasTitle

			if not hasTitle then
				if Element.IconImage then
					if not Element.DescRow then
						Element.DescRow = New("Frame", {
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 14),
							LayoutOrder = 2,
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0, 5),
								FillDirection = Enum.FillDirection.Horizontal,
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = Enum.VerticalAlignment.Center,
							}),
						})
						Element.DescRow.Parent = Element.LabelHolder
					end

					if not Element.DescIconImage then
						Element.DescIconImage = New("ImageLabel", {
							Image = Element.IconImage.Image,
							Size = UDim2.fromOffset(16, 16),
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							ThemeTag = {
								ImageColor3 = "Text",
							},
						})
						Element.DescIconImage.Parent = Element.DescRow
					else
						Element.DescIconImage.Image = Element.IconImage.Image
						Element.DescIconImage.Parent = Element.DescRow
					end

					Element.DescLabel.Parent = Element.DescRow
					Element.DescLabel.LayoutOrder = 2
					Element.DescLabel.Size = UDim2.new(1, -24, 0, 14)
				else
					if Element.DescRow then
						Element.DescRow:Destroy()
						Element.DescRow = nil
						Element.DescIconImage = nil
					end
					Element.DescLabel.Parent = Element.LabelHolder
					Element.DescLabel.LayoutOrder = 2
					Element.DescLabel.Size = UDim2.new(1, 0, 0, 14)
				end
			else
				if Element.DescRow then
					Element.DescRow:Destroy()
					Element.DescRow = nil
					Element.DescIconImage = nil
				end
				Element.DescLabel.Parent = Element.LabelHolder
				Element.DescLabel.LayoutOrder = 2
				Element.DescLabel.Size = UDim2.new(1, 0, 0, 14)
			end
			if Library.Window and Library.Window.AllElements and Library.Window.AllElements[Element.Frame] then
				Library.Window.AllElements[Element.Frame].title = Set
			elseif Library.Windows and #Library.Windows > 0 then
				local currentWindow = Library.Windows[#Library.Windows]
				if currentWindow and currentWindow.AllElements and currentWindow.AllElements[Element.Frame] then
					currentWindow.AllElements[Element.Frame].title = Set
				end
			end
		end

		function Element:Visible(Bool)
			Element.Frame.Visible = Bool
		end

		function Element:SetDesc(Set)
			if Set == nil then
				Set = ""
			end
			if Set == "" then
				Element.DescLabel.Visible = false
			else
				Element.DescLabel.Visible = true
			end
			Element.DescLabel.Text = Set
			if Library.Window and Library.Window.AllElements and Library.Window.AllElements[Element.Frame] then
				Library.Window.AllElements[Element.Frame].description = Set
			elseif Library.Windows and #Library.Windows > 0 then
				local currentWindow = Library.Windows[#Library.Windows]
				if currentWindow and currentWindow.AllElements and currentWindow.AllElements[Element.Frame] then
					currentWindow.AllElements[Element.Frame].description = Set
				end
			end
		end

		function Element:GetTitle()
			return Element.TitleLabel.Text
		end

		function Element:GetDesc()
			return Element.DescLabel.Text
		end

		function Element:Destroy()
			Element.Frame:Destroy()
		end

		Element.Header.Visible = not (Title == nil or Title == "")

		Element:SetTitle(Title or "")
		Element:SetDesc(Desc)


		if Library.Window and Library.Window.RegisterElement then
			Library.Window.RegisterElement(Element.Frame, Title, "Element", Desc)
		elseif Library.Windows and #Library.Windows > 0 then
			local currentWindow = Library.Windows[#Library.Windows]
			if currentWindow and currentWindow.RegisterElement then
				currentWindow.RegisterElement(Element.Frame, Title, "Element", Desc)
			end
		end

		if Hover then
			local Themes = Library.Themes
			local Motor, SetTransparency = Creator.SpringMotor(
				Creator.GetThemeProperty("ElementTransparency"),
				Element.Frame,
				"BackgroundTransparency",
				false,
				true
			)

			Creator.AddSignal(Element.Frame.MouseEnter, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
			end)
			Creator.AddSignal(Element.Frame.MouseLeave, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency"))
			end)
			Creator.AddSignal(Element.Frame.MouseButton1Down, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency") + Creator.GetThemeProperty("HoverChange"))
			end)
			Creator.AddSignal(Element.Frame.MouseButton1Up, function()
				SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
			end)
		end

		return Element
	end
end)()
Components.Section = (function()
	local New = Creator.New

	return function(Title, Parent, Icon)
		local Section = {}

		Section.Layout = New("UIListLayout", {
			Padding = UDim.new(0, 5),
		})

		Section.Container = New("Frame", {
			Size = UDim2.new(1, 0, 0, 26),
			Position = UDim2.fromOffset(0, 24),
			BackgroundTransparency = 1,
		}, {
			Section.Layout,
		})

		local SectionHeader = New("Frame", {
			Size = UDim2.new(1, -16, 0, 18),
			Position = UDim2.fromOffset(0, 2),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 5),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
			Icon and New("ImageLabel", {
				Image = Icon,
				Size = UDim2.fromOffset(16, 16),
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}) or nil,
		})

		Section.TitleLabel = New("TextLabel", {
			RichText = true,
			Text = Title,
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.SemiBold),
			TextSize = 18,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, Icon and -21 or 0, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})
		Section.TitleLabel.Parent = SectionHeader
		Creator.SetupMarquee(Section.TitleLabel)

		Section.Root = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 26),
			LayoutOrder = 7,
			Parent = Parent,
		}, {
			SectionHeader,
			Section.Container,
		})

		Creator.AddSignal(Section.Layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			Section.Container.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y)
			Section.Root.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y + 25)
		end)


		if Library.Window and Library.Window.RegisterElement then
			Library.Window.RegisterElement(Section.Root, Title, "Section")
		elseif Library.Windows and #Library.Windows > 0 then
			local currentWindow = Library.Windows[#Library.Windows]
			if currentWindow and currentWindow.RegisterElement then
				currentWindow.RegisterElement(Section.Root, Title, "Section")
			end
		end

		return Section
	end
end)()
Components.Tab = (function()
	local New = Creator.New
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local Components = Components

	local TAB_DRAG_THRESHOLD = 8

	local TabModule = {
		Window = nil,
		Tabs = {},
		Containers = {},
		SelectedTab = 0,
		TabCount = 0,
		AnimationTask = nil,
		CurrentAnimationTab = 0,
		TabOrder = {},
		Drag = {
			Active = false,
		},
	}

	function TabModule:Init(Window)
		TabModule.Window = Window
		TabModule.TabOrder = {}
		TabModule.Drag = TabModule.Drag or {}
		TabModule.Drag.Active = false
		TabModule.Drag.Placeholder = nil
		TabModule.Drag.PendingTab = nil
		TabModule.Drag.PendingInput = nil
		if not TabModule.Drag.InputChangedConn then
			TabModule.Drag.InputChangedConn = Creator.AddSignal(UserInputService.InputChanged, function(input)
				TabModule:OnInputChanged(input)
			end)
		end
		return TabModule
	end

	function TabModule:GetCurrentTabPos()
		if TabModule.Window.TabsInHeader then
			local TabHolderPos = TabModule.Window.TabHolder.AbsolutePosition.X
			local TabPos = TabModule.Tabs[TabModule.SelectedTab].Frame.AbsolutePosition.X
			return TabPos - TabHolderPos
		else
			local TabHolderPos = TabModule.Window.TabHolder.AbsolutePosition.Y
			local TabPos = TabModule.Tabs[TabModule.SelectedTab].Frame.AbsolutePosition.Y
			return TabPos - TabHolderPos
		end
	end

	function TabModule:GetTabOrderIndex(tabId)
		for index, value in ipairs(TabModule.TabOrder) do
			if value == tabId then
				return index
			end
		end
		return nil
	end

	function TabModule:ApplyLayoutOrder()
		for order, tabId in ipairs(TabModule.TabOrder) do
			local tab = TabModule.Tabs[tabId]
			if tab and tab.Frame then
				tab.Frame.LayoutOrder = order
			end
		end
	end

	function TabModule:ApplyDragLayout()
		local drag = TabModule.Drag
		if not drag.Active then
			return TabModule:ApplyLayoutOrder()
		end

		local placeholderIndex = drag.InsertIndex or (#TabModule.TabOrder + 1)
		local orderCounter = 1
		for _, tabId in ipairs(TabModule.TabOrder) do
			local tab = TabModule.Tabs[tabId]
			if tab and tab.Frame then
				local adjustedOrder = orderCounter
				if orderCounter >= placeholderIndex then
					adjustedOrder = adjustedOrder + 1
				end
				tab.Frame.LayoutOrder = adjustedOrder
				orderCounter = orderCounter + 1
			end
		end

		if drag.Placeholder then
			drag.Placeholder.LayoutOrder = placeholderIndex
		end
	end

	function TabModule:GetDragLayer()
		if TabModule.Window and TabModule.Window.DragLayer and TabModule.Window.DragLayer.Parent then
			return TabModule.Window.DragLayer
		end

		if Library.GUI then
			local layer = Instance.new("Frame")
			layer.Name = "TabDragLayer"
			layer.BackgroundTransparency = 1
			layer.BorderSizePixel = 0
			layer.ZIndex = 2000
			layer.Size = UDim2.fromScale(1, 1)
			layer.Parent = Library.GUI
			if TabModule.Window then
				TabModule.Window.DragLayer = layer
			end
			return layer
		end

		return nil
	end

	function TabModule:ElevateZIndex(frame)
		local drag = TabModule.Drag
		drag.ZIndexMap = {}

		local function elevate(object)
			if object:IsA("GuiObject") then
				drag.ZIndexMap[object] = object.ZIndex
				object.ZIndex = object.ZIndex + 200
			end
			for _, child in ipairs(object:GetChildren()) do
				elevate(child)
			end
		end

		elevate(frame)
	end

	function TabModule:RestoreDragZIndex()
		local drag = TabModule.Drag
		if drag.ZIndexMap then
			for object, value in pairs(drag.ZIndexMap) do
				if object then
					object.ZIndex = value
				end
			end
		end
		drag.ZIndexMap = nil
	end

	function TabModule:IsDragging()
		return TabModule.Drag and TabModule.Drag.Active or false
	end

	function TabModule:ClearPendingDrag()
		local drag = TabModule.Drag
		if drag.PendingChangedConn then
			drag.PendingChangedConn:Disconnect()
		end
		drag.PendingChangedConn = nil
		drag.PendingTab = nil
		drag.PendingTabId = nil
		drag.PendingInput = nil
		drag.PendingStartPosition = nil
		drag.PendingControlType = nil
	end

	function TabModule:StartPendingDrag(tab, tabId, input)
		if TabModule:IsDragging() or not tab or not tab.Frame then
			return
		end

		if #TabModule.TabOrder <= 1 then
			return
		end

		if Library.DialogOpen or (TabModule.Window and TabModule.Window.Minimized) then
			return
		end

		TabModule:ClearPendingDrag()

		local drag = TabModule.Drag
		drag.PendingTab = tab
		drag.PendingTabId = tabId
		drag.PendingInput = input
		drag.PendingStartPosition = Vector2.new(input.Position.X, input.Position.Y)
		drag.PendingControlType = input.UserInputType
		local absolutePos = tab.Frame.AbsolutePosition
		drag.PointerOffset = Vector2.new(input.Position.X - absolutePos.X, input.Position.Y - absolutePos.Y)

		drag.PendingChangedConn = Creator.AddSignal(input.Changed, function()
			if input.UserInputState == Enum.UserInputState.End then
				TabModule:ClearPendingDrag()
			end
		end)
	end

	function TabModule:BeginDrag(tab, tabId, input)
		local holder = TabModule.Window and TabModule.Window.TabHolder
		if not holder or not tab or not tab.Frame then
			return
		end

		local totalTabs = #TabModule.TabOrder
		if totalTabs <= 1 then
			return
		end

		local drag = TabModule.Drag
		drag.Active = true
		drag.Tab = tab
		drag.TabId = tabId
		drag.ActiveInput = input
		drag.ControlType = input.UserInputType == Enum.UserInputType.Touch and Enum.UserInputType.Touch or Enum.UserInputType.MouseMovement
		drag.MoveInput = input.UserInputType == Enum.UserInputType.Touch and input or nil

		local originalIndex = TabModule:GetTabOrderIndex(tabId) or totalTabs
		drag.OriginalIndex = originalIndex
		table.remove(TabModule.TabOrder, originalIndex)
		drag.InsertIndex = originalIndex

		local phWidth = tab.Frame.AbsoluteSize.X
		local phHeight = tab.Frame.AbsoluteSize.Y

		local placeholder = Instance.new("Frame")
		placeholder.Name = "TabDragPlaceholder"
		placeholder.BackgroundTransparency = 0.94
		placeholder.BackgroundColor3 = Creator.GetThemeProperty("Accent") or Color3.fromRGB(96, 205, 255)
		placeholder.BorderSizePixel = 0
		placeholder.Active = false
		placeholder.Size = TabModule.Window.TabsInHeader
			and UDim2.fromOffset(phWidth, phHeight)
			or UDim2.new(1, 0, 0, phHeight)
		placeholder.LayoutOrder = drag.InsertIndex
		placeholder.Parent = holder

		local phCorner = Instance.new("UICorner")
		phCorner.CornerRadius = UDim.new(0, 6)
		phCorner.Parent = placeholder

		local phStroke = Instance.new("UIStroke")
		phStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		phStroke.Color = Creator.GetThemeProperty("Accent") or Color3.fromRGB(96, 205, 255)
		phStroke.Transparency = 0.6
		phStroke.Thickness = 1
		phStroke.Parent = placeholder

		placeholder.BackgroundTransparency = 1
		phStroke.Transparency = 1
		TweenService:Create(placeholder, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0.92
		}):Play()
		TweenService:Create(phStroke, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Transparency = 0.5
		}):Play()

		drag.Placeholder = placeholder

		local absolutePos = tab.Frame.AbsolutePosition
		if not drag.PointerOffset then
			drag.PointerOffset = Vector2.new(input.Position.X - absolutePos.X, input.Position.Y - absolutePos.Y)
		end

		drag.OriginalParent = tab.Frame.Parent
		drag.OriginalSize = tab.Frame.Size
		drag.OriginalAutomaticSize = tab.Frame.AutomaticSize
		drag.OriginalAnchorPoint = tab.Frame.AnchorPoint

		local dragLayer = TabModule:GetDragLayer()
		tab.Frame.Parent = dragLayer or tab.Frame.Parent
		tab.Frame.AnchorPoint = Vector2.new(0, 0)
		tab.Frame.AutomaticSize = Enum.AutomaticSize.None
		tab.Frame.Size = UDim2.fromOffset(tab.Frame.AbsoluteSize.X, tab.Frame.AbsoluteSize.Y)
		tab.Frame.Position = UDim2.fromOffset(absolutePos.X, absolutePos.Y)

		TabModule:ElevateZIndex(tab.Frame)

		if tab.SetTransparency then
			tab.SetTransparency(0.82)
		end

		drag.Scale = Instance.new("UIScale")
		drag.Scale.Name = "DragScale"
		drag.Scale.Scale = 1
		drag.Scale.Parent = tab.Frame
		TweenService:Create(drag.Scale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.05 }):Play()

		if drag.InputEndedConn then
			drag.InputEndedConn:Disconnect()
		end
		drag.InputEndedConn = Creator.AddSignal(input.Changed, function()
			if input.UserInputState == Enum.UserInputState.End then
				TabModule:EndDrag(false)
			end
		end)

		TabModule:ApplyDragLayout()
		TabModule:UpdateDragPosition(Vector2.new(input.Position.X, input.Position.Y))
	end

	function TabModule:UpdateDragPosition(pointer)
		local drag = TabModule.Drag
		if not drag.Active or not drag.Tab or not drag.Tab.Frame then
			return
		end

		pointer = pointer or UserInputService:GetMouseLocation()
		local offset = drag.PointerOffset or Vector2.new(0, 0)
		local x = pointer.X - offset.X
		local y = pointer.Y - offset.Y
		drag.Tab.Frame.Position = UDim2.fromOffset(x, y)

		TabModule:UpdateDragOrder(pointer)
	end

	function TabModule:UpdateDragOrder(pointer)
		local drag = TabModule.Drag
		if not drag.Active then
			return
		end

		if not drag.Active or not drag.Tab or not drag.Tab.Frame then return end

		local holder = TabModule.Window and TabModule.Window.TabHolder
		if not holder then return end

		local isHeader = TabModule.Window.TabsInHeader
		
		pointer = pointer or game:GetService("UserInputService"):GetMouseLocation()
		local offset = drag.PointerOffset or Vector2.new(0, 0)
		local rawX = pointer.X - offset.X
		local rawY = pointer.Y - offset.Y
		
		local parentAbs = drag.Tab.Frame.Parent and drag.Tab.Frame.Parent.AbsolutePosition or Vector2.new(0,0)
		local draggedSize = isHeader and drag.Tab.Frame.AbsoluteSize.X or drag.Tab.Frame.AbsoluteSize.Y
		local draggedCenter = (isHeader and (rawX + parentAbs.X) or (rawY + parentAbs.Y)) + draggedSize / 2

		local startPos = isHeader and holder.AbsolutePosition.X or holder.AbsolutePosition.Y
		local scroll = isHeader and holder.CanvasPosition.X or holder.CanvasPosition.Y
		local spacing = 4

		local slots = {}
		local currentCoord = startPos - scroll

		for index = 1, #TabModule.TabOrder + 1 do
			local center = currentCoord + draggedSize / 2
			table.insert(slots, { Index = index, Center = center })
			
			local tabId = TabModule.TabOrder[index]
			if tabId then
				local tab = TabModule.Tabs[tabId]
				local elementSize = 34
				if tab and tab.Frame then
					elementSize = isHeader and tab.Frame.AbsoluteSize.X or tab.Frame.AbsoluteSize.Y
				end
				currentCoord = currentCoord + elementSize + spacing
			end
		end

		local closestDistance = math.huge
		local bestIndex = drag.InsertIndex

		for _, slot in ipairs(slots) do
			local dist = math.abs(draggedCenter - slot.Center)
			if dist < closestDistance then
				closestDistance = dist
				bestIndex = slot.Index
			end
		end

		if bestIndex ~= drag.InsertIndex then
			drag.InsertIndex = bestIndex
			TabModule:ApplyDragLayout()
		end
	end

	function TabModule:EndDrag(cancelled)
		local drag = TabModule.Drag
		if drag.PendingTab then
			TabModule:ClearPendingDrag()
		end

		if not drag.Active then
			return
		end

		drag.Active = false

		if drag.InputEndedConn then
			drag.InputEndedConn:Disconnect()
		end
		drag.InputEndedConn = nil

		local insertIndex = cancelled and drag.OriginalIndex or drag.InsertIndex or (#TabModule.TabOrder + 1)
		insertIndex = math.clamp(insertIndex, 1, #TabModule.TabOrder + 1)
		table.insert(TabModule.TabOrder, insertIndex, drag.TabId)
		TabModule:ApplyLayoutOrder()

		local targetPos = nil
		if drag.Placeholder and drag.Placeholder.Parent then
			targetPos = drag.Placeholder.AbsolutePosition
		end

		local tabFrame = drag.Tab and drag.Tab.Frame
		local originalParent = drag.OriginalParent or (TabModule.Window and TabModule.Window.TabHolder)
		local originalSize = drag.OriginalSize
		local originalAutoSize = drag.OriginalAutomaticSize
		local originalAnchor = drag.OriginalAnchorPoint
		local tabObj = drag.Tab
		local tabId = drag.TabId

		if drag.Scale then
			local scale = drag.Scale
			local tween = TweenService:Create(scale, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 })
			tween:Play()
			tween.Completed:Connect(function()
				if scale and scale.Parent then
					scale:Destroy()
				end
			end)
		end
		drag.Scale = nil

		local function finishDrop()
			if tabFrame and tabFrame.Parent then
				tabFrame.Parent = originalParent or tabFrame.Parent
				tabFrame.Size = originalSize or tabFrame.Size
				tabFrame.AutomaticSize = originalAutoSize or tabFrame.AutomaticSize
				tabFrame.AnchorPoint = originalAnchor or tabFrame.AnchorPoint
			end

			TabModule:RestoreDragZIndex()

			if tabObj and tabObj.SetTransparency then
				tabObj.SetTransparency(tabObj.Selected and 0.85 or 0.89)
			end

			if drag.Placeholder and drag.Placeholder.Parent then
				drag.Placeholder:Destroy()
				drag.Placeholder = nil
			end

			if
				TabModule.Window
				and TabModule.Window.SelectorPosMotor
				and TabModule.SelectedTab == tabId
			then
				TabModule.Window.SelectorPosMotor:setGoal(Spring(TabModule:GetCurrentTabPos(), { frequency = 6 }))
			end
		end

		if tabFrame and targetPos then
			local returnTween = TweenService:Create(
				tabFrame,
				TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Position = UDim2.fromOffset(targetPos.X, targetPos.Y) }
			)
			returnTween:Play()
			returnTween.Completed:Connect(function()
				finishDrop()
			end)
		else
			finishDrop()
		end

		drag.Tab = nil
		drag.TabId = nil
		drag.OriginalParent = nil
		drag.OriginalSize = nil
		drag.OriginalAutomaticSize = nil
		drag.OriginalAnchorPoint = nil
		drag.InsertIndex = nil
		drag.OriginalIndex = nil
		drag.PointerOffset = nil
		drag.ActiveInput = nil
		drag.MoveInput = nil
		drag.ControlType = nil
	end

	function TabModule:OnInputChanged(input)
		local drag = TabModule.Drag

		if drag.PendingTab and drag.PendingStartPosition then
			local isRelevant = false
			if drag.PendingInput == input then
				isRelevant = true
			elseif drag.PendingControlType == Enum.UserInputType.MouseButton1
				and input.UserInputType == Enum.UserInputType.MouseMovement then
				isRelevant = true
			end

			if isRelevant then
				local current = Vector2.new(input.Position.X, input.Position.Y)
				if (current - drag.PendingStartPosition).Magnitude >= TAB_DRAG_THRESHOLD then
					local pendingTab = drag.PendingTab
					local pendingTabId = drag.PendingTabId
					TabModule:ClearPendingDrag()
					TabModule:BeginDrag(pendingTab, pendingTabId, input)
					return
				end
			end
		end

		if drag.Active then
			if drag.MoveInput and input == drag.MoveInput then
				TabModule:UpdateDragPosition(Vector2.new(input.Position.X, input.Position.Y))
			elseif not drag.MoveInput and (input.UserInputType == drag.ControlType or input.UserInputType == Enum.UserInputType.MouseMovement) then
				TabModule:UpdateDragPosition(Vector2.new(input.Position.X, input.Position.Y))
			end
		end
	end

	function TabModule:New(Title, Icon, Parent)
		local Window = TabModule.Window
		local Elements = Library.Elements

		TabModule.TabCount = TabModule.TabCount + 1
		local TabIndex = TabModule.TabCount

		local Tab = {
			Selected = false,
			Name = Title,
			Type = "Tab",
		}

		if not fischbypass then 
			if Library:GetIcon(Icon) then
				Icon = Library:GetIcon(Icon)
			end

			if Icon == "" or Icon == nil then
				Icon = nil
			end
		end

		Tab.TitleLabel = New("TextLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			Text = Title,
			RichText = true,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font),
			TextSize = 12,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			BackgroundTransparency = 1,
			ZIndex = 11,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Tab.TitleHolder = New("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = not fischbypass and Icon and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
			Size = not fischbypass and Icon and UDim2.new(1, -42, 1, 0) or UDim2.new(1, -24, 1, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 11,
		}, {
			Tab.TitleLabel
		})
		Creator.SetupMarquee(Tab.TitleLabel)

		Tab.Frame = New("TextButton", {
			Size = TabModule.Window.TabsInHeader and UDim2.new(0, 0, 1, -8) or UDim2.new(1, 0, 0, 34),
			AutomaticSize = TabModule.Window.TabsInHeader and Enum.AutomaticSize.X or Enum.AutomaticSize.None,
			ClipsDescendants = true,
			BackgroundTransparency = 0.92,
			Parent = Parent,
			ZIndex = 10,
			ThemeTag = {
				BackgroundColor3 = "Tab",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 6),
			}),
			Tab.TitleHolder,
			New("ImageLabel", {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.new(0, 8, 0.5, 0),
				BackgroundTransparency = 1,
				Image = Icon and Icon or nil,
				ZIndex = 11,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}),
		})


		local ContainerLayout = New("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		Tab.ContainerAnim = New("CanvasGroup", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Parent = Window.ContainerHolder,
			Visible = false,
			Position = UDim2.fromOffset(0, 0),
		})

		Tab.ContainerFrame = New("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Parent = Tab.ContainerAnim,
			Visible = true,
			BottomImage = "rbxassetid://6889812791",
			MidImage = "rbxassetid://6889812721",
			TopImage = "rbxassetid://6276641225",
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			ScrollBarImageTransparency = 0.95,
			ScrollBarThickness = 3,
			BorderSizePixel = 0,
			CanvasSize = UDim2.fromScale(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = true,
		}, {
			ContainerLayout,
			New("UIPadding", {
				PaddingRight = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 1),
				PaddingTop = UDim.new(0, 1),
				PaddingBottom = UDim.new(0, 1),
			}),
		})

		Tab.ContainerXMotor = Flipper.SingleMotor.new(0)
		Tab.ContainerTransparencyMotor = Flipper.SingleMotor.new(0)

		Tab.ContainerXMotor:onStep(function(Value)
			if Tab.ContainerAnim and Tab.ContainerAnim.Parent then
				Tab.ContainerAnim.Position = UDim2.fromOffset(Value, 0)
			end
		end)

		Tab.ContainerTransparencyMotor:onStep(function(Value)
			if Tab.ContainerAnim and Tab.ContainerAnim.Parent then
				Tab.ContainerAnim.GroupTransparency = Value
			end
		end)

		Creator.AddSignal(ContainerLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			Tab.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 2)
		end)

		Tab.Motor, Tab.SetTransparency = Creator.SpringMotor(0.92, Tab.Frame, "BackgroundTransparency")

		Creator.AddSignal(Tab.Frame.MouseEnter, function()
			Tab.SetTransparency(Tab.Selected and 0.85 or 0.87)
		end)
		Creator.AddSignal(Tab.Frame.MouseLeave, function()
			Tab.SetTransparency(Tab.Selected and 0.89 or 0.92)
		end)
		Creator.AddSignal(Tab.Frame.InputBegan, function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
				-- TabModule:StartPendingDrag(Tab, TabIndex, input) -- Reordering temporarily disabled
			end
		end)
		Creator.AddSignal(Tab.Frame.InputEnded, function(input)
			if TabModule.Drag and TabModule.Drag.PendingInput == input then
				TabModule:ClearPendingDrag()
			end
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Down, function()
			if TabModule:IsDragging() then
				return
			end
			Tab.SetTransparency(0.92)
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Up, function()
			if TabModule:IsDragging() then
				return
			end
			Tab.SetTransparency(Tab.Selected and 0.85 or 0.89)
		end)
		Creator.AddSignal(Tab.Frame.MouseButton1Click, function()
			if TabModule:IsDragging() then
				return
			end
			TabModule:SelectTab(TabIndex)
		end)

		TabModule.Containers[TabIndex] = Tab.ContainerAnim
		TabModule.Tabs[TabIndex] = Tab
		table.insert(TabModule.TabOrder, TabIndex)
		Tab.Frame.LayoutOrder = #TabModule.TabOrder
		Tab.Index = TabIndex
		TabModule:ApplyLayoutOrder()

		Tab.Container = Tab.ContainerFrame
		Tab.ScrollFrame = Tab.Container

		if Window.TabsInHeader and Window.TabHolder and Window.TabHolder:FindFirstChild("UIListLayout") then
			local layout = Window.TabHolder:FindFirstChild("UIListLayout")
			Creator.AddSignal(layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				if Window.TabHolder then
					Window.TabHolder.CanvasSize = UDim2.new(0, layout.AbsoluteContentSize.X, 0, 0)
				end
			end)
			task.wait()
			if Window.TabHolder and layout then
				Window.TabHolder.CanvasSize = UDim2.new(0, layout.AbsoluteContentSize.X, 0, 0)
			end
		end

		Tab.SubTabs = {}
		Tab.SubTabContainers = {}
		Tab.SelectedSubTab = 0
		Tab.SubTabCount = 0
		Tab.SubTabHolder = nil

		function Tab:AddSubTab(Title, Icon)
			self.SubTabCount = self.SubTabCount + 1
			local SubTabIndex = self.SubTabCount

			if not self.SubTabHolder then
				local SubTabListLayout = New("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
				})

				self.SubTabHolder = New("ScrollingFrame", {
					Size = UDim2.new(1, -20, 0, 40),
					Position = UDim2.fromOffset(1, 8),
					BackgroundTransparency = 1,
					Parent = self.ContainerFrame,
					ScrollingDirection = Enum.ScrollingDirection.X,
					ScrollBarThickness = 0,
					ScrollBarImageTransparency = 1,
					ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
					CanvasSize = UDim2.fromScale(0, 1),
					BorderSizePixel = 0,
				}, {
					SubTabListLayout,
					New("UIPadding", {
						PaddingLeft = UDim.new(0, 0),
						PaddingRight = UDim.new(0, 0),
						PaddingTop = UDim.new(0, 0),
						PaddingBottom = UDim.new(0, 0),
					}),
				})

				Creator.AddSignal(SubTabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
					self.SubTabHolder.CanvasSize = UDim2.new(0, SubTabListLayout.AbsoluteContentSize.X, 0, 40)
				end)

				local SubTabContainerHolder = New("Frame", {
					Size = UDim2.new(1, -11, 1, -56),
					Position = UDim2.fromOffset(1, 48),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Parent = self.ContainerFrame,
				})

				self.SubTabContainerHolder = SubTabContainerHolder
			end

		local SubTabIcon = Icon
			if not fischbypass then 
				local resolvedIcon = Library:GetIcon(Icon)
				if resolvedIcon then
					SubTabIcon = resolvedIcon
				end

			if SubTabIcon == "" or SubTabIcon == nil then
				SubTabIcon = nil
			end
			end

			local SubTabButton = New("TextButton", {
				Size = UDim2.new(0, 0, 0, 32),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 0.92,
				Parent = self.SubTabHolder,
				Text = "",
				ThemeTag = {
					BackgroundColor3 = "Tab",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 6),
				}),
				New("UIStroke", {
					Transparency = 1,
					Thickness = 1,
					ThemeTag = {
						Color = "Accent",
					},
				}),
				New("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
				}),
				New("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12),
					PaddingTop = UDim.new(0, 6),
					PaddingBottom = UDim.new(0, 6),
				}),
				SubTabIcon and New("ImageLabel", {
					Size = UDim2.fromOffset(16, 16),
					BackgroundTransparency = 1,
					Image = SubTabIcon,
					LayoutOrder = 1,
					ThemeTag = {
						ImageColor3 = "Text",
					},
				}) or nil,
				New("TextLabel", {
					Text = Title,
					RichText = true,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextTransparency = 0,
					FontFace = resolveFont(Library.Font),
					TextSize = 12,
					TextXAlignment = "Left",
					TextYAlignment = "Center",
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					ThemeTag = {
						TextColor3 = "Text",
					},
				}),
			})

			local SubTabContainerAnim = New("CanvasGroup", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				GroupTransparency = 0,
				Parent = self.SubTabContainerHolder,
				Visible = false,
				Position = UDim2.fromOffset(0, 0),
			})

			local SubTabContainer = New("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Parent = SubTabContainerAnim,
				Visible = true,
				BottomImage = "rbxassetid://6889812791",
				MidImage = "rbxassetid://6889812721",
				TopImage = "rbxassetid://6276641225",
				ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
				ScrollBarImageTransparency = 0.95,
				ScrollBarThickness = 3,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = true,
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder,
				}),
				New("UIPadding", {
					PaddingRight = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 1),
					PaddingTop = UDim.new(0, 1),
					PaddingBottom = UDim.new(0, 1),
				}),
			})

			local SubTabLayout = SubTabContainer:FindFirstChild("UIListLayout")
			Creator.AddSignal(SubTabLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				SubTabContainer.CanvasSize = UDim2.new(0, 0, 0, SubTabLayout.AbsoluteContentSize.Y + 2)
			end)

			local SubTabXMotor = Flipper.SingleMotor.new(0)
			local SubTabTransparencyMotor = Flipper.SingleMotor.new(0)

			SubTabXMotor:onStep(function(Value)
				if SubTabContainerAnim and SubTabContainerAnim.Parent then
					SubTabContainerAnim.Position = UDim2.fromOffset(Value, 0)
				end
			end)

			SubTabTransparencyMotor:onStep(function(Value)
				if SubTabContainerAnim and SubTabContainerAnim.Parent then
					SubTabContainerAnim.GroupTransparency = Value
				end
			end)

			local SubTabMotor, SubTabSetTransparency = Creator.SpringMotor(0.92, SubTabButton, "BackgroundTransparency")
			local SubTabStroke = SubTabButton:FindFirstChild("UIStroke")

			local function UpdateSubTabAppearance()
				if self.SelectedSubTab == SubTabIndex then
					SubTabSetTransparency(0.75)
					if SubTabStroke then
						SubTabStroke.Transparency = 0
					end
				else
					SubTabSetTransparency(0.92)
					if SubTabStroke then
						SubTabStroke.Transparency = 1
					end
				end
			end

			Creator.AddSignal(SubTabButton.MouseEnter, function()
				if self.SelectedSubTab ~= SubTabIndex then
					SubTabSetTransparency(0.87)
				end
			end)

			Creator.AddSignal(SubTabButton.MouseLeave, function()
				UpdateSubTabAppearance()
			end)

			Creator.AddSignal(SubTabButton.MouseButton1Down, function()
				SubTabSetTransparency(0.92)
			end)

			Creator.AddSignal(SubTabButton.MouseButton1Up, function()
				UpdateSubTabAppearance()
			end)

			UpdateSubTabAppearance()

			Creator.AddSignal(SubTabButton.MouseButton1Click, function()
				self:SelectSubTab(SubTabIndex)
			end)

			local SubTab = {
				Type = "SubTab",
				Name = Title,
				Button = SubTabButton,
				Container = SubTabContainer,
				ContainerAnim = SubTabContainerAnim,
				XMotor = SubTabXMotor,
				TransparencyMotor = SubTabTransparencyMotor,
				SetTransparency = SubTabSetTransparency,
				Selected = false,
				Parent = self,
			}

			self.SubTabs[SubTabIndex] = SubTab
			self.SubTabContainers[SubTabIndex] = SubTabContainerAnim

			if self.SubTabCount == 1 then
				self:SelectSubTab(SubTabIndex)
			end

			function SubTab:AddSection(SectionTitle, SectionIcon)
				local Section = { Type = "Section", Parent = SubTab }

				local Icon = SectionIcon
				if not fischbypass then 
					if Library:GetIcon(Icon) then
						Icon = Library:GetIcon(Icon)
					end

			if Icon == "" or Icon == nil then
				Icon = nil
					end
				end

				local SectionFrame = Components.Section(SectionTitle, SubTab.Container, Icon)
				Section.Container = SectionFrame.Container
				Section.ScrollFrame = SubTab.Container

				setmetatable(Section, Elements)
				return Section
			end

			setmetatable(SubTab, Elements)
			return SubTab
		end

		function Tab:SelectSubTab(SubTabIndex)
			if self.SelectedSubTab == SubTabIndex then
				return
			end

			local PreviousSubTab = self.SelectedSubTab
			local Direction = (PreviousSubTab > 0 and SubTabIndex > PreviousSubTab) and 1 or -1
			if PreviousSubTab == 0 then
				Direction = 0
			end

			local ContainerSize = self.SubTabContainerHolder and self.SubTabContainerHolder.AbsoluteSize.X or 500
			local SlideDistance = math.min(ContainerSize * 0.15, 60)

			self.SelectedSubTab = SubTabIndex
			
			if Window and not Window.TabsInHeader and Window.TabDisplay then
				Window.TabDisplay.Text = self.Name .. " <font color=\"#888\">/</font> " .. self.SubTabs[SubTabIndex].Title
			end

			for idx, SubTabObj in next, self.SubTabs do
				SubTabObj.Selected = (idx == SubTabIndex)
				local SubTabStroke = SubTabObj.Button:FindFirstChild("UIStroke")
				if idx == SubTabIndex then
					SubTabObj.SetTransparency(0.75)
					if SubTabStroke then
						SubTabStroke.Transparency = 0
					end
				else
					SubTabObj.SetTransparency(0.92)
					if SubTabStroke then
						SubTabStroke.Transparency = 1
					end
				end
			end

			if PreviousSubTab > 0 and PreviousSubTab ~= SubTabIndex and self.SubTabs[PreviousSubTab] and self.SubTabs[SubTabIndex] then
				local OldContainer = self.SubTabs[PreviousSubTab].ContainerAnim
				local NewContainer = self.SubTabs[SubTabIndex].ContainerAnim
				local OldSubTab = self.SubTabs[PreviousSubTab]
				local NewSubTab = self.SubTabs[SubTabIndex]

				for idx, Container in next, self.SubTabContainers do
					if Container and idx ~= PreviousSubTab and idx ~= SubTabIndex then
						Container.Visible = false
						Container.Position = UDim2.fromOffset(0, 0)
						Container.GroupTransparency = 0
						if self.SubTabs[idx] then
							pcall(function()
								self.SubTabs[idx].XMotor:setGoal(Instant(0))
								self.SubTabs[idx].TransparencyMotor:setGoal(Instant(0))
							end)
						end
					end
				end

				OldContainer.Visible = true
				OldContainer.Position = UDim2.fromOffset(0, 0)
				OldContainer.GroupTransparency = 0
				pcall(function()
					OldSubTab.XMotor:setGoal(Instant(0))
					OldSubTab.TransparencyMotor:setGoal(Instant(0))
				end)

				NewContainer.Visible = true
				NewContainer.Position = UDim2.fromOffset(Direction * SlideDistance, 0)
				NewContainer.GroupTransparency = 1
				pcall(function()
					NewSubTab.XMotor:setGoal(Instant(Direction * SlideDistance))
					NewSubTab.TransparencyMotor:setGoal(Instant(1))
				end)

				task.wait()

				pcall(function()
					OldSubTab.XMotor:setGoal(Spring(-Direction * SlideDistance, { frequency = 4, dampingRatio = 0.7 }))
					OldSubTab.TransparencyMotor:setGoal(Spring(1, { frequency = 4, dampingRatio = 0.7 }))
				end)

				pcall(function()
					NewSubTab.XMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
					NewSubTab.TransparencyMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
				end)

				task.spawn(function()
					task.wait(0.5)
					if self.SelectedSubTab == SubTabIndex and self.SubTabs[PreviousSubTab] then
						local OldContainer = self.SubTabs[PreviousSubTab].ContainerAnim
						local OldSubTab = self.SubTabs[PreviousSubTab]
						if OldContainer and OldContainer.Parent then
							OldContainer.Visible = false
							OldContainer.Position = UDim2.fromOffset(0, 0)
							OldContainer.GroupTransparency = 0
						end
						if OldSubTab and OldSubTab.XMotor and OldSubTab.TransparencyMotor then
							pcall(function()
								OldSubTab.XMotor:setGoal(Instant(0))
								OldSubTab.TransparencyMotor:setGoal(Instant(0))
							end)
						end
					end
				end)
			else
				for idx, Container in next, self.SubTabContainers do
					if Container then
						Container.Visible = (idx == SubTabIndex)
						Container.Position = UDim2.fromOffset(0, 0)
						Container.GroupTransparency = 0
						if self.SubTabs[idx] then
							pcall(function()
								self.SubTabs[idx].XMotor:setGoal(Instant(0))
								self.SubTabs[idx].TransparencyMotor:setGoal(Instant(0))
							end)
						end
					end
				end
			end
		end

		function Tab:AddSection(SectionTitle, SectionIcon)
			if self.SelectedSubTab > 0 and self.SubTabs[self.SelectedSubTab] then
				return self.SubTabs[self.SelectedSubTab]:AddSection(SectionTitle, SectionIcon)
			end

			local Section = { Type = "Section", Parent = self }

			local Icon = SectionIcon
			if not fischbypass then 
				local resolvedIcon = Library:GetIcon(Icon)
				if resolvedIcon then
					Icon = resolvedIcon
				end

				if Icon == "" or Icon == nil then
					Icon = nil
				end
			end

			local SectionFrame = Components.Section(SectionTitle, Tab.Container, Icon)
			Section.Container = SectionFrame.Container
			Section.ScrollFrame = Tab.Container

			setmetatable(Section, Elements)
			return Section
		end

		setmetatable(Tab, Elements)
		return Tab
	end

	function TabModule:SelectTab(Tab)
		if TabModule.SelectedTab == Tab then
			return
		end
		
		if TabModule.AnimationTask then
			task.cancel(TabModule.AnimationTask)
			TabModule.AnimationTask = nil
		end

		local Window = TabModule.Window
		local PreviousTab = TabModule.SelectedTab
		
		local Direction = (PreviousTab > 0 and Tab > PreviousTab) and 1 or -1
		if PreviousTab == 0 then
			Direction = 0
		end
		
		local ContainerSize = Window.ContainerHolder and Window.ContainerHolder.AbsoluteSize.X or (Window.ContainerCanvas and Window.ContainerCanvas.AbsoluteSize.X or 500)
		local SlideDistance = math.min(ContainerSize * 0.15, 60)

		for _, Option in next, Library.Options do
			if Option and Option.Type == "Dropdown" and Option.Opened then
				pcall(function()
					Option:Close()
				end)
			end
		end

		TabModule.SelectedTab = Tab
		TabModule.CurrentAnimationTab = Tab

		for _, TabObject in next, TabModule.Tabs do
			TabObject.SetTransparency(0.92)
			TabObject.Selected = false
		end
		TabModule.Tabs[Tab].SetTransparency(0.89)
		TabModule.Tabs[Tab].Selected = true

		if not Window.TabsInHeader then
			Window.TabDisplay.Text = TabModule.Tabs[Tab].Name
		end
		Window.SelectorPosMotor:setGoal(Spring(TabModule:GetCurrentTabPos(), { frequency = 6 }))
		if Window.TabsInHeader then
			local tabFrame = TabModule.Tabs[Tab].Frame
			if tabFrame and Window.HeaderSelector then
				Window.SelectorSizeMotor:setGoal(Spring(tabFrame.AbsoluteSize.X, { frequency = 6 }))
			end
		end

		if PreviousTab > 0 and PreviousTab ~= Tab and TabModule.Tabs[PreviousTab] and TabModule.Tabs[Tab] then
			local OldContainer = TabModule.Tabs[PreviousTab].ContainerAnim
			local NewContainer = TabModule.Tabs[Tab].ContainerAnim
			local OldTab = TabModule.Tabs[PreviousTab]
			local NewTab = TabModule.Tabs[Tab]

			if not OldContainer or not NewContainer or not OldTab.ContainerXMotor or not OldTab.ContainerTransparencyMotor or not NewTab.ContainerXMotor or not NewTab.ContainerTransparencyMotor then
				for idx, Container in next, TabModule.Containers do
					if Container then
						Container.Visible = (idx == Tab)
						Container.Position = UDim2.fromOffset(0, 0)
						Container.GroupTransparency = 0
					end
				end
				return
			end

			for idx, Container in next, TabModule.Containers do
				if Container and idx ~= PreviousTab and idx ~= Tab then
					Container.Visible = false
					Container.Position = UDim2.fromOffset(0, 0)
					Container.GroupTransparency = 0
					if TabModule.Tabs[idx] and TabModule.Tabs[idx].ContainerXMotor and TabModule.Tabs[idx].ContainerTransparencyMotor then
						pcall(function()
							TabModule.Tabs[idx].ContainerXMotor:setGoal(Instant(0))
							TabModule.Tabs[idx].ContainerTransparencyMotor:setGoal(Instant(0))
						end)
					end
				end
			end

			OldContainer.Visible = true
			OldContainer.Position = UDim2.fromOffset(0, 0)
			OldContainer.GroupTransparency = 0
			pcall(function()
				OldTab.ContainerXMotor:setGoal(Instant(0))
				OldTab.ContainerTransparencyMotor:setGoal(Instant(0))
			end)

			NewContainer.Visible = true
			NewContainer.Position = UDim2.fromOffset(Direction * SlideDistance, 0)
			NewContainer.GroupTransparency = 1
			pcall(function()
				NewTab.ContainerXMotor:setGoal(Instant(Direction * SlideDistance))
				NewTab.ContainerTransparencyMotor:setGoal(Instant(1))
			end)

			task.wait()

			pcall(function()
				OldTab.ContainerXMotor:setGoal(Spring(-Direction * SlideDistance, { frequency = 4, dampingRatio = 0.7 }))
				OldTab.ContainerTransparencyMotor:setGoal(Spring(1, { frequency = 4, dampingRatio = 0.7 }))
			end)

			pcall(function()
				NewTab.ContainerXMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
				NewTab.ContainerTransparencyMotor:setGoal(Spring(0, { frequency = 4, dampingRatio = 0.7 }))
			end)

			TabModule.AnimationTask = task.spawn(function()
				task.wait(0.5)
				if TabModule.CurrentAnimationTab == Tab and TabModule.Tabs[PreviousTab] then
					local OldContainer = TabModule.Tabs[PreviousTab].ContainerAnim
					local OldTab = TabModule.Tabs[PreviousTab]
					if OldContainer and OldContainer.Parent then
						OldContainer.Visible = false
						OldContainer.Position = UDim2.fromOffset(0, 0)
						OldContainer.GroupTransparency = 0
					end
					if OldTab and OldTab.ContainerXMotor and OldTab.ContainerTransparencyMotor then
						pcall(function()
							OldTab.ContainerXMotor:setGoal(Instant(0))
							OldTab.ContainerTransparencyMotor:setGoal(Instant(0))
						end)
					end
					TabModule.AnimationTask = nil
				end
			end)
		else
			for idx, Container in next, TabModule.Containers do
				if Container then
					Container.Visible = (idx == Tab)
					Container.Position = UDim2.fromOffset(0, 0)
					Container.GroupTransparency = 0
					if TabModule.Tabs[idx] and TabModule.Tabs[idx].ContainerXMotor and TabModule.Tabs[idx].ContainerTransparencyMotor then
						pcall(function()
							TabModule.Tabs[idx].ContainerXMotor:setGoal(Instant(0))
							TabModule.Tabs[idx].ContainerTransparencyMotor:setGoal(Instant(0))
						end)
					end
				end
			end
		end
	end

	return TabModule
end)()
Components.Button = (function()
	local New = Creator.New

	local Spring = Flipper.Spring.new

	return function(Theme, Parent, DialogCheck)
		DialogCheck = DialogCheck or false
		local Button = {}

		Button.Title = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Button.HoverFrame = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ThemeTag = {
				BackgroundColor3 = "Hover",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		Button.Frame = New("TextButton", {
			Size = UDim2.new(0, 0, 0, 32),
			Parent = Parent,
			ThemeTag = {
				BackgroundColor3 = "DialogButton",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = 0.65,
				ThemeTag = {
					Color = "DialogButtonBorder",
				},
			}),
			Button.HoverFrame,
			Button.Title,
		})
		local Motor, SetTransparency = Creator.SpringMotor(1, Button.HoverFrame, "BackgroundTransparency", DialogCheck)
		Creator.AddSignal(Button.Frame.MouseEnter, function()
			SetTransparency(0.97)
		end)
		Creator.AddSignal(Button.Frame.MouseLeave, function()
			SetTransparency(1)
		end)
		Creator.AddSignal(Button.Frame.MouseButton1Down, function()
			SetTransparency(1)
		end)
		Creator.AddSignal(Button.Frame.MouseButton1Up, function()
			SetTransparency(0.97)
		end)

		return Button
	end
end)()
Components.Dialog = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	local Dialog = {
		Window = nil,
	}

	function Dialog:Init(Window)
		Dialog.Window = Window
		return Dialog
	end

	function Dialog:Create()
		local NewDialog = {
			Buttons = 0,
		}

		NewDialog.TintFrame = New("TextButton", {
			Text = "",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			Parent = Dialog.Window.Root,
			ZIndex = 1,
			ZLayer = "dialog",
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		})

		local TintMotor, TintTransparency = Creator.SpringMotor(1, NewDialog.TintFrame, "BackgroundTransparency", true)

		NewDialog.ButtonHolder = New("Frame", {
			Size = UDim2.new(1, -40, 1, -40),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 10),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),
		})

		NewDialog.ButtonHolderFrame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 70),
			Position = UDim2.new(0, 0, 1, -70),
			ZIndex = 961,
			ThemeTag = {
				BackgroundColor3 = "DialogHolder",
			},
		}, {
			New("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				ThemeTag = {
					BackgroundColor3 = "DialogHolderLine",
				},
			}),
			NewDialog.ButtonHolder,
		})

		NewDialog.Title = New("TextLabel", {
			FontFace = resolveFont(Library.Font, Enum.FontWeight.SemiBold),
			Text = "Dialog",
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 22,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 22),
			Position = UDim2.fromOffset(20, 25),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewDialog.Scale = New("UIScale", {
			Scale = 1,
		})

		local ScaleMotor, Scale = Creator.SpringMotor(1.1, NewDialog.Scale, "Scale")

		NewDialog.Root = New("CanvasGroup", {
			Size = UDim2.fromOffset(300, 165),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			GroupTransparency = 1,
			Parent = NewDialog.TintFrame,
			ZIndex = 2,
			ZLayer = "dialog",
			ThemeTag = {
				BackgroundColor3 = "Dialog",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ThemeTag = {
					Color = "DialogBorder",
				},
			}),
			NewDialog.Scale,
			NewDialog.Title,
			NewDialog.ButtonHolderFrame,
		})

		local RootMotor, RootTransparency = Creator.SpringMotor(1, NewDialog.Root, "GroupTransparency")

		function NewDialog:Open()
			Library.DialogOpen = true
			NewDialog.Scale.Scale = 1.1
			TintTransparency(0.75)
			RootTransparency(0)
			Scale(1)
		end

		function NewDialog:Close()
			Library.DialogOpen = false
			TintTransparency(1)
			RootTransparency(1)
			Scale(1.1)
			task.wait(0.15)
			if NewDialog.TintFrame and NewDialog.TintFrame.Parent then
				NewDialog.TintFrame:Destroy()
			end
		end

		function NewDialog:Button(Title, Callback)
			NewDialog.Buttons = NewDialog.Buttons + 1
			Title = Title or "Button"
			Callback = Callback or function() end

			local Button = Components.Button("", NewDialog.ButtonHolder, true)
			Button.Title.Text = Title

			for _, Btn in next, NewDialog.ButtonHolder:GetChildren() do
				if Btn:IsA("TextButton") then
					Btn.Size =
						UDim2.new(1 / NewDialog.Buttons, -(((NewDialog.Buttons - 1) * 10) / NewDialog.Buttons), 0, 32)
				end
			end

			Creator.AddSignal(Button.Frame.MouseButton1Click, function()
				Library:SafeCallback(Callback)
				pcall(function()
					NewDialog:Close()
				end)
			end)

			return Button
		end

		return NewDialog
	end

	return Dialog
end)()
Components.Notification = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	local Notification = {}

	function Notification:Init(GUI)
		Library.ActiveNotifications = Library.ActiveNotifications or {}

		Notification.Holder = New("Frame", {
			Position = UDim2.new(1, -20, 1, -20),
			Size = UDim2.new(0, 330, 1, -40),
			AnchorPoint = Vector2.new(1, 1),
			BackgroundTransparency = 1,
			Parent = GUI,
			ZIndex = 1,
			ZLayer = "notification",
		}, {
			New("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, 10),
			}),
		})
	end

	function Notification:New(Config)
		Config.Title = Config.Title or "Title"
		Config.Content = Config.Content or "Content"
		Config.SubContent = Config.SubContent or ""
		Config.Duration = Config.Duration or nil
		local NewNotification = {
			Closed = false,
		}

		NewNotification.AcrylicPaint = Acrylic.AcrylicPaint()

		local resolvedIcon = nil
		if Config.Icon then
			resolvedIcon = Library:GetIcon(Config.Icon) or (Config.Icon:match("rbxasset") and Config.Icon or nil)
		end

		if resolvedIcon then
			NewNotification.IconIndicator = New("ImageLabel", {
				Image = resolvedIcon,
				Size = UDim2.fromOffset(20, 20),
				Position = UDim2.new(0, 13, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			})
		end

		NewNotification.Title = New("TextLabel", {
			Position = UDim2.new(0, resolvedIcon and 42 or 14, 0, 17),
			Text = Config.Title,
			RichText = true,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.SemiBold),
			TextSize = 13,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, resolvedIcon and -80 or -50, 0, 16),
			TextWrapped = false,
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewNotification.ContentLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Config.Content,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 14),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextWrapped = true,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		NewNotification.SubContentLabel = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = Config.SubContent,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 14),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextWrapped = true,
			ThemeTag = {
				TextColor3 = "SubText",
			},
		})

		NewNotification.LabelHolder = New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(resolvedIcon and 42 or 14, 40),
			Size = UDim2.new(1, resolvedIcon and -58 or -28, 0, 0),
		}, {
			New("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, 4),
			}),
			NewNotification.ContentLabel,
			NewNotification.SubContentLabel,
		})

		NewNotification.CloseButton = New("TextButton", {
			Text = "",
			Position = UDim2.new(1, -14, 0, 13),
			Size = UDim2.fromOffset(20, 20),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
		}, {
			New("ImageLabel", {
				Image = Components.Assets.Close,
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}),
		})

		NewNotification.Root = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 60),
			Position = UDim2.fromScale(1, 0),
			ZIndex = 3,
			ZLayer = "notification",
			ClipsDescendants = true,
		}, {
			NewNotification.AcrylicPaint.Frame,
			NewNotification.IconIndicator,
			NewNotification.Title,
			NewNotification.CloseButton,
			NewNotification.LabelHolder,
		})

		Creator.SetupMarquee(NewNotification.Title)

		if Config.Content == "" then
			NewNotification.ContentLabel.Visible = false
		end

		if Config.SubContent == "" then
			NewNotification.SubContentLabel.Visible = false
		end

		NewNotification.Holder = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 60),
			Parent = Notification.Holder,
			ZIndex = 2,
			ZLayer = "notification",
			ClipsDescendants = true,
		}, {
			NewNotification.Root,
		})

		local RootMotor = Flipper.GroupMotor.new({
			Scale = 1,
			Offset = 60,
		})

		RootMotor:onStep(function(Values)
			NewNotification.Root.Position = UDim2.new(Values.Scale, Values.Offset, 0, 0)
		end)

		Creator.AddSignal(NewNotification.CloseButton.MouseButton1Click, function()
			NewNotification:Close()
		end)
		function NewNotification:ApplyTransparency()
		end

		function NewNotification:Open()
			task.spawn(function()
				local ContentSize = NewNotification.LabelHolder.AbsoluteSize.Y
				local finalHeight = 52 + ContentSize
				NewNotification.Holder.Size = UDim2.new(1, 0, 0, finalHeight)
				NewNotification.Root.Size = UDim2.new(1, 0, 0, finalHeight)

				task.wait()
				
				local updatedContentSize = NewNotification.LabelHolder.AbsoluteSize.Y
				local updatedHeight = 52 + updatedContentSize
				NewNotification.Holder.Size = UDim2.new(1, 0, 0, updatedHeight)
				NewNotification.Root.Size = UDim2.new(1, 0, 0, updatedHeight)
				
				RootMotor:setGoal({
					Scale = Spring(0, { frequency = 4 }),
					Offset = Spring(0, { frequency = 4 }),
				})
			end)
		end

		function NewNotification:Close()
			if not NewNotification.Closed then
				NewNotification.Closed = true

				for i, notif in pairs(Library.ActiveNotifications or {}) do
					if notif == NewNotification then
						table.remove(Library.ActiveNotifications, i)
						break
					end
				end

				task.spawn(function()
					if Library.Unloaded then return end
					RootMotor:setGoal({
						Scale = Spring(1, { frequency = 5 }),
						Offset = Spring(60, { frequency = 5 }),
					})
					task.wait(0.4)
					if Library.Unloaded then return end
					if Library.UseAcrylic then
						NewNotification.AcrylicPaint.Model:Destroy()
					end
					NewNotification.Holder:Destroy()
				end)
			end
		end

		table.insert(Library.ActiveNotifications, NewNotification)

		NewNotification:Open()
		if Config.Duration then
			task.delay(Config.Duration, function()
				NewNotification:Close()
			end)
		end
		return NewNotification
	end

	return Notification
end)()
Components.Textbox = (function()
	local New = Creator.New

	return function(Parent, Acrylic)
		Acrylic = Acrylic or false
		local Textbox = {}

		Textbox.Input = New("TextBox", {
			FontFace = resolveFont(Library.Font),
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(10, 0),
			ThemeTag = {
				TextColor3 = "Text",
				PlaceholderColor3 = "SubText",
			},
		})

		Textbox.Container = New("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Position = UDim2.new(0, 6, 0, 0),
			Size = UDim2.new(1, -12, 1, 0),
		}, {
			Textbox.Input,
		})

		Textbox.Indicator = New("Frame", {
			Size = UDim2.new(1, -4, 0, 1),
			Position = UDim2.new(0, 2, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = Acrylic and 0.5 or 0,
			ThemeTag = {
				BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine",
			},
		})

		Textbox.Frame = New("Frame", {
			Size = UDim2.new(0, 0, 0, 30),
			BackgroundTransparency = Acrylic and 0.9 or 0,
			Parent = Parent,
			ThemeTag = {
				BackgroundColor3 = Acrylic and "Input" or "DialogInput",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = Acrylic and 0.5 or 0.65,
				ThemeTag = {
					Color = Acrylic and "InElementBorder" or "DialogButtonBorder",
				},
			}),
			Textbox.Indicator,
			Textbox.Container,
		})

		local function Update()
			local PADDING = 2
			local Reveal = Textbox.Container.AbsoluteSize.X

			if not Textbox.Input:IsFocused() or Textbox.Input.TextBounds.X <= Reveal - 2 * PADDING then
				Textbox.Input.Position = UDim2.new(0, PADDING, 0, 0)
			else
				local Cursor = Textbox.Input.CursorPosition
				if Cursor ~= -1 then
					local subtext = string.sub(Textbox.Input.Text, 1, Cursor - 1)
					local width = TextService:GetTextSize(
						subtext,
						Textbox.Input.TextSize,
						Textbox.Input.Font,
						Vector2.new(math.huge, math.huge)
					).X

					local CurrentCursorPos = Textbox.Input.Position.X.Offset + width
					if CurrentCursorPos < PADDING then
						Textbox.Input.Position = UDim2.fromOffset(PADDING - width, 0)
					elseif CurrentCursorPos > Reveal - PADDING - 1 then
						Textbox.Input.Position = UDim2.fromOffset(Reveal - width - PADDING - 1, 0)
					end
				end
			end
		end

		task.spawn(Update)

		Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("Text"), Update)
		Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("CursorPosition"), Update)

		Creator.AddSignal(Textbox.Input.Focused, function()
			Update()
			Textbox.Indicator.Size = UDim2.new(1, -2, 0, 2)
			Textbox.Indicator.Position = UDim2.new(0, 1, 1, 0)
			Textbox.Indicator.BackgroundTransparency = 0
			Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "InputFocused" or "DialogHolder" })
			Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = "InputIndicatorFocus" })
		end)

		Creator.AddSignal(Textbox.Input.FocusLost, function()
			Update()
			Textbox.Indicator.Size = UDim2.new(1, -4, 0, 1)
			Textbox.Indicator.Position = UDim2.new(0, 2, 1, 0)
			Textbox.Indicator.BackgroundTransparency = 0.5
			Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "Input" or "DialogInput" })
			Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine" })
		end)

		return Textbox
	end
end)()
Components.TitleBar = (function()
	local New = Creator.New
	local AddSignal = Creator.AddSignal

	local function parseColor(value)
		if typeof(value) == "Color3" then return value end
		if typeof(value) == "string" then
			local hex = value:gsub("#","")
			if #hex == 6 then
				local r = tonumber(hex:sub(1,2), 16) or 255
				local g = tonumber(hex:sub(3,4), 16) or 255
				local b = tonumber(hex:sub(5,6), 16) or 255
				return Color3.fromRGB(r,g,b)
			end
		end
		return Themes[Library.Theme].SubText or Color3.fromRGB(170,170,170)
	end

	return function(Config)
		local TitleBar = {}

		local function BarButton(Icon, Pos, Parent, Callback)
			local Button = {
				Callback = Callback or function() end,
			}

			Button.Frame = New("TextButton", {
				Size = UDim2.new(0, 34, 1, -8),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Parent = Parent,
				Position = Pos,
				Text = "",
				ThemeTag = {
					BackgroundColor3 = "Text",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 7),
				}),
				New("ImageLabel", {
					Image = Icon,
					Size = UDim2.fromOffset(16, 16),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Name = "Icon",
					ThemeTag = {
						ImageColor3 = "Text",
					},
				}),
			})

			local Motor, SetTransparency = Creator.SpringMotor(1, Button.Frame, "BackgroundTransparency")

			AddSignal(Button.Frame.MouseEnter, function()
				SetTransparency(0.94)
			end)
			AddSignal(Button.Frame.MouseLeave, function()
				SetTransparency(1, true)
			end)
			AddSignal(Button.Frame.MouseButton1Down, function()
				SetTransparency(0.96)
			end)
			AddSignal(Button.Frame.MouseButton1Up, function()
				SetTransparency(0.94)
			end)
			AddSignal(Button.Frame.MouseButton1Click, Button.Callback)

			Button.SetCallback = function(Func)
				Button.Callback = Func
			end

			return Button
		end

		TitleBar.Frame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 42),
			BackgroundTransparency = 1,
			Parent = Config.Parent,
		}, {
			New("Frame", {
				Name = "HeaderContent",
				Size = UDim2.new(1, -16, 1, 0),
				Position = UDim2.new(0, 12, 0, 0),
				BackgroundTransparency = 1,
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0, 5),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
				}),

				Config.Icon and New("ImageLabel", {
					Image = Config.Icon,
					Size = UDim2.fromOffset(20, 20),
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ThemeTag = {
						ImageColor3 = "Text",
					},
				}) or nil,

				not Config.Window.TabsInHeader and New("TextLabel", {
					RichText = true,
					Text = Config.Title,
					FontFace = resolveFont(Library.Font),
					TextSize = 12,
					TextXAlignment = "Left",
					TextYAlignment = "Center",
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					LayoutOrder = Config.Icon and 2 or 1,
					ThemeTag = {
						TextColor3 = "Text",
					},
				}) or nil,
				not Config.Window.TabsInHeader and Config.SubTitle and New("TextLabel", {
					RichText = true,
					Text = Config.SubTitle,
					TextTransparency = 0.4,
					FontFace = resolveFont(Library.Font),
					TextSize = 12,
					TextXAlignment = "Left",
					TextYAlignment = "Center",
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					LayoutOrder = Config.Icon and 3 or 2,
					ThemeTag = {
						TextColor3 = "Text",
					},
				}) or nil,

			}),
			New("Frame", {
				BackgroundTransparency = 0.5,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				ThemeTag = {
					BackgroundColor3 = "TitleBarLine",
				},
			}),
		})
		TitleBar.CloseButton = BarButton(Components.Assets.Close, UDim2.new(1, -4, 0, 4), TitleBar.Frame, function()
			Library.Window:Dialog({
				Title = "Close",
				Content = "Are you sure you want to unload the interface?",
				Buttons = {
					{
						Title = "Yes",
						Callback = function()
							Library:Destroy()
						end,
					},
					{
						Title = "No",
					},
				},
			})
		end)
		TitleBar.MaxButton = BarButton(Components.Assets.Max, UDim2.new(1, -40, 0, 4), TitleBar.Frame, function()
			Config.Window.Maximize(not Config.Window.Maximized)
		end)
		TitleBar.MinButton = BarButton(Components.Assets.Min, UDim2.new(1, -80, 0, 4), TitleBar.Frame, function()
			Library.Window:Minimize()
		end)

		if Config.Window.TabsInHeader then
			local HeaderContent = TitleBar.Frame:FindFirstChild("HeaderContent")
			if not HeaderContent then
				for _, child in ipairs(TitleBar.Frame:GetChildren()) do
					if child:IsA("Frame") and child.Name ~= "TitleBarLine" and child.Name ~= "" then
						HeaderContent = child
						break
					end
				end
			end
			if HeaderContent then
				if Config.Window.TabHolder and Config.Window.TabHolder.Parent and Config.Window.TabHolder.Parent ~= HeaderContent then
					Config.Window.TabHolder:Destroy()
				end
				Config.Window.TabHolder = New("ScrollingFrame", {
					Size = UDim2.new(1, -(Config.Icon and 150 or 120), 1, -8),
					Position = UDim2.new(0, Config.Icon and 30 or 12, 0, 4),
					BackgroundTransparency = 1,
					ScrollBarImageTransparency = 1,
					ScrollBarThickness = 0,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					Parent = HeaderContent,
					LayoutOrder = Config.Icon and 2 or 1,
					Visible = true,
				}, {
					New("UIListLayout", {
						Padding = UDim.new(0, 4),
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center,
					}),
				})
				Config.Window.HeaderSelector = New("Frame", {
					Size = UDim2.fromOffset(0, 2),
					BackgroundColor3 = Color3.fromRGB(76, 194, 255),
					Position = UDim2.fromOffset(0, 0),
					AnchorPoint = Vector2.new(0, 1),
					ZIndex = 11,
					Parent = Config.Window.TabHolder,
					Visible = true,
					ThemeTag = {
						BackgroundColor3 = "Accent",
					},
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(0, 1),
					}),
				})
			end
		end

		return TitleBar
	end
end)()
Components.Window = (function()
	local Spring = Flipper.Spring.new
	local Instant = Flipper.Instant.new
	local New = Creator.New

	return function(Config)
		local Window = {
			Minimized = false,
			Maximized = false,
			Size = Config.Size,
			CurrentPos = 0,
			TabWidth = 0,
			Position = UDim2.fromOffset(0, 0),
			DropdownsOutsideWindow = Config.DropdownsOutsideWindow == true,
			TabsInHeader = Config.TabsInHeader == true,
		}

		Library.Window = Window

		local Dragging = false
		local DragInput, MousePos, StartPos
		local Resizing = false
		local ResizePos
		local MinimizeNotif = false

		Window.AcrylicPaint = Acrylic.AcrylicPaint()

		local function CenterWindow()
			local vp = Camera.ViewportSize
			local x = math.max(0, (vp.X - Window.Size.X.Offset) / 2)
			local y = math.max(0, (vp.Y - Window.Size.Y.Offset) / 2)
			Window.Position = UDim2.fromOffset(math.floor(x), math.floor(y))
			if Window.Root then
				Window.Root.Position = Window.Position
			end
		end
		Window.TabWidth = Config.TabWidth or 160

		local Selector = New("Frame", {
			Size = Window.TabsInHeader and UDim2.fromOffset(0, 4) or UDim2.fromOffset(4, 0),
			BackgroundColor3 = Color3.fromRGB(76, 194, 255),
			Position = Window.TabsInHeader and UDim2.fromOffset(0, 0) or UDim2.fromOffset(0, (Window.TabHolderTop or 45) + 0),
			AnchorPoint = Window.TabsInHeader and Vector2.new(0.5, 0) or Vector2.new(0, 0.5),
			ZIndex = 1,
			ThemeTag = {
				BackgroundColor3 = "Accent",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 9),
			}),
		})

		local ResizeStartFrame = New("Frame", {
			Size = UDim2.fromOffset(20, 20),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -20, 1, -2),
		})

		local SearchElements = {}
		local AllElements = {}

		local function UpdateElementVisibility(searchTerm)
			if not searchTerm then searchTerm = "" end
			
			local function normalizeText(text)
				if not text then return "" end
				text = tostring(text)
				text = string.gsub(text, "^%s+", "")
				text = string.gsub(text, "%s+$", "")
				text = string.gsub(text, "%s+", " ")
				
				local function RobustLower(str)
					if not str then return "" end
					str = tostring(str):lower()
					local upper = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
					local lower = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
					for i = 1, 33 do
						local uChar = utf8.char(utf8.codepoint(upper, utf8.offset(upper, i)))
						local lChar = utf8.char(utf8.codepoint(lower, utf8.offset(lower, i)))
						str = str:gsub(uChar, lChar)
					end
					return str
				end
				
				return RobustLower(text)
			end
			
			local function getElementValues(elementFrame)
				local values = {}
				
				local function addText(text)
					if text and text ~= "" then
						table.insert(values, tostring(text))
					end
				end
				
				local function findTextInDescendants(obj)
					if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
						addText(obj.Text)
					end
					for _, child in pairs(obj:GetChildren()) do
						findTextInDescendants(child)
					end
				end
				
				findTextInDescendants(elementFrame)
				
				return values
			end
			
			local function checkMatch(text, query)
				if query == "" then
					return true
				end
				
				local normalizedText = normalizeText(text)
				if normalizedText == "" then
					return false
				end
				
				local queryLower = normalizeText(query)
				if queryLower == "" then
					return true
				end
				
				if string.find(queryLower, "%s", 1) then
					local words = {}
					for word in string.gmatch(queryLower, "%S+") do
						if #word > 0 then
							table.insert(words, word)
						end
					end
					
					if #words == 0 then
						return true
					end
					
					for _, word in ipairs(words) do
						if not string.find(normalizedText, word, 1, true) then
							return false
						end
					end
					return true
				else
					return string.find(normalizedText, queryLower, 1, true) ~= nil
				end
			end
			
			local normalizedQuery = normalizeText(searchTerm)
			
			local matchedSectionFrames = {}
			local elementsInMatchedSections = {}
			
			for element, data in pairs(AllElements) do
				if element and element.Parent then
					if data.type == "Section" then
						local title = tostring(data.title or "")
						if normalizedQuery ~= "" and checkMatch(title, normalizedQuery) then
							matchedSectionFrames[element] = true
							if element:FindFirstChild("Container") then
								local container = element:FindFirstChild("Container")
								for _, child in pairs(container:GetChildren()) do
									if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
										elementsInMatchedSections[child] = true
									end
								end
							end
						end
					end
				end
			end
			
			for element, data in pairs(AllElements) do
				if element and element.Parent then
					if normalizedQuery == "" then
						element.Visible = true
					else
						local title = tostring(data.title or "")
						local desc = tostring(data.description or "")
						local matchesTitle = checkMatch(title, normalizedQuery)
						local matchesDesc = checkMatch(desc, normalizedQuery)
						local matchesValues = false
						
						local elementValues = getElementValues(element)
						for _, value in ipairs(elementValues) do
							if checkMatch(value, normalizedQuery) then
								matchesValues = true
								break
							end
						end
						
						local matchesSection = elementsInMatchedSections[element] == true
						
						if not matchesSection and data.section then
							for sectionFrame, _ in pairs(matchedSectionFrames) do
								if data.section == sectionFrame then
									matchesSection = true
									break
								end
							end
						end
						
						element.Visible = matchesTitle or matchesDesc or matchesValues or matchesSection
					end
				end
			end

			local searchTermForClosure = searchTerm
			task.spawn(function()
				task.wait(0.05)
				
				if not Window or not Window.ContainerHolder then return end
				
				for _, tabContainer in pairs(Window.ContainerHolder:GetChildren()) do
					if tabContainer:IsA("ScrollingFrame") then
						local containerLayout = tabContainer:FindFirstChild("UIListLayout")
						if containerLayout then
							local containerPadding = tabContainer:FindFirstChild("UIPadding")
							local paddingTop = containerPadding and containerPadding.PaddingTop.Offset or 1
							local paddingBottom = containerPadding and containerPadding.PaddingBottom.Offset or 1
							local contentSize = containerLayout.AbsoluteContentSize.Y + paddingTop + paddingBottom
							tabContainer.CanvasSize = UDim2.new(0, 0, 0, math.max(0, contentSize))
						end
						
						for _, section in pairs(tabContainer:GetChildren()) do
							if section:IsA("Frame") and section.Name ~= "UIPadding" then
								local sectionContainer = section:FindFirstChild("Container")
								
								if sectionContainer and sectionContainer:IsA("Frame") then
									local containerLayout = sectionContainer:FindFirstChild("UIListLayout")
									if containerLayout then
										local hasVisibleChild = false
										for _, element in pairs(sectionContainer:GetChildren()) do
											if not element:IsA("UIListLayout") and element.Visible then
												hasVisibleChild = true
												break
											end
										end
										
										if searchTermForClosure == "" or hasVisibleChild then
											section.Visible = true
											local containerPadding = sectionContainer:FindFirstChild("UIPadding")
											local containerPaddingTop = containerPadding and containerPadding.PaddingTop.Offset or 0
											local containerPaddingBottom = containerPadding and containerPadding.PaddingBottom.Offset or 0
											local containerContentSize = containerLayout.AbsoluteContentSize.Y + containerPaddingTop + containerPaddingBottom
											sectionContainer.Size = UDim2.new(1, 0, 0, math.max(0, containerContentSize))
										else
											section.Visible = false
											sectionContainer.Size = UDim2.new(1, 0, 0, 0)
										end
									end
								end
								
								local sectionLayout = section:FindFirstChild("UIListLayout")
								if sectionLayout then
									local sectionPadding = section:FindFirstChild("UIPadding")
									local sectionPaddingTop = sectionPadding and sectionPadding.PaddingTop.Offset or 0
									local sectionPaddingBottom = sectionPadding and sectionPadding.PaddingBottom.Offset or 0
									local sectionContentSize = sectionLayout.AbsoluteContentSize.Y + sectionPaddingTop + sectionPaddingBottom
									section.Size = UDim2.new(1, 0, 0, math.max(0, sectionContentSize + 25))
								end
							end
						end
					end
				end
			end)
		end

		local function RegisterElement(elementFrame, title, elementType, description)
			if elementFrame then
				local sectionFrame = nil
				local parent = elementFrame.Parent
				
				while parent do
					if parent:FindFirstChild("Container") then
						local sectionRoot = parent
						local sectionContainer = parent:FindFirstChild("Container")
						if sectionContainer and elementFrame.Parent == sectionContainer then
							sectionFrame = sectionRoot
							break
						end
					end
					parent = parent.Parent
				end
				
				AllElements[elementFrame] = {
					title = tostring(title or ""),
					type = elementType or "Element",
					description = tostring(description or ""),
					section = sectionFrame
				}
			end
		end

		Window.ShowSearch = (Config.Search == nil) and true or (Config.Search and true or false)

		local ImageAsset = Config.Image
		local hasImage = ImageAsset and type(ImageAsset) == "string" and ImageAsset ~= ""
		local imageSize = Window.TabWidth - 24
		local topOffset = 0

		local ImageFrame = hasImage and New("ImageLabel", {
			Size = UDim2.new(0, imageSize, 0, imageSize),
			Position = UDim2.new(0.5, 0, 0, topOffset),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			Image = ImageAsset,
			ZIndex = 5,
			Visible = true,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 6),
			}),
		}) or nil

		Window.HasImage = hasImage
		Window.ImageFrame = ImageFrame
		Window.ImageSize = imageSize
		Window.TopOffset = topOffset

		local searchOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
		local searchHeight = 28

		local tabHolderTop
		if hasImage then
			if Window.ShowSearch then
				tabHolderTop = imageSize + 10 + topOffset + searchHeight + 6
			else
				tabHolderTop = imageSize + 10 + topOffset
			end
		else
			if Window.ShowSearch then
				tabHolderTop = topOffset + searchHeight + 6
			else
				tabHolderTop = 45
			end
		end
		Window.TabHolderTop = tabHolderTop

		if not Window.TabsInHeader then
			Window.TabHolder = New("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, -(tabHolderTop + 6)),
				Position = UDim2.new(0, 0, 0, tabHolderTop),
				BackgroundTransparency = 1,
				ScrollBarImageTransparency = 1,
				ScrollBarThickness = 0,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0, 4),
				}),
			})
		end

		local SearchFrame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 28),
			Position = UDim2.new(0, 0, 0, searchOffset),
			BackgroundTransparency = 0.7,
			ZIndex = 10,
			Visible = Window.ShowSearch,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			ThemeTag = {
				BackgroundColor3 = "Element",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local SearchInput = New("TextBox", {
			FontFace = resolveFont(Library.Font),
			TextColor3 = Color3.fromRGB(200, 200, 200),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -36, 1, 0),
			Position = UDim2.new(0, 8, 0, 0),
			PlaceholderText = "Search...",
			PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
			ClearTextOnFocus = false,
			Text = "",
			Parent = SearchFrame,
			ThemeTag = {
				TextColor3 = "Text",
				PlaceholderColor3 = "SubText",
			},
		})

		local SearchIcon = New("ImageLabel", {
			Size = UDim2.fromOffset(16, 16),
			Position = UDim2.new(1, -13, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = Library:GetIcon("search"),
			Parent = SearchFrame,
			ImageTransparency = 0.3,
			ThemeTag = {
				ImageColor3 = "SubText",
			},
		})

		local SearchTextbox = {
			Input = SearchInput,
			Frame = SearchFrame,
		}

		Creator.AddSignal(SearchTextbox.Input:GetPropertyChangedSignal("Text"), function()
			local searchText = SearchTextbox.Input.Text or ""
			UpdateElementVisibility(searchText)
		end)

		Creator.AddSignal(SearchTextbox.Input.FocusLost, function(enterPressed)
		end)

		Creator.AddSignal(UserInputService.InputBegan, function(input, gameProcessed)
			if gameProcessed then return end
			if input.KeyCode == Enum.KeyCode.Escape and SearchTextbox.Input:IsFocused() then
				SearchTextbox.Input.Text = ""
				SearchTextbox.Input:ReleaseFocus()
			end
		end)

		Window.SearchElements = SearchElements
		Window.AllElements = AllElements
		Window.RegisterElement = RegisterElement
		Window.UpdateElementVisibility = UpdateElementVisibility

		local imageSize = Window.TabWidth - 24
		local topOffset = Window.TopOffset or 25
		local imageOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
		local searchHeight = 28
		local totalOffset = (Window.ShowSearch and searchHeight or 0) + imageOffset

		local TabFrame = New("Frame", {
			Size = UDim2.new(0, Window.TabWidth, 1, Window.ShowSearch and -63 or -31),
			Position = UDim2.new(0, 12, 0, Window.ShowSearch and 54 or 19),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Visible = not Window.TabsInHeader,
		}, {
			ImageFrame,
			SearchFrame,
			not Window.TabsInHeader and Window.TabHolder or nil,
			not Window.TabsInHeader and Selector or nil,
		})

		Window.TabFrame = TabFrame

		Window.TabDisplay = New("TextLabel", {
			RichText = true,
			Text = "Tab",
			TextTransparency = 0,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.Medium),
			TextSize = 28,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, -Window.TabWidth - 52, 0, 32),
			Position = UDim2.fromOffset(Window.TabWidth + 30, 56),
			BackgroundTransparency = 1,
			Visible = not Window.TabsInHeader,
			TextWrapped = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		Window.ContainerHolder = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		})

		Window.ContainerAnim = New("CanvasGroup", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
		})

		Window.ContainerCanvas = New("Frame", {
			Size = Window.TabsInHeader and UDim2.new(1, -32, 1, -102) or UDim2.new(1, -Window.TabWidth - 32, 1, -102),
			Position = Window.TabsInHeader and UDim2.fromOffset(16, 90) or UDim2.fromOffset(Window.TabWidth + 26, 90),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, {
			Window.ContainerAnim,
			Window.ContainerHolder
		})

		local backgroundTransparency = Config.BackgroundTransparency
		if backgroundTransparency == nil then
			backgroundTransparency = 0.5
		end
		Window.BackgroundTransparency = backgroundTransparency

		if not Library.Acrylic and Window.AcrylicPaint and Window.AcrylicPaint.Frame then
			local background = Window.AcrylicPaint.Frame:FindFirstChild("Background")
			if background then
				background.BackgroundTransparency = backgroundTransparency
			end
		end

		local backgroundImageTransparency = Config.BackgroundImageTransparency
		if backgroundImageTransparency == nil then
			backgroundImageTransparency = backgroundTransparency
		end
		Window.BackgroundImageTransparency = backgroundImageTransparency

		local rootChildren = {}
		
		if Config.BackgroundImage then
			local BackgroundImageFrame = New("ImageLabel", {
				Name = "BackgroundImage",
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(0, 0),
				BackgroundTransparency = 1,
				Image = Config.BackgroundImage,
				ImageTransparency = math.max(0, math.min(1, backgroundImageTransparency)),
				ZIndex = 0,
				ScaleType = Enum.ScaleType.Stretch,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})
			Window.BackgroundImage = BackgroundImageFrame
			table.insert(rootChildren, BackgroundImageFrame)
		end
		
		local MinimizeShade = New("Frame", {
			Name = "MinimizeShade",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 900,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		})
		Window.MinimizeShade = MinimizeShade
		
		table.insert(rootChildren, Window.AcrylicPaint.Frame)
		table.insert(rootChildren, Window.TabDisplay)
		table.insert(rootChildren, Window.ContainerCanvas)
		table.insert(rootChildren, TabFrame)
		table.insert(rootChildren, ResizeStartFrame)
		table.insert(rootChildren, MinimizeShade)

		Window.Root = New("Frame", {
			BackgroundTransparency = 1,
			Size = Window.Size,
			Position = Window.Position,
			Parent = Config.Parent,
			ZLayer = "base",
			ZIndex = 1,
		}, rootChildren)

		Window.RootScale = New("UIScale", {
			Scale = 1,
			Parent = Window.Root,
		})

		CenterWindow()
		Creator.AddSignal(Camera:GetPropertyChangedSignal("ViewportSize"), function()
			CenterWindow()
		end)


		Window.TitleBar = Components.TitleBar({
			Title = Config.Title,
			SubTitle = Config.SubTitle,
			Icon = Config.Icon,
			Parent = Window.Root,
			Window = Window,
			UserInfoTitle = Config.UserInfoTitle,
			UserInfo = Config.UserInfo,
			UserInfoSubtitle = Config.UserInfoSubtitle,
			UserInfoSubtitleColor = Config.UserInfoSubtitleColor,
		})

		Creator.SetupMarquee(Window.TabDisplay)

		if Config.UserInfo then
			local function parseColor(value)
				if typeof(value) == "Color3" then return value end
				return Themes[Library.Theme].SubText or Color3.fromRGB(170,170,170)
			end

		local userInfoHeight = 56
		Window.UserInfoHeight = userInfoHeight
		Window.UserInfoTop = Config.UserInfoTop
		
		local UserInfoSection = New("Frame", {
			Name = "UserInfoSection",
			Size = UDim2.new(1, 0, 0, userInfoHeight),
			Position = Config.UserInfoTop and UDim2.fromOffset(0, 0) or UDim2.new(0, 0, 1, -(userInfoHeight + 2)),
			BackgroundTransparency = 1,
			ZIndex = 15,
			Parent = TabFrame,
		})

		New("Frame", {
			Name = "UserInfoSeparator",
			BackgroundTransparency = 0.5,
			Size = UDim2.new(1, 0, 0, 1),
			Position = Config.UserInfoTop and UDim2.fromOffset(0, userInfoHeight + 4) or UDim2.new(0, 0, 1, -(userInfoHeight + 4)),
			ZIndex = 15,
			Parent = TabFrame,
			ThemeTag = {
				BackgroundColor3 = "TitleBarLine",
			},
		})

		local avatarSize = 36
		local avatarPadding = 12
		local Avatar = New("ImageLabel", {
			Name = "Avatar",
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(avatarSize, avatarSize),
			Position = UDim2.new(0, avatarPadding, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = "rbxassetid://0",
			ZIndex = 16,
			Parent = UserInfoSection,
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})

		pcall(function()
			local Players = game:GetService("Players")
			local content, isReady = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
			if isReady and content then
				Avatar.Image = content
			end
		end)

		local titleText = tostring((Config.UserInfoTitle ~= nil and Config.UserInfoTitle) or (LocalPlayer.Name or "User"))
		local subtitleText = (Config.UserInfoSubtitle ~= nil) and tostring(Config.UserInfoSubtitle) or ""

		local textLeftPadding = avatarSize + avatarPadding + 10
		local textRightPadding = 12

		New("TextLabel", {
			Name = "UserName",
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			FontFace = resolveFont(Library.Font),
			TextSize = 14,
			Text = titleText,
			Size = UDim2.new(1, -(textLeftPadding + textRightPadding), 0.5, 0),
			Position = UDim2.new(0, textLeftPadding, 0, 0),
			TextTruncate = Enum.TextTruncate.AtEnd,
			Parent = UserInfoSection,
			ThemeTag = { TextColor3 = "Text" },
		})

		New("TextLabel", {
			Name = "UserSubtitle",
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			FontFace = resolveFont(Library.Font),
			TextSize = 12,
			TextTransparency = 0.3,
			Text = subtitleText,
			TextColor3 = parseColor(Config.UserInfoSubtitleColor),
			Size = UDim2.new(1, -(textLeftPadding + textRightPadding), 0.5, 0),
			Position = UDim2.new(0, textLeftPadding, 0.5, 0),
			TextTruncate = Enum.TextTruncate.AtEnd,
			Parent = UserInfoSection,
		})

			if Config.UserInfoTop then
				local topOffset = Window.TopOffset or 0
				local imageOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
				TabFrame.Position = UDim2.new(0, 12, 0, 39)
				TabFrame.Size = UDim2.new(0, Window.TabWidth, 1, -(31 + imageOffset + userInfoHeight))
				local searchOffset = hasImage and (imageSize + 10 + topOffset) or topOffset
				SearchFrame.Position = UDim2.new(0, 0, 0, userInfoHeight + 6 + searchOffset)
				if ImageFrame then
					ImageFrame.Position = UDim2.new(0.5, 0, 0, userInfoHeight + topOffset)
				end
				local newTabHolderTop = userInfoHeight + 6 + (hasImage and (imageSize + 10 + topOffset) or topOffset) + (Window.ShowSearch and (searchHeight + 6) or 0)
				Window.TabHolderTop = newTabHolderTop
				Window.TabHolder.Position = UDim2.new(0, 0, 0, newTabHolderTop)
				Window.TabHolder.Size = UDim2.new(1, 0, 1, -(newTabHolderTop + 6 + userInfoHeight))
				if Window.UpdateTabHolderLayout then
					Window:UpdateTabHolderLayout(newTabHolderTop)
				end
			else
				Window.TabHolder.Size = UDim2.new(1, 0, 1, -(tabHolderTop + 6 + userInfoHeight))
				if Window.UpdateTabHolderLayout then
					Window:UpdateTabHolderLayout(tabHolderTop)
				end
			end
		end

		if Library.UseAcrylic then
			Window.AcrylicPaint.AddParent(Window.Root)
		end

		local SizeMotor = Flipper.GroupMotor.new({
			X = Window.Size.X.Offset,
			Y = Window.Size.Y.Offset,
		})

		local PosMotor = Flipper.GroupMotor.new({
			X = Window.Position.X.Offset,
			Y = Window.Position.Y.Offset,
		})

		local CDDrag = 0
		Window.SelectorPosMotor = Flipper.SingleMotor.new(Window.TabsInHeader and 0 or 17)
		Window.SelectorSizeMotor = Flipper.SingleMotor.new(Window.TabsInHeader and 0 or 0)
		Window.ContainerBackMotor = Flipper.SingleMotor.new(0)
		Window.ContainerPosMotor = Flipper.SingleMotor.new(94)
		Window.ContainerXMotor = Flipper.SingleMotor.new(0)

		SizeMotor:onStep(function(values)
			task.wait(CDDrag / 10)
			Window.Root.Size = UDim2.new(0, values.X, 0, values.Y)
			task.spawn(function()
				task.wait(0.01)
				if Window.UpdateTabHolderLayout then
					Window:UpdateTabHolderLayout()
				end
			end)
		end)

		PosMotor:onStep(function(values)
			task.wait(CDDrag / 10)
			Window.Root.Position = UDim2.new(0, values.X, 0, values.Y)
		end)

		local LastValue = 0
		local LastTime = 0
		Window.SelectorPosMotor:onStep(function(Value)
			if Window.TabsInHeader then
				if Window.HeaderSelector and Window.TabHolder then
					local tabHolderPos = Window.TabHolder.AbsolutePosition.X
					local tabHolderParentPos = Window.TabHolder.Parent and Window.TabHolder.Parent.AbsolutePosition.X or 0
					local selectorX = Value
					Window.HeaderSelector.Position = UDim2.new(0, selectorX, 1, -2)
					Window.HeaderSelector.Visible = true
				end
			else
				local base = Window.TabHolderTop or 45
				local verticalInset = 16
				local selectorY = base + Value + verticalInset

				local searchOffset = Window.HasImage and (Window.ImageSize + Window.TopOffset + 10) or Window.TopOffset
				local searchTop = searchOffset
				local searchBottom = searchTop + 28

				if Window.HasImage and Window.ImageSize then
					local imageBottom = Window.ImageSize + Window.TopOffset + 10
					if selectorY < imageBottom then
						Selector.Visible = false
					return
				end
			end

			if Window.ShowSearch then
				if selectorY >= searchTop and selectorY <= searchBottom then
					Selector.Visible = false
					return
				end
			end

			if Window.UserInfoHeight then
				local tabFrameSize = Window.TabFrame and Window.TabFrame.Size.Y.Offset or 0
				local userInfoTop = Window.UserInfoTop and 0 or (tabFrameSize - Window.UserInfoHeight - 2)
				local userInfoBottom = userInfoTop + Window.UserInfoHeight
				
				if selectorY >= userInfoTop and selectorY <= userInfoBottom then
					Selector.Visible = false
					return
				end
			end

				Selector.Visible = true
				Selector.Position = UDim2.new(0, 0, 0, selectorY)
			end
			local Now = os.clock()
			local DeltaTime = Now - LastTime

			if LastValue ~= nil then
				if Window.TabsInHeader then
					if Window.HeaderSelector and TabModule.Tabs[TabModule.SelectedTab] then
						local tabFrame = TabModule.Tabs[TabModule.SelectedTab].Frame
						if tabFrame then
							Window.SelectorSizeMotor:setGoal(Spring(tabFrame.AbsoluteSize.X, { frequency = 6 }))
						end
					end
				else
					Window.SelectorSizeMotor:setGoal(Spring((math.abs(Value - LastValue) / (DeltaTime * 60)) + 16))
				end
				LastValue = Value
			end
			LastTime = Now
		end)

		Window.SelectorSizeMotor:onStep(function(Value)
			if Window.TabsInHeader then
				if Window.HeaderSelector then
					Window.HeaderSelector.Size = UDim2.new(0, Value, 0, 2)
				end
			else
				Selector.Size = UDim2.new(0, 4, 0, Value)
			end
		end)

		Window.ContainerBackMotor:onStep(function(Value)
			Window.ContainerAnim.GroupTransparency = Value
		end)

		local ContainerXValue = 0
		local ContainerYValue = 94

		local function UpdateContainerPosition()
			if Window.ContainerAnim then
				Window.ContainerAnim.Position = UDim2.fromOffset(ContainerXValue, ContainerYValue)
			end
		end

		Window.ContainerPosMotor:onStep(function(Value)
			ContainerYValue = Value
			UpdateContainerPosition()
		end)

		Window.ContainerXMotor:onStep(function(Value)
			ContainerXValue = Value
			UpdateContainerPosition()
		end)

		local OldSizeX
		local OldSizeY
		Window.Maximize = function(Value, NoPos, Instant)
			Window.Maximized = Value
			Window.TitleBar.MaxButton.Frame.Icon.Image = Value and Components.Assets.Restore or Components.Assets.Max

			if Value then
				OldSizeX = Window.Size.X.Offset
				OldSizeY = Window.Size.Y.Offset
			end
			local SizeX = Value and Camera.ViewportSize.X or OldSizeX
			local SizeY = Value and Camera.ViewportSize.Y or OldSizeY
			SizeMotor:setGoal({
				X = Flipper[Instant and "Instant" or "Spring"].new(SizeX, { frequency = 6 }),
				Y = Flipper[Instant and "Instant" or "Spring"].new(SizeY, { frequency = 6 }),
			})
			Window.Size = UDim2.fromOffset(SizeX, SizeY)

			if not NoPos then
				PosMotor:setGoal({
					X = Spring(Value and 0 or Window.Position.X.Offset, { frequency = 6 }),
					Y = Spring(Value and 0 or Window.Position.Y.Offset, { frequency = 6 }),
				})
			end
		end

		Creator.AddSignal(Window.TitleBar.Frame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Dragging = true
				MousePos = Input.Position
				StartPos = Window.Root.Position

				if Window.Maximized then
					StartPos = UDim2.fromOffset(
						Mouse.X - (Mouse.X * ((OldSizeX - 100) / Window.Root.AbsoluteSize.X)),
						Mouse.Y - (Mouse.Y * (OldSizeY / Window.Root.AbsoluteSize.Y))
					)
				end

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)

		Creator.AddSignal(Window.TitleBar.Frame.InputChanged, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseMovement
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = Input
			end
		end)

		Creator.AddSignal(ResizeStartFrame.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				Resizing = true
				ResizePos = Input.Position
			end
		end)

		Creator.AddSignal(UserInputService.InputChanged, function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				Window.Position = UDim2.fromOffset(StartPos.X.Offset + Delta.X, StartPos.Y.Offset + Delta.Y)
				PosMotor:setGoal({
					X = Instant(Window.Position.X.Offset),
					Y = Instant(Window.Position.Y.Offset),
				})

				if Window.Maximized then
					Window.Maximize(false, true, true)
				end
			end

			if
				(Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)
				and Resizing
			then
				local Delta = Input.Position - ResizePos
				local StartSize = Window.Size

				local TargetSize = Vector3.new(StartSize.X.Offset, StartSize.Y.Offset, 0) + Vector3.new(1, 1, 0) * Delta
				local TargetSizeClamped =
					Vector2.new(math.clamp(TargetSize.X, 470, 2048), math.clamp(TargetSize.Y, 380, 2048))

				SizeMotor:setGoal({
					X = Flipper.Instant.new(TargetSizeClamped.X),
					Y = Flipper.Instant.new(TargetSizeClamped.Y),
				})
			end
		end)

		Creator.AddSignal(UserInputService.InputEnded, function(Input)
			if Resizing == true or Input.UserInputType == Enum.UserInputType.Touch then
				Resizing = false
				Window.Size = UDim2.fromOffset(SizeMotor:getValue().X, SizeMotor:getValue().Y)
			end
		end)

		if Window.TabHolder then
			Creator.AddSignal(Window.TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				if Window.TabHolder and Window.TabHolder.UIListLayout then
					if Window.TabsInHeader then
						local padding = Window.TabHolder:FindFirstChild("UIPadding")
						local paddingLeft = padding and padding.PaddingLeft.Offset or 0
						local paddingRight = padding and padding.PaddingRight.Offset or 0
						local contentSize = Window.TabHolder.UIListLayout.AbsoluteContentSize.X + paddingLeft + paddingRight
						if contentSize > 0 then
							Window.TabHolder.CanvasSize = UDim2.new(0, contentSize, 0, 0)
						end
					else
						local padding = Window.TabHolder:FindFirstChild("UIPadding")
						local paddingTop = padding and padding.PaddingTop.Offset or 6
						local paddingBottom = padding and padding.PaddingBottom.Offset or 6
						local contentSize = Window.TabHolder.UIListLayout.AbsoluteContentSize.Y + paddingTop + paddingBottom
						if contentSize > 0 then
							Window.TabHolder.CanvasSize = UDim2.new(0, 0, 0, contentSize)
						end
					end
				end
			end)
		end

		Creator.AddSignal(UserInputService.InputBegan, function(Input)
			if
				type(Library.MinimizeKeybind) == "table"
				and Library.MinimizeKeybind.Type == "Keybind"
				and not UserInputService:GetFocusedTextBox()
			then
				if Input.KeyCode.Name == Library.MinimizeKeybind.Value then
					-- handled by the keybind callback
				end
			elseif Input.KeyCode == Library.MinimizeKey and not UserInputService:GetFocusedTextBox() then
				Window:Minimize()
			end
		end)

		function Window:ToggleSearch()
			Window.ShowSearch = not Window.ShowSearch
			SearchFrame.Visible = Window.ShowSearch
			local topOffset = Window.TopOffset or 25
			local searchOffset = Window.HasImage and (Window.ImageSize + 10 + topOffset) or topOffset
			SearchFrame.Position = UDim2.new(0, 0, 0, searchOffset)
			local imageOffset = Window.HasImage and (Window.ImageSize + 10 + topOffset) or topOffset
			local searchHeight = 28
			local totalOffset = (Window.ShowSearch and searchHeight or 0) + imageOffset
			TabFrame.Size = UDim2.new(0, Window.TabWidth, 1, -(totalOffset + 31))

			if Window.UpdateTabHolderLayout then
				Window:UpdateTabHolderLayout()
			end
		end

		function Window:Minimize()
			Window.Minimized = not Window.Minimized

			if Window.Minimized then
				Dragging = false
				Resizing = false
			end

			local targetVisible = not Window.Minimized
			local shade = Window.MinimizeShade

			if shade then
				shade.BackgroundTransparency = targetVisible and 1 or 0.75
				shade.Visible = not targetVisible
			end

			if Window.RootScale then
				Window.Root.Visible = targetVisible
				Window.RootScale.Scale = targetVisible and 1 or 0.9
				if targetVisible and shade then
					shade.BackgroundTransparency = 1
					shade.Visible = false
				end
			else
				Window.Root.Visible = targetVisible
				if shade then
					if targetVisible then
						shade.BackgroundTransparency = 1
						shade.Visible = false
					else
						shade.BackgroundTransparency = 0.75
						shade.Visible = true
					end
				end
			end

			for _, Option in next, Library.Options do
				if Option and Option.Type == "Dropdown" and Option.Opened then
					pcall(function()
						Option:Close()
					end)
				end
			end
			if not MinimizeNotif then
				MinimizeNotif = true
				local Key = Library.MinimizeKeybind and Library.MinimizeKeybind.Value or Library.MinimizeKey.Name
				if not Mobile then Library:Notify({
					Title = "Interface",
					Content = "Press " .. Key .. " to toggle the interface.",
					Duration = 6
					})
				else 
					Library:Notify({
						Title = "Interface",
						Content = "Tap to the button to toggle the interface.",
						Duration = 6
					})
				end
			end

			if not RunService:IsStudio() and Library.Minimizer then
				pcall(function()
					if Mobile then
						local mobileButton = Library.Minimizer:FindFirstChild("TextButton")
						if mobileButton then
							local imageLabel = mobileButton:FindFirstChild("ImageLabel")
							if imageLabel then
								imageLabel.Image = Window.Minimized and Library:GetIcon("monitor-off") or Library:GetIcon("moon")
							end
						end
					else
						local desktopButton = Library.Minimizer:FindFirstChild("TextButton")
						if desktopButton then
							local imageLabel = desktopButton:FindFirstChild("ImageLabel")
							if imageLabel then
								imageLabel.Image = Window.Minimized and Library:GetIcon("monitor-off") or Library:GetIcon("moon")
							end
						end
					end
				end)
			end
		end

		function Window:Destroy()
			if Window.AllElements then
				Window.AllElements = nil
			end
			
			if Window.Tabs then
				for _, tab in pairs(Window.Tabs) do
					if tab then
						if tab.ContainerXMotor then
							pcall(function() tab.ContainerXMotor:destroy() end)
						end
						if tab.ContainerTransparencyMotor then
							pcall(function() tab.ContainerTransparencyMotor:destroy() end)
						end
						if tab.Motor then
							pcall(function() tab.Motor:destroy() end)
						end
						if tab.SubTabs then
							for _, subTab in pairs(tab.SubTabs) do
								if subTab.XMotor then
									pcall(function() subTab.XMotor:destroy() end)
								end
								if subTab.TransparencyMotor then
									pcall(function() subTab.TransparencyMotor:destroy() end)
								end
								if subTab.Motor then
									pcall(function() subTab.Motor:destroy() end)
								end
							end
						end
						if tab.Destroy then
							pcall(function()
								tab:Destroy()
							end)
						end
					end
				end
				Window.Tabs = {}
			end
			
			if Window.SelectorPosMotor then
				pcall(function() Window.SelectorPosMotor:destroy() end)
			end
			if Window.SelectorSizeMotor then
				pcall(function() Window.SelectorSizeMotor:destroy() end)
			end
			if Window.ContainerBackMotor then
				pcall(function() Window.ContainerBackMotor:destroy() end)
			end
			if Window.ContainerPosMotor then
				pcall(function() Window.ContainerPosMotor:destroy() end)
			end
			if Window.ContainerXMotor then
				pcall(function() Window.ContainerXMotor:destroy() end)
			end
			
			if Window.ContainerHolder then
				for _, container in pairs(Window.ContainerHolder:GetChildren()) do
					pcall(function()
						container:Destroy()
					end)
				end
			end

			if Window.DragLayer then
				pcall(function()
					Window.DragLayer:Destroy()
				end)
				Window.DragLayer = nil
			end
			
			if Library.UseAcrylic and Window.AcrylicPaint and Window.AcrylicPaint.Model then
				Window.AcrylicPaint.Model:Destroy()
			end
			
			if Window.Root then
				Window.Root:Destroy()
			end
			
			Window = nil
		end

		function Window:SetBackgroundImage(imageUrl, imageTransparency)
			if not Window.BackgroundImage then
				local imgTransparency = imageTransparency or Window.BackgroundImageTransparency or Window.BackgroundTransparency or 0.5
				local BackgroundImageFrame = New("ImageLabel", {
					Name = "BackgroundImage",
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
					Image = imageUrl,
					ImageTransparency = math.max(0, math.min(1, imgTransparency)),
					ZIndex = 0,
					ScaleType = Enum.ScaleType.Stretch,
					Parent = Window.Root,
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				})
				Window.BackgroundImage = BackgroundImageFrame
				if imageTransparency ~= nil then
					Window.BackgroundImageTransparency = imageTransparency
				end
			else
				Window.BackgroundImage.Image = imageUrl
				Window.BackgroundImage.ScaleType = Enum.ScaleType.Stretch
				if imageTransparency ~= nil then
					Window.BackgroundImageTransparency = imageTransparency
					Window.BackgroundImage.ImageTransparency = math.max(0, math.min(1, imageTransparency))
				end
			end
			Library:RefreshOpenDropdowns()
		end

		function Window:SetBackgroundTransparency(transparency)
			transparency = transparency or 0.5
			Window.BackgroundTransparency = transparency
			local base = clamp01(transparency)

			if Window.AcrylicPaint and Window.AcrylicPaint.Frame then
				local background = Window.AcrylicPaint.Frame:FindFirstChild("Background")
				if background then
					if Library.Acrylic and Library.UseAcrylic then
						background.BackgroundTransparency = computeAcrylicTransparency(base)
					else
						background.BackgroundTransparency = computeSolidTransparency(base)
					end
				end
				for _, child in ipairs(Window.AcrylicPaint.Frame:GetChildren()) do
					if child:IsA("ImageLabel") and child.Image == "rbxassetid://8992230677" then
						child.ImageTransparency = Library.Acrylic and Library.UseAcrylic
							and computeAcrylicTransparency(base)
							or computeSolidTransparency(base)
					elseif child:IsA("Frame") and child:FindFirstChildWhichIsA("UIGradient") then
						child.BackgroundTransparency = Library.Acrylic and Library.UseAcrylic
							and computeAcrylicTransparency(base)
							or computeSolidTransparency(base)
					end
				end
			end

			Library:RefreshOpenDropdowns()
		end

		function Window:SetBackgroundImageTransparency(transparency)
			transparency = transparency or 0.5
			Window.BackgroundImageTransparency = transparency
			if Window.BackgroundImage then
				Window.BackgroundImage.ImageTransparency = math.max(0, math.min(1, transparency))
			end

			Library:RefreshOpenDropdowns()
		end

		local DialogModule = Components.Dialog:Init(Window)
		function Window:Dialog(Config)
			local Dialog = DialogModule:Create()
			Dialog.Title.Text = Config.Title

			local ContentHolder = New("ScrollingFrame", {
				BackgroundTransparency = 1,
				ScrollBarImageTransparency = 0.7,
				ScrollBarThickness = 4,
				BottomImage = "rbxassetid://6889812791",
				MidImage = "rbxassetid://6889812721",
				TopImage = "rbxassetid://6276641225",
				Position = UDim2.fromOffset(20, 60),
				Size = UDim2.new(1, -40, 1, -110),
				CanvasSize = UDim2.fromOffset(0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				Parent = Dialog.Root,
			})

			local Content = New("TextLabel", {
				FontFace = resolveFont(Library.Font),
				Text = Config.Content,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextWrapped = true,
				Size = UDim2.new(1, -8, 0, 0),
				BackgroundTransparency = 1,
				Parent = ContentHolder,
				ThemeTag = { TextColor3 = "Text" },
			})

			New("UISizeConstraint", {
				MinSize = Vector2.new(300, 165),
				MaxSize = Vector2.new(620, math.huge),
				Parent = Dialog.Root,
			})

			local maxWidth = math.min(620, Window.Size.X.Offset - 120)
			local baseWidth = math.max(300, math.min(maxWidth, Content.TextBounds.X + 40))
			Dialog.Root.Size = UDim2.fromOffset(baseWidth, 165)
			ContentHolder.Size = UDim2.new(1, -40, 1, -110)
			task.defer(function()
				local contentHeight = Content.TextBounds.Y
				local desired = math.clamp(contentHeight + 110, 165, 420)
				Dialog.Root.Size = UDim2.fromOffset(baseWidth, desired)
				ContentHolder.CanvasSize = UDim2.fromOffset(0, contentHeight)
			end)

			for _, Button in next, Config.Buttons do
				Dialog:Button(Button.Title, Button.Callback)
			end

			Dialog:Open()
		end

		local TabModule = Components.Tab:Init(Window)
		function Window:AddTab(TabConfig)
			local tab = TabModule:New(TabConfig.Title, TabConfig.Icon, Window.TabHolder)
			return tab
		end

		function Window:SelectTab(Tab)
			TabModule:SelectTab(Tab)
		end

		if Window.TabHolder then
			Creator.AddSignal(Window.TabHolder:GetPropertyChangedSignal("CanvasPosition"), function()
				LastValue = TabModule:GetCurrentTabPos() + 16
				LastTime = 0
				Window.SelectorPosMotor:setGoal(Instant(TabModule:GetCurrentTabPos()))
			end)
		end


		return Window
	end
end)()

return Components

local Creator = 
local Library = 
local Flipper = 

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local RenderStepped = RunService.RenderStepped
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local LocalPlayer = game:GetService("Players").LocalPlayer

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local fischbypass
if game.GameId == 5750914919 then
	fischbypass = true
end

local New = Creator.New
local Components = 
local Acrylic = 
local Window

local HUE_SEQUENCE_TABLE = (function()
	local t = {}
	for Color = 0, 1, 0.1 do
		table.insert(t, ColorSequenceKeypoint.new(Color, Color3.fromHSV(Color, 1, 1)))
	end
	return t
end)()

local ElementsTable = {}
local AddSignal = Creator.AddSignal
local resolveFont = Creator.resolveFont

ElementsTable.Button = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Button"

	function Element:New(Idx, Config)
		if type(Idx) == "table" then
			Config = Idx
			Idx = nil
		end
		assert(Config.Title, "Button - Missing Title")
		Config.Callback = Config.Callback or function() end

		local ButtonFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		ButtonFrame.TitleHolder.Size = UDim2.new(1, -34, 0, 16)
		if ButtonFrame.DescLabel then
			ButtonFrame.DescLabel.Size = UDim2.new(1, -34, 0, 16)
		end

		local ButtonIco = New("ImageLabel", {
			Image = Library:GetIcon("chevron-right"),
			Size = UDim2.fromOffset(16, 16),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			BackgroundTransparency = 1,
			Parent = ButtonFrame.Frame,
			ThemeTag = {
				ImageColor3 = "Text",
			},
		})

		Creator.AddSignal(ButtonFrame.Frame.MouseButton1Click, function()
			Library:SafeCallback(Config.Callback)
		end)

		return ButtonFrame
	end

	return Element
end)()
ElementsTable.Toggle = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Toggle"

	function Element:New(Idx, Config)
		assert(Config.Title, "Toggle - Missing Title")

		local Toggle = {
			Value = Config.Default or false,
			Locked = Config.Locked or false,
			Callback = Config.Callback or function(Value) end,
			Type = "Toggle",
		}

		local ToggleFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		ToggleFrame.DescLabel.Size = UDim2.new(1, -54, 0, 16)
		ToggleFrame.TitleHolder.Size = UDim2.new(1, -54, 0, 16)

		Toggle.SetTitle = ToggleFrame.SetTitle
		Toggle.SetDesc = ToggleFrame.SetDesc
		Toggle.Visible = ToggleFrame.Visible
		Toggle.Elements = ToggleFrame

		local ToggleCircle = New("ImageLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromOffset(14, 14),
			Position = UDim2.new(0, 2, 0.5, 0),
			Image = "http://www.roblox.com/asset/?id=12266946128",
			ImageTransparency = 0.5,
			ThemeTag = {
				ImageColor3 = "ToggleSlider",
			},
		})

		local ToggleBorder = New("UIStroke", {
			Transparency = 0.5,
			ThemeTag = {
				Color = "ToggleSlider",
			},
		})

		local ToggleSlider = New("Frame", {
			Size = UDim2.fromOffset(36, 18),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Parent = ToggleFrame.Frame,
			BackgroundTransparency = 1,
			ThemeTag = {
				BackgroundColor3 = "Accent",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 9),
			}),
			ToggleBorder,
			ToggleCircle,
		})

		local lockedShaking = false
		local function playLockedShake()
			if lockedShaking then return end
			lockedShaking = true
			local origin = ToggleCircle.Position
			local ox = origin.X.Offset
			local offsets = { 4, -4, 3, -3, 2, -2, 0 }
			local function step(i)
				if i > #offsets then
					ToggleCircle.Position = origin
					lockedShaking = false
					return
				end
				TweenService:Create(
					ToggleCircle,
					TweenInfo.new(0.04, Enum.EasingStyle.Linear),
					{ Position = UDim2.new(origin.X.Scale, ox + offsets[i], origin.Y.Scale, origin.Y.Offset) }
				):Play()
				task.delay(0.04, function() step(i + 1) end)
			end
			step(1)
		end

		local function updateLockVisuals()
			TweenService:Create(
				ToggleFrame.Frame,
				TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ BackgroundTransparency = Toggle.Locked and 0.8 or 0 }
			):Play()
		end

		function Toggle:OnChanged(Func)
			Toggle.Changed = Func
			Func(Toggle.Value)
		end

		function Toggle:Lock(State)
			Toggle.Locked = State
			updateLockVisuals()
		end

		function Toggle:SetValue(Value)
			if Toggle.Locked then return end
			Value = not not Value
			Toggle.Value = Value

			Creator.OverrideTag(ToggleBorder, { Color = Toggle.Value and "Accent" or "ToggleSlider" })
			Creator.OverrideTag(ToggleCircle, { ImageColor3 = Toggle.Value and "ToggleToggled" or "ToggleSlider" })
			TweenService:Create(
				ToggleCircle,
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Position = UDim2.new(0, Toggle.Value and 19 or 2, 0.5, 0) }
			):Play()
			TweenService:Create(
				ToggleSlider,
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ BackgroundTransparency = Toggle.Value and 0.45 or 1 }
			):Play()
			ToggleCircle.ImageTransparency = Toggle.Value and 0 or 0.5

			Library:SafeCallback(Toggle.Callback, Toggle.Value)
			Library:SafeCallback(Toggle.Changed, Toggle.Value)
		end

		function Toggle:Destroy()
			ToggleFrame:Destroy()
			Library.Options[Idx] = nil
		end

		Creator.AddSignal(ToggleFrame.Frame.MouseButton1Click, function()
			if Toggle.Locked then
				playLockedShake()
				return
			end
			Toggle:SetValue(not Toggle.Value)
		end)

		if Toggle.Locked then
			updateLockVisuals()
		end

		Toggle:SetValue(Toggle.Value)

		Library.Options[Idx] = Toggle
		return Toggle
	end

	return Element
end)()
ElementsTable.Dropdown = (function()
	local Element = {}
	Element.__index = Element
	Element.__type = "Dropdown"

	function Element:New(Idx, Config, Parent)
		assert(self.Library, "Dropdown - Missing Library context")
		local Library = self.Library

		local Dropdown = {
			Values = Config.Values,
			Value = Config.Default,
			Multi = Config.Multi,
			Buttons = {},
			Opened = false,
			Type = "Dropdown",
			Callback = Config.Callback or function() end,
			Search = (Config.Search == nil) and true or Config.Search,
			KeepSearch = Config.KeepSearch == true,
            Locked = Config.Locked or false,
		}

		local DropdownFrame = Components.Element(Config.Title, Config.Description, self.Container, true, Config)
		DropdownFrame.DescLabel.Size = UDim2.new(1, -170, 0, 14)

		Dropdown.SetTitle = DropdownFrame.SetTitle
		Dropdown.SetDesc = DropdownFrame.SetDesc
        Dropdown.Visible = DropdownFrame.Visible
        Dropdown.Elements = DropdownFrame

		local DropdownDisplay = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = "Value",
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -40, 1, 0),
			Position = UDim2.new(0, 8, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		local DropdownIco = New("ImageLabel", {
			Image = Library:GetIcon("chevron-down"),
			Size = UDim2.fromOffset(16, 16),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -8, 0.5, 0),
			BackgroundTransparency = 1,
			ThemeTag = {
				ImageColor3 = "SubText",
			},
		})

		local IcoMotor, SetIcoRotation = Creator.SpringMotor(0, DropdownIco, "Rotation")

		local DropdownInner = New("TextButton", {
			Size = UDim2.fromOffset(180, 30),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.9,
			Parent = DropdownFrame.Frame,
			ThemeTag = {
				BackgroundColor3 = "DropdownFrame",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 5),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = "InElementBorder",
				},
			}),
			DropdownIco,
			DropdownDisplay,
		})

		local DropdownListLayout = New("UIListLayout", {
			Padding = UDim.new(0, 3),
		})

		local DROPDOWN_Z_INDEX = 100000 -- Hardcoded high offset to ensure it's above normal window layers

		local DropdownScrollFrame = New("ScrollingFrame", {
			Size = UDim2.new(1, -5, 1, -10),
			Position = UDim2.fromOffset(5, 5),
			BackgroundTransparency = 1,
			BottomImage = "rbxassetid://6889812791",
			MidImage = "rbxassetid://6889812721",
			TopImage = "rbxassetid://6276641225",
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
            
            -- Defensive wait for layout
            if row.AbsoluteSize.Y == 0 then task.wait() end

            local rowAbsPos = row.AbsolutePosition
            local rowAbsSize = row.AbsoluteSize
            local btnAbsPos = btn.AbsolutePosition
            local btnAbsSize = btn.AbsoluteSize
            local listAbsSize = list.AbsoluteSize

            -- Calculate relative to button instead of row for a tighter fit
            local targetY = (btnAbsPos.Y - guiAbsPos.Y) + btnAbsSize.Y + 6
            local targetX = (btnAbsPos.X - guiAbsPos.X)
            
            -- Flip logic: if opens off-screen, open above the button instead
            if targetY + listAbsSize.Y > viewportSize.Y - 20 then
                targetY = (btnAbsPos.Y - guiAbsPos.Y) - listAbsSize.Y - 6
            end
            
            -- Bounds safety for X
            targetX = math.clamp(targetX, 5, (viewportSize.X - guiAbsPos.X) - listAbsSize.X - 5)
            
            list.Position = UDim2.fromOffset(targetX, targetY)
		end

		local function RecalculateListSize()
            local visibleCount = 0
            for _, element in next, DropdownScrollFrame:GetChildren() do
                if not element:IsA("UIListLayout") and element.Visible then
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
			SearchBar = New("Frame", {
				Size = UDim2.new(1, -10, 0, 28),
				Position = UDim2.fromOffset(5, 5),
				BackgroundTransparency = 0.7,
				BackgroundColor3 = Color3.fromRGB(20, 20, 20),
				ThemeTag = { BackgroundColor3 = "Element" },
				ZIndex = DROPDOWN_Z_INDEX + 2,
			}, {
				New("UICorner", { CornerRadius = UDim.new(0, 4) }),
			})

			SearchBox = New("TextBox", {
				FontFace = resolveFont(Library.Font),
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -36, 1, 0),
				Position = UDim2.new(0, 10, 0, 0),
				PlaceholderText = "Search...",
				PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
				ClearTextOnFocus = false,
				Text = "",
				Parent = SearchBar,
				ThemeTag = {
					TextColor3 = "Text",
					PlaceholderColor3 = "SubText",
				},
				ZIndex = DROPDOWN_Z_INDEX + 3,
			})

			local SearchIcon = New("ImageLabel", {
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.new(1, -13, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			Image = Library:GetIcon("search"),
			Parent = SearchBar,
			ImageTransparency = 0.3,
			ZIndex = DROPDOWN_Z_INDEX + 4,
				ThemeTag = {
					ImageColor3 = "SubText",
				},
			})

			DropdownScrollFrame.Position = UDim2.fromOffset(5, 38)
			DropdownScrollFrame.Size = UDim2.new(1, -5, 1, -43)

			local function ApplyFilter()
				local function RobustLower(str)
					if not str then return "" end
					str = tostring(str):lower()
					local upper = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
					local lower = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
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
					if not element:IsA("UIListLayout") then
						local label = element:FindFirstChild("ButtonLabel")
						local value = label and label.Text or ""
						element.Visible = text == "" or RobustLower(value):find(text, 1, true) ~= nil
					end
				end
				
				RecalculateCanvasSize()
				RecalculateListSize()
				RecalculateListPosition()
			end
			
			Dropdown.ApplyFilter = ApplyFilter
			Creator.AddSignal(SearchBox:GetPropertyChangedSignal("Text"), ApplyFilter)
		end

-- Helper functions moved up above filtering logic


		local DropdownHolderFrame = New("Frame", {
			Size = UDim2.fromScale(1, 1),
            ZIndex = DROPDOWN_Z_INDEX + 1,
			ThemeTag = {
				BackgroundColor3 = "DropdownHolder",
			},
		}, {
            SearchBar,
			DropdownScrollFrame,
			New("UICorner", {
				CornerRadius = UDim.new(0, 7),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = "DropdownBorder",
				},
			}),
			New("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "http://www.roblox.com/asset/?id=5554236805",
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(23, 23, 277, 277),
				Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
				Position = UDim2.fromOffset(-15, -15),
				ImageColor3 = Color3.fromRGB(0, 0, 0),
				ImageTransparency = 0.1,
			}),
		})

		DropdownHolderCanvas = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(180, 300),
			Parent = self.Library.GUI,
			Visible = false,
            ZIndex = DROPDOWN_Z_INDEX,
		}, {
			DropdownHolderFrame,
			New("UISizeConstraint", {
				MinSize = Vector2.new(160, 0),
			}),
		})
		table.insert(Library.OpenFrames, DropdownHolderCanvas)

        Dropdown.HolderCanvas = DropdownHolderCanvas
        Dropdown.HolderFrame = DropdownHolderFrame

-- Helper functions moved up

		RecalculateListPosition()
		RecalculateListSize()

		Creator.AddSignal(DropdownInner:GetPropertyChangedSignal("AbsolutePosition"), RecalculateListPosition)

		local function checkSelected(obj)
			if not obj then return true end
			if (obj.Type == "Tab" or obj.Type == "SubTab") and not obj.Selected then
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
			
			-- Close other dropdowns before opening this one (but not this one)
			Library:CloseOtherDropdowns(Dropdown)
			
			Dropdown.Opened = true
			DropdownHolderCanvas.Visible = true
            
            SetIcoRotation(180)

            -- Ensure size and layout is calculated before positioning
            RecalculateListSize()
            RecalculateCanvasSize()
            task.wait()
            RecalculateListSize()
            RecalculateListPosition()
			
			-- Bring to front
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

			DropdownDisplay.Text = (Str == "" and "--" or Str)
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
				if not Element:IsA("UIListLayout") then
					Element:Destroy()
				end
			end

			local Count = 0

			for Idx, Value in next, Values do
				local Table = {}

				Count = Count + 1

				local ButtonSelector = New("Frame", {
					Size = UDim2.fromOffset(4, 14),
					BackgroundColor3 = Color3.fromRGB(76, 194, 255),
					Position = UDim2.fromOffset(-1, 16),
					AnchorPoint = Vector2.new(0, 0.5),
					ThemeTag = {
						BackgroundColor3 = "Accent",
					},
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(0, 2),
					}),
				})

				local ButtonLabel = New("TextLabel", {
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
					Name = "ButtonLabel",
					ThemeTag = {
						TextColor3 = "Text",
					},
				})

				local Button = New("TextButton", {
					Size = UDim2.new(1, -5, 0, 32),
					BackgroundTransparency = 1,
					ZIndex = DROPDOWN_Z_INDEX + 3,
					Text = "",
					Parent = DropdownScrollFrame,
					ThemeTag = {
						BackgroundColor3 = "DropdownOption",
					},
				}, {
					ButtonSelector,
					ButtonLabel,
					New("UICorner", {
						CornerRadius = UDim.new(0, 6),
					}),
				})

				local Selected

				if Config.Multi then
					Selected = Dropdown.Value[Value]
				else
					Selected = Dropdown.Value == Value
				end

				local BackMotor, SetBackTransparency = Creator.SpringMotor(1, Button, "BackgroundTransparency")
				local SelMotor, SetSelTransparency = Creator.SpringMotor(1, ButtonSelector, "BackgroundTransparency")
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

		if type(Config.Default) == "string" then
			local Idx = table.find(Dropdown.Values, Config.Default)
			if Idx then
				table.insert(Defaults, Idx)
			end
		elseif type(Config.Default) == "table" then
			for _, Value in next, Config.Default do
				local Idx = table.find(Dropdown.Values, Value)
				if Idx then
					table.insert(Defaults, Idx)
				end
			end
		elseif type(Config.Default) == "number" and Dropdown.Values[Config.Default] ~= nil then
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
	Element.__type = "Paragraph"

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
	Element.__type = "Slider"

	function Element:New(Idx, Config)
		assert(Config.Title, "Slider - Missing Title.")
		assert(Config.Default, "Slider - Missing default value.")
		assert(Config.Min, "Slider - Missing minimum value.")
		assert(Config.Max, "Slider - Missing maximum value.")
		assert(Config.Rounding, "Slider - Missing rounding value.")

		local Slider = {
			Value = nil,
			Min = Config.Min,
			Max = Config.Max,
			Rounding = Config.Rounding,
			Callback = Config.Callback or function(Value) end,
			Type = "Slider",
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

		local SliderDot = New("ImageLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, -7, 0.5, 0),
			Size = UDim2.fromOffset(14, 14),
			Image = "http://www.roblox.com/asset/?id=12266946128",
			Active = true,
			ThemeTag = {
				ImageColor3 = "Accent",
			},
		})

		local SliderRail = New("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(7, 0),
			Size = UDim2.new(1, -14, 1, 0),
			Active = true,
		}, {
			SliderDot,
		})

		local SliderFill = New("Frame", {
			Size = UDim2.new(0, 0, 1, 0),
			ThemeTag = {
				BackgroundColor3 = "Accent",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(1, 0),
			}),
		})

		local SliderDisplay = New("TextLabel", {
			FontFace = resolveFont(Library.Font),
			Text = "Value",
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
				TextColor3 = "SubText",
			},
		})

		local SliderInput = New("TextBox", {
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
				TextColor3 = "Text",
				BackgroundColor3 = "Element",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Transparency = 1,
				Thickness = 1,
				ThemeTag = {
					Color = "DropdownBorder",
				}
			}),
		})

		local SliderInner = New("Frame", {
			Size = UDim2.new(1, 0, 0, 4),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			BackgroundTransparency = 0.4,
			Parent = SliderFrame.Frame,
			ThemeTag = {
				BackgroundColor3 = "SliderRail",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(1, 0),
			}),
			New("UISizeConstraint", {
				MaxSize = Vector2.new(100, math.huge),
			}),
			SliderDisplay,
			SliderInput,
			SliderFill,
			SliderRail,
		})

		local isHovering = false

		local function calculateInputWidth(text)
			local textSize = game:GetService("TextService"):GetTextSize(
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
			if property == "Text" then
				local text = SliderInput.Text
				local cleanText = text:gsub("[^%d%.%-]", "")
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

-- Removed global InputChanged listener for performance

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
	Element.__type = "Keybind"

	function Element:New(Idx, Config)
		assert(Config.Title, "KeyBind - Missing Title")
		assert(Config.Default, "KeyBind - Missing default value.")

		local Keybind = {
			Value = Config.Default,
			Toggled = false,
			Mode = Config.Mode or "Toggle",
			Type = "Keybind",
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

		local KeybindDisplayLabel = New("TextLabel", {
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
				TextColor3 = "Text",
			},
		})

		local KeybindDisplayFrame = New("TextButton", {
			Size = UDim2.fromOffset(0, 30),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.9,
			Parent = KeybindFrame.Frame,
			AutomaticSize = Enum.AutomaticSize.X,
			ThemeTag = {
				BackgroundColor3 = "Keybind",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 5),
			}),
			New("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag = {
					Color = "InElementBorder",
				},
			}),
			KeybindDisplayLabel,
		})

		function Keybind:GetState()
			if UserInputService:GetFocusedTextBox() and Keybind.Mode ~= "Always" then
				return false
			end

			if Keybind.Mode == "Always" then
				return true
			elseif Keybind.Mode == "Hold" then
				if Keybind.Value == "None" then
					return false
				end

				local Key = Keybind.Value

				if Key == "MouseLeft" or Key == "MouseRight" then
					return Key == "MouseLeft" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
						or Key == "MouseRight"
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
						Key = "MouseLeft"
					elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
						Key = "MouseRight"
					end

					PickEndedEvent = UserInputService.InputEnded:Connect(function(Input)
						if
							Input.KeyCode.Name == Key
							or Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
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
				if Keybind.Mode == "Toggle" then
					local Key = Keybind.Value

					if Key == "MouseLeft" or Key == "MouseRight" then
						if
							Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
							or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
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
	Element.__type = "Colorpicker"

	function Element:New(Idx, Config)
		assert(Config.Title, "Colorpicker - Missing Title")
		assert(Config.Default, "AddColorPicker: Missing default value.")

		local Colorpicker = {
			Value = Config.Default,
			Transparency = Config.Transparency or 0,
			Type = "Colorpicker",
			Title = type(Config.Title) == "string" and Config.Title or "Colorpicker",
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

		local DisplayFrameColor = New("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Colorpicker.Value,
			Parent = ColorpickerFrame.Frame,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local DisplayFrame = New("ImageLabel", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Parent = ColorpickerFrame.Frame,
			Image = "http://www.roblox.com/asset/?id=14204231522",
			ImageTransparency = 0.45,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(40, 40),
		}, {
			New("UICorner", {
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
				return New("TextLabel", {
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
						TextColor3 = "Text",
					},
				})
			end

			local function GetRGB()
				local Value = Color3.fromHSV(Hue, Sat, Vib)
				return { R = math.floor(Value.r * 255), G = math.floor(Value.g * 255), B = math.floor(Value.b * 255) }
			end

			local SatCursor = New("ImageLabel", {
				Size = UDim2.new(0, 18, 0, 18),
				ScaleType = Enum.ScaleType.Fit,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = "http://www.roblox.com/asset/?id=4805639000",
			})

			local SatVibMap = New("ImageLabel", {
				Size = UDim2.fromOffset(180, 160),
				Position = UDim2.fromOffset(20, 55),
				Image = "rbxassetid://4155801252",
				BackgroundColor3 = Colorpicker.Value,
				BackgroundTransparency = 0,
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				SatCursor,
			})

			local OldColorFrame = New("Frame", {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = Colorpicker.Transparency,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
			})
			local OldColorFrameChecker = New("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(112, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				New("UIStroke", {
					Thickness = 2,
					Transparency = 0.75,
				}),
				OldColorFrame,
			})

			local DialogDisplayFrame = New("Frame", {
				BackgroundColor3 = Colorpicker.Value,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
			})

			local DialogDisplayFrameChecker = New("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(20, 220),
				Size = UDim2.fromOffset(88, 24),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),
				New("UIStroke", {
					Thickness = 2,
					Transparency = 0.75,
				}),
				DialogDisplayFrame,
			})

			local HueSliderGradient = New("UIGradient", {
				Color = ColorSequence.new(HUE_SEQUENCE_TABLE),
				Rotation = 90,
			})

			local HueDragHolder = New("Frame", {
				Size = UDim2.new(1, 0, 1, -10),
				Position = UDim2.fromOffset(0, 5),
				BackgroundTransparency = 1,
			})

			local HueDrag = New("ImageLabel", {
				Size = UDim2.fromOffset(14, 14),
				Image = "http://www.roblox.com/asset/?id=12266946128",
				Parent = HueDragHolder,
				ThemeTag = {
					ImageColor3 = "DialogInput",
				},
			})

			local HueSlider = New("Frame", {
				Size = UDim2.fromOffset(12, 190),
				Position = UDim2.fromOffset(210, 55),
				Parent = Dialog.Root,
			}, {
				New("UICorner", {
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
			CreateInputLabel("Green", UDim2.fromOffset(Config.Transparency and 360 or 340, 135))

			local BlueInput = CreateInput()
			BlueInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 175)
			CreateInputLabel("Blue", UDim2.fromOffset(Config.Transparency and 360 or 340, 175))

			local AlphaInput
			if Config.Transparency then
				AlphaInput = CreateInput()
				AlphaInput.Frame.Position = UDim2.fromOffset(260, 215)
				CreateInputLabel("Alpha", UDim2.fromOffset(360, 215))
			end

			local TransparencySlider, TransparencyDrag, TransparencyColor
			if Config.Transparency then
				local TransparencyDragHolder = New("Frame", {
					Size = UDim2.new(1, 0, 1, -10),
					Position = UDim2.fromOffset(0, 5),
					BackgroundTransparency = 1,
				})

				TransparencyDrag = New("ImageLabel", {
					Size = UDim2.fromOffset(14, 14),
					Image = "http://www.roblox.com/asset/?id=12266946128",
					Parent = TransparencyDragHolder,
					ThemeTag = {
						ImageColor3 = "DialogInput",
					},
				})

				TransparencyColor = New("Frame", {
					Size = UDim2.fromScale(1, 1),
				}, {
					New("UIGradient", {
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}),
						Rotation = 270,
					}),
					New("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
				})

				TransparencySlider = New("Frame", {
					Size = UDim2.fromOffset(12, 190),
					Position = UDim2.fromOffset(230, 55),
					Parent = Dialog.Root,
					BackgroundTransparency = 1,
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
					New("ImageLabel", {
						Image = "http://www.roblox.com/asset/?id=14204231522",
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Parent = Dialog.Root,
					}, {
						New("UICorner", {
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
					if Success and typeof(Result) == "Color3" then
						Hue, Sat, Vib = Color3.toHSV(Result)
					end
				end
				Display()
			end)

			Creator.AddSignal(RedInput.Input.FocusLost, function(Enter)
				if Enter then
					local CurrentColor = GetRGB()
					local Success, Result = pcall(Color3.fromRGB, RedInput.Input.Text, CurrentColor["G"], CurrentColor["B"])
					if Success and typeof(Result) == "Color3" then
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
					if Success and typeof(Result) == "Color3" then
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
					if Success and typeof(Result) == "Color3" then
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

			Dialog:Button("Done", function()
				Colorpicker:SetValue({ Hue, Sat, Vib }, Transparency)
			end)
			Dialog:Button("Cancel")
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
	Element.__type = "Input"

	function Element:New(Idx, Config)
		assert(Config.Title, "Input - Missing Title")
		Config.Callback = Config.Callback or function() end

		local Input = {
			Value = Config.Default or "",
			Numeric = Config.Numeric or false,
			Finished = Config.Finished or false,
			Callback = Config.Callback or function(Value) end,
			Type = "Input",
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
			AddSignal(Box:GetPropertyChangedSignal("Text"), function()
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
	Element.__type = "Discord"

	function Element:New(Idx, Config)
		assert(Config.Invite, "Discord - Missing Invite")

		local Discord = {
			Type = "Discord",
			Config = Config
		}

		-- Create Discord element without description
		local DiscordFrame = Components.Element("Loading...", "", self.Container, true, Config)
		DiscordFrame.LabelHolder.Size = UDim2.new(1, -150, 0, 0)
		DiscordFrame.LabelHolder.Position = UDim2.new(0, 55, 0, 0)
		DiscordFrame.DescLabel.Visible = false

        -- Server icon with Discord-style border
        local IconContainer = New("Frame", {
            Name = "IconContainer",
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.new(0, 10, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            Parent = DiscordFrame.Frame,
        }, {
            New("UICorner", { CornerRadius = UDim.new(0, 8) }),
            New("UIStroke", {
                Thickness = 1,
                ThemeTag = { Color = "ElementBorder" },
            }),
        })

        local ServerIcon = New("ImageLabel", {
            Name = "ServerIcon",
            Size = UDim2.fromScale(0.85, 0.85),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "",
            Parent = IconContainer,
        }, {
            New("UICorner", { CornerRadius = UDim.new(0, 6) }),
        })

		-- Member count label
        local MemberLabel = New("TextLabel", {
            Name = "MemberLabel",
            TextSize = 11,
            FontFace = resolveFont(Library.Font),
            Text = "Loading...",
            TextColor3 = Color3.fromRGB(200, 200, 200),
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2.new(1, -80, 0.5, 0),
            AnchorPoint = Vector2.new(1, 0.5),
            Parent = DiscordFrame.Frame,
        })

		-- Join button matching element style
		local JoinButton = New("TextButton", {
			Size = UDim2.fromOffset(55, 24),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 0.88,
			Text = "Join",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 12,
			FontFace = resolveFont(Library.Font, Enum.FontWeight.Medium),
			Parent = DiscordFrame.Frame,
			AutoButtonColor = false,
			ThemeTag = {
				BackgroundColor3 = "Element",
			},
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 6) }),
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

		-- Click to copy invite link
		Creator.AddSignal(JoinButton.MouseButton1Click, function()
			if setclipboard then
				setclipboard(Config.Invite)
			end
			Library:Notify({
				Title = "Discord",
				Content = "Invite link copied!",
				Duration = 2,
			})
		end)

        -- Fetch Discord server info
        task.spawn(function()
            local InviteCode = Config.Invite:match("discord%.gg/([%w%-_]+)") 
                or Config.Invite:match("discord%.com/invite/([%w%-_]+)")
                or Config.Invite:match("discordapp%.com/invite/([%w%-_]+)")
                or Config.Invite:match("/([%w%-_]+)$")
                or Config.Invite:match("([%w%-_]+)$")
                or Config.Invite

            local http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            if not http then
                warn("Exploit does not support HTTP requests")
                DiscordFrame:SetTitle("Discord Error")
                DiscordFrame:SetDesc("Exploit does not support HTTP requests.")
                return
            end

            local url = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true"
            local success, response = pcall(function()
                return http({ Url = url, Method = "GET" })
            end)

            if not success or response.StatusCode ~= 200 then
                warn("Request error:", response and response.StatusCode)
                DiscordFrame:SetTitle("Discord Error")
                DiscordFrame:SetDesc("Failed to fetch server info. (" .. tostring(response and response.StatusCode or "Unknown") .. ")")
                return
            end

            local data
            local success_json = pcall(function()
                data = game:GetService("HttpService"):JSONDecode(response.Body)
            end)

            if success_json and data and data.guild then
                DiscordFrame:SetTitle(data.guild.name)
                
                -- Show member count
                if data.approximate_member_count then
                    local count = data.approximate_member_count
                    if count >= 1000000 then
                        MemberLabel.Text = string.format("%.1fM members", count / 1000000)
                    elseif count >= 1000 then
                        MemberLabel.Text = string.format("%.1fK members", count / 1000)
                    else
                        MemberLabel.Text = tostring(count) .. " members"
                    end
                else
                    MemberLabel.Text = "Join now"
                end

                -- Load server icon
                if data.guild.icon then
                    local iconUrl = string.format("https://cdn.discordapp.com/icons/%s/%s.png?size=256", data.guild.id, data.guild.icon)
                    local successIcon, asset = pcall(function()
                        return Library:GetCustomAsset(iconUrl)
                    end)

                    if successIcon and asset and asset ~= "" then
                        ServerIcon.Image = asset
                        IconContainer.Visible = true
                        DiscordFrame.LabelHolder.Position = UDim2.fromOffset(55, 0)
                        
                        -- Fade in animation
                        ServerIcon.ImageTransparency = 1
                        TweenService:Create(ServerIcon, TweenInfo.new(0.25), {
                            ImageTransparency = 0
                       	}):Play()
                    end
                end
            else
                DiscordFrame:SetTitle("Discord")
                MemberLabel.Text = "Invalid invite"
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
local RunService = game:GetService("RunService")

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
	
	local SplitFrame = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		Parent = self.Container,
		LayoutOrder = 7,
	}, {
		New("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
	})
	
	local LeftContainer = New("Frame", {
		Size = UDim2.new(0.5, -2.5, 0, 0),
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		ClipsDescendants = true,
	})
	
	local RightContainer = New("Frame", {
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
		Type = "Section",
		Container = LeftContainer,
		ScrollFrame = self.ScrollFrame,
		HasElement = false,
		Parent = self,
	}
	
	local RightSection = {
		Type = "Section",
		Container = RightContainer,
		ScrollFrame = self.ScrollFrame,
		HasElement = false,
		Parent = self,
	}
	
	for _, ElementComponent in pairs(ElementsTable) do
		LeftSection["Add" .. ElementComponent.__type] = function(self, Idx, Config)
			if LeftSection.HasElement then
				warn("Split section already has a left element. Only one element per side is allowed.")
				return nil
			end
			local configCopy = {}
			for k, v in pairs(Config or {}) do
				configCopy[k] = v
			end
			configCopy.Description = nil
			ElementComponent.Container = LeftContainer
			ElementComponent.Type = "Section"
			ElementComponent.ScrollFrame = LeftSection.ScrollFrame
			ElementComponent.Library = Library
			local element = ElementComponent:New(Idx, configCopy, LeftSection)
			if element and element.Frame then
				element.Frame.Size = UDim2.new(1, 0, 0, 0)
				Creator.AddSignal(element.Frame:GetPropertyChangedSignal("AbsoluteSize"), updateSizes)
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
				if element.Type == "Slider" and element.Elements and element.Elements.Frame then
					task.wait()
					for _, child in pairs(element.Elements.Frame:GetChildren()) do
						if child:IsA("Frame") then
							local sizeConstraint = child:FindFirstChild("UISizeConstraint")
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
				warn("Split section already has a right element. Only one element per side is allowed.")
				return nil
			end
			local configCopy = {}
			for k, v in pairs(Config or {}) do
				configCopy[k] = v
			end
			configCopy.Description = nil
			ElementComponent.Container = RightContainer
			ElementComponent.Type = "Section"
			ElementComponent.ScrollFrame = RightSection.ScrollFrame
			ElementComponent.Library = Library
			local element = ElementComponent:New(Idx, configCopy, RightSection)
			if element and element.Frame then
				element.Frame.Size = UDim2.new(1, 0, 0, 0)
				Creator.AddSignal(element.Frame:GetPropertyChangedSignal("AbsoluteSize"), updateSizes)
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
				if element.Type == "Slider" and element.Elements and element.Elements.Frame then
					task.wait()
					for _, child in pairs(element.Elements.Frame:GetChildren()) do
						if child:IsA("Frame") then
							local sizeConstraint = child:FindFirstChild("UISizeConstraint")
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

local Acrylic = 
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local GUI = nil
local CoreGui = game:GetService("CoreGui")
if CoreGui then
	GUI = CoreGui:FindFirstChild("RobloxGui") or CoreGui
end

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled
local fischbypass = game.GameId == 5750914919

local Components = 
local Library = 

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

--[[

███████╗██╗░░░░░██╗░░░██╗███████╗███╗░░██╗████████╗  ██████╗░██╗░░░░░██╗░░░██╗░██████╗
██╔════╝██║░░░░░██║░░░██║██╔════╝████╗░██║╚══██╔══╝  ██╔══██╗██║░░░░░██║░░░██║██╔════╝
█████╗░░██║░░░░░██║░░░██║█████╗░░██╔██╗██║░░░██║░░░  ██████╔╝██║░░░░░██║░░░██║╚█████╗░
██╔══╝░░██║░░░░░██║░░░██║██╔══╝░░██║╚████║░░░██║░░░  ██╔═══╝░██║░░░░░██║░░░██║░╚═══██╗
██║░░░░░███████╗╚██████╔╝███████╗██║░╚███║░░░██║░░░  ██║░░░░░███████╗╚██████╔╝██████╔╝
╚═╝░░░░░╚══════╝░╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░  ╚═╝░░░░░╚══════╝░╚═════╝░╚═════╝░

A modified version of Fluent
https://fluent-pl.us

]]

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local httpService = game:GetService("HttpService")

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
		targetParent = game:GetService("CoreGui")
	end
end)

if not targetParent then
	targetParent = LocalPlayer:WaitForChild("PlayerGui")
end

local guiName = ""
for _ = 1, math.random(12, 20) do guiName = guiName .. string.char(math.random(97, 122)) end

local GUI = New("ScreenGui", {
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
		local _, i = Event:find(":%d+: ")

		if not i then
			return Library:Notify({
				Title = "Interface",
				Content = "Callback error",
				SubContent = Event,
				Duration = 5,
			})
		end

		return Library:Notify({
			Title = "Interface",
			Content = "Callback error",
			SubContent = Event:sub(i + 1),
			Duration = 5,
		})
	end
end--?
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





	local iconAsset = Library:GetIcon("moon")


	if type(Config.Icon) == "string" and Config.Icon ~= "" then


		pcall(function()


			local resolved = Library:GetIcon(Config.Icon)


			if resolved and resolved ~= "" then


				iconAsset = resolved


			elseif string.match(Config.Icon, "^rbxassetid://%d+$") then


				iconAsset = Config.Icon


			end


		end)


	end





	local useAcrylic = (Config.Acrylic == true)





	local cornerRadius = tonumber(Config.Corner)


	local backgroundTransparency = (typeof(Config.Transparency) == "number") and math.clamp(Config.Transparency, 0, 1) or 0


	local draggableWhole = (Config.Draggable == true)





	local holder


	local function createButton(isDesktop)


		return New("TextButton", {


			Name = "MinimizeButton",


			Size = UDim2.new(1, 0, 1, 0),


			BorderSizePixel = 0,


			BackgroundTransparency = backgroundTransparency or 0,


			AutoButtonColor = true,


			ThemeTag = {


				BackgroundColor3 = "Element",


			},


		}, {


			New("UICorner", { CornerRadius = UDim.new(0, cornerRadius or (isDesktop and 14 or 12)) }),


			New("UIStroke", {


				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,


				Transparency = isDesktop and 0.6 or 0.7,


				Thickness = isDesktop and 2 or 1.5,


				ThemeTag = {


					Color = "ElementBorder",


				},


			}),


			New("ImageLabel", {


				Name = "Icon",


				Image = iconAsset,


				Size = UDim2.new(0.8, 0, 0.8, 0),


				Position = UDim2.new(0.5, 0, 0.5, 0),


				AnchorPoint = Vector2.new(0.5, 0.5),


				BackgroundTransparency = 1,


				ThemeTag = {


					ImageColor3 = "Text",


				},


			}, {


				New("UIAspectRatioConstraint", { AspectRatio = 1, AspectType = Enum.AspectType.FitWithinMaxSize }),


				New("UICorner", { CornerRadius = UDim.new(0, 0) })


			}),





		})


	end





	if isMobile then


		holder = New("Frame", {


			Name = "FluentMinimizer",


			Parent = parentGui,


			Size = Config.Size or UDim2.fromOffset(36, 36),


			Position = Config.Position or UDim2.new(0.45, 0, 0.025, 0),


			BackgroundTransparency = 1,


			ZIndex = 999999999,


			Visible = (Config.Visible ~= false),


		})


	else


		holder = New("Frame", {


			Name = "FluentMinimizer",


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


				if descendant.ClassName == "UICorner" then


					descendant.CornerRadius = desiredCorner


				elseif descendant.ClassName == "ImageLabel" then


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





	local button = holder:FindFirstChildOfClass("TextButton")


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
		local background = Library.Window.AcrylicPaint.Frame:FindFirstChild("Background")
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
			local background = Library.Window.AcrylicPaint.Frame:FindFirstChild("Background")
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


local MinimizeButton = New("TextButton", {


	BackgroundColor3 = Color3.fromRGB(25, 25, 30),


	Size = UDim2.new(1, 0, 1, 0),


	BorderSizePixel = 0,


	BackgroundTransparency = 0.05, 


}, {


	New("UICorner", {


		CornerRadius = UDim.new(0, 14),


	}),


	New("UIGradient", {


		Color = ColorSequence.new{


			ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),


			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))


		},


		Rotation = 45,


	}),


	New("UIStroke", {


		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,


		Color = Color3.fromRGB(100, 150, 255),


		Transparency = 0.6,


		Thickness = 2,


	}),


	New("Frame", {


		BackgroundColor3 = Color3.fromRGB(100, 150, 255),


		BackgroundTransparency = 0.9,


		Size = UDim2.new(1, -6, 1, -6),


		Position = UDim2.new(0, 3, 0, 3),


		BorderSizePixel = 0,


	}, {


		New("UICorner", {


			CornerRadius = UDim.new(0, 11),


		}),


	}),


	New("Frame", {


		BackgroundColor3 = Color3.fromRGB(255, 255, 255),


		BackgroundTransparency = 0.94,


		Size = UDim2.new(0.7, 0, 0.3, 0),


		Position = UDim2.new(0.15, 0, 0.1, 0),


		BorderSizePixel = 0,


	}, {


		New("UICorner", {


			CornerRadius = UDim.new(0, 8),


		}),


	}),


	New("ImageLabel", {


		Image = Library:GetIcon("moon"),


		Size = UDim2.new(0.8, 0, 0.8, 0),


		Position = UDim2.new(0.5, 0, 0.5, 0),


		AnchorPoint = Vector2.new(0.5, 0.5),


		BackgroundTransparency = 1,


		ImageColor3 = Color3.fromRGB(255, 255, 255),


		ImageTransparency = 0.1,


	}, {


		New("UIAspectRatioConstraint", {


			AspectRatio = 1,


			AspectType = Enum.AspectType.FitWithinMaxSize,


		})


	})


})





local MobileMinimizeButton = New("TextButton", {


	BackgroundColor3 = Color3.fromRGB(25, 25, 30),


	Size = UDim2.new(1, 0, 1, 0),


	BorderSizePixel = 0,


	BackgroundTransparency = 0.05,


}, {


	New("UICorner", {


		CornerRadius = UDim.new(0, 12),


	}),


	New("UIGradient", {


		Color = ColorSequence.new{


			ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),


			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))


		},


		Rotation = 45,


	}),


	New("UIStroke", {


		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,


		Color = Color3.fromRGB(100, 150, 255),


		Transparency = 0.7,


		Thickness = 1.5,


	}),


	New("Frame", {


		BackgroundColor3 = Color3.fromRGB(100, 150, 255),


		BackgroundTransparency = 0.92,


		Size = UDim2.new(1, -4, 1, -4),


		Position = UDim2.new(0, 2, 0, 2),


		BorderSizePixel = 0,


	}, {


		New("UICorner", {


			CornerRadius = UDim.new(0, 10),


		}),


	}),


	New("ImageLabel", {


		Image = Library:GetIcon("moon"),


		Size = UDim2.new(0.8, 0, 0.8, 0),


		Position = UDim2.new(0.5, 0, 0.5, 0),


		AnchorPoint = Vector2.new(0.5, 0.5),


		BackgroundTransparency = 1,


		ImageColor3 = Color3.fromRGB(255, 255, 255),


		ImageTransparency = 0.1,


	}, {


		New("UIAspectRatioConstraint", {


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
