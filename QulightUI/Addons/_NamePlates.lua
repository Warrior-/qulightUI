if not Qulight["nameplate"].enable == true then return end
----------------------------------------------------------------------------------------
--	Based on dNameplates(by Dawn, editor Elv22)
----------------------------------------------------------------------------------------
local function SpellName(id)
	local name = select(1, GetSpellInfo(id))
	return name
end

DebuffWhiteList = {
	-- Death Knight
	--BETA [SpellName(115001)] = true,	-- Remorseless Winter
	[SpellName(108194)] = true,	-- Asphyxiate
	[SpellName(47476)] = true,	-- Strangulate
	[SpellName(55078)] = true,	-- Blood Plague
	[SpellName(55095)] = true,	-- Frost Fever
	-- Druid
	[SpellName(33786)] = true,	-- Cyclone
	[SpellName(339)] = true,	-- Entangling Roots
	[SpellName(164812)] = true,	-- Moonfire
	[SpellName(164815)] = true,	-- Sunfire
	[SpellName(58180)] = true,	-- Infected Wounds
	--BETA [SpellName(33745)] = true,	-- Lacerate
	[SpellName(155722)] = true,	-- Rake
	[SpellName(1079)] = true,	-- Rip
	-- Hunter
	[SpellName(3355)] = true,	-- Freezing Trap
	-- Mage
	[SpellName(118)] = true,	-- Polymorph
	[SpellName(31661)] = true,	-- Dragon's Breath
	[SpellName(122)] = true,	-- Frost Nova
	--BETA [SpellName(111340)] = true,	-- Ice Ward
	[SpellName(44457)] = true,	-- Living Bomb
	[SpellName(114923)] = true,	-- Nether Tempest
	[SpellName(112948)] = true,	-- Frost Bomb
	--BETA [SpellName(83853)] = true,	-- Combustion
	--BETA [SpellName(44572)] = true,	-- Deep Freeze
	[SpellName(120)] = true,	-- Cone of Cold
	--BETA [SpellName(102051)] = true,	-- Frostjaw
	-- Monk
	[SpellName(115078)] = true,	-- Paralysis
	-- Paladin
	[SpellName(20066)] = true,	-- Repentance
	--BETA [SpellName(10326)] = true,	-- Turn Evil
	[SpellName(853)] = true,	-- Hammer of Justice
	--BETA [SpellName(105593)] = true,	-- Fist of Justice
	--BETA [SpellName(31803)] = true,	-- Censure
	-- Priest
	[SpellName(9484)] = true,	-- Shackle Undead
	[SpellName(8122)] = true,	-- Psychic Scream
	[SpellName(64044)] = true,	-- Psychic Horror
	[SpellName(15487)] = true,	-- Silence
	[SpellName(589)] = true,	-- Shadow Word: Pain
	[SpellName(34914)] = true,	-- Vampiric Touch
	-- Rogue
	[SpellName(6770)] = true,	-- Sap
	[SpellName(2094)] = true,	-- Blind
	[SpellName(1776)] = true,	-- Gouge
	-- Shaman
	[SpellName(51514)] = true,	-- Hex
	[SpellName(3600)] = true,	-- Earthbind
	--BETA [SpellName(8056)] = true,	-- Frost Shock
	--BETA [SpellName(8050)] = true,	-- Flame Shock
	--BETA [SpellName(63685)] = true,	-- Frozen Power
	-- Warlock
	[SpellName(710)] = true,	-- Banish
	[SpellName(6789)] = true,	-- Mortal Coil
	[SpellName(5782)] = true,	-- Fear
	[SpellName(5484)] = true,	-- Howl of Terror
	[SpellName(6358)] = true,	-- Seduction
	[SpellName(30283)] = true,	-- Shadowfury
	[SpellName(603)] = true,	-- Doom
	[SpellName(980)] = true,	-- Agony
	[SpellName(146739)] = true,	-- Corruption
	[SpellName(48181)] = true,	-- Haunt
	[SpellName(348)] = true,	-- Immolate
	[SpellName(30108)] = true,	-- Unstable Affliction
	-- Warrior
	[SpellName(5246)] = true,	-- Intimidating Shout
	[SpellName(132168)] = true,	-- Shockwave
	[SpellName(115767)] = true,	-- Deep Wounds
	-- Racial
	[SpellName(25046)] = true,	-- Arcane Torrent
	[SpellName(20549)] = true,	-- War Stomp
	[SpellName(107079)] = true,	-- Quaking Palm
}


local PlateBlacklist = {
	-- Army of the Dead
	["Army of the Dead"] = true,
	["Войско мертвых"] = true,
	-- Wild Imp
	["Wild Imp"] = true,
	["Дикий бес"] = true,
	-- Hunter Trap
	["Venomous Snake"] = true,
	["Ядовитая змея"] = true,
	["Viper"] = true,
	["Гадюка"] = true,
	-- Raid
	["Liquid Obsidian"] = true,
	["Жидкий обсидиан"] = true,
	["Lava Parasites"] = true,
	["Лавовый паразит"] = true,
	-- Gundrak
	["Fanged Pit Viper"] = true,
	["Клыкастая глубинная гадюка"] = true,
}


-- Check Player's Role
local RoleUpdater = CreateFrame("Frame")
RoleUpdater:RegisterEvent("PLAYER_ENTERING_WORLD")
RoleUpdater:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
RoleUpdater:RegisterEvent("PLAYER_TALENT_UPDATE")
RoleUpdater:RegisterEvent("CHARACTER_POINTS_CHANGED")
RoleUpdater:RegisterEvent("UNIT_INVENTORY_CHANGED")
RoleUpdater:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
RoleUpdater:SetScript("OnEvent", function() Role = CheckRole() end)


-- pixel perfect script of custom ui scale.
local mult = 768/string.match(getscreenresolution, "%d+x(%d+)")/Qulight["general"].UiScale
local function scale(x)
    return mult*math.floor(x/mult+.5)
end
function Scale(x) return scale(x) end
mult = mult


local Plates = CreateFrame("Frame", nil, WorldFrame)
local frames, numChildren, select = {}, -1, select
local noscalemult = mult * Qulight["general"].UiScale
local goodR, goodG, goodB = 0.2, 0.8, 0.2
local badR, badG, badB = 1, 0, 0
local transitionR, transitionG, transitionB = 1, 1, 0

local NamePlates = CreateFrame("Frame", nil, UIParent)
NamePlates:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
if Qulight["nameplate"].track_auras == true then
	NamePlates:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

local healList, exClass = {}, {}
local testing = false

exClass.DEATHKNIGHT = true
exClass.MAGE = true
exClass.ROGUE = true
exClass.WARLOCK = true
exClass.WARRIOR = true
if Qulight["nameplate"].healer_icon == true then
	local t = CreateFrame("Frame")
	t.factions = {
		["Horde"] = 1,
		["Alliance"] = 0,
	}
	t.healers = {
		[L_PLANNER_DRUID_4] = true,
		[L_PLANNER_MONK_2] = true,
		[L_PLANNER_PALADIN_1] = true,
		[L_PLANNER_PRIEST_1] = true,
	}

	local lastCheck = 20
	local function CheckHealers(self, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 25 then
			lastCheck = 0
			healList = {}
			for i = 1, GetNumBattlefieldScores() do
				local name, _, _, _, _, faction, _, _, _, _, _, _, _, _, _, talentSpec = GetBattlefieldScore(i)
				name = name:match("(.+)%-.+") or name
				if name and t.healers[talentSpec] and t.factions[UnitFactionGroup("player")] == faction then
					healList[name] = talentSpec
				end
			end
		end
	end

	local function CheckArenaHealers(self, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 25 then
			lastCheck = 0
			healList = {}
			for i = 1, 5 do
				local specID = GetArenaOpponentSpec(i)
				if specID and specID > 0 then
					local name = UnitName(format('arena%d', i))
					local _, talentSpec = GetSpecializationInfoByID(specID)
					if name and t.healers[talentSpec] then
						healList[name] = talentSpec
					end
				end
			end
		end
	end

	local function CheckLoc(self, event)
		if event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_ENTERING_BATTLEGROUND" then
			local _, instanceType = IsInInstance()
			if instanceType == "pvp" then
				t:SetScript("OnUpdate", CheckHealers)
			elseif instanceType == "arena" then
				t:SetScript("OnUpdate", CheckArenaHealers)
			else
				healList = {}
				t:SetScript("OnUpdate", nil)
			end
		end
	end

	t:RegisterEvent("PLAYER_ENTERING_WORLD")
	t:RegisterEvent("PLAYER_ENTERING_BATTLEGROUND")
	t:SetScript("OnEvent", CheckLoc)
end

local function Abbrev(name)
	local newname = (string.len(name) > 18) and string.gsub(name, "%s?(.[\128-\191]*)%S+%s", "%1. ") or name
	return utf8sub(newname, 18, false)
end

local function QueueObject(frame, object)
	frame.queue = frame.queue or {}
	frame.queue[object] = true
end

local function HideObjects(frame)
	for object in pairs(frame.queue) do
		if object:GetObjectType() == "Texture" then
			object:SetColorTexture(nil)
		elseif object:GetObjectType() == "FontString" then
			object:SetWidth(0.001)
		else
			object:Hide()
		end
	end
end

-- Create a fake backdrop frame using textures
local function CreateVirtualFrame(frame, point)
	if point == nil then point = frame end
	if point.backdrop then return end

	frame.backdrop = frame:CreateTexture(nil, "BORDER")
	frame.backdrop:SetDrawLayer("BORDER", -8)
	frame.backdrop:SetPoint("TOPLEFT", point, "TOPLEFT", -noscalemult, noscalemult)
	frame.backdrop:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", noscalemult, -noscalemult)
	frame.backdrop:SetColorTexture(0.05, 0.05, 0.05, 1)
end

local function SetVirtualBorder(frame, r, g, b)
end

-- Create aura icons
local function CreateAuraIcon(frame)
	local button = CreateFrame("Frame", nil, self.Health)
	button:SetWidth(Qulight["nameplate"].auras_size)
	button:SetHeight(Qulight["nameplate"].auras_size)

	CreateStyle(button, 4)
	
	button.bg = button:CreateTexture(nil, "BACKGROUND")
	button.bg:SetColorTexture(0.05, 0.05, 0.05, 1)
	button.bg:SetAllPoints(button)

	button.bord = button:CreateTexture(nil, "BORDER")
	button.bord:SetColorTexture(.6,.6,.6,0)
	button.bord:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.bord:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)

	button.bg2 = button:CreateTexture(nil, "ARTWORK")
	button.bg2:SetColorTexture(0.05, 0.05, 0.05, 1)
	button.bg2:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.bg2:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)

	button.icon = button:CreateTexture(nil, "OVERLAY")
	button.icon:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)
	button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	button.cd = CreateFrame("Cooldown", nil, button)
	button.cd:SetAllPoints(button)
	button.cd:SetReverse(true)

	button.count = button:CreateFontString(nil, "OVERLAY")
	button.count:SetFont(Qulight["media"].font, 10, "THINOUTLINE")
	button.count:SetShadowOffset(1, -1)
	button.count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)

	return button
end

-- Update an aura icon
local function UpdateAuraIcon(button, unit, index, filter)
	local _, _, icon, count, _, duration, expirationTime, _, _, _, spellID = UnitAura(unit, index, filter)

	button.icon:SetTexture(icon)
	button.cd:SetCooldown(expirationTime - duration, duration)
	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID
	if count > 1 then
		button.count:SetText(count)
	else
		button.count:SetText("")
	end
	button.cd:SetScript("OnUpdate", function(self)
		if not button.cd.timer then
			self:SetScript("OnUpdate", nil)
			return
		end
		button.cd.timer.text:SetFont(Qulight["media"].font, 8, "THINOUTLINE")
		button.cd.timer.text:SetShadowOffset(1, -1)
	end)
	button:Show()
end

-- Filter auras on nameplate, and determine if we need to update them or not
function Plates:OnAura(unit)
	if not self:IsShown() then
		return
	end
	if not Qulight["nameplate"].track_auras or not self.NewPlate.icons or not self.NewPlate.unit then return end
	local i = 1
	for index = 1, 40 do
		if i > Qulight["nameplate"].width / Qulight["nameplate"].auras_size then return end
		local match
		local name, _, _, _, _, duration, _, caster, _, _ = UnitAura(unit, index, "HARMFUL")

		if DebuffWhiteList[name] and caster == "player" then match = true end

		if duration and match == true then
			if not self.NewPlate.icons[i] then self.NewPlate.icons[i] = Plates:CreateAuraIcon(self.NewPlate) end
			local icon = self.NewPlate.icons[i]
			if i == 1 then icon:SetPoint("RIGHT", self.NewPlate.icons, "RIGHT") end
			if i ~= 1 and i <= Qulight["nameplate"].width / Qulight["nameplate"].auras_size then icon:SetPoint("RIGHT", self.NewPlate.icons[i-1], "LEFT", -2, 0) end
			i = i + 1
			UpdateAuraIcon(icon, unit, index, "HARMFUL")
		end
	end
	for index = i, #self.NewPlate.icons do self.NewPlate.icons[index]:Hide() end
end

-- Color Nameplate
function Plates:GetColor()
	local Red, Green, Blue = self.ArtContainer.HealthBar:GetStatusBarColor()
	local texcoord = {0, 0, 0, 0}
	self.isClass = false

	for class, _ in pairs(RAID_CLASS_COLORS) do
		Red, Green, Blue = floor(Red * 100 + 0.5) / 100, floor(Green * 100 + 0.5) / 100, floor(Blue * 100 + 0.5) / 100
		local AltBlue = Blue

		if class == "MONK" then
			AltBlue = AltBlue - 0.01
		end

		if RAID_CLASS_COLORS[class].r == Red and RAID_CLASS_COLORS[class].g == Green and RAID_CLASS_COLORS[class].b == AltBlue then
			self.isClass = true
			self.isFriendly = false
			if Qulight["nameplate"].class_icons == true then
				texcoord = CLASS_BUTTONS[class]
				self.NewPlate.class.Glow:Show()
				self.NewPlate.class:SetTexCoord(texcoord[1], texcoord[2], texcoord[3], texcoord[4])
			end
			Red, Green, Blue = unpack(oUF_colors.class[class])
			return Red, Green, Blue
		end
	end

	self.isTapped = false

	if (Red + Blue + Blue) == 1.59 then			-- Tapped
		Red, Green, Blue = 0.6, 0.6, 0.6
		self.isFriendly = false
		self.isTapped = true
	elseif Green + Blue == 0 then				-- Hostile
		Red, Green, Blue = unpack(oUF_colors.reaction[1])
		self.isFriendly = false
	elseif Red + Blue == 0 then					-- Friendly NPC
		Red, Green, Blue = unpack(oUF_colors.power["MANA"])
		self.isFriendly = true
	elseif Red + Green > 1.95 then				-- Neutral NPC
		Red, Green, Blue = unpack(oUF_colors.reaction[4])
		self.isFriendly = false
	elseif Red + Green == 0 then				-- Friendly Player
		Red, Green, Blue = unpack(oUF_colors.reaction[5])
		self.isFriendly = true
	else
		self.isFriendly = false
	end

	if Qulight["nameplate"].class_icons == true then
		if self.isClass == true then
			self.NewPlate.class.Glow:Show()
		else
			self.NewPlate.class.Glow:Hide()
		end
		self.NewPlate.class:SetTexCoord(texcoord[1], texcoord[2], texcoord[3], texcoord[4])
	end

	return Red, Green, Blue
end

-- Color the castbar depending on if we can interrupt or not
function Plates:UpdateCastBar()
	local Red, Blue, Green = self.ArtContainer.CastBar:GetStatusBarColor()
	local Minimum, Maximum = self.ArtContainer.CastBar:GetMinMaxValues()
	local Current = self.ArtContainer.CastBar:GetValue()
	local Shield = self.ArtContainer.CastBarFrameShield

	if Shield:IsShown() then
		self.NewPlate.CastBar:SetStatusBarColor(0.78, 0.25, 0.25)
		self.NewPlate.CastBar.Background:SetColorTexture(0.78, 0.25, 0.25, 0.2)
	else
		self.NewPlate.CastBar:SetStatusBarColor(Red, Blue, Green)
		self.NewPlate.CastBar.Background:SetColorTexture(0.75, 0.75, 0.25, 0.2)
	end

	self.NewPlate.CastBar:SetMinMaxValues(Minimum, Maximum)
	self.NewPlate.CastBar:SetValue(Current)

	local last = self.NewPlate.CastBar.last and self.NewPlate.CastBar.last or 0
	local finish = (Current > last) and (Maximum - Current) or Current

	self.NewPlate.CastBar.Time:SetFormattedText("%.1f ", finish)
end

function Plates:CastOnShow()
	self.NewPlate.CastBar.Icon:SetTexture(self.ArtContainer.CastBarSpellIcon:GetTexture())
	if Qulight["nameplate"].show_castbar_name == true then
		self.NewPlate.CastBar.Name:SetText(self.ArtContainer.CastBarText:GetText())
	end
	self.NewPlate.CastBar:Show()
end

function Plates:CastOnHide()
	self.NewPlate.CastBar:Hide()
end

function Plates:OnShow()
	self.NewPlate:Show()
	Plates.UpdateHealth(self)

	local object = {
		self.ArtContainer.HealthBar,
		self.ArtContainer.Border,
		self.ArtContainer.Highlight,
		self.ArtContainer.LevelText,
		self.ArtContainer.EliteIcon,
		self.ArtContainer.AggroWarningTexture,
		self.ArtContainer.HighLevelIcon,
		self.ArtContainer.CastBar,
		self.ArtContainer.CastBarBorder,
		self.ArtContainer.CastBarFrameShield,
		self.ArtContainer.CastBarText,
		self.ArtContainer.CastBarTextBG,
		self.NameContainer.NameText
	}

	for _, object in pairs(object) do
		objectType = object:GetObjectType()
		if objectType == "Texture" then
			object:SetTexture("")
		elseif objectType == "FontString" then
			object:SetWidth(0.001)
		elseif objectType == "StatusBar" then
			object:SetStatusBarTexture("")
		end
		if object ~= self.ArtContainer.HighLevelIcon and object ~= self.ArtContainer.EliteIcon then
			object:Hide()
		end
	end

	local Name = self.NameContainer.NameText:GetText() or "Unknown"
	local Level = self.ArtContainer.LevelText:GetText() or ""
	local Boss, Elite = self.ArtContainer.HighLevelIcon, self.ArtContainer.EliteIcon

	self.NewPlate.level:SetTextColor(self.ArtContainer.LevelText:GetTextColor())
	if Boss:IsShown() then
		Level = "??"
		self.NewPlate.level:SetTextColor(0.8, 0.05, 0)
	elseif Elite:IsShown() then
		Level = Level.."+"
	end

	if Qulight["nameplate"].name_abbrev == true and Qulight["nameplate"].track_auras ~= true then
		self.NewPlate.Name:SetText(Abbrev(Name))
	else
		self.NewPlate.Name:SetText(Name)
	end

	if tonumber(Level) == UnitLevel("player") and not Elite:IsShown() then
		self.NewPlate.level:SetText("")
	else
		self.NewPlate.level:SetText(Level)
	end

	if Qulight["nameplate"].class_icons == true and self.isClass == true then
		self.NewPlate.level:SetPoint("RIGHT", self.NewPlate.Name, "LEFT", -2, 0)
	else
		self.NewPlate.level:SetPoint("RIGHT", self.NewPlate.Health, "LEFT", -2, 0)
	end

	if Qulight["nameplate"].healer_icon == true then
		local name = self.NewPlate.Name:GetText()
		name = gsub(name, "%s*"..((_G.FOREIGN_SERVER_LABEL:gsub("^%s", "")):gsub("[%*()]", "%%%1")).."$", "")
		name = gsub(name, "%s*"..((_G.INTERACTIVE_SERVER_LABEL:gsub("^%s", "")):gsub("[%*()]", "%%%1")).."$", "")
		if testing then
			self.NewPlate.HPHeal:Show()
		else
			if healList[name] then
				if exClass[healList[name]] then
					self.NewPlate.HPHeal:Hide()
				else
					self.NewPlate.HPHeal:Show()
				end
			else
				self.NewPlate.HPHeal:Hide()
			end
		end
	end
end

function Plates:OnHide()
	if self.NewPlate.icons then
		for _, icon in ipairs(self.NewPlate.icons) do
			icon:Hide()
		end
	end
end

function Plates:UpdateHealth()
	self.NewPlate.Health:SetMinMaxValues(self.ArtContainer.HealthBar:GetMinMaxValues())
	self.NewPlate.Health:SetValue(self.ArtContainer.HealthBar:GetValue() - 1) -- Blizzard bug fix
	self.NewPlate.Health:SetValue(self.ArtContainer.HealthBar:GetValue())
end

function Plates:UpdateHealthColor()
	if not self:IsShown() then
		return
	end

	local Red, Green, Blue = Plates.GetColor(self)

	self.NewPlate.Health:SetStatusBarColor(Red, Green, Blue)
	self.NewPlate.Health.Background:SetColorTexture(red, Green, Blue, 0.2)
	self.NewPlate.Name:SetTextColor(Red, Green, Blue)

	if self.isClass or self.isTapped then return end

	if Qulight["nameplate"].enhance_threat ~= true then
		if self.ArtContainer.AggroWarningTexture:IsShown() then
			local _, val = self.ArtContainer.AggroWarningTexture:GetVertexColor()
			if val > 0.7 then
				SetVirtualBorder(self.NewPlate.Health, transitionR, transitionG, transitionB)
			else
				SetVirtualBorder(self.NewPlate.Health, badR, badG, badB)
			end
		else
			SetVirtualBorder(self.NewPlate.Health, 0.05, 0.05, 0.05, 1)
		end
	else
		if not self.ArtContainer.AggroWarningTexture:IsShown() then
			if InCombatLockdown() and self.isFriendly ~= true then
				-- No Threat
				if T.Role == "Tank" then
					self.NewPlate.Health:SetStatusBarColor(badR, badG, badB)
					self.NewPlate.Health.Background:SetColorTexture(badR, badG, badB, 0.2)
				else
					self.NewPlate.Health:SetStatusBarColor(goodR, goodG, goodB)
					self.NewPlate.Health.Background:SetColorTexture(goodR, goodG, goodB, 0.2)
				end
			end
		else
			local r, g, b = self.ArtContainer.AggroWarningTexture:GetVertexColor()
			if g + b == 0 then
				-- Have Threat
				if T.Role == "Tank" then
					self.NewPlate.Health:SetStatusBarColor(goodR, goodG, goodB)
					self.NewPlate.Health.Background:SetColorTexture(goodR, goodG, goodB, 0.2)
				else
					self.NewPlate.Health:SetStatusBarColor(badR, badG, badB)
					self.NewPlate.Health.Background:SetColorTexture(badR, badG, badB, 0.2)
				end
			else
				-- Losing/Gaining Threat
				self.NewPlate.Health:SetStatusBarColor(transitionR, transitionG, transitionB)
				self.NewPlate.Health.Background:SetColorTexture(transitionR, transitionG, transitionB, 0.2)
			end
		end
	end
end

function Plates:UpdateHealthText()
	local _, MaxHP = self.ArtContainer.HealthBar:GetMinMaxValues()
	local CurrentHP = self.ArtContainer.HealthBar:GetValue()
	local Percent = (CurrentHP / MaxHP) * 100

	if Qulight["nameplate"].health_value == true then
		-- self.NewPlate.Health.Text:SetText(T.ShortValue(CurrentHP).." / "..T.ShortValue(MaxHP))
		self.NewPlate.Health.Text:SetFormattedText("%d%%", Percent)
	end

	if self.isClass == true or self.isFriendly == true then
		if Percent <= 50 and Percent >= 20 then
			SetVirtualBorder(self.NewPlate.Health, 1, 1, 0)
		elseif Percent < 20 then
			SetVirtualBorder(self.NewPlate.Health, 1, 0, 0)
		else
			SetVirtualBorder(self.NewPlate.Health, 0.05, 0.05, 0.05, 1)
		end
	elseif (self.isClass ~= true and self.isFriendly ~= true) and Qulight["nameplate"].enhance_threat == true then
		SetVirtualBorder(self.NewPlate.Health, 0.05, 0.05, 0.05, 1)
	end

	if GetUnitName("target") and self.NewPlate:GetAlpha() == 1 then
		self.NewPlate.Health:SetSize((Qulight["nameplate"].width + Qulight["nameplate"].ad_width) * noscalemult, (Qulight["nameplate"].height + Qulight["nameplate"].ad_height) * noscalemult)
		self.NewPlate.CastBar:SetPoint("BOTTOMLEFT", self.NewPlate.Health, "BOTTOMLEFT", 0, -8-((Qulight["nameplate"].height + Qulight["nameplate"].ad_height) * noscalemult))
		self.NewPlate.CastBar.Icon:SetSize(((Qulight["nameplate"].height + Qulight["nameplate"].ad_height) * 2 * T.noscalemult) + 8, ((Qulight["nameplate"].height + Qulight["nameplate"].ad_height) * 2 * noscalemult) + 8)
		self.NewPlate.Health:SetFrameLevel(1)
	else
		self.NewPlate.Health:SetSize(Qulight["nameplate"].width * noscalemult, Qulight["nameplate"].height * noscalemult)
		self.NewPlate.CastBar:SetPoint("BOTTOMLEFT", self.NewPlate.Health, "BOTTOMLEFT", 0, -8-(Qulight["nameplate"].height * noscalemult))
		self.NewPlate.CastBar.Icon:SetSize((Qulight["nameplate"].height * 2 * noscalemult) + 8, (Qulight["nameplate"].height * 2 * noscalemult) + 8)
		self.NewPlate.Health:SetFrameLevel(0)
	end

	if UnitExists("target") and self.NewPlate:GetAlpha() == 1 and GetUnitName("target") == self.NewPlate.Name:GetText() then
		self.NewPlate.guid = UnitGUID("target")
		self.NewPlate.unit = "target"
		Plates.OnAura(self, "target")
	elseif self.ArtContainer.Highlight:IsShown() and UnitExists("mouseover") and GetUnitName("mouseover") == self.NewPlate.Name:GetText() then
		self.NewPlate.guid = UnitGUID("mouseover")
		self.NewPlate.unit = "mouseover"
		Plates.OnAura(self, "mouseover")
	else
		self.NewPlate.unit = nil
	end
end

local function NamePlateSizerOnSizeChanged(self, x, y)
	local plate = self.__owner
	if plate:IsShown() then
		plate.NewPlate:Hide()
		if T.PlateBlacklist[plate.NameContainer.NameText:GetText()] then return end
		plate.NewPlate:SetPoint("CENTER", WorldFrame, "BOTTOMLEFT", x, y)
		plate.NewPlate:Show()
	end
end

local function NamePlateCreateSizer(self)
	local sizer = CreateFrame("Frame", nil, self.NewPlate)
	sizer.__owner = self
	sizer:SetPoint("BOTTOMLEFT", WorldFrame)
	sizer:SetPoint("TOPRIGHT", self, "CENTER")
	sizer:SetScript("OnSizeChanged", NamePlateSizerOnSizeChanged)
end

function Plates:Skin(obj)
	local Plate = obj

	local HealthBar = Plate.ArtContainer.HealthBar
	local Border = Plate.ArtContainer.Border
	local Highlight = Plate.ArtContainer.Highlight
	local LevelText = Plate.ArtContainer.LevelText
	local RaidTargetIcon = Plate.ArtContainer.RaidTargetIcon
	local Elite = Plate.ArtContainer.EliteIcon
	local Threat = Plate.ArtContainer.AggroWarningTexture
	local Boss = Plate.ArtContainer.HighLevelIcon
	local CastBar = Plate.ArtContainer.CastBar
	local CastBarBorder = Plate.ArtContainer.CastBarBorder
	local CastBarSpellIcon = Plate.ArtContainer.CastBarSpellIcon
	local CastBarFrameShield = Plate.ArtContainer.CastBarFrameShield
	local CastBarText = Plate.ArtContainer.CastBarText
	local CastBarTextBG = Plate.ArtContainer.CastBarTextBG

	local Name = Plate.NameContainer.NameText

	self.Container[Plate] = CreateFrame("Frame", nil, self)

	local NewPlate = self.Container[Plate]
	NewPlate:SetSize(Qulight["nameplate"].width * noscalemult, (Qulight["nameplate"].height * noscalemult) * 2 + 8)
	NewPlate:SetFrameStrata("BACKGROUND")
	NewPlate:SetFrameLevel(0)

	NewPlate.Health = CreateFrame("StatusBar", nil, NewPlate)
	NewPlate.Health:SetFrameStrata("BACKGROUND")
	NewPlate.Health:SetFrameLevel(1)
	NewPlate.Health:SetSize(Qulight["nameplate"].width * noscalemult, Qulight["nameplate"].height * noscalemult)
	NewPlate.Health:SetStatusBarTexture(SetHorizTile(true))
	NewPlate.Health:SetPoint("BOTTOM", 0, 0)
	CreateVirtualFrame(NewPlate.Health)

	NewPlate.Health.Background = NewPlate.Health:CreateTexture(nil, "BORDER")
	NewPlate.Health.Background:SetTexture(0.05, 0.05, 0.05, 1)
	NewPlate.Health.Background:SetAllPoints()

	if Qulight["nameplate"].health_value == true then
		NewPlate.Health.Text = NewPlate.Health:CreateFontString(nil, "OVERLAY")
		NewPlate.Health.Text:SetFont(Qulight["media"].font, 8, "THINOUTLINE")
		NewPlate.Health.Text:SetShadowOffset(1, -1)
		NewPlate.Health.Text:SetPoint( "RIGHT", NewPlate.Health, "RIGHT", 0, 0)
		NewPlate.Health.Text:SetTextColor(0.8, 0.05, 0)
	end

	NewPlate.Name = NewPlate.Health:CreateFontString(nil, "OVERLAY")
	NewPlate.Name:SetPoint("BOTTOMLEFT", NewPlate.Health, "TOPLEFT", -3, 4)
	NewPlate.Name:SetPoint("BOTTOMRIGHT", NewPlate.Health, "TOPRIGHT", 3, 4)
	NewPlate.Name:SetFont(Qulight["media"].font, 8, "THINOUTLINE")
	NewPlate.Name:SetShadowOffset(1, -1)

	NewPlate.level = NewPlate.Health:CreateFontString(nil, "OVERLAY")
	NewPlate.level:SetFont(Qulight["media"].font, 8, "THINOUTLINE")
	NewPlate.level:SetShadowOffset(1, -1)
	NewPlate.level:SetTextColor(0.8, 0.05, 0)
	NewPlate.level:SetPoint("RIGHT", NewPlate.Health, "LEFT", -2, 0)

	NewPlate.CastBar = CreateFrame("StatusBar", nil, NewPlate.Health)
	NewPlate.CastBar:SetFrameStrata("BACKGROUND")
	NewPlate.CastBar:SetFrameLevel(1)
	NewPlate.CastBar:SetStatusBarTexture(C.media.texture)
	NewPlate.CastBar:SetPoint("TOPRIGHT", NewPlate.Health, "BOTTOMRIGHT", 0, -8)
	NewPlate.CastBar:SetPoint("BOTTOMLEFT", NewPlate.Health, "BOTTOMLEFT", 0, -8-(Qulight["nameplate"].height * noscalemult))
	NewPlate.CastBar:Hide()
	CreateVirtualFrame(NewPlate.CastBar)

	NewPlate.CastBar.Background = NewPlate.CastBar:CreateTexture(nil, "BORDER")
	NewPlate.CastBar.Background:SetColorTexture(0.75, 0.75, 0.25, 0.2)
	NewPlate.CastBar.Background:SetAllPoints()

	NewPlate.hiddenFrame = CreateFrame("Frame", nil, NewPlate)
	NewPlate.hiddenFrame:Hide()
	CastBarSpellIcon:SetParent(NewPlate.hiddenFrame)
	NewPlate.CastBar.Icon = NewPlate.CastBar:CreateTexture(nil, "OVERLAY")
	NewPlate.CastBar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	NewPlate.CastBar.Icon:SetSize((Qulight["nameplate"].height * 2 * noscalemult) + 8, (Qulight["nameplate"].height * 2 * noscalemult) + 8)
	NewPlate.CastBar.Icon:SetPoint("TOPLEFT", NewPlate.Health, "TOPRIGHT", 8, 0)
	CreateVirtualFrame(NewPlate.CastBar, NewPlate.CastBar.Icon)

	NewPlate.CastBar.Time = NewPlate.CastBar:CreateFontString(nil, "ARTWORK")
	NewPlate.CastBar.Time:SetPoint("RIGHT", NewPlate.CastBar, "RIGHT", 3, 0)
	NewPlate.CastBar.Time:SetFont(Qulight["media"].font, 8, "THINOUTLINE")
	NewPlate.CastBar.Time:SetShadowOffset(1, -1)
	NewPlate.CastBar.Time:SetTextColor(0.8, 0.05, 0)

	if Qulight["nameplate"].show_castbar_name == true then
		NewPlate.CastBar.Name = NewPlate.CastBar:CreateFontString(nil, "OVERLAY")
		NewPlate.CastBar.Name:SetPoint("LEFT", NewPlate.CastBar, "LEFT", 3, 0)
		NewPlate.CastBar.Name:SetPoint("RIGHT", NewPlate.CastBar.Time, "LEFT", -1, 0)
		NewPlate.CastBar.Name:SetFont(Qulight["media"].font, 8, "THINOUTLINE")
		NewPlate.CastBar.Name:SetShadowOffset(1, -1)
		NewPlate.CastBar.Name:SetTextColor(0.8, 0.05, 0)
		NewPlate.CastBar.Name:SetJustifyH("LEFT")
	end

	RaidTargetIcon:ClearAllPoints()
	RaidTargetIcon:SetPoint("BOTTOM", NewPlate.Health, "TOP", 0, Qulight["nameplate"].track_auras == true and 38 or 16)
	RaidTargetIcon:SetSize((Qulight["nameplate"].height * 2 * noscalemult) + 8, (Qulight["nameplate"].height * 2 * noscalemult) + 8)

	if Qulight["nameplate"].track_auras == true then
		if not NewPlate.icons then
			NewPlate.icons = CreateFrame("Frame", nil, NewPlate.Health)
			NewPlate.icons:SetPoint("BOTTOMRIGHT", NewPlate.Health, "TOPRIGHT", 0, C.font.nameplates_font_size + 7)
			NewPlate.icons:SetWidth(20 + Qulight["nameplate"].width)
			NewPlate.icons:SetHeight(Qulight["nameplate"].auras_size)
			NewPlate.icons:SetFrameLevel(NewPlate.Health:GetFrameLevel() + 2)
		end
	end

	if Qulight["nameplate"].class_icons == true then
		NewPlate.class = NewPlate.Health:CreateTexture(nil, "OVERLAY")
		NewPlate.class:SetPoint("TOPRIGHT", NewPlate.Health, "TOPLEFT", -8, noscalemult * 2)
		NewPlate.class:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
		NewPlate.class:SetSize((Qulight["nameplate"].height * 2 * noscalemult) + 11, (Qulight["nameplate"].height * 2 * noscalemult) + 11)

		NewPlate.class.Glow = CreateFrame("Frame", nil, NewPlate.Health)
		NewPlate.class.Glow:SetTemplate("Transparent")
		NewPlate.class.Glow:SetScale(noscalemult)
		NewPlate.class.Glow:SetAllPoints(NewPlate.class)
		NewPlate.class.Glow:SetFrameLevel(NewPlate.Health:GetFrameLevel() -1 > 0 and NewPlate.Health:GetFrameLevel() -1 or 0)
		NewPlate.class.Glow:Hide()
	end

	if Qulight["nameplate"].healer_icon == true then
		NewPlate.HPHeal = NewPlate.Health:CreateFontString(nil, "OVERLAY")
		NewPlate.HPHeal:SetFont(C.font.nameplates_font, 32, C.font.nameplates_font_style)
		NewPlate.HPHeal:SetText("|cFFD53333+|r")
		if Qulight["nameplate"].track_auras == true then
			NewPlate.HPHeal:SetPoint("BOTTOM", NewPlate.Name, "TOP", 0, 13)
		else
			NewPlate.HPHeal:SetPoint("BOTTOM", NewPlate.Name, "TOP", 0, 0)
		end
	end

	Plate.NewPlate = NewPlate

	self.OnShow(Plate)
	NamePlateCreateSizer(obj)
	Plate:HookScript("OnShow", self.OnShow)
	Plate:HookScript("OnHide", self.OnHide)
	HealthBar:HookScript("OnValueChanged", function() self.UpdateHealth(Plate) end)
	CastBar:HookScript("OnShow", function() self.CastOnShow(Plate) end)
	CastBar:HookScript("OnHide", function() self.CastOnHide(Plate) end)
	CastBar:HookScript("OnValueChanged", function() self.UpdateCastBar(Plate) end)

	Plate.IsSkinned = true
end

--
function Plates:Search(...)
	local count = WorldFrame:GetNumChildren()
	if count ~= numChildren then
		numChildren = count
		for index = 1, select("#", WorldFrame:GetChildren()) do
			local frame = select(index, WorldFrame:GetChildren())
			local name = frame:GetName()

			if not frame.IsSkinned and (name and name:find("^NamePlate%d")) then
				Plates:Skin(frame)
			end
		end
	end
end

function Plates:Update()
	for Plate, NewPlate in pairs(self.Container) do
		if Plate:IsShown() then
			if Plate:GetAlpha() == 1 then
				NewPlate:SetAlpha(1)
			else
				NewPlate:SetAlpha(0.5)
			end

			self.UpdateHealthColor(Plate)
			self.UpdateHealthText(Plate)
		else
			NewPlate:Hide()
		end
	end
end

function Plates:OnUpdate(elapsed)
	self:Search()
	self:Update()
end

function Plates:Enable()

	self:SetAllPoints()
	self.Container = {}
	self:SetScript("OnUpdate", self.OnUpdate)
end

Plates:Enable()

function Plates:MatchGUID(destGUID, spellID)
	if not self.NewPlate.guid then return end

	if self.NewPlate.guid == destGUID then
		for _, icon in ipairs(self.NewPlate.icons) do
			if icon.spellID == spellID then
				icon:Hide()
			end
		end
	end
end

function NamePlates:COMBAT_LOG_EVENT_UNFILTERED(_, event, ...)
	if event == "SPELL_AURA_REMOVED" then
		local _, sourceGUID, _, _, _, destGUID, _, _, _, spellID = ...

		if sourceGUID == UnitGUID("player") or arg4 == UnitGUID("pet") then
			for Plate, NewPlate in pairs(Plates.Container) do
				if Plate:IsShown() then
					Plates.MatchGUID(Plate, destGUID, spellID)
				end
			end
		end
	end
end

-- Only show nameplates when in combat
if Qulight["nameplate"].comba == true then
	NamePlates:RegisterEvent("PLAYER_REGEN_ENABLED")
	NamePlates:RegisterEvent("PLAYER_REGEN_DISABLED")

	function NamePlates:PLAYER_REGEN_ENABLED()
		SetCVar("nameplateShowEnemies", 0)
	end

	function NamePlates:PLAYER_REGEN_DISABLED()
		SetCVar("nameplateShowEnemies", 1)
	end
end

NamePlates:RegisterEvent("PLAYER_ENTERING_WORLD")
function NamePlates:PLAYER_ENTERING_WORLD()
	if Qulight["nameplate"].comba == true then
		if InCombatLockdown() then
			SetCVar("nameplateShowEnemies", 1)
		else
			SetCVar("nameplateShowEnemies", 0)
		end
	end
	if Qulight["nameplate"].enhance_threat == true then
		SetCVar("threatWarning", 3)
	end
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("nameplateShowSelf", 0)
	SetCVar("NamePlateVerticalScale", 1)
	SetCVar("NamePlateHorizontalScale", 1)
end
