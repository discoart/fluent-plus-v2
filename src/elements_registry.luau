local Creator = require("creator")
local ElementsTable = require("elements")
local Library = require("library")
local RunService = game:GetService("RunService")

local Elements = {}
Elements.__index = Elements
Elements.__namecall = function(self, Key, ...)
	return Elements[Key](self, ...)
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
