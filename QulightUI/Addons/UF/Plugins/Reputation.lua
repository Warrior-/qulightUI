local _, ns = ...
local oUF = ns.oUF or oUF

if not oUF then return end

local function GetReputation()
	local pendingReward
	local name, standingID, min, max, cur, factionID = GetWatchedFactionInfo()

	local friendID, _, _, _, _, _, standingText, _, nextThreshold = GetFriendshipReputation(factionID)
	if(friendID) then
		if(not nextThreshold) then
			min, max, cur = 0, 1, 1 -- force a full bar when maxed out
		end
		standingID = 5 -- force friends' color
	else
		local value, nextThreshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
		if(value) then
			cur = value % nextThreshold
			min = 0
			max = nextThreshold
			pendingReward = hasRewardPending
			standingID = MAX_REPUTATION_REACTION + 1 -- force paragon's color
			standingText = PARAGON
		end
	end

	max = max - min
	cur = cur - min
	-- cur and max are both 0 for maxed out factions
	if(cur == max) then
		cur, max = 1, 1
	end
	standingText = standingText or GetText('FACTION_STANDING_LABEL' .. standingID, UnitSex('player'))

	return cur, max, name, factionID, standingID, standingText, pendingReward
end

for tag, func in next, {
	['reputation:cur'] = function()
		return (GetReputation())
	end,
	['reputation:max'] = function(unit, runit)
		local _, max = GetReputation()
		return max
	end,
	['reputation:per'] = function()
		local cur, max = GetReputation()
		return math.floor(cur / max * 100 + 1/2)
	end,
	['reputation:standing'] = function()
		local _, _, _, _, _, standingText = GetReputation()
		return standingText
	end,
	['reputation:faction'] = function()
		local _, _, name = GetReputation()
		return name
	end,
} do
	oUF.Tags.Methods[tag] = func
	oUF.Tags.Events[tag] = 'UPDATE_FACTION'
end

local function tooltip(self)
	local cur, max, name, factionID, standingID, standingText, pendingReward = GetReputation()
	GameTooltip:SetOwner(self, 'ANCHOR_BOTTOM', 0, -5)
	GameTooltip:AddLine(string.format("%s (%s)", name, standingText))
	if(cur ~= max) then
		GameTooltip:AddLine(string.format("%d / %d (%d%%)", cur, max, (cur) / (max) * 100))
	end
	GameTooltip:Show()
end

local function update(self, event, unit)
	local bar = self.Reputation
	if(not GetWatchedFactionInfo()) then return bar:Hide() end

	local name, id, min, max, value = GetWatchedFactionInfo()
	bar:SetMinMaxValues(min, max)
	bar:SetValue(value)
	bar:Show()

	if(bar.Text) then
		if(bar.OverrideText) then
			bar:OverrideText(min, max, value, name, id)
		else
			bar.Text:SetFormattedText('%d / %d - %s', value - min, max - min, name)
		end
	end

	if(bar.PostUpdate) then bar.PostUpdate(self, event, unit, bar, min, max, value, name, id) end
end

local function enable(self, unit)
	local bar = self.Reputation
	if(bar and unit == 'player') then
		if(not bar:GetStatusBarTexture()) then
			bar:SetStatusBarTexture([=[Interface\TargetingFrame\UI-StatusBar]=])
		end

		self:RegisterEvent('UPDATE_FACTION', update)

		if(bar.Tooltip) then
			bar:EnableMouse(true)
			bar:HookScript('OnLeave', GameTooltip_Hide)
			bar:HookScript('OnEnter', tooltip)
		end

		return true
	end
end

local function disable(self)
	if(self.Reputation) then
		self:UnregisterEvent('UPDATE_FACTION', update)
	end
end

oUF:AddElement('Reputation', update, enable, disable)
