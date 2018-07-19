local _, ns = ...
local oUF = ns.oUF or oUF

if not oUF then return end
--[[

	Elements handled:
	 .Experience [statusbar]
	 .Experience.Rested [statusbar] (optional, must be parented to Experience)
	 .Experience.Text [fontstring] (optional)

	Booleans:
	 - noTooltip

	Functions that can be overridden from within a layout:
	 - PostUpdate(element unit, min, max)

--]]

local _, ns = ...
local oUF = ns.oUF or oUF
assert(oUF, 'oUF Experience was unable to locate oUF install')

local function GetXP(unit)
	return UnitXP(unit), UnitXPMax(unit)
	
end

local function SetTooltip(self)
	local isHonor = IsWatchingHonorAsXP()
	local cur = (isHonor and UnitHonor or UnitXP)('player')
	local max = (isHonor and UnitHonorMax or UnitXPMax)('player')
	local per = math.floor(cur / max * 100 + 0.5)
	local bar = isHonor and 5 or 20
	local rested = (isHonor and GetHonorExhaustion or GetXPExhaustion)() or 0

	GameTooltip:SetOwner(self, 'ANCHOR_BOTTOM', 0, -5)
	GameTooltip:AddLine(COMBAT_XP_GAIN.." "..format(LEVEL_GAINED, UnitLevel("player")))
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(string.format(XP..": %d / %d (%d%% - %d/%d)", cur, max, per, bar - (bar * (max - cur) / max), bar))
	GameTooltip:AddLine(string.format(LEVEL_ABBR..": %d (%d%% - %d/%d)", max - cur, (max - cur) / max * 100, 1 + bar * (max - cur) / max, bar))

	if(self.rested) then
		GameTooltip:AddLine(string.format("|cff0090ff"..TUTORIAL_TITLE26..": +%d (%d%%)", rested, rested / max * 100))
	end

	GameTooltip:Show()
end

local function Update(self, event, owner)
	local experience = self.Experience
	-- Conditional hiding
	if(UnitLevel('player') == MAX_PLAYER_LEVEL) then
		return experience:Hide()
	end

	local unit = self.unit
	local min, max = GetXP(unit)
	experience:SetMinMaxValues(0, max)
	experience:SetValue(min)
	experience:Show()

	if(experience.Text) then
		experience.Text:SetFormattedText('%d / %d', min, max)
	end

	if(experience.Rested) then
		local rested = GetXPExhaustion()
		if(unit == 'player' and rested and rested > 0) then
			experience.Rested:SetMinMaxValues(0, max)
			experience.Rested:SetValue(math.min(min + rested, max))
			experience.rested = rested
		else
			experience.Rested:SetMinMaxValues(0, 1)
			experience.Rested:SetValue(0)
			experience.rested = nil
		end
	end

	if(experience.PostUpdate) then
		return experience:PostUpdate(unit, min, max)
	end
end

local function Enable(self, unit)
	local experience = self.Experience
	if(experience) then
		local Update = experience.Update or Update

		self:RegisterEvent('PLAYER_XP_UPDATE', Update)
		self:RegisterEvent('PLAYER_LEVEL_UP', Update)
		self:RegisterEvent('UNIT_PET', Update)

		if(experience.Rested) then
			self:RegisterEvent('UPDATE_EXHAUSTION', Update)
		end

		if(not experience.noTooltip) then
			experience:EnableMouse(true)
			experience:HookScript('OnLeave', GameTooltip_Hide)
			experience:HookScript('OnEnter', SetTooltip)
		end

		if(not experience:GetStatusBarTexture()) then
			experience:SetStatusBarTexture([=[Interface\TargetingFrame\UI-StatusBar]=])
		end

		return true
	end
end

local function Disable(self)
	local experience = self.Experience
	if(experience) then
		local Update = experience.Update or Update

		self:UnregisterEvent('PLAYER_XP_UPDATE', Update)
		self:UnregisterEvent('PLAYER_LEVEL_UP', Update)

		if(experience.Rested) then
			self:UnregisterEvent('UPDATE_EXHAUSTION', Update)
		end

		if(hunterPlayer) then
			self:UnregisterEvent('UNIT_PET_EXPERIENCE', Update)
		end
	end
end

oUF:AddElement('Experience', Update, Enable, Disable)
