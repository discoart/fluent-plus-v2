local function clamp01(value)
	return math.clamp(value or 0, 0, 1)
end

local function getFrameBackdrop(frame)
	if not frame then
		return nil, nil
	end

	local background = frame:FindFirstChild("Background")
	if background then
		return background.BackgroundColor3, background.BackgroundTransparency
	end

	return frame.BackgroundColor3, frame.BackgroundTransparency
end

local function computeAcrylicTransparency(base)
	return clamp01(base or 0.5)
end

local function computeSolidTransparency(base)
	base = clamp01(base or 0.5)
	if base < 1 then
		local reduction = base > 0.7 and 0.2 or 0.3
		return clamp01(base - reduction)
	end
	return base
end

function Library:GetWindowBackdropSnapshot()
	local snapshot = {
		backgroundTransparency = 0.5,
