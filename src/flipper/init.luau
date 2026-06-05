local SingleMotor = require("flipper/single_motor")
local GroupMotor = require("flipper/group_motor")
local Instant = require("flipper/instant")
local Linear = require("flipper/linear")
local Spring = require("flipper/spring")

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
