local Creator = require("creator")
local Library = require("library")
local Flipper = require("flipper")
local resolveFont = Creator.resolveFont

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera

local Mobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform()) ~= nil or UserInputService.TouchEnabled

local Components = {
	Assets = {
		Close = Library:GetIcon("x"),
		Min = Library:GetIcon("minus"),
		Max = Library:GetIcon("maximize-2"),
		Restore = Library:GetIcon("minimize-2"),
	},
}

require("components.element")(Components)
require("components.section")(Components)
require("components.tab")(Components)
require("components.button")(Components)
require("components.dialog")(Components)
require("components.notification")(Components)
require("components.textbox")(Components)
require("components.titlebar")(Components)
require("components.window")(Components)

return Components
