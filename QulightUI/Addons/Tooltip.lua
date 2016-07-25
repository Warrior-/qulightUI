if not Qulight["tooltip"].enable then return end

----------------------------------------------------------------------------------------
--	Based on aTooltip(by ALZA)
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF or oUF
 
if not oUF then return end

oUF_colors = setmetatable({
	tapped = {0.6, 0.6, 0.6},
	disconnected = {0.84, 0.75, 0.65},
	power = setmetatable({
		["MANA"] = {0.31, 0.45, 0.63},
		["RAGE"] = {0.69, 0.31, 0.31},
		["FOCUS"] = {0.71, 0.43, 0.27},
		["ENERGY"] = {0.65, 0.63, 0.35},
		["POWER_TYPE_FEL_ENERGY"] = {0.65, 0.63, 0.35},
		["RUNES"] = {0.55, 0.57, 0.61},
		["RUNIC_POWER"] = {0, 0.82, 1},
		["AMMOSLOT"] = {0.8, 0.6, 0},
		["FUEL"] = {0, 0.55, 0.5},
	}, {__index = oUF.colors.power}),
	runes = setmetatable({
		[1] = {0.69, 0.31, 0.31},
		[2] = {0.33, 0.59, 0.33},
		[3] = {0.31, 0.45, 0.63},
		[4] = {0.84, 0.75, 0.65},
	}, {__index = oUF.colors.runes}),
	reaction = setmetatable({
		[1] = {0.85, 0.27, 0.27}, -- Hated
		[2] = {0.85, 0.27, 0.27}, -- Hostile
		[3] = {0.85, 0.27, 0.27}, -- Unfriendly
		[4] = {0.85, 0.77, 0.36}, -- Neutral
		[5] = {0.33, 0.59, 0.33}, -- Friendly
		[6] = {0.33, 0.59, 0.33}, -- Honored
		[7] = {0.33, 0.59, 0.33}, -- Revered
		[8] = {0.33, 0.59, 0.33}, -- Exalted
	}, {__index = oUF.colors.reaction}),
}, {__index = oUF.colors})


local StoryTooltip = QuestScrollFrame.StoryTooltip
StoryTooltip:SetFrameLevel(4)

local tooltips = {
	GameTooltip,
	ItemRefTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	WorldMapTooltip,
	WorldMapCompareTooltip1,
	WorldMapCompareTooltip2,
	FriendsTooltip,
	ItemRefShoppingTooltip1,
	ItemRefShoppingTooltip2,
	AtlasLootTooltip,
	QuestHelperTooltip,
	QuestGuru_QuestWatchTooltip,
	StoryTooltip
}

local backdrop = {
	bgFile = Qulight["media"].blank, edgeFile = Qulight["media"].blank, edgeSize = 1,
	insets = {left = -1, right = -1, top = -1, bottom = -1}
}

local style = {
	bgFile =  Qulight["media"].texture,
	edgeFile = Qulight["media"].glow, 
	edgeSize = 4,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
}

function CreateStyleTT(f, size, level, alpha, alphaborder) 
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(level or 0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -size, size)
	shadow:SetPoint("BOTTOMRIGHT", size, -size-7)
	shadow:SetBackdrop(style)
	shadow:SetBackdropColor(.08,.08,.08, alpha or .9)
	shadow:SetBackdropBorderColor(0, 0, 0, alphaborder or 1)
	f.shadow = shadow
	return shadow
end

for _, tt in pairs(tooltips) do
	if not IsAddOnLoaded("Aurora") then
		tt:SetBackdrop(nil)
		if tt.BackdropFrame then
			tt.BackdropFrame:SetBackdrop(nil)
		end
		local bg = CreateFrame("Frame", nil, tt)
		bg:SetPoint("TOPLEFT")
		bg:SetPoint("BOTTOMRIGHT")
		bg:SetFrameLevel(tt:GetFrameLevel() - 1)
		
		CreateStyleTT(bg, 1)
		
		
		tt.GetBackdrop = function() return backdrop end
		tt.GetBackdropColor = function() return 0, 0, 0, 0.7 end
		tt.GetBackdropBorderColor = function() return 0.37, 0.3, 0.3, 1 end
	end
end


local anchor = CreateFrame("Frame", "TooltipAnchor", UIParent)
anchor:SetSize(200, 40)
anchor:SetFrameStrata("TOOLTIP")
anchor:SetFrameLevel(20)
anchor:SetClampedToScreen(true)
anchor:SetAlpha(0)
anchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 218)
 
AnchorTooltips = CreateFrame("Frame","Move_Tooltip",UIParent)
if Qulight["general"].centerpanel then
		AnchorTooltips:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 235)
	else
		AnchorTooltips:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 218)
end
CreateAnchor(AnchorTooltips, "Move tooltips", 100, 110)
 
-- Hide PVP text
PVP_ENABLED = ""

-- Statusbar
local healthBar = GameTooltipStatusBar
healthBar:ClearAllPoints()
healthBar:SetHeight(6)
healthBar:SetPoint("TOPLEFT", healthBar:GetParent(), "BOTTOMLEFT", 5, 5)
healthBar:SetPoint("TOPRIGHT", healthBar:GetParent(), "BOTTOMRIGHT", -5, 5)
healthBar:SetStatusBarTexture(Qulight["media"].texture)

-- Raid icon
local ricon = GameTooltip:CreateTexture("GameTooltipRaidIcon", "OVERLAY")
ricon:SetHeight(18)
ricon:SetWidth(18)
ricon:SetPoint("BOTTOM", GameTooltip, "TOP", 0, 5)

GameTooltip:HookScript("OnHide", function(self) ricon:SetTexture(nil) end)

-- Add "Targeted By" line
local targetedList = {}
local ClassColors = {}
local token

for class, color in next, RAID_CLASS_COLORS do
	ClassColors[class] = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255)
end

local function AddTargetedBy()
	local numParty, numRaid = GetNumSubgroupMembers(), GetNumGroupMembers()
	if numParty > 0 or numRaid > 0 then
		for i = 1, (numRaid > 0 and numRaid or numParty) do
			local unit = (numRaid > 0 and "raid"..i or "party"..i)
			if UnitIsUnit(unit.."target", token) and not UnitIsUnit(unit, "player") then
				local _, class = UnitClass(unit)
				targetedList[#targetedList + 1] = ClassColors[class]
				targetedList[#targetedList + 1] = UnitName(unit)
				targetedList[#targetedList + 1] = "|r, "
			end
		end
		if #targetedList > 0 then
			targetedList[#targetedList] = nil
			GameTooltip:AddLine(" ", nil, nil, nil, 1)
			local line = _G["GameTooltipTextLeft"..GameTooltip:NumLines()]
			if not line then return end
			line:SetFormattedText("Targeted By".." (|cffffffff%d|r): %s", (#targetedList + 1) / 3, table.concat(targetedList))
			wipe(targetedList)
		end
	end
end

----------------------------------------------------------------------------------------
--	Unit tooltip styling
----------------------------------------------------------------------------------------
function GameTooltip_UnitColor(unit)
	if not unit then return end
	local r, g, b

	if UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
		if color then
			r, g, b = color.r, color.g, color.b
		else
			r, g, b = 1, 1, 1
		end
	elseif UnitIsTapDenied(unit) or UnitIsDead(unit) then
		r, g, b = 0.6, 0.6, 0.6
	else
		local reaction = oUF_colors.reaction[UnitReaction(unit, "player")]
		if reaction then
			r, g, b = reaction[1], reaction[2], reaction[3]
		else
			r, g, b = 1, 1, 1
		end
	end

	return r, g, b
end

local function GameTooltipDefault(tooltip, parent)
	if Qulight["tooltip"].cursor == true then
		tooltip:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", 20, 20)
	else
		tooltip:SetOwner(parent, "ANCHOR_NONE")
		tooltip:ClearAllPoints()
		tooltip:SetPoint("BOTTOMRIGHT", TooltipAnchor, "BOTTOMRIGHT", 0, 0)
		tooltip.default = 1
	end
end
hooksecurefunc("GameTooltip_SetDefaultAnchor", GameTooltipDefault)

if Qulight["tooltip"].shift_modifer == true then
	local ShiftShow = function()
		if IsShiftKeyDown() then
			GameTooltip:Show()
		else
			if not HoverBind.enabled then
				GameTooltip:Hide()
			end
		end
	end
	GameTooltip:SetScript("OnShow", ShiftShow)
	local EventShow = function()
		if arg1 == "LSHIFT" and arg2 == 1 then
			GameTooltip:Show()
		elseif arg1 == "LSHIFT" and arg2 == 0 then
			GameTooltip:Hide()
		end
	end
	local sh = CreateFrame("Frame")
	sh:RegisterEvent("MODIFIER_STATE_CHANGED")
	sh:SetScript("OnEvent", EventShow)
else
	if Qulight["tooltip"].cursor == true then
		hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent)
			if InCombatLockdown() and Qulight["tooltip"].hidecombat and not IsShiftKeyDown() then
				self:Hide()
			else
				self:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", 20, 20)
			end
		end)
	else
		hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self)
			if InCombatLockdown() and Qulight["tooltip"].hidecombat and not IsShiftKeyDown() then
				self:Hide()
			else
				self:SetPoint("BOTTOMRIGHT", TooltipAnchor, "BOTTOMRIGHT", 0, 0)
			end
		end)
	end
end

if Qulight["tooltip"].health_value == true then
	GameTooltipStatusBar:SetScript("OnValueChanged", function(self, value)
		if not value then return end
		local min, max = self:GetMinMaxValues()
		if (value < min) or (value > max) then return end
		self:SetStatusBarColor(0, 1, 0)
		local _, unit = GameTooltip:GetUnit()
		if unit then
			min, max = UnitHealth(unit), UnitHealthMax(unit)
			if not self.text then
				self.text = self:CreateFontString(nil, "OVERLAY", "Tooltip_Med")
				self.text:SetPoint("CENTER", GameTooltipStatusBar, 0, 1.5)
				self.text:SetShadowOffset(2, -2)
			end
			self.text:Show()
			local hp = ShortValue(min).." / "..ShortValue(max)
			self.text:SetText(hp)
		end
	end)
end

local OnTooltipSetUnit = function(self)
	local lines = self:NumLines()
	local unit = (select(2, self:GetUnit())) or (GetMouseFocus() and GetMouseFocus():GetAttribute("unit")) or (UnitExists("mouseover") and "mouseover") or nil

	if not unit then return end

	local name, realm = UnitName(unit)
	local race, englishRace = UnitRace(unit)
	local level = UnitLevel(unit)
	local levelColor = GetQuestDifficultyColor(level)
	local classification = UnitClassification(unit)
	local creatureType = UnitCreatureType(unit)
	local _, faction = UnitFactionGroup(unit)
	local _, playerFaction = UnitFactionGroup("player")
	local relationship = UnitRealmRelationship(unit)
	local UnitPVPName = UnitPVPName

	if level and level == -1 then
		if classification == "worldboss" then
			level = "|cffff0000|r"..ENCOUNTER_JOURNAL_ENCOUNTER
		else
			level = "|cffff0000??|r"
		end
	end

	if classification == "rareelite" then classification = " R+"
	elseif classification == "rare" then classification = " R"
	elseif classification == "elite" then classification = "+"
	else classification = "" end


	if UnitPVPName(unit) and Qulight["tooltip"].title then
		name = UnitPVPName(unit)
	end

	_G["GameTooltipTextLeft1"]:SetText(name)
	if realm and realm ~= "" and Qulight["tooltip"].realm then
		self:AddLine(FRIENDS_LIST_REALM.."|cffffffff"..realm.."|r")
	end


	if UnitIsPlayer(unit) then
		if UnitIsAFK(unit) then
			self:AppendText((" %s"):format("|cffE7E716".."AFK".."|r"))
		elseif UnitIsDND(unit) then
			self:AppendText((" %s"):format("|cffFF0000".."DND".."|r"))
		end

		if UnitIsPlayer(unit) and englishRace == "Pandaren" and faction ~= nil and faction ~= playerFaction then
			local hex = "cffff3333"
			if faction == "Alliance" then
				hex = "cff69ccf0"
			end
			self:AppendText((" [|%s%s|r]"):format(hex, faction:sub(1, 2)))
		end

		if GetGuildInfo(unit) then
			_G["GameTooltipTextLeft2"]:SetFormattedText("%s", GetGuildInfo(unit))
			if UnitIsInMyGuild(unit) then
				_G["GameTooltipTextLeft2"]:SetTextColor(1, 1, 0)
			else
				_G["GameTooltipTextLeft2"]:SetTextColor(0, 1, 1)
			end
		end

		local n = GetGuildInfo(unit) and 3 or 2
		-- thx TipTac for the fix above with color blind enabled
		if GetCVar("colorblindMode") == "1" then n = n + 1 end
		_G["GameTooltipTextLeft"..n]:SetFormattedText("|cff%02x%02x%02x%s|r %s", levelColor.r * 255, levelColor.g * 255, levelColor.b * 255, level, race or UNKNOWN)

		for i = 2, lines do
			local line = _G["GameTooltipTextLeft"..i]
			if not line or not line:GetText() then return end
			if line and line:GetText() and (line:GetText() == FACTION_HORDE or line:GetText() == FACTION_ALLIANCE) then
				line:SetText()
				break
			end
		end
	else
		for i = 2, lines do
			local line = _G["GameTooltipTextLeft"..i]
			if not line or not line:GetText() or UnitIsBattlePetCompanion(unit) then return end
			if (level and line:GetText():find("^"..LEVEL)) or (creatureType and line:GetText():find("^"..creatureType)) then
				local r, g, b = GameTooltip_UnitColor(unit)
				line:SetFormattedText("|cff%02x%02x%02x%s%s|r %s", levelColor.r * 255, levelColor.g * 255, levelColor.b * 255, level, classification, creatureType or "")
				break
			end
		end
	end

	if Qulight["tooltip"].target == true and UnitExists(unit.."target") then
		local r, g, b = GameTooltip_UnitColor(unit.."target")
		local text = ""

		if UnitIsEnemy("player", unit.."target") then
			r, g, b = unpack(oUF_colors.reaction[1])
		elseif not UnitIsFriend("player", unit.."target") then
			r, g, b = unpack(oUF_colors.reaction[4])
		end

		if UnitName(unit.."target") == UnitName("player") then
			text = "|cfffed100"..STATUS_TEXT_TARGET..":|r ".."|cffff0000> "..UNIT_YOU.." <|r"
		else
			text = "|cfffed100"..STATUS_TEXT_TARGET..":|r "..UnitName(unit.."target")
		end

		self:AddLine(text, r, g, b)
	end

	if Qulight["tooltip"].raid_icon == true then
		local raidIndex = GetRaidTargetIndex(unit)
		if raidIndex then
			ricon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..raidIndex)
		end
	end

	if Qulight["tooltip"].who_targetting == true then
		token = unit AddTargetedBy()
	end
end

GameTooltip:HookScript("OnTooltipSetUnit", OnTooltipSetUnit)

----------------------------------------------------------------------------------------
--	Adds guild rank to tooltips(GuildRank by Meurtcriss)
----------------------------------------------------------------------------------------
if Qulight["tooltip"].rank == true then
	GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
		-- Get the unit
		local _, unit = self:GetUnit()
		if not unit then
			local mFocus = GetMouseFocus()
			if mFocus and mFocus.unit then
				unit = mFocus.unit
			end
		end
		-- Get and display guild rank
		if UnitIsPlayer(unit) then
			local guildName, guildRank = GetGuildInfo(unit)
			if guildName then
				self:AddLine(RANK..": |cffffffff"..guildRank.."|r")
			end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Hide tooltips in combat for action bars, pet bar and stance bar
----------------------------------------------------------------------------------------
if Qulight["tooltip"].hidebuttons == true then
	local CombatHideActionButtonsTooltip = function(self)
		if not IsShiftKeyDown() then
			self:Hide()
		end
	end

	hooksecurefunc(GameTooltip, "SetAction", CombatHideActionButtonsTooltip)
	hooksecurefunc(GameTooltip, "SetPetAction", CombatHideActionButtonsTooltip)
	hooksecurefunc(GameTooltip, "SetShapeshift", CombatHideActionButtonsTooltip)
end

----------------------------------------------------------------------------------------
--	Fix compare tooltips(by Blizzard)(../FrameXML/GameTooltip.lua)
----------------------------------------------------------------------------------------
hooksecurefunc("GameTooltip_ShowCompareItem", function(self, shift)
	if not self then
		self = GameTooltip
	end

	-- Find correct side
	local shoppingTooltip1, shoppingTooltip2 = unpack(self.shoppingTooltips)
	local primaryItemShown, secondaryItemShown = shoppingTooltip1:SetCompareItem(shoppingTooltip2, self)
	local side = "left"
	local rightDist = 0
	local leftPos = self:GetLeft()
	local rightPos = self:GetRight()

	if not rightPos then
		rightPos = 0
	end
	if not leftPos then
		leftPos = 0
	end

	rightDist = GetScreenWidth() - rightPos

	if leftPos and (rightDist < leftPos) then
		side = "left"
	else
		side = "right"
	end

	-- See if we should slide the tooltip
	if self:GetAnchorType() and self:GetAnchorType() ~= "ANCHOR_PRESERVE" then
		local totalWidth = 0
		if primaryItemShown then
			totalWidth = totalWidth + shoppingTooltip1:GetWidth()
		end
		if secondaryItemShown then
			totalWidth = totalWidth + shoppingTooltip2:GetWidth()
		end

		if side == "left" and totalWidth > leftPos then
			self:SetAnchorType(self:GetAnchorType(), totalWidth - leftPos, 0)
		elseif side == "right" and (rightPos + totalWidth) > GetScreenWidth() then
			self:SetAnchorType(self:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0)
		end
	end

	-- Anchor the compare tooltips
	if secondaryItemShown then
		shoppingTooltip2:SetOwner(self, "ANCHOR_NONE")
		shoppingTooltip2:ClearAllPoints()
		if side and side == "left" then
			shoppingTooltip2:SetPoint("TOPRIGHT", self, "TOPLEFT", -3, -10)
		else
			shoppingTooltip2:SetPoint("TOPLEFT", self, "TOPRIGHT", 3, -10)
		end

		shoppingTooltip1:SetOwner(self, "ANCHOR_NONE")
		shoppingTooltip1:ClearAllPoints()

		if side and side == "left" then
			shoppingTooltip1:SetPoint("TOPRIGHT", shoppingTooltip2, "TOPLEFT", -3, 0)
		else
			shoppingTooltip1:SetPoint("TOPLEFT", shoppingTooltip2, "TOPRIGHT", 3, 0)
		end
	else
		shoppingTooltip1:SetOwner(self, "ANCHOR_NONE")
		shoppingTooltip1:ClearAllPoints()

		if side and side == "left" then
			shoppingTooltip1:SetPoint("TOPRIGHT", self, "TOPLEFT", -3, -10)
		else
			shoppingTooltip1:SetPoint("TOPLEFT", self, "TOPRIGHT", 3, -10)
		end

		shoppingTooltip2:Hide()
	end

	shoppingTooltip1:SetCompareItem(shoppingTooltip2, self)
	shoppingTooltip1:Show()
end)

----------------------------------------------------------------------------------------
--	Fix GameTooltipMoneyFrame font size
----------------------------------------------------------------------------------------
local function FixFont(self)
	for i = 1, 2 do
		if _G["GameTooltipMoneyFrame"..i] then
			_G["GameTooltipMoneyFrame"..i.."PrefixText"]:SetFontObject("GameTooltipText")
			_G["GameTooltipMoneyFrame"..i.."SuffixText"]:SetFontObject("GameTooltipText")
			_G["GameTooltipMoneyFrame"..i.."GoldButton"]:SetNormalFontObject("GameTooltipText")
			_G["GameTooltipMoneyFrame"..i.."SilverButton"]:SetNormalFontObject("GameTooltipText")
			_G["GameTooltipMoneyFrame"..i.."CopperButton"]:SetNormalFontObject("GameTooltipText")
		end
	end
	for i = 1, 2 do
		if _G["ItemRefTooltipMoneyFrame"..i] then
			_G["ItemRefTooltipMoneyFrame"..i.."PrefixText"]:SetFontObject("GameTooltipText")
			_G["ItemRefTooltipMoneyFrame"..i.."SuffixText"]:SetFontObject("GameTooltipText")
			_G["ItemRefTooltipMoneyFrame"..i.."GoldButton"]:SetNormalFontObject("GameTooltipText")
			_G["ItemRefTooltipMoneyFrame"..i.."SilverButton"]:SetNormalFontObject("GameTooltipText")
			_G["ItemRefTooltipMoneyFrame"..i.."CopperButton"]:SetNormalFontObject("GameTooltipText")
		end
	end
end

GameTooltip:HookScript("OnTooltipSetItem", FixFont)
ItemRefTooltip:HookScript("OnTooltipSetItem", FixFont)


local function GetLFDRole(unit)
local role = UnitGroupRolesAssigned(unit)

	if role == "NONE" then
		return "|cFFB5B5B5"..NO_ROLE.."|r"
	elseif role == "TANK" then
		return "|cFF0070DE"..TANK.."|r"
	elseif role == "HEALER" then
		return "|cFF00CC12"..HEALER.."|r"
	else
		return "|cFFFF3030"..DAMAGER.."|r"
	end
end

GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
	local _, instanceType = IsInInstance()
	if instanceType == "scenario" then return end
	local _, unit = GameTooltip:GetUnit()
	if unit and UnitIsPlayer(unit) and ((UnitInParty(unit) or UnitInRaid(unit)) and GetNumGroupMembers() > 0) then
		GameTooltip:AddLine(ROLE..": "..GetLFDRole(unit))
	end
end)



----------------------------------------------------------------------------------------
--	Target Talents(TipTacTalents by Aezay)
----------------------------------------------------------------------------------------
-- Constants
local TALENTS_PREFIX = SPECIALIZATION..":|cffffffff "
local CACHE_SIZE = 25
local INSPECT_DELAY = 0.2
local INSPECT_FREQ = 2

-- Variables
local ttt = CreateFrame("Frame", "TipTacTalents")
local cache = {}
local current = {}

-- Time of the last inspect reuqest. Init this to zero, just to make sure. This is a global so other addons could use this variable as well
lastInspectRequest = 0

-- Allow these to be accessed through other addons
ttt.cache = cache
ttt.current = current
ttt:Hide()

----------------------------------------------------------------------------------------
--	Gather Talents
----------------------------------------------------------------------------------------
local function GatherTalents(mouseover)
	if mouseover == 1 then
		local id = GetInspectSpecialization("mouseover")
		local currentSpecName = id and select(2, GetSpecializationInfoByID(id)) or "Loading..."
		current.tree = currentSpecName
	else
		local currentSpec = GetSpecialization()
		local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "No Talents"
		current.tree = currentSpecName
	end

	-- Set the tips line output, for inspect, only update if the tip is still showing a unit
	if mouseover == 0 then
		GameTooltip:AddLine(TALENTS_PREFIX..current.tree)
	elseif GameTooltip:GetUnit() then
		for i = 2, GameTooltip:NumLines() do
			if (_G["GameTooltipTextLeft"..i]:GetText() or ""):match("^"..TALENTS_PREFIX) then
				_G["GameTooltipTextLeft"..i]:SetFormattedText("%s%s", TALENTS_PREFIX, current.tree)
				break
			end
		end
	end
	-- Organise Cache
	local cacheSize = CACHE_SIZE
	for i = #cache, 1, -1 do
		if current.name == cache[i].name then
			tremove(cache, i)
			break
		end
	end
	if #cache > cacheSize then
		tremove(cache, 1)
	end
	-- Cache the new entry
	if cacheSize > 0 then
		cache[#cache + 1] = CopyTable(current)
	end
end

----------------------------------------------------------------------------------------
--	Event Handling
----------------------------------------------------------------------------------------
-- OnEvent
ttt:SetScript("OnEvent", function(self, event, guid)
	self:UnregisterEvent(event)
	if guid == current.guid then
		GatherTalents(1)
	end
end)

-- OnUpdate
ttt:SetScript("OnUpdate", function(self, elapsed)
	self.nextUpdate = (self.nextUpdate - elapsed)
	if self.nextUpdate <= 0 then
		self:Hide()
		-- Make sure the mouseover unit is still our unit
		if UnitGUID("mouseover") == current.guid then
			lastInspectRequest = GetTime()
			self:RegisterEvent("INSPECT_READY")
			-- Az: Fix the blizzard inspect copypasta code (Blizzard_InspectUI\InspectPaperDollFrame.lua @ line 23)
			if InspectFrame then
				InspectFrame.unit = "player"
			end
			NotifyInspect(current.unit)
		end
	end
end)

-- HOOK: OnTooltipSetUnit
GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
	-- Abort any delayed inspect in progress
	ttt:Hide()
	-- Get the unit -- Check the UnitFrame unit if this tip is from a concated unit, such as "targettarget".
	local _, unit = self:GetUnit()
	if not unit then
		local mFocus = GetMouseFocus()
		if mFocus and mFocus.unit then
			unit = mFocus.unit
		end
	end
	-- No Unit or not a Player
	if not unit or not UnitIsPlayer(unit) then
		return
	end
	-- Only bother for players over level 9
	local level = UnitLevel(unit)
	if level > 9 or level == -1 then
		-- Wipe Current Record
		wipe(current)
		current.unit = unit
		current.name = UnitName(unit)
		current.guid = UnitGUID(unit)
		-- No need for inspection on the player
		if UnitIsUnit(unit, "player") then
			GatherTalents(0)
			return
		end
		-- Show Cached Talents, If Available
		local isInspectOpen = (InspectFrame and InspectFrame:IsShown()) or (Examiner and Examiner:IsShown())
		local cacheLoaded = false
		for _, entry in ipairs(cache) do
			if current.name == entry.name and not isInspectOpen then
				self:AddLine(TALENTS_PREFIX..entry.tree)
				current.tree = entry.tree
				cacheLoaded = true
				break
			end
		end
		-- Queue an inspect request
		if CanInspect(unit) and not isInspectOpen then
			local lastInspectTime = GetTime() - lastInspectRequest
			ttt.nextUpdate = (lastInspectTime > INSPECT_FREQ) and INSPECT_DELAY or (INSPECT_FREQ - lastInspectTime + INSPECT_DELAY)
			ttt:Show()
			if not cacheLoaded then
				self:AddLine(TALENTS_PREFIX.."Loading...")
			end
		elseif isInspectOpen then
			self:AddLine(TALENTS_PREFIX.."Inspect Frame is open")
		end
	end
end)

-----------------------------------------------------------------------
--	Your achievement status in tooltip(Enhanced Achievements by Syzgyn)
----------------------------------------------------------------------------------------
local colors = {
	["GREEN"] = {
		["r"] = 0.25,
		["g"] = 0.75,
		["b"] = 0.25,
	},
	["GRAY"] = {
		["r"] = 0.5,
		["g"] = 0.5,
		["b"] = 0.5,
	},
}

local function SetHyperlink(tooltip, refString)
	local output = {[0] = {}, [1] = {}}
	if select(3, string.find(refString, "(%a-):")) ~= "achievement" then return end

	local _, _, achievementID = string.find(refString, ":(%d+):")
	local numCriteria = GetAchievementNumCriteria(achievementID)
	local _, _, GUID = string.find(refString, ":%d+:(.-):")

	if GUID == UnitGUID("player") then
		tooltip:Show()
		return
	end

	tooltip:AddLine(" ")
	local _, _, _, completed, month, day, year, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID)

	if completed then
		if year < 10 then year = "0"..year end

		if client == "ruRU" then
			tooltip:AddLine("Your Status: Completed on "..day.."/"..month.."/"..year, 0, 1, 0)
		else
			tooltip:AddLine("Your Status: Completed on "..month.."/"..day.."/"..year, 0, 1, 0)
		end

		if earnedBy then
			if earnedBy ~= "" then
				tooltip:AddLine(format(ACHIEVEMENT_EARNED_BY, earnedBy))
			end
			if not wasEarnedByMe then
				tooltip:AddLine(format(ACHIEVEMENT_NOT_COMPLETED_BY, name))
			elseif name ~= earnedBy then
				tooltip:AddLine(format(ACHIEVEMENT_COMPLETED_BY, name))
			end
		end
	elseif numCriteria == 0 then
		tooltip:AddLine("Your Status: Incomplete")
	else
		tooltip:AddLine("Your Status:")
		for i = 1, numCriteria, 2 do
			for a = 0, 1 do
				output[a].text = nil
				output[a].color = nil
				if i + a <= numCriteria then
					local name, _, completed, quantity, reqQuantity = GetAchievementCriteriaInfo(achievementID, i + a)
					if completed then
						output[a].text = name
						output[a].color = "GREEN"
					else
						if quantity < reqQuantity and reqQuantity > 1 then
							output[a].text = name.." ("..quantity.."/"..reqQuantity..")"
							output[a].color = "GRAY"
						else
							output[a].text = name
							output[a].color = "GRAY"
						end
					end
				else
					output[a].text = nil
				end
			end
			if output[1].text == nil then
				tooltip:AddLine(output[0].text, colors[output[0].color].r, colors[output[0].color].g, colors[output[0].color].b)
			else
				tooltip:AddDoubleLine(output[0].text, output[1].text, colors[output[0].color].r, colors[output[0].color].g, colors[output[0].color].b, colors[output[1].color].r, colors[output[1].color].g, colors[output[1].color].b)
			end
			output = {[0] = {}, [1] = {}}
		end
	end
	tooltip:Show()
end

hooksecurefunc(GameTooltip, "SetHyperlink", SetHyperlink)
hooksecurefunc(ItemRefTooltip, "SetHyperlink", SetHyperlink)


----------------------------------------------------------------------------------------
--	Displays items can not be transmogrified(Will It Mog by Nathanyel)
----------------------------------------------------------------------------------------
-- Slots
local locs = {
	["INVTYPE_HEAD"] = 1,
	["INVTYPE_SHOULDER"] = 1,
	["INVTYPE_CHEST"] = 1,
	["INVTYPE_ROBE"] = 1,
	["INVTYPE_WAIST"] = 1,
	["INVTYPE_LEGS"] = 1,
	["INVTYPE_FEET"] = 1,
	["INVTYPE_WRIST"] = 1,
	["INVTYPE_HAND"] = 1,
	["INVTYPE_CLOAK"] = 1,
	["INVTYPE_WEAPON"] = 1,
	["INVTYPE_SHIELD"] = 1,
	["INVTYPE_2HWEAPON"] = 1,
	["INVTYPE_HOLDABLE"] = 1,
	["INVTYPE_WEAPONMAINHAND"] = 1,
	["INVTYPE_WEAPONOFFHAND"] = 1,
	["INVTYPE_RANGED"] = 1,
	["INVTYPE_THROWN"] = 1,
	["INVTYPE_RANGEDRIGHT"] = 1,
}

local WIMtooltip = function(tooltip)
	local _, link = tooltip:GetItem()
	if not link then return end
	local itemID = link:match("item:(%d+)")
	if not itemID then return end

	local rndench = link:match("item:[^:]+:[^:]+:[^:]+:[^:]+:[^:]+:[^:]+:([^:]+):")
	GetItemInfo(itemID)
	local _, _, quality, _, _, itemType, subType, _, slot = GetItemInfo(itemID)
	-- No weapon or armor, or misc 'weapon', or invalid slot
	if not itemType or not (itemType == ARMOR or itemType == ENCHSLOT_WEAPON) or (subType == MISCELLANEOUS and (itemType == ENCHSLOT_WEAPON or slot == "INVTYPE_CLOAK")) or not locs[slot] then return end
	local canBeChanged, noChangeReason, canBeSource, noSourceReason = C_Transmog.GetItemInfo(itemID)

	if rndench and rndench ~= "0" and noSourceReason == "NO_STATS" then
		canBeChanged = true
		canBeSource = true
	end

	if (quality < 2 or subType == MISCELLANEOUS) and not (canBeChanged or canBeSource) then return end

	if noChangeReason or noSourceReason then
		GameTooltip:AddLine(" ")
	end

	if subType == MISCELLANEOUS and itemType ~= "INVTYPE_HOLDABLE" then
		tooltip:AddLine("|cffff0000"..ERR_TRANSMOGRIFY_INVALID_ITEM_TYPE.."|r", nil, nil, nil, true)
	end

	if noChangeReason then
		tooltip:AddLine(gsub("|cffff0000"..(_G["ERR_TRANSMOGRIFY_"..noChangeReason] or ERR_TRANSMOGRIFY_INVALID_SOURCE), "%%s", ""), nil, nil, nil, true)
	end

	if noSourceReason and noSourceReason ~= noChangeReason then
		tooltip:AddLine(gsub("|cffff0000"..(_G["ERR_TRANSMOGRIFY_"..noSourceReason] or ERR_TRANSMOGRIFY_MISMATCH), "%%s", ""), nil, nil, nil, true)
	end

	tooltip:Show()
end

GameTooltip:HookScript("OnTooltipSetItem", WIMtooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", WIMtooltip)


----------------------------------------------------------------------------------------
--	Based on tekKompare(by Tekkub)
----------------------------------------------------------------------------------------
local orig1, orig2, GameTooltip = {}, {}, GameTooltip
local linktypes = {item = true, enchant = true, spell = true, quest = true, unit = true, talent = true, achievement = true, glyph = true, instancelock = true, currency = true}

local function OnHyperlinkEnter(frame, link, ...)
	local linktype = link:match("^([^:]+)")
	if linktype and linktype == "battlepet" then
		GameTooltip:SetOwner(frame, "ANCHOR_TOPLEFT", -3, 0)
		GameTooltip:Show()
		local _, speciesID, level, breedQuality, maxHealth, power, speed = strsplit(":", link)
		BattlePetToolTip_Show(tonumber(speciesID), tonumber(level), tonumber(breedQuality), tonumber(maxHealth), tonumber(power), tonumber(speed))
	elseif linktype and linktypes[linktype] then
		GameTooltip:SetOwner(frame, "ANCHOR_TOPLEFT", -3, 0)
		GameTooltip:SetHyperlink(link)
		GameTooltip:Show()
	end

	if orig1[frame] then return orig1[frame](frame, link, ...) end
end

local function OnHyperlinkLeave(frame, link, ...)
	local linktype = link:match("^([^:]+)")
	if linktype and linktype == "battlepet" then
		BattlePetTooltip:Hide()
	elseif linktype and linktypes[linktype] then
		GameTooltip:Hide()
	end

	if orig1[frame] then return orig1[frame](frame, link, ...) end
end

for i = 1, NUM_CHAT_WINDOWS do
	local frame = _G["ChatFrame"..i]
	orig1[frame] = frame:GetScript("OnHyperlinkEnter")
	frame:SetScript("OnHyperlinkEnter", OnHyperlinkEnter)

	orig2[frame] = frame:GetScript("OnHyperlinkLeave")
	frame:SetScript("OnHyperlinkLeave", OnHyperlinkLeave)
end


----------------------------------------------------------------------------------------
--	Your instance lock status in tooltip(Instance Lock Compare by Dridzt)
----------------------------------------------------------------------------------------
local myTip = CreateFrame("GameTooltip", "InstanceLockTooltip", nil, "GameTooltipTemplate")

local function ILockCompare(frame, link, ...)
	if not frame or not link then return end

	local linkType = string.match(link, "(instancelock):")
	if linkType == "instancelock" then
		local mylink, templink
		local myguid = UnitGUID("player")
		local guid = string.match(link, "instancelock:([^:]+)")

		if guid ~= myguid then
			local instanceguid = string.match(link, "instancelock:[^:]+:(%d+):")
			local numsaved = GetNumSavedInstances()
			if numsaved > 0 then
				for i = 1, numsaved do
					local locked, extended = select(5, GetSavedInstanceInfo(i))
					if extended or locked then
						templink = GetSavedInstanceChatLink(i)
						local myinstanceguid = string.match(templink, "instancelock:[^:]+:(%d+):")
						if myinstanceguid == instanceguid then
							mylink = string.match(templink, "(instancelock:[^:]+:%d+:%d+:%d+)")
							break
						end
					end
				end
				mylink = mylink or string.gsub(link, "(instancelock:)([^:]+)(:%d+:%d+:)(%d+)", function(a, g, b, k) g = myguid; k = "0"; return a..g..b..k end)
			else
				mylink = string.gsub(link, "(instancelock:)([^:]+)(:%d+:%d+:)(%d+)", function(a, g, b, k) g = myguid; k = "0"; return a..g..b..k end)
			end
		end

		if mylink then
			if not myTip:IsVisible() and frame:IsVisible() then
				myTip:SetParent(frame)
				myTip:SetOwner(frame, "ANCHOR_NONE")
				CreateStyle(myTip, 2)

				local side = "left"
				local rightDist = 0
				local leftPos = frame:GetLeft()
				local rightPos = frame:GetRight()
				if not rightPos then
					rightPos = 0
				end
				if not leftPos then
					leftPos = 0
				end
				rightDist = GetScreenWidth() - rightPos
				if leftPos and (rightDist < leftPos) then
					side = "left"
				else
					side = "right"
				end
				myTip:ClearAllPoints()
				if side == "left" then
					myTip:SetPoint("TOPRIGHT", frame, "TOPLEFT", -3, -10)
				elseif side == "right" then
					myTip:SetPoint("TOPLEFT", frame, "TOPRIGHT", 3, -10)
				end
				myTip:SetHyperlink(mylink)
				myTip:Show()
			end
		end
	end
end

ItemRefTooltip:HookScript("OnDragStop", function(self, button)
	if myTip:IsVisible() and (myTip:GetParent():GetName() == self:GetName()) then
		local side = "left"
		local rightDist = 0
		local leftPos = self:GetLeft()
		local rightPos = self:GetRight()
		if not rightPos then
			rightPos = 0
		end
		if not leftPos then
			leftPos = 0
		end
		rightDist = GetScreenWidth() - rightPos
		if leftPos and (rightDist < leftPos) then
			side = "left"
		else
			side = "right"
		end
		myTip:ClearAllPoints()
		if side == "left" then
			myTip:SetPoint("TOPRIGHT", self, "TOPLEFT", -3, -10)
		elseif side == "right" then
			myTip:SetPoint("TOPLEFT", self, "TOPRIGHT", 3, -10)
		end
	end
end)

hooksecurefunc(GameTooltip, "SetHyperlink", ILockCompare)
hooksecurefunc(ItemRefTooltip,"SetHyperlink", ILockCompare)

--------------------------------------------------------
--	Item count in tooltip(by Tukz)
----------------------------------------------------------------------------------------
GameTooltip:HookScript("OnTooltipCleared", function(self) self.UIItemTooltip = nil end)
GameTooltip:HookScript("OnTooltipSetItem", function(self)
	if UIItemTooltip and not self.UIItemTooltip and UIItemTooltip.count then
		local item, link = self:GetItem()
		local num = GetItemCount(link, true)
		local item_count = ""

		if UIItemTooltip.count and num > 1 then
			item_count = "|cffffffff".."Item count:".." "..num
		end

		self:AddLine(item_count)
		self.UIItemTooltip = 1
	end
end)

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, name)
	f:UnregisterEvent("ADDON_LOADED")
	f:SetScript("OnEvent", nil)
	UIItemTooltip = UIItemTooltip or {count = true}
end)

----------------------------------------------------------------------------------------
--	Adds item icons to tooltips(Tipachu by Tuller)
----------------------------------------------------------------------------------------
local function setTooltipIcon(self, icon)
	local title = icon and _G[self:GetName().."TextLeft1"]
	if title then
		title:SetFormattedText("|T%s:20:20:0:0:64:64:5:59:5:59:%d|t %s", icon, 20, title:GetText())
	end
end

local function newTooltipHooker(method, func)
	return function(tooltip)
		local modified = false

		tooltip:HookScript("OnTooltipCleared", function(self, ...)
			modified = false
		end)

		tooltip:HookScript(method, function(self, ...)
			if not modified then
				modified = true
				func(self, ...)
			end
		end)
	end
end

local hookItem = newTooltipHooker("OnTooltipSetItem", function(self, ...)
	local _, link = self:GetItem()
	if link then
		setTooltipIcon(self, GetItemIcon(link))
	end
end)

local hookSpell = newTooltipHooker("OnTooltipSetSpell", function(self, ...)
	local _, _, id = self:GetSpell()
	if id then
		setTooltipIcon(self, select(3, GetSpellInfo(id)))
	end
end)

for _, tooltip in pairs{GameTooltip, ItemRefTooltip, ItemRefShoppingTooltip1, ItemRefShoppingTooltip2, ShoppingTooltip1, ShoppingTooltip2} do
	hookItem(tooltip)
	hookSpell(tooltip)
end

----------------------------------------------------------------------------------------
--	Equipped average item level(Cloudy Unit Info by Cloudyfa)
----------------------------------------------------------------------------------------
--- Variables
local currentUNIT, currentGUID
local GearDB = {}

local nextInspectRequest = 0
local lastInspectRequest = 0

local prefixColor = "|cffF9D700"
local detailColor = "|cffffffff"

local gearPrefix = STAT_AVERAGE_ITEM_LEVEL..": "

--- Create Frame
local f = CreateFrame("Frame", "CloudyUnitInfo")
f:RegisterEvent("UNIT_INVENTORY_CHANGED")
f:RegisterEvent("INSPECT_READY")

--- Set Unit Info
local function SetUnitInfo(gear)
	if not gear then return end

	local _, unit = GameTooltip:GetUnit()
	if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

	local gearLine
	for i = 2, GameTooltip:NumLines() do
		local line = _G["GameTooltipTextLeft" .. i]
		local text = line:GetText()

		if text and strfind(text, gearPrefix) then
			gearLine = line
		end
	end

	if gear then
		gear = prefixColor..gearPrefix..detailColor..gear

		if gearLine then
			gearLine:SetText(gear)
		else
			GameTooltip:AddLine(gear)
		end
	end

	GameTooltip:Show()
end

--- PVP Item Detect
local function IsPVPItem(link)
	local itemStats = GetItemStats(link)
	for stat in pairs(itemStats) do
		if stat == "ITEM_MOD_RESILIENCE_RATING_SHORT" or stat == "ITEM_MOD_PVP_POWER_SHORT" then
			return true
		end
	end

	return false
end

local upgrades = {
	["1"] = 8, ["373"] = 4, ["374"] = 8, ["375"] = 4, ["376"] = 4, ["377"] = 4,
	["379"] = 4, ["380"] = 4, ["446"] = 4, ["447"] = 8, ["452"] = 8, ["454"] = 4,
	["455"] = 8, ["457"] = 8, ["459"] = 4, ["460"] = 8, ["461"] = 12, ["462"] = 16,
	["466"] = 4, ["467"] = 8, ["469"] = 4, ["470"] = 8, ["471"] = 12, ["472"] = 16,
	["477"] = 4, ["478"] = 8, ["480"] = 8, ["492"] = 4, ["493"] = 8, ["495"] = 4,
	["496"] = 8, ["497"] = 12, ["498"] = 16, ["504"] = 12, ["505"] = 16, ["506"] = 20,
	["507"] = 24, ["530"] = 5, ["531"] = 10
}

local function BOALevel(level, id)
	if level > 97 then
		if id == 133585 or id == 133595 or id == 133596 or id == 133597 or id == 133598 then
			level = 715
		else
			level = 605 - (100 - level) * 5
		end
	elseif level > 90 then
		level = 590 - (97 - level) * 10
	elseif level > 85 then
		level = 463 - (90 - level) * 19.75
	elseif level > 80 then
		level = 333 - (85 - level) * 13.5
	elseif level > 67 then
		level = 187 - (80 - level) * 4
	elseif level > 57 then
		level = 105 - (67 - level) * 2.9
	elseif level > 5 then
		level = level + 5
	else
		level = 10
	end

	return level
end

local timewarped = {
	[615] = 660, -- Dungeon drops
	[692] = 675, -- Timewarped badge vendors
}

local timewarped_warforged = {
	[656] = 675, -- Dungeon drops
}

--- Unit Gear Info
local function UnitGear(unit)
	if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

	local ulvl = UnitLevel(unit)
	local class = select(2, UnitClass(unit))

	local ilvl, boa, pvp = 0, 0, 0
	local total, count, delay = 0, 16, nil
	local mainhand, offhand, twohand = 1, 1, 0

	for i = 1, 17 do
		if i ~= 4 then
			local itemTexture = GetInventoryItemTexture(unit, i)

			if itemTexture then
				local itemLink = GetInventoryItemLink(unit, i)

				if not itemLink then
					delay = true
				else
					local _, _, quality, level, _, _, _, _, slot = GetItemInfo(itemLink)

					if (not quality) or (not level) then
						delay = true
					else
						if quality == 7 then
							boa = boa + 1
							local id = tonumber(strmatch(itemLink, "item:(%d+)"))
							total = total + BOALevel(ulvl, id)
						else
							if IsPVPItem(itemLink) then
								pvp = pvp + 1
							end

							local warped = select(15, strsplit(":", itemLink))
							local warforged = select(16, strsplit(":", itemLink))
							level = timewarped[tonumber(warped)] or level
							level = timewarped_warforged[tonumber(warforged)] or level

							--BETA local upgrade = itemLink:match(":(%d+)\124h%[")
							local upgrade = 0
							if upgrades[upgrade] == nil then upgrades[upgrade] = 0 end

							total = total + (level + upgrades[upgrade])
						end

						if i >= 16 then
							if (slot == "INVTYPE_2HWEAPON") or (slot == "INVTYPE_RANGED") or ((slot == "INVTYPE_RANGEDRIGHT") and (class == "HUNTER")) then
								twohand = twohand + 1
							end
						end
					end
				end
			else
				if i == 16 then
					mainhand = 0
				elseif i == 17 then
					offhand = 0
				end
			end
		end
	end

	if (mainhand == 0) and (offhand == 0) or (twohand == 1) then
		count = count - 1
	end

	if not delay then
		if unit == "player" and GetAverageItemLevel() > 0 then
			_, ilvl = GetAverageItemLevel()
		else
			ilvl = total / count
		end

		if ilvl > 0 then ilvl = string.format("%.1f", ilvl) end
		if boa > 0 then ilvl = ilvl.."  |cffe6cc80"..boa.." "..HEIRLOOMS end
		if pvp > 0 then ilvl = ilvl.."  |cffa335ee"..pvp.." "..PVP end
	else
		ilvl = nil
	end

	return ilvl
end

--- Scan Current Unit
local function ScanUnit(unit, forced)
	local cachedGear

	if UnitIsUnit(unit, "player") then
		cachedGear = UnitGear("player")

		SetUnitInfo(cachedGear or CONTINUED)
	else
		if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

		cachedGear = GearDB[currentGUID]

		-- cachedGear? ok...skip get gear
		if cachedGear and not forced then
			SetUnitInfo(cachedGear)
		end

		if not (IsShiftKeyDown() or forced) then
			if UnitAffectingCombat("player") then return end
		end

		if not UnitIsVisible(unit) then return end
		if UnitIsDeadOrGhost("player") or UnitOnTaxi("player") then return end
		if InspectFrame and InspectFrame:IsShown() then return end

		-- Press SHIFT to refresh
		if IsShiftKeyDown() then
			SetUnitInfo(CONTINUED, CONTINUED)
		else
			SetUnitInfo(cachedGear or CONTINUED)
		end

		local timeSinceLastInspect = GetTime() - lastInspectRequest
		if timeSinceLastInspect >= 1.5 then
			nextInspectRequest = 0
		else
			nextInspectRequest = 1.5 - timeSinceLastInspect
		end
		f:Show()
	end
end

--- Character Info Sheet
hooksecurefunc("PaperDollFrame_SetItemLevel", function(self, unit)
	if unit ~= "player" then return end

	local total, equip = GetAverageItemLevel()
	if total > 0 then total = string.format("%.1f", total) end
	if equip > 0 then equip = string.format("%.1f", equip) end

	local ilvl = equip
	if equip ~= total then
		ilvl = equip.." / "..total
	end

	CharacterStatsPane.ItemLevelFrame.Value:SetText(ilvl)

	self.tooltip = detailColor..STAT_AVERAGE_ITEM_LEVEL.." "..ilvl
end)

--- Handle Events
f:SetScript("OnEvent", function(self, event, ...)
	if event == "UNIT_INVENTORY_CHANGED" then
		local unit = ...
		if UnitGUID(unit) == currentGUID then
			ScanUnit(unit, true)
		end
	elseif event == "INSPECT_READY" then
		local guid = ...
		if guid ~= currentGUID then return end

		local gear = UnitGear(currentUNIT)
		GearDB[currentGUID] = gear

		if not gear then
			ScanUnit(currentUNIT, true)
		else
			SetUnitInfo(gear)
		end
	end
end)

f:SetScript("OnUpdate", function(self, elapsed)
	nextInspectRequest = nextInspectRequest - elapsed
	if nextInspectRequest > 0 then return end

	self:Hide()

	if currentUNIT and (UnitGUID(currentUNIT) == currentGUID) then
		lastInspectRequest = GetTime()
		NotifyInspect(currentUNIT)
	end
end)

GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	local _, unit = self:GetUnit()

	if (not unit) or (not CanInspect(unit)) then return end
	if (UnitLevel(unit) > 0) and (UnitLevel(unit) < 10) then return end

	currentUNIT, currentGUID = unit, UnitGUID(unit)
	ScanUnit(unit)
end)

----------------------------------------------------------------------------------------
--	Multi ItemRefTooltip
----------------------------------------------------------------------------------------
local tips = {[1] = _G["ItemRefTooltip"]}
local types = {item = true, enchant = true, spell = true, quest = true, unit = true, talent = true, achievement = true, glyph = true, instancelock = true, currency = true}

local CreateTip = function(link)
	for k, v in ipairs(tips) do
		for i, tip in ipairs(tips) do
			if tip:IsShown() and tip.link == link then
				tip.link = nil
				HideUIPanel(tip)
				return
			end
		end
		if not v:IsShown() then
			v.link = link
			return v
		end
	end

	local num = #tips + 1
	local tip = CreateFrame("GameTooltip", "ItemRefTooltip"..num, UIParent, "GameTooltipTemplate")
	CreateStyle(tip, 1)
	tip:SetPoint("BOTTOM", 0, 80)
	tip:SetSize(128, 64)
	tip:EnableMouse(true)
	tip:SetMovable(true)
	tip:SetClampedToScreen(true)
	tip:RegisterForDrag("LeftButton")
	tip:SetScript("OnDragStart", function(self) self:StartMoving() end)
	tip:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	tip:HookScript("OnShow", function(self)
		self:SetBackdropColor(0, 0, 0, 0.7)
		self:SetBackdropBorderColor(0.37, 0.3, 0.3, 1)
	end)

	local close = CreateFrame("Button", "ItemRefTooltip"..num.."CloseButton", tip)
	close:SetScript("OnClick", function(self) HideUIPanel(tip) end)
--	SkinCloseButton(close)

	table.insert(UISpecialFrames, tip:GetName())

	tip.link = link
	tips[num] = tip

	return tip
end

local ShowTip = function(tip, link)
	ShowUIPanel(tip)
	if not tip:IsShown() then
		tip:SetOwner(UIParent, "ANCHOR_PRESERVE")
	end
	tip:SetHyperlink(link)
end

local _SetItemRef = SetItemRef
function SetItemRef(...)
	local link, text, button = ...
	local handled = strsplit(":", link)
	if not IsModifiedClick() and handled and types[handled] then
		local tip = CreateTip(link)
		if tip then
			ShowTip(tip, link)
		end
	else
		return _SetItemRef(...)
	end
end

if Qulight["tooltip"].arena_experience then
----------------------------------------------------------------------------------------
--	Arena function(ArenaExp by Fernir)
----------------------------------------------------------------------------------------
local active = false
local tooltip = _G["GameTooltip"]
local statistic = {
	370,	-- Highest 2 man personal rating
	595,	-- Highest 3 man personal rating
}

local gradient = function(val, low, high)
	local percent, r, g
	if high > low then
		percent = val / (high - low)
	else
		percent = 1 - val / (low - high)
	end
	if percent > 1 then percent = 1 end
	if percent < 0 then percent = 0 end
	if percent < 0.5 then
		r, g = 1, 2 * percent
	else
		r, g = (1 - percent) * 2, 1
	end
	return format("|cff%02x%02x%02x%s|r", r * 255, g * 255, 0, val)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		if ... then
			frame:UnregisterEvent("ADDON_LOADED")
			tooltip:HookScript("OnTooltipSetUnit", function()
				if InCombatLockdown() then return end
				if AchievementFrame and AchievementFrame:IsShown() then return end

				self.unit = select(2, tooltip:GetUnit())
				if not UnitIsPlayer(self.unit) then return end

				if _G.GearScore then
					_G.GearScore:UnregisterEvent("INSPECT_ACHIEVEMENT_READY")
				end
				ClearAchievementComparisonUnit()
				frame:RegisterEvent("INSPECT_ACHIEVEMENT_READY")
				SetAchievementComparisonUnit(self.unit)
			end)
			tooltip:HookScript("OnTooltipCleared", function()
				if frame:IsEventRegistered("INSPECT_ACHIEVEMENT_READY") and frame:IsEventRegistered("INSPECT_ACHIEVEMENT_READY") then
					frame:UnregisterEvent("INSPECT_ACHIEVEMENT_READY")
					ClearAchievementComparisonUnit()
				end
				active = false
			end)
		end
	elseif event == "INSPECT_ACHIEVEMENT_READY" then
		if not GetComparisonAchievementPoints() then return end

		active = false

		for index, Achievement in pairs(statistic) do
			if tonumber(GetComparisonStatistic(Achievement)) and tonumber(GetComparisonStatistic(Achievement)) > 0 then
				tooltip:AddDoubleLine(select(2, GetAchievementInfo(Achievement)), gradient(tonumber(GetComparisonStatistic(Achievement)), 0, 100))
				active = true
			end
		end

		if active then tooltip:Show() end

		if _G.GearScore then
			_G.GearScore:RegisterEvent("INSPECT_ACHIEVEMENT_READY")
		end

		frame:UnregisterEvent("INSPECT_ACHIEVEMENT_READY")
		ClearAchievementComparisonUnit()
	end
end)
end
----------------------------------------------------------------------------------------
--	Spell/Item IDs(idTip by Silverwind)
----------------------------------------------------------------------------------------
local debuginfo = false
local function addLine(self, id, isItem)
	for i = 1, self:NumLines() do
		local line = _G[self:GetName().."TextLeft"..i]
		if not line then break end
		local text = line:GetText()
		if text and (text:match("Item ID:") or text:match("Spell ID:")) then return end
	end
	if isItem then
		self:AddLine("|cffffffff".."Item ID:".." "..id)
	else
		self:AddLine("|cffffffff".."Spell ID:".." "..id)
	end
	self:Show()
end

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
	local id = select(3, self:GetSpell())
	if id then addLine(self, id) end
end)

hooksecurefunc(GameTooltip, "SetUnitAura", function(self, ...)
	local id = select(11, UnitAura(...))
	if id then addLine(self, id) end
	if debuginfo == true and id and IsModifierKeyDown() then print(UnitAura(...)..": "..id) end
end)

hooksecurefunc("SetItemRef", function(link, ...)
	local id = tonumber(link:match("spell:(%d+)"))
	if id then addLine(ItemRefTooltip, id) end
end)

local function attachItemTooltip(self)
	local link = select(2, self:GetItem())
	if not link then return end
	local id = link:match("item:(%d+):")
	if id then addLine(self, id, true) end
end

GameTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)

SlashCmdList.SHOWSPELLID = function()
	if not debuginfo then
		debuginfo = true
	else
		debuginfo = false
	end
end

SLASH_SHOWSPELLID1 = "/showid"
SLASH_SHOWSPELLID2 = "/si"
SLASH_SHOWSPELLID3 = "/ыш"

----------------------------------------------------------------------------------------
--	Clean ruRU tooltip(snt_rufix by Don Kaban, edited by ALZA)
----------------------------------------------------------------------------------------
ITEM_CREATED_BY = ""	-- No creator name
ITEM_SOCKETABLE = ""	-- No gem info line
EMPTY_SOCKET_RED = "|cffFF4040"..EMPTY_SOCKET_RED.."|r"
EMPTY_SOCKET_YELLOW = "|cffffff40"..EMPTY_SOCKET_YELLOW.."|r"
EMPTY_SOCKET_BLUE = "|cff6060ff"..EMPTY_SOCKET_BLUE.."|r"

if client ~= "ruRU" then return end

GUILD_ACHIEVEMENT = "Уведомл. для гильдии"

local ttext
local replace = {
	["красного цвета"] = "|cffFF4040красного цвета|r",
	["синего цвета"] = "|cff6060ffсинего цвета|r",
	["желтого цвета"] = "|cffffff40желтого цвета|r",
	["Требуется хотя бы"] = "Требуется",
}

local replaceclass = {
	["Воин"] = "|cffC79C6EВоин|r",
	["Друид"] = "|cffFF7D0AДруид|r",
	["Жрец"] = "|cffFFFFFFЖрец|r",
	["Маг"] = "|cff69CCF0Маг|r",
	["Монах"] = "|cff00FF96Монах|r",
	["Охотник"] = "|cffABD473Охотник|r",
	["Паладин"] = "|cffF58CBAПаладин|r",
	["Разбойник"] = "|cffFFF569Разбойник|r",
	["Рыцарь смерти"] = "|cffC41F3BРыцарь смерти|r",
	["Чернокнижник"] = "|cff9482C9Чернокнижник|r",
	["Шаман"] = "|cff0070DEШаман|r",
}

local function Translate(text)
	if text then
		for rus, replace in next, replace do
			text = text:gsub(rus, replace)
		end
		return text
	end
end

local function TranslateClass(text)
	if text then
		for rus, replaceclass in next, replaceclass do
			text = text:gsub(rus, replaceclass)
		end
		return text
	end
end

local function UpdateTooltip(self)
	if not self:GetItem() then return end
	local tname = self:GetName()
	for i = 3, self:NumLines() do
		ttext = _G[tname.."TextLeft"..i]
		local class = ttext:GetText() and (string.find(ttext:GetText(), "Класс") or string.find(ttext:GetText(), "Требуется"))
		if ttext then ttext:SetText(Translate(ttext:GetText())) end
		if ttext and class then ttext:SetText(TranslateClass(ttext:GetText())) end
		ttext = _G[tname.."TextRight"..i]
		if ttext then ttext:SetText(Translate(ttext:GetText())) end
	end
	ttext = nil
end

GameTooltip:HookScript("OnTooltipSetItem", UpdateTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", UpdateTooltip)
ShoppingTooltip1:HookScript("OnTooltipSetItem", UpdateTooltip)
ShoppingTooltip2:HookScript("OnTooltipSetItem", UpdateTooltip)