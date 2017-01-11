	if not Qulight["misk"].BuffReminderRaidBuffs == true then return end
ReminderBuffs = {
	Flask = {
			188033,	-- Flask of the Seventh Demon (Agility)
			188034,	-- Flask of the Countless Armies (Strenght)
			188035,	-- Flask of Ten Thousand Scars (Stamina)
			188031,	-- Flask of the Whispered Pact (Intellect)
		},
		--BETA - Not any viable Battle/Guardian Elixir to replace Flask
		BattleElixir = {
			--105686,	-- Elixir of Perfection
			--105688,	-- Monk's Elixir
			--105685,	-- Elixir of Peace
			--105682,	-- Mad Hozen Elixir
			--105683,	-- Elixir of Weaponry
			--105684,	-- Elixir of the Rapids
		},
		GuardianElixir = {
			--105687,	-- Elixir of Mirrors
			--105681,	-- Mantid Elixir
		},
		Food = {
			104280,	-- Well Fed
		},
		Stat = {
			--BETA 1126,	-- Mark of the Wild
			--BETA 160206,	-- Lone Wolf: Power of the Primates
			--BETA 159988,	-- Bark of the Wild (Dog)
			--BETA 160017,	-- Blessing of Kongs (Gorilla)
			--BETA 90363,	-- Embrace of the Shale Spider
			--BETA 160077,	-- Strength of the Earth (Worm)
			--BETA 115921,	-- Legacy of the Emperor
			--BETA 116781,	-- Legacy of the White Tiger
			--BETA 20217,	-- Blessing of Kings
		},
		Stamina = {
			--BETA 21562,	-- Power Word: Fortitude
			--BETA 160199,	-- Lone Wolf: Fortitude of the Bear
			--BETA 50256,	-- Invigorating Roar (Bear)
			--BETA 90364,	-- Qiraji Fortitude (Silithid)
			--BETA 160003,	-- Savage Vigor (Rylak)
			--BETA 160014,	-- Sturdiness (Goat)
			--BETA 166928,	-- Blood Pact
			--BETA 469,	-- Commanding Shout
			--BETA 111922,	-- Runescroll of Fortitude III
		}
	}

	-- Caster buffs
	function ReminderCasterBuffs()
		Spell5Buff = {	-- Spell Power
			--BETA 1459,	-- Arcane Brilliance
			--BETA 61316,	-- Dalaran Brilliance
			--BETA 160205,	-- Lone Wolf: Wisdom of the Serpent
			--BETA 126309,	-- Still Water (Water Strider)
			--BETA 128433,	-- Serpent's Cunning (Serpent)
			--BETA 90364,	-- Qiraji Fortitude (Silithid)
			--BETA 109773,	-- Dark Intent
		}
	end

	-- Physical buffs
	function ReminderPhysicalBuffs()
		Spell5Buff = {	-- Attack Power
			--BETA 57330,	-- Horn of Winter
			--BETA 19506,	-- Trueshot Aura
			--BETA 6673,	-- Battle Shout
		}

	Spell6Buff = {	-- Haste
		--BETA 116956,	-- Grace of Air
		--BETA 55610,	-- Unholy Aura
		--BETA 160203,	-- Lone Wolf: Haste of the Hyena
		--BETA 128432,	-- Cackling Howl (Hyena)
		--BETA 135678,	-- Energizing Spores (Sporebat)
		--BETA 160003,	-- Savage Vigor (Rylak)
		--BETA 49868,	-- Mind Quickening
		--BETA 113742,	-- Swiftblade's Cunning
	}
end

local flaskbuffs = ReminderBuffs["Flask"]
local battleelixirbuffs = ReminderBuffs["BattleElixir"]
local guardianelixirbuffs = ReminderBuffs["GuardianElixir"]
local foodbuffs = ReminderBuffs["Food"]
local statbuffs = ReminderBuffs["Stat"]
local staminabuffs = ReminderBuffs["Stamina"]
local visible, flask, battleelixir, guardianelixir, food, stat, stamina, spell5, spell6

local function CheckElixir(unit)
	if battleelixirbuffs and battleelixirbuffs[1] then
		for i, battleelixirbuffs in pairs(battleelixirbuffs) do
			local spellname = select(1, GetSpellInfo(battleelixirbuffs))
			if UnitAura("player", spellname) then
				FlaskFrame.t:SetTexture(select(3, GetSpellInfo(battleelixirbuffs)))
				battleelixir = true
				break
			else
				battleelixir = false
			end
		end
	end

	if guardianelixirbuffs and guardianelixirbuffs[1] then
		for i, guardianelixirbuffs in pairs(guardianelixirbuffs) do
			local spellname = select(1, GetSpellInfo(guardianelixirbuffs))
			if UnitAura("player", spellname) then
				guardianelixir = true
				if not battleelixir then
					FlaskFrame.t:SetTexture(select(3, GetSpellInfo(guardianelixirbuffs)))
				end
				break
			else
				guardianelixir = false
			end
		end
	end

	if guardianelixir == true and battleelixir == true then
		FlaskFrame:SetAlpha(1)
		flask = true
		return
	else
		FlaskFrame:SetAlpha(0.2)
		flask = false
	end
end

local function OnAuraChange(self, event, arg1, unit)
	if event == "UNIT_AURA" and arg1 ~= "player" then return end

	if Role == "Caster" or Role == "Healer" then
		ReminderCasterBuffs()
	else
		ReminderPhysicalBuffs()
	end

	if flaskbuffs and flaskbuffs[1] then
		FlaskFrame.t:SetTexture(select(3, GetSpellInfo(flaskbuffs[1])))
		for i, flaskbuffs in pairs(flaskbuffs) do
			local spellname = select(1, GetSpellInfo(flaskbuffs))
			if UnitAura("player", spellname) then
				FlaskFrame.t:SetTexture(select(3, GetSpellInfo(flaskbuffs)))
				FlaskFrame:SetAlpha(1)
				flask = true
				break
			else
				CheckElixir()
			end
		end
	end

	if foodbuffs and foodbuffs[1] then
		FoodFrame.t:SetTexture(select(3, GetSpellInfo(foodbuffs[1])))
		for i, foodbuffs in pairs(foodbuffs) do
			local spellname = select(1, GetSpellInfo(foodbuffs))
			if UnitAura("player", spellname) then
				FoodFrame:SetAlpha(1)
				FoodFrame.t:SetTexture(select(3, GetSpellInfo(foodbuffs)))
				food = true
				break
			else
				FoodFrame:SetAlpha(0.2)
				food = false
			end
		end
	end

	for i, statbuffs in pairs(statbuffs) do
		local spellname = select(1, GetSpellInfo(statbuffs))
		if UnitAura("player", name) then
			StatFrame:SetAlpha(1)
			StatFrame.t:SetTexture(select(3, GetSpellInfo(statbuffs)))
			stat = true
			break
		else
			StatFrame:SetAlpha(0.2)
			StatFrame.t:SetTexture(select(3, GetSpellInfo(statbuffs)))
			stat = false
		end
	end

	for i, staminabuffs in pairs(staminabuffs) do
		local spellname = select(1, GetSpellInfo(staminabuffs))
		if UnitAura("player", name) then
			StaminaFrame:SetAlpha(1)
			StaminaFrame.t:SetTexture(select(3, GetSpellInfo(staminabuffs)))
			stamina = true
			break
		else
			StaminaFrame:SetAlpha(0.2)
			StaminaFrame.t:SetTexture(select(3, GetSpellInfo(staminabuffs)))
			stamina = false
		end
	end

	for i, Spell5Buff in pairs(Spell5Buff) do
		local spellname = select(1, GetSpellInfo(Spell5Buff))
		if UnitAura("player", name) then
			Spell5Frame:SetAlpha(1)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
			spell5 = true
			break
		else
			Spell5Frame:SetAlpha(0.2)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
			spell5 = false
		end
	end

	for i, Spell6Buff in pairs(Spell6Buff) do
		local spellname = select(1, GetSpellInfo(Spell6Buff))
		if UnitAura("player", name) then
			Spell6Frame:SetAlpha(1)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
			spell6 = true
			break
		else
			Spell6Frame:SetAlpha(0.2)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
			spell6 = false
		end
	end

	local inInstance, instanceType = IsInInstance()
	if not (inInstance and (instanceType == "raid")) then
		RaidBuffReminder:SetAlpha(0) ---
		visible = false
	elseif flask == true and food == true and stat == true and stamina == true and spell5 == true and spell6 == true then
		if not visible then
			RaidBuffReminder:SetAlpha(0)
			visible = false
		end
		if visible then
			UIFrameFadeOut(RaidBuffReminder, 0.5)
			visible = false
		end
	else
		if not visible then
			UIFrameFadeIn(RaidBuffReminder, 0.5)
			visible = true
		end
	end
end
bsize = 18
Anchorraidbuff_reminder = CreateFrame("Frame","Move_raidbuff_reminder",UIParent)
Anchorraidbuff_reminder:SetPoint("RIGHT", UIParent, "RIGHT", -1, 0)
CreateAnchor(Anchorraidbuff_reminder, "Move Raid Buff Reminder", bsize + 8, 136)

local raidbuff_reminder = CreateFrame("Frame", "RaidBuffReminder", UIParent)
CreatePanel(raidbuff_reminder, bsize + 8,135 , "TOPLEFT", Anchorraidbuff_reminder, "TOPLEFT", 0, 0)
CreateStyle(raidbuff_reminder, 2)
raidbuff_reminder:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_INVENTORY_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_AURA")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuff_reminder:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuff_reminder:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
raidbuff_reminder:RegisterEvent("CHARACTER_POINTS_CHANGED")
raidbuff_reminder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuff_reminder:SetScript("OnEvent", OnAuraChange)

local function CreateButton(name, relativeTo, firstbutton)
	local button = CreateFrame("Frame", name, RaidBuffReminder)
	if firstbutton == true then
-- for horizontal use RIGHT and LEFT, for vertical use TOP and BOTTOM
		CreatePanel(button, bsize + 1, bsize - 1, "TOP", relativeTo, "BOTTOM", 0, 20) 
	else
		CreatePanel(button, bsize + 1, bsize - 1, "BOTTOM", relativeTo, "TOP", 0, 5)
	end
	
	button:SetFrameLevel(RaidBuffReminder:GetFrameLevel() + 2)
	button.t = button:CreateTexture(name..".t", "OVERLAY")
	button.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	button.t:SetAllPoints(button)
	CreateStyle(button, 4)
end

do
	CreateButton("FlaskFrame", RaidBuffReminder, true)
	CreateButton("FoodFrame", FlaskFrame, false)
	CreateButton("StatFrame", FoodFrame, false)
	CreateButton("StaminaFrame", StatFrame, false)
	CreateButton("Spell5Frame", StaminaFrame, false)
	CreateButton("Spell6Frame", Spell5Frame, false)
end