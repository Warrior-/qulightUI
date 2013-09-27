
if Qulight["general"].centerpanel then
if Qulight["datatext"].crit and Qulight["datatext"].crit > 0 then


--------------------------------------------------------------------
-- Crit (Spell or Melee.. or ranged)
--------------------------------------------------------------------

	local Stat = CreateFrame("Frame")
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = CenterDPSPanel:CreateFontString(nil, "OVERLAY")
	Text:SetFont(Qulight["media"].font, 10, "OVERLAY")
	PP(Qulight["datatext"].crit, Text)

	local int = 1
	local function Update(self, t)
		int = int - t
		local meleecrit = GetCritChance()
		local spellcrit = GetSpellCritChance(1)
		local rangedcrit = GetRangedCritChance()
		local CritChance


		if select(2, UnitClass("Player")) == "CASTER" or "HEAL" then
			CritChance = spellcrit
		elseif select(2, UnitClass("Player")) == "HUNTER" then    
			CritChance = rangedcrit
		else
			CritChance = meleecrit
		end

		if int < 0 then
			Text:SetText("Crit: ".."|r"..qColor..format("%.2f", CritChance).. "% |r")
			int = 1
		end     
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end
end