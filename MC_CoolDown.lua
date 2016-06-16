local skill_01 = CreateFrame("Frame", "skill_01", UIParent)
skill_01:SetWidth(64)
skill_01:SetHeight(64)
skill_01:ClearAllPoints()
skill_01:SetPoint("CENTER", 0, 0)
skill_01:RegisterEvent("ACTIONBAR_UPDATE_STATE")
skill_01:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
local skill_01_texture = skill_01:CreateTexture("skill_01_texture")
skill_01_texture:SetTexture(GetActionTexture(1))
skill_01_texture:SetAllPoints(skill_01)
skill_01_texture:Hide()

local i = 1

function displayCD()
	local start, duration, enable = GetActionCooldown(1)
	if(start > 0 and i == 1) then
		skill_01_texture:Show()
		print("This skill is on Cooldown")
		i = i + 1
	end
	if (start == 0) then
		skill_01_texture:Hide()
		print("This skill is available")
		i = 1
	end
end

skill_01:SetScript("OnEvent", displayCD)
