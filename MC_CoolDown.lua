local myFrame = CreateFrame("Frame", "myFrame", UIParent)
myFrame:SetWidth(64)
myFrame:SetHeight(64)
myFrame:ClearAllPoints()
myFrame:SetPoint("CENTER", 0, 0)
myFrame:RegisterEvent("SPELL_UPDATE_USABLE")
local texture = myFrame:CreateTexture("CDTexture")
texture:SetTexture(GetActionTexture(1))
texture:SetAllPoints(myFrame)
texture:Hide()
local i = 1

function displayCD()
	local start, duration, enable = GetActionCooldown(1)
	if(start > 0 and i == 1) then
		texture:Show()
		print("This skill is on Cooldown")
		i = i + 1
	end
	if (start == 0) then
		texture:Hide()
		print("This skill is available")
		i = 1
	end
end

myFrame:SetScript("OnEvent", displayCD)
