if not Qulight["misk"].Reminder == true then return end

ReminderBuffs = {
		DEATHKNIGHT = {
			[1] = {	-- Horn of Winter group
				["spells"] = {
					57330,	-- Horn of Winter
				},
				["negate_spells"] = {
					6673,	-- Battle Shout
					19506,	-- Trueshot Aura
				},
				["combat"] = true,
			},
			[2] = {	-- Blood Presence group
				["spells"] = {
					48263,	-- Blood Presence
				},
				["role"] = "Tank",
				["instance"] = true,
				["reversecheck"] = true,
			},
		},
		DRUID = {
			[1] = {	-- Mark of the Wild group
				["spells"] = {
					1126,	-- Mark of the Wild
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		MAGE = {
			[1] = {	-- Brilliance group
				["spells"] = {
					1459,	-- Arcane Brilliance
					61316,	-- Dalaran Brilliance
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		MONK = {
			[1] = {	-- Legacy of the Emperor group
				["spells"] = {
					115921,	-- Legacy of the Emperor
				},
				["negate_spells"] = {
					1126,	-- Mark of the Wild
					20217,	-- Blessing of Kings
					90363,	-- Embrace of the Shale Spider
					116781,	-- Legacy of the White Tiger
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
			[2] = {	-- Legacy of the White Tiger group
				["spells"] = {
					116781,	-- Legacy of the White Tiger
				},
				["negate_spells"] = {
					90363,	-- Embrace of the Shale Spider
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		PALADIN = {
			[1] = {	-- Righteous Fury group
				["spells"] = {
					25780,	-- Righteous Fury
				},
				["role"] = "Tank",
				["instance"] = true,
				["reversecheck"] = true,
				["negate_reversecheck"] = 1,	-- Holy paladins use RF sometimes
			},
			[2] = {	-- Blessing of Kings group
				["spells"] = {
					20217,	-- Blessing of Kings
				},
				["negate_spells"] = {
					1126,	-- Mark of the Wild
					115921,	-- Legacy of the Emperor
					116781,	-- Legacy of the White Tiger
					90363,	-- Embrace of the Shale Spider
				},
				["personal"] = {
					19740,	-- Blessing of Might
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
			[3] = {	-- Blessing of Might group
				["spells"] = {
					19740,	-- Blessing of Might
				},
				["negate_spells"] = {
					116956,	-- Grace of Air
					93435,	-- Roar of Courage
					128997,	-- Spirit Beast Blessing
					155522,	-- Power of the Grave
				},
				["personal"] = {
					20217,	-- Blessing of Kings
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		PRIEST = {
			[1] = {	-- Stamina group
				["spells"] = {
					21562,	-- Power Word: Fortitude
				},
				["negate_spells"] = {
					469,	-- Commanding Shout
					90364,	-- Qiraji Fortitude
					166928,	-- Blood Pact
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true
			},
		},
		ROGUE = {
			[1] = {	-- Lethal Poisons group
				["spells"] = {
					2823,	-- Deadly Poison
					8679,	-- Wound Poison
					157584,	-- Instant Poison
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
			[2] = {	-- Non-Lethal Poisons group
				["spells"] = {
					3408,	-- Crippling Poison
					108211,	-- Leeching Poison
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		SHAMAN = {
			[1] = {	-- Shields group
				["spells"] = {
					52127,	-- Water Shield
					324,	-- Lightning Shield
					974,	-- Earth Shield
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		WARLOCK = {
			[1] = {	-- Dark Intent group
				["spells"] = {
					109773,	-- Dark Intent
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		WARRIOR = {
			[1] = {	-- Commanding Shout group
				["spells"] = {
					469,	-- Commanding Shout
				},
				["negate_spells"] = {
					21562,	-- Power Word: Fortitude
					90364,	-- Qiraji Fortitude
					166928,	-- Blood Pact
				},
				["personal"] = {
					6673,	-- Battle Shout
				},
				["combat"] = true,
				["role"] = "Tank",
			},
			[2] = {	-- Battle Shout group
				["spells"] = {
					6673,	-- Battle Shout
				},
				["negate_spells"] = {
					19506,	-- Trueshot Aura
					57330,	-- Horn of Winter
				},
				["personal"] = {
					469,	-- Commanding Shout
				},
				["combat"] = true,
				["role"] = "Melee",
			},
		},
}

local tab = ReminderBuffs[myclass]
if not tab then return end

local function OnEvent(self, event, arg1, arg2)
	local group = tab[self.id]
	if not group.spells then return end
	if not GetActiveSpecGroup() then return end
	if event == "UNIT_AURA" and arg1 ~= "player" then return end
	if group.level and UnitLevel("player") < group.level then return end

	self.icon:SetTexture(nil)
	self:Hide()
	if group.negate_spells then
		for _, buff in pairs(group.negate_spells) do
			local name = GetSpellInfo(buff)
			if (name and UnitBuff("player", name)) then
				return
			end
		end
	end

	for _, buff in pairs(group.spells) do
		local name, _, icon = GetSpellInfo(buff)
		local usable, nomana = IsUsableSpell(name)
		if usable or nomana or group.level then
			self.icon:SetTexture(select(3, GetSpellInfo(buff)))
			self.hasTexture = true
			break
		end
	end

	if not self.icon:GetTexture() and event == "PLAYER_LOGIN" then
		self:UnregisterAllEvents()
		self:RegisterEvent("LEARNED_SPELL_IN_TAB")
		return
	elseif self.icon:GetTexture() and event == "LEARNED_SPELL_IN_TAB" then
		self:UnregisterAllEvents()
		self:RegisterEvent("UNIT_AURA")
		if group.combat and group.combat == true then
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
		end

		if (group.instance and group.instance == true) or (group.pvp and group.pvp == true) then
			self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		end

		if group.role and group.role == true then
			self:RegisterEvent("UNIT_INVENTORY_CHANGED")
		end
	end

	local role = group.role
	local spec = group.spec
	local combat = group.combat
	local personal = group.personal
	local instance = group.instance
	local pvp = group.pvp
	local reversecheck = group.reversecheck
	local negate_reversecheck = group.negate_reversecheck
	local canplaysound = false
	local rolepass = false
	local specpass = false
	local inInstance, instanceType = IsInInstance()

	if role ~= nil then
		if role == Role then
			rolepass = true
		else
			rolepass = false
		end
	else
		rolepass = true
	end

	if spec ~= nil then
		if spec == GetSpecialization() then
			specpass = true
		else
			specpass = false
		end
	else
		specpass = true
	end

	-- Prevent user error
	if reversecheck ~= nil and (role == nil and spec == nil) then reversecheck = nil end

	if ((combat and UnitAffectingCombat("player")) or (instance and difficultyID ~= 0) or (pvp and (instanceType == "arena" or instanceType == "pvp"))) and
	specpass == true and rolepass == true and not UnitInVehicle("player") then
		for _, buff in pairs(group.spells) do
			local name = GetSpellInfo(buff)
			local _, _, icon, _, _, _, _, unitCaster = UnitBuff("player", name)
			if personal and personal == true then
				if name and icon and unitCaster == "player" then	
					self:Hide()
					return
				end
			else
				if name and icon then
					self:Hide()
					return
				end
			end
		end
		self:Show()
		if canplaysound == true then PlaySoundFile(C.media.warning_sound, "Master") end
	elseif ((combat and UnitAffectingCombat("player")) or (instance and difficultyID ~= 0)) and
	reversecheck == true and not UnitInVehicle("player") then
		if negate_reversecheck and negate_reversecheck == GetSpecialization() then self:Hide() return end
		for _, buff in pairs(group.spells) do
			local name = GetSpellInfo(buff)
			local _, _, icon, _, _, _, _, unitCaster = UnitBuff("player", name)
			if name and icon and unitCaster == "player" then
				self:Show()
				if canplaysound == true then PlaySoundFile(C.media.warning_sound, "Master") end
				return
			end
		end
	else
		self:Hide()
	end
end

for i=1, #tab do
	local frame = CreateFrame("Frame", "ReminderFrame"..i, UIParent)
	CreatePanel(frame, 40, 40, "CENTER", UIParent, "CENTER", 0, 200)
	frame:SetFrameLevel(1)
	frame.id = i
	frame.icon = frame:CreateTexture(nil, "OVERLAY")
	frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	frame.icon:SetPoint("CENTER")
	frame.icon:SetWidth(36)
	frame.icon:SetHeight(36)
	frame:Hide()
	CreateStyle(frame, 2)
	frame:RegisterEvent("UNIT_AURA")
	frame:RegisterEvent("PLAYER_LOGIN")
	frame:RegisterEvent("UNIT_INVENTORY_CHANGED")
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame:RegisterEvent("PLAYER_REGEN_DISABLED")
	frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	frame:RegisterEvent("UNIT_ENTERING_VEHICLE")
	frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
	frame:RegisterEvent("UNIT_EXITING_VEHICLE")
	frame:RegisterEvent("UNIT_EXITED_VEHICLE")
	frame:SetScript("OnEvent", OnEvent)
	frame:SetScript("OnUpdate", function(self, elapsed)
		if not self.icon:GetTexture() then
			self:Hide()
		end
	end)
	frame:SetScript("OnShow", function(self)
		if not self.icon:GetTexture() then
			self:Hide()
		end	
	end)
end