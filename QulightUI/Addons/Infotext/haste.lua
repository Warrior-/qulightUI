
if Qulight["general"].centerpanel then
if Qulight["datatext"].haste and Qulight["datatext"].haste > 0 then
	local Stat = CreateFrame("Frame")
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = CenterDPSPanel:CreateFontString(nil, "OVERLAY")
	Text:SetFont(Qulight["media"].font, 10, "OVERLAY")
	PP(Qulight["datatext"].haste, Text)

	local int = 1

	local function Update(self, t)
		
		local spellhaste = UnitSpellHaste("player")
		local rangedhaste = GetRangedHaste()
		local attackhaste = GetMeleeHaste()
		
		if attackhaste > spellhaste and select(2, UnitClass("Player")) ~= "HUNTER" then
			haste = attackhaste
		elseif select(2, UnitClass("Player")) == "HUNTER" then
			haste = rangedhaste
		else
			haste = spellhaste
		end
		
		int = int - t
		if int < 0 then
			Text:SetText("Haste: ".."|r"..qColor..format("%.2f", haste).. "% |r")
			int = 1
		end     
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end
end