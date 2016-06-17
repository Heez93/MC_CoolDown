local myFrame = CreateFrame("Frame", "myFrame", UIParent)
myFrame:SetWidth(64)
myFrame:SetHeight(64)
myFrame:ClearAllPoints()
myFrame:SetPoint("CENTER", 0, 0)
myFrame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
local texture = myFrame:CreateTexture("CDTexture")
texture:SetTexture(GetActionTexture(1))
texture:SetAllPoints(myFrame)
texture:Hide()

local timer = CreateFrame("Frame")

local function setTimer(startTime, duration)
	local endTime = startTime + duration
	timer:SetScript("OnUpdate", function(self, elapsed)
		if(GetTime() > endTime) then
			texture:Hide()
			self:SetScript("OnUpdate", nil)
		end
		if(GetTime() < endTime) then
			texture:Show()
		end	
	end);
end
	

local function displayCD()
	local start, duration, enable = GetActionCooldown(1)
	setTimer(start, duration)
	print("Test")
end

myFrame:SetScript("OnEvent", displayCD)
