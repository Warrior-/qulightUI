if not Qulight["misk"].filger == true then return end

Filger_Settings = {
	config_mode = false,
	max_test_icon = 5,
}

AnchorBUFF_ICON = CreateFrame("Frame","Move_BUFF_ICON",UIParent)
AnchorBUFF_ICON:SetPoint("RIGHT", UIParent, "CENTER", -213, -115)
CreateAnchor(AnchorBUFF_ICON, "Move BUFF_ICON", 37, 37)

AnchorT_BUFF_ICON = CreateFrame("Frame","Move_T_BUFF_ICON",UIParent)
AnchorT_BUFF_ICON:SetPoint("LEFT", UIParent, "CENTER", 213, -115)
CreateAnchor(AnchorT_BUFF_ICON, "Move T_BUFF_ICON", 37, 37)

AnchorP_PROC_ICON = CreateFrame("Frame","Move_P_PROC_ICON",UIParent)
AnchorP_PROC_ICON:SetPoint("RIGHT", UIParent, "CENTER", -211, -227)
CreateAnchor(AnchorP_PROC_ICON, "Move P_PROC_ICON", 37, 37)

AnchorT_DEBUFF_ICON = CreateFrame("Frame","Move_T_DEBUFF_ICON",UIParent)
AnchorT_DEBUFF_ICON:SetPoint("LEFT", UIParent, "CENTER", 211, -227)
CreateAnchor(AnchorT_DEBUFF_ICON, "Move T_DEBUFF_ICON", 37, 37)

AnchorT_SPECIAL_P_BUFF_ICON = CreateFrame("Frame","Move_SPECIAL_P_BUFF_ICON",UIParent)
AnchorT_SPECIAL_P_BUFF_ICON:SetPoint("RIGHT", UIParent, "CENTER", -213, -72)
CreateAnchor(AnchorT_SPECIAL_P_BUFF_ICON, "Move SPECIAL_P_BUFF_ICON", 37, 37)

Anchor_CD = CreateFrame("Frame","Move_CD",UIParent)
Anchor_CD:SetPoint("BOTTOM", UIParent, "BOTTOM", -172, 380)
CreateAnchor(Anchor_CD, "Move CD", 40, 40)

Anchor_PVEPVPCD = CreateFrame("Frame","Move_PVEPVPCD",UIParent)
Anchor_PVEPVPCD:SetPoint("LEFT", UIParent, "CENTER", 213, -72)
CreateAnchor(Anchor_PVEPVPCD, "Move PVEPVPCD", 25, 25)

Anchor_PVEDEBUFF = CreateFrame("Frame","Move_PVEDEBUFF",UIParent)
Anchor_PVEDEBUFF:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 720)
CreateAnchor(Anchor_PVEDEBUFF, "Move PVEDEBUFF", 37, 37)

Filger_Spells = {
["DEATHKNIGHT"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Bone Shield
			{spellID = 195181, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Blood
			{spellID = 55233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Icebound Fortitude
			{spellID = 48792, unitID = "player", caster = "player", filter = "BUFF"},
			-- Anti-Magic Shell
			{spellID = 48707, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dancing Rune Weapon
			{spellID = 81256, unitID = "player", caster = "player", filter = "BUFF"},
			-- Lichborne
			{spellID = 49039, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rune Tap
			{spellID = 194679, unitID = "player", caster = "player", filter = "BUFF"},
			-- Pillar of Frost
			{spellID = 51271, unitID = "player", caster = "player", filter = "BUFF"},
			-- Desecrated Ground
			{spellID = 115018, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unholy Blight
			{spellID = 115989, unitID = "player", caster = "player", filter = "BUFF"},
			-- Summon Gargoyle
			{spellID = 49206, filter = "ICD", trigger = "NONE", duration = 40},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Crimson Scourge
			{spellID = 81141, unitID = "player", caster = "player", filter = "BUFF"},
			-- Freezing Fog
			{spellID = 59052, unitID = "player", caster = "player", filter = "BUFF"},
			-- Killing Machine
			{spellID = 51124, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sudden Doom
			{spellID = 81340, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unholy Strength
			{spellID = 53365, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Transformation
			{spellID = 63560, unitID = "pet", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Strength
			{spellID = 60229, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Drunken Evasiveness (Bonus Armor, Use) [Brawler's Statue]
			{spellID = 127967, unitID = "player", caster = "player", filter = "BUFF"},
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Victory (Strength, Proc)
			{spellID = 190025, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Tanking
			-- Living Carapace (Damage Reduction, Use) [Animated Exoskeleton]
			{spellID = 225033, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Aura (Leech, Use) [Fang of Tichcondrius]
			{spellID = 225130, unitID = "player", caster = "player", filter = "BUFF"},
			-- Infernal Contract (Damage Reduction, Use) [Infernal Contract]
			{spellID = 225140, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sands of Time (DoT, Proc) [Royal Dagger Haft]
			{spellID = 225720, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowy Reflection (Damage Reduction, Proc) [Phantasmal Echo]
			{spellID = 222479, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nightmarish Ichor (Versatility, Proc) [Goblet of Nightmarish Ichor]
			{spellID = 222027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wild God's Fury (Health, Use) [Unbridled Fury]
			{spellID = 221695, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkening Soul (Damage Reduction, Proc) [Grotesque Statuette]
			{spellID = 222209, unitID = "player", caster = "player", filter = "BUFF"},
			-- Crystalline Body (Damage Reduction, Use) [Shard of Rokmora]
			{spellID = 214366, unitID = "player", caster = "player", filter = "BUFF"},
			-- Stance of the Mountain (Damage Reduction, Use) [Talisman of the Cragshaper]
			{spellID = 214423, unitID = "player", caster = "player", filter = "BUFF"},
			-- Warlord's Fortitude (Health and Mastery, Proc) [Parjesh's Medallion]
			{spellID = 214622, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nerubian Chitin (Armor, Proc) [Impenetrable Nerubian Husk]
			{spellID = 214494, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Strength]
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mark of the Heavy Hide (Armor)
			{spellID = 228399, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},


		},
	},
	["DEMONHUNTER"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Metamorphosis
			{spellID = 187827, unitID = "player", caster = "player", filter = "BUFF"},
			-- Chaos Blades
			{spellID = 211048, unitID = "player", caster = "player", filter = "BUFF"},
			-- Empower Wards
			{spellID = 218256, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkness
			{spellID = 196718, unitID = "player", caster = "player", filter = "BUFF"},
			-- Immolation Aura
			{spellID = 178470, unitID = "player", caster = "player", filter = "BUFF"},
			-- Demon Spikes
			{spellID = 203720, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Barrier (Talent)
			{spellID = 227225, unitID = "player", caster = "player", filter = "BUFF"},
			-- Netherwalk (Talent)
			{spellID = 196555, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nether Bond (Talent)
			{spellID = 207810, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Soul Fragments
			{spellID = 203981, unitID = "player", caster = "player", filter = "BUFF"},
			-- Painbringer (Vengeance Artifact)
			{spellID = 212988, unitID = "player", caster = "player", filter = "BUFF"},
			-- Momentum
			{spellID = 208628, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Agility
			{spellID = 60233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Drunken Evasiveness (Bonus Armor, Use) [Brawler's Statue]
			{spellID = 127967, unitID = "player", caster = "player", filter = "BUFF"},
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Conquest (Agility, Proc)
			{spellID = 190026, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Tanking
			-- Living Carapace (Damage Reduction, Use) [Animated Exoskeleton]
			{spellID = 225033, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Aura (Leech, Use) [Fang of Tichcondrius]
			{spellID = 225130, unitID = "player", caster = "player", filter = "BUFF"},
			-- Infernal Contract (Damage Reduction, Use) [Infernal Contract]
			{spellID = 225140, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sands of Time (DoT, Proc) [Royal Dagger Haft]
			{spellID = 225720, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowy Reflection (Damage Reduction, Proc) [Phantasmal Echo]
			{spellID = 222479, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nightmarish Ichor (Versatility, Proc) [Goblet of Nightmarish Ichor]
			{spellID = 222027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wild God's Fury (Health, Use) [Unbridled Fury]
			{spellID = 221695, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkening Soul (Damage Reduction, Proc) [Grotesque Statuette]
			{spellID = 222209, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Agility]
			-- Blood Frenzy (Haste, Proc) [Bloodthirsty Instinct]
			{spellID = 221796, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mark of the Heavy Hide (Armor)
			{spellID = 228399, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Sigil of Flame
			{spellID = 204598, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Sigil of Silence
			{spellID = 204490, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Sigil of Misery
			{spellID = 207685, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Sigil of Grasp
			{spellID = 204843, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Fiery Brand
			{spellID = 207744, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Frailty (Spirit Bomb Talent)
			{spellID = 224509, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Nemesis (Talent)
			{spellID = 206491, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Bloodletting
			{spellID = 207690, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD},

			-- Imprison
			{spellID = 217832, unitID = "focus", caster = "all", filter = "DEBUFF"},
		},
	},
	["DRUID"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Incarnation: Chosen of Elune
			{spellID = 102560, unitID = "player", caster = "player", filter = "BUFF"},
			-- Incarnation: King of the Jungle
			{spellID = 102543, unitID = "player", caster = "player", filter = "BUFF"},
			-- Incarnation: Son of Ursoc
			{spellID = 102558, unitID = "player", caster = "player", filter = "BUFF"},
			-- Incarnation: Tree of Life
			{spellID = 117679, unitID = "player", caster = "player", filter = "BUFF"},
			-- Survival Instincts
			{spellID = 61336, unitID = "player", caster = "player", filter = "BUFF"},
			-- Barkskin
			{spellID = 22812, unitID = "player", caster = "player", filter = "BUFF"},
			-- Savage Roar
			{spellID = 52610, unitID = "player", caster = "player", filter = "BUFF"},
			-- Berserk
			{spellID = 106951, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Tiger's Fury
			{spellID = 5217, unitID = "player", caster = "player", filter = "BUFF"},
			-- Celestial Alignment
			{spellID = 194223, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nature's Vigil
			{spellID = 124974, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rage of the Sleeper
			{spellID = 200851, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ironfur
			{spellID = 192081, unitID = "player", caster = "player", filter = "BUFF"},
			-- Mark of Ursol
			{spellID = 192083, unitID = "player", caster = "player", filter = "BUFF"},
			-- Pulverize
			{spellID = 158792, unitID = "player", caster = "player", filter = "BUFF"},
			-- Lunar Empowerment
			{spellID = 164547, unitID = "player", caster = "player", filter = "BUFF"},
			-- Solar Empowerment
			{spellID = 164545, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nature's Grasp
			{spellID = 170856, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dash
			{spellID = 1850, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cenarion Ward
			{spellID = 102351, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Bloodtalons
			{spellID = 145152, unitID = "player", caster = "player", filter = "BUFF"},
			-- Clearcasting
			{spellID = 16870, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul of the Forest
			{spellID = 114108, unitID = "player", caster = "player", filter = "BUFF"},
			-- Predatory Swiftness
			{spellID = 69369, unitID = "player", caster = "player", filter = "BUFF"},
			-- Guardian of Elune
			{spellID = 213680, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Agility
			{spellID = 60233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Intellect
			{spellID = 60234, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Drunken Evasiveness (Bonus Armor, Use) [Brawler's Statue]
			{spellID = 127967, unitID = "player", caster = "player", filter = "BUFF"},
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- Now is the time! (Spell Power, Proc) [Mithril Wristwatch]
			{spellID = 127923, unitID = "player", caster = "player", filter = "BUFF"},
			-- Essence of Life (Haste, Proc) [Thousand-Year Pickled Egg]
			{spellID = 127915, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Dominance (Intellect, Proc)
			{spellID = 190027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Conquest (Agility, Proc)
			{spellID = 190026, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Tanking
			-- Living Carapace (Damage Reduction, Use) [Animated Exoskeleton]
			{spellID = 225033, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Aura (Leech, Use) [Fang of Tichcondrius]
			{spellID = 225130, unitID = "player", caster = "player", filter = "BUFF"},
			-- Infernal Contract (Damage Reduction, Use) [Infernal Contract]
			{spellID = 225140, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sands of Time (DoT, Proc) [Royal Dagger Haft]
			{spellID = 225720, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowy Reflection (Damage Reduction, Proc) [Phantasmal Echo]
			{spellID = 222479, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nightmarish Ichor (Versatility, Proc) [Goblet of Nightmarish Ichor]
			{spellID = 222027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wild God's Fury (Health, Use) [Unbridled Fury]
			{spellID = 221695, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkening Soul (Damage Reduction, Proc) [Grotesque Statuette]
			{spellID = 222209, unitID = "player", caster = "player", filter = "BUFF"},
			-- Crystalline Body (Damage Reduction, Use) [Shard of Rokmora]
			{spellID = 214366, unitID = "player", caster = "player", filter = "BUFF"},
			-- Stance of the Mountain (Damage Reduction, Use) [Talisman of the Cragshaper]
			{spellID = 214423, unitID = "player", caster = "player", filter = "BUFF"},
			-- Warlord's Fortitude (Health and Mastery, Proc) [Parjesh's Medallion]
			{spellID = 214622, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nerubian Chitin (Armor, Proc) [Impenetrable Nerubian Husk]
			{spellID = 214494, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Agility]
			-- Blood Frenzy (Haste, Proc) [Bloodthirsty Instinct]
			{spellID = 221796, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Intellect]
			-- Accelerando (Haste, Proc) [Erratic Metronome]
			{spellID = 225719, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nefarious Pact (Cast speed, Proc) [Whispers in the Dark]
			{spellID = 225774, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},
			-- Focused Lightning (Mastery, Proc) [Stormsinger Fulmination Charge]
			{spellID = 215632, unitID = "player", caster = "player", filter = "BUFF"},
			-- Collapsing Shadow (Agility, Use) [Obelisk of the Void]
			{spellID = 215476, unitID = "player", caster = "player", filter = "BUFF"},
			-- Elune's Light (Agility, Use) [Moonlit Prism]
			{spellID = 215648, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Intensity (Crit, Proc) [Infernal Writ]
			{spellID = 215816, unitID = "player", caster = "player", filter = "BUFF"},
			-- Maddening Whispers (Damage, Proc) [Wriggling Sinew]
			{spellID = 222046, unitID = "player", caster = "player", filter = "BUFF"},
			-- Healing
			-- Constellations (Mastery, Haste, or Critical Strike, Proc) [Etraeus' Celestial Map]
			{spellID = 225136, unitID = "player", caster = "player", filter = "BUFF"},
			-- Heightened Senses (Haste and Intellect, Proc) [Heightened Senses]
			{spellID = 221752, unitID = "player", caster = "player", filter = "BUFF"},
			-- Phased Webbing (Mastery, Proc) [Thrumming Gossamer]
			{spellID = 215198, unitID = "player", caster = "player", filter = "BUFF"},
			-- Solemnity (Haste, Proc) [Flask of the Solemn Night]
			{spellID = 224347, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mark of the Heavy Hide (Armor)
			{spellID = 228399, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON}, 

			-- Moonfire
			{spellID = 164812, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Sunfire
			{spellID = 164815, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Stellar Flare
			{spellID = 202347, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Rake
			{spellID = 155722, unitID = "target", caster = "player", filter = "DEBUFF", absID = true},
			-- Rip
			{spellID = 1079, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Thrash
			{spellID = 77758, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Immobilized
			{spellID = 45334, unitID = "target", caster = "player", filter = "DEBUFF"},

			-- Trinket Effects
			-- Mark of Doom [Prophecy of Fear]
			{spellID = 184073, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD},

			-- Cyclone
			{spellID = 33786, unitID = "focus", caster = "all", filter = "DEBUFF"},
			-- Entangling Roots
			{spellID = 339, unitID = "focus", caster = "all", filter = "DEBUFF"},
		},
	},
	["HUNTER"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Aspect of the Turtle
			{spellID = 186265, unitID = "player", caster = "player", filter = "BUFF"},
			-- Bestial Wrath
			{spellID = 19574, unitID = "player", caster = "player", filter = "BUFF"},
			-- Beast Cleave
			{spellID = 118455, unitID = "pet", caster = "player", filter = "BUFF"},
			-- Trueshot
			{spellID = 193526, unitID = "player", caster = "player", filter = "BUFF"},
			-- Aspect of the Wild
			{spellID = 193530, unitID = "player", caster = "player", filter = "BUFF"},
			-- Aspect of the Eagle
			{spellID = 186289, unitID = "player", caster = "player", filter = "BUFF"},
			-- Aspect of the Cheetah
			{spellID = 186257, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dire Beast
			{spellID = 120694, unitID = "player", caster = "player", filter = "BUFF"},
			-- Camouflage
			{spellID = 199483, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Spirit Mend
			{spellID = 90361, unitID = "player", caster = "player", filter = "BUFF"},
			-- Posthaste
			{spellID = 118922, unitID = "player", caster = "player", filter = "BUFF"},
			-- Volley
			{spellID = 194386, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Steady Focus
			{spellID = 193533, unitID = "player", caster = "player", filter = "BUFF"},
			-- Lock and Load
			{spellID = 194594, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frenzy
			{spellID = 19615, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Mend Pet
			{spellID = 136, unitID = "pet", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Agility
			{spellID = 60233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Conquest (Agility, Proc)
			{spellID = 190026, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Agility]
			-- Blood Frenzy (Haste, Proc) [Bloodthirsty Instinct]
			{spellID = 221796, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Focused Lightning (Mastery, Proc) [Stormsinger Fulmination Charge]
			{spellID = 215632, unitID = "player", caster = "player", filter = "BUFF"},
			-- Collapsing Shadow (Agility, Use) [Obelisk of the Void]
			{spellID = 215476, unitID = "player", caster = "player", filter = "BUFF"},
			-- Elune's Light (Agility, Use) [Moonlit Prism]
			{spellID = 215648, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Black Arrow
			{spellID = 194599, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Serpent Sting
			{spellID = 87935, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Narrow Escape
			{spellID = 136634, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Entrapment
			{spellID = 135373, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Warp Time (Warp Stalker)
			{spellID = 35346, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Ankle Crack (Crocolisk)
			{spellID = 50433, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Frost Breath (Chimaera)
			{spellID = 54644, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Concussive Shot
			{spellID = 5116, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Ice Trap
			{spellID = 135299, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Poisoned Ammo
			{spellID = 162543, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Frozen Ammo
			{spellID = 162546, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- True Aim
			{spellID = 199803, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD},

			-- Wyvern Sting
			{spellID = 19386, unitID = "focus", caster = "player", filter = "DEBUFF"},
		},
	},
	["MAGE"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Ice Block
			{spellID = 45438, unitID = "player", caster = "player", filter = "BUFF"},
			-- Invisibility
			{spellID = 66, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Invisibility
			{spellID = 32612, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Greater Invisibility
			{spellID = 110960, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Icy Veins
			{spellID = 12472, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Power
			{spellID = 12042, unitID = "player", caster = "player", filter = "BUFF"},
			-- Combustion
			{spellID = 190319, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rune of Power
			{spellID = 116014, filter = "ICD", trigger = "NONE", duration = 10},
			-- Pyretic Incantation
			{spellID = 194329, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ice Barrier
			{spellID = 11426, unitID = "player", caster = "player", filter = "BUFF"},
			-- Heating Up
			{spellID = 48107, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ice Floes
			{spellID = 108839, unitID = "player", caster = "player", filter = "BUFF"},
			-- Evanesce
			{spellID = 157913, unitID = "player", caster = "player", filter = "BUFF"},
			-- Alter Time
			{spellID = 110909, unitID = "player", caster = "player", filter = "BUFF"},
			-- Temporal Shield
			--BETA {spellID = 115610, unitID = "player", caster = "player", filter = "BUFF"},
			-- Mirror Image
			{spellID = 55342, filter = "ICD", trigger = "NONE", duration = 40},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Fingers of Frost
			{spellID = 44544, unitID = "player", caster = "player", filter = "BUFF"},
			-- Brain Freeze
			{spellID = 190447, unitID = "player", caster = "player", filter = "BUFF"},
			-- Glacial Spike!
			{spellID = 199844, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Missiles!
			{spellID = 79683, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hot Streak!
			{spellID = 48108, unitID = "player", caster = "player", filter = "BUFF"},
			-- Chain Reaction (Ebonchill)
			{spellID = 195418, unitID = "player", caster = "player", filter = "BUFF"},
			-- Kael'thas's Ultimate Ability
			{spellID = 209455, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Intellect
			{spellID = 60234, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Now is the time! (Spell Power, Proc) [Mithril Wristwatch]
			{spellID = 127923, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Dominance (Intellect, Proc)
			{spellID = 190027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Intellect]
			-- Accelerando (Haste, Proc) [Erratic Metronome]
			{spellID = 225719, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nefarious Pact (Cast speed, Proc) [Whispers in the Dark]
			{spellID = 225774, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},
			-- Focused Lightning (Mastery, Proc) [Stormsinger Fulmination Charge]
			{spellID = 215632, unitID = "player", caster = "player", filter = "BUFF"},
			-- Collapsing Shadow (Agility, Use) [Obelisk of the Void]
			{spellID = 215476, unitID = "player", caster = "player", filter = "BUFF"},
			-- Elune's Light (Agility, Use) [Moonlit Prism]
			{spellID = 215648, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Intensity (Crit, Proc) [Infernal Writ]
			{spellID = 215816, unitID = "player", caster = "player", filter = "BUFF"},
			-- Maddening Whispers (Damage, Proc) [Wriggling Sinew]
			{spellID = 222046, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Arcane Charge
			{spellID = 36032, unitID = "player", caster = "player", filter = "DEBUFF"},
			-- Living Bomb
			{spellID = 44457, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Nether Tempest
			{spellID = 114923, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Frost Bomb
			{spellID = 112948, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Pyroblast
			{spellID = 11366, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Freeze (Pet)
			{spellID = 33395, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Water Jet (Pet)
			{spellID = 135029, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Frostbite
			{spellID = 198121, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Frost Nova
			{spellID = 122, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Cone of Cold
			{spellID = 120, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Flurry
			{spellID = 228354, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Ice Nova
			{spellID = 157997, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Slow
			{spellID = 31589, unitID = "target", caster = "player", filter = "DEBUFF"},

			-- Trinket Effects
			-- Mark of Doom [Prophecy of Fear]
			{spellID = 184073, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD},

			-- Polymorph
			{spellID = 118, unitID = "focus", caster = "all", filter = "DEBUFF"},
		},
	},
	["MONK"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 45,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Fortifying Brew
			{spellID = 120954, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ironskin Brew
			{spellID = 215479, unitID = "player", caster = "player", filter = "BUFF"},
			-- Touch of Karma
			{spellID = 125174, unitID = "player", caster = "player", filter = "BUFF"},
			-- Diffuse Magic
			{spellID = 122783, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dampen Harm
			{spellID = 122278, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nimble Brew
			{spellID = 213664, unitID = "player", caster = "player", filter = "BUFF"},
			-- Serenity
			{spellID = 152173, unitID = "player", caster = "player", filter = "BUFF"},
			-- Storm, Earth, and Fire
			{spellID = 137639, unitID = "player", caster = "player", filter = "BUFF"},
			-- Mana Tea
			{spellID = 197908, unitID = "player", caster = "player", filter = "BUFF"},
			-- The Mists of Sheilun
			{spellID = 199888, unitID = "player", caster = "player", filter = "BUFF"},
			-- Thunder Focus Tea
			{spellID = 116680, unitID = "player", caster = "player", filter = "BUFF"},
			-- Momentum
			{spellID = 119085, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Blackout Kick!
			{spellID = 116768, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Agility
			{spellID = 60233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Intellect
			{spellID = 60234, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Drunken Evasiveness (Bonus Armor, Use) [Brawler's Statue]
			{spellID = 127967, unitID = "player", caster = "player", filter = "BUFF"},
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- Essence of Life (Haste, Proc) [Thousand-Year Pickled Egg]
			{spellID = 127915, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Conquest (Agility, Proc)
			{spellID = 190026, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Dominance (Intellect, Proc)
			{spellID = 190027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Tanking
			-- Living Carapace (Damage Reduction, Use) [Animated Exoskeleton]
			{spellID = 225033, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Aura (Leech, Use) [Fang of Tichcondrius]
			{spellID = 225130, unitID = "player", caster = "player", filter = "BUFF"},
			-- Infernal Contract (Damage Reduction, Use) [Infernal Contract]
			{spellID = 225140, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sands of Time (DoT, Proc) [Royal Dagger Haft]
			{spellID = 225720, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowy Reflection (Damage Reduction, Proc) [Phantasmal Echo]
			{spellID = 222479, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nightmarish Ichor (Versatility, Proc) [Goblet of Nightmarish Ichor]
			{spellID = 222027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wild God's Fury (Health, Use) [Unbridled Fury]
			{spellID = 221695, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkening Soul (Damage Reduction, Proc) [Grotesque Statuette]
			{spellID = 222209, unitID = "player", caster = "player", filter = "BUFF"},
			-- Crystalline Body (Damage Reduction, Use) [Shard of Rokmora]
			{spellID = 214366, unitID = "player", caster = "player", filter = "BUFF"},
			-- Stance of the Mountain (Damage Reduction, Use) [Talisman of the Cragshaper]
			{spellID = 214423, unitID = "player", caster = "player", filter = "BUFF"},
			-- Warlord's Fortitude (Health and Mastery, Proc) [Parjesh's Medallion]
			{spellID = 214622, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nerubian Chitin (Armor, Proc) [Impenetrable Nerubian Husk]
			{spellID = 214494, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Agility]
			-- Blood Frenzy (Haste, Proc) [Bloodthirsty Instinct]
			{spellID = 221796, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},
			-- Healing
			-- Constellations (Mastery, Haste, or Critical Strike, Proc) [Etraeus' Celestial Map]
			{spellID = 225136, unitID = "player", caster = "player", filter = "BUFF"},
			-- Heightened Senses (Haste and Intellect, Proc) [Heightened Senses]
			{spellID = 221752, unitID = "player", caster = "player", filter = "BUFF"},
			-- Phased Webbing (Mastery, Proc) [Thrumming Gossamer]
			{spellID = 215198, unitID = "player", caster = "player", filter = "BUFF"},
			-- Solemnity (Haste, Proc) [Flask of the Solemn Night]
			{spellID = 224347, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mark of the Heavy Hide (Armor)
			{spellID = 228399, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Heavy Stagger
			{spellID = 124273, unitID = "player", caster = "player", filter = "DEBUFF"},
			-- Keg Smash
			{spellID = 121253, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Breath of Fire
			{spellID = 123725, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
	},
	["PALADIN"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Divine Shield
			{spellID = 642, unitID = "player", caster = "player", filter = "BUFF"},
			-- Guardian of Ancient Kings
			{spellID = 86659, unitID = "player", caster = "player", filter = "BUFF"},
			-- Holy Avenger
			{spellID = 105809, unitID = "player", caster = "player", filter = "BUFF"},
			-- Avenging Wrath
			{spellID = 31884, unitID = "player", caster = "player", filter = "BUFF"},
			-- Seraphim
			{spellID = 152262, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ardent Defender
			{spellID = 31850, unitID = "player", caster = "player", filter = "BUFF"},
			-- Divine Protection
			{spellID = 498, unitID = "player", caster = "player", filter = "BUFF"},
			-- Speed of Light
			{spellID = 85499, unitID = "player", caster = "player", filter = "BUFF"},
			-- Eternal Flame
			{spellID = 114163, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Infusion of Light
			{spellID = 54149, unitID = "player", caster = "player", filter = "BUFF"},
			-- Selfless Healer
			{spellID = 114250, unitID = "player", caster = "player", filter = "BUFF"},
			-- Divine Purpose
			{spellID = 223819, unitID = "player", caster = "player", filter = "BUFF"},
			-- Grand Crusader
			{spellID = 85416, unitID = "player", caster = "player", filter = "BUFF"},
			-- Final Verdict
			{spellID = 157048, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Strength
			{spellID = 60229, unitID = "player", caster = "player", filter = "BUFF"},
			-- Intellect
			{spellID = 60234, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Drunken Evasiveness (Bonus Armor, Use) [Brawler's Statue]
			{spellID = 127967, unitID = "player", caster = "player", filter = "BUFF"},
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- Essence of Life (Haste, Proc) [Thousand-Year Pickled Egg]
			{spellID = 127915, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Victory (Strength, Proc)
			{spellID = 190025, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Dominance (Intellect, Proc)
			{spellID = 190027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Tanking
			-- Living Carapace (Damage Reduction, Use) [Animated Exoskeleton]
			{spellID = 225033, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Aura (Leech, Use) [Fang of Tichcondrius]
			{spellID = 225130, unitID = "player", caster = "player", filter = "BUFF"},
			-- Infernal Contract (Damage Reduction, Use) [Infernal Contract]
			{spellID = 225140, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sands of Time (DoT, Proc) [Royal Dagger Haft]
			{spellID = 225720, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowy Reflection (Damage Reduction, Proc) [Phantasmal Echo]
			{spellID = 222479, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nightmarish Ichor (Versatility, Proc) [Goblet of Nightmarish Ichor]
			{spellID = 222027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wild God's Fury (Health, Use) [Unbridled Fury]
			{spellID = 221695, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkening Soul (Damage Reduction, Proc) [Grotesque Statuette]
			{spellID = 222209, unitID = "player", caster = "player", filter = "BUFF"},
			-- Crystalline Body (Damage Reduction, Use) [Shard of Rokmora]
			{spellID = 214366, unitID = "player", caster = "player", filter = "BUFF"},
			-- Stance of the Mountain (Damage Reduction, Use) [Talisman of the Cragshaper]
			{spellID = 214423, unitID = "player", caster = "player", filter = "BUFF"},
			-- Warlord's Fortitude (Health and Mastery, Proc) [Parjesh's Medallion]
			{spellID = 214622, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nerubian Chitin (Armor, Proc) [Impenetrable Nerubian Husk]
			{spellID = 214494, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Strength]
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},
			-- Healing
			-- Constellations (Mastery, Haste, or Critical Strike, Proc) [Etraeus' Celestial Map]
			{spellID = 225136, unitID = "player", caster = "player", filter = "BUFF"},
			-- Heightened Senses (Haste and Intellect, Proc) [Heightened Senses]
			{spellID = 221752, unitID = "player", caster = "player", filter = "BUFF"},
			-- Phased Webbing (Mastery, Proc) [Thrumming Gossamer]
			{spellID = 215198, unitID = "player", caster = "player", filter = "BUFF"},
			-- Solemnity (Haste, Proc) [Flask of the Solemn Night]
			{spellID = 224347, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mark of the Heavy Hide (Armor)
			{spellID = 228399, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Forbearance
			{spellID = 25771, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Trinket Effects
			-- Fel Burn [Empty Drinking Horn]
			{spellID = 184256, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
	},
	["PRIEST"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Dispersion
			{spellID = 47585, unitID = "player", caster = "player", filter = "BUFF"},
			-- Power Infusion
			{spellID = 10060, unitID = "player", caster = "player", filter = "BUFF"},
			-- Apotheosis
			{spellID = 200183, unitID = "player", caster = "player", filter = "BUFF"},
			-- Blessing of T'uure
			{spellID = 196644, unitID = "player", caster = "player", filter = "BUFF"},
			-- Spirit of Redemption
			{spellID = 20711, unitID = "player", caster = "all", filter = "BUFF"},
			-- Divinity
			{spellID = 197030, unitID = "player", caster = "player", filter = "BUFF"},
			-- Archangel
			{spellID = 197862, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Embrace
			{spellID = 15286, unitID = "player", caster = "player", filter = "BUFF"},
			-- Focused Will
			{spellID = 45242, unitID = "player", caster = "player", filter = "BUFF"},
			-- Spectral Guise
			{spellID = 112833, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fade
			{spellID = 586, unitID = "player", caster = "player", filter = "BUFF"},
			-- Spirit Shell
			{spellID = 109964, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Power Word: Shield
			{spellID = 17, unitID = "player", caster = "all", filter = "BUFF"},
			-- Renew
			{spellID = 139, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON}, 

			-- Buffs
			-- Shadowy Insight
			{spellID = 124430, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Light
			{spellID = 114255, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Darkness
			{spellID = 87160, unitID = "player", caster = "player", filter = "BUFF"},
			-- Twist of Fate
			{spellID = 123254, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Intellect
			{spellID = 60234, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Now is the time! (Spell Power, Proc) [Mithril Wristwatch]
			{spellID = 127923, unitID = "player", caster = "player", filter = "BUFF"},
			-- Essence of Life (Haste, Proc) [Thousand-Year Pickled Egg]
			{spellID = 127915, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Dominance (Intellect, Proc)
			{spellID = 190027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Intellect]
			-- Accelerando (Haste, Proc) [Erratic Metronome]
			{spellID = 225719, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nefarious Pact (Cast speed, Proc) [Whispers in the Dark]
			{spellID = 225774, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},
			-- Focused Lightning (Mastery, Proc) [Stormsinger Fulmination Charge]
			{spellID = 215632, unitID = "player", caster = "player", filter = "BUFF"},
			-- Collapsing Shadow (Agility, Use) [Obelisk of the Void]
			{spellID = 215476, unitID = "player", caster = "player", filter = "BUFF"},
			-- Elune's Light (Agility, Use) [Moonlit Prism]
			{spellID = 215648, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Intensity (Crit, Proc) [Infernal Writ]
			{spellID = 215816, unitID = "player", caster = "player", filter = "BUFF"},
			-- Maddening Whispers (Damage, Proc) [Wriggling Sinew]
			{spellID = 222046, unitID = "player", caster = "player", filter = "BUFF"},
			-- Healing
			-- Constellations (Mastery, Haste, or Critical Strike, Proc) [Etraeus' Celestial Map]
			{spellID = 225136, unitID = "player", caster = "player", filter = "BUFF"},
			-- Heightened Senses (Haste and Intellect, Proc) [Heightened Senses]
			{spellID = 221752, unitID = "player", caster = "player", filter = "BUFF"},
			-- Phased Webbing (Mastery, Proc) [Thrumming Gossamer]
			{spellID = 215198, unitID = "player", caster = "player", filter = "BUFF"},
			-- Solemnity (Haste, Proc) [Flask of the Solemn Night]
			{spellID = 224347, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Trinket Effects
			-- Mark of Doom [Prophecy of Fear]
			{spellID = 184073, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD},

			-- Shackle Undead
			{spellID = 9484, unitID = "focus", caster = "player", filter = "DEBUFF"},
			-- Psychic Scream
			{spellID = 8122, unitID = "focus", caster = "player", filter = "DEBUFF"},
		},
	},
	["ROGUE"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Slice and Dice
			{spellID = 5171, unitID = "player", caster = "player", filter = "BUFF"},
			-- Adrenaline Rush
			{spellID = 13750, unitID = "player", caster = "player", filter = "BUFF"},
			-- Evasion
			{spellID = 5277, unitID = "player", caster = "player", filter = "BUFF"},
			-- Envenom
			{spellID = 32645, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shadow Dance
			{spellID = 185313, unitID = "player", caster = "player", filter = "BUFF"},
			-- Symbols of Death
			{spellID = 212283, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shadow Blades
			{spellID = 121471, unitID = "player", caster = "player", filter = "BUFF"},
			-- Curse of the Dreadblades
			{spellID = 208245, unitID = "player", caster = "player", filter = "DEBUFF"},
			-- Alacrity
			{spellID = 193539, unitID = "player", caster = "player", filter = "BUFF"},
			-- Master of Subtlety
			{spellID = 31665, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cloak of Shadows
			{spellID = 31224, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vanish
			{spellID = 1856, unitID = "player", caster = "player", filter = "BUFF"},
			-- Combat Readiness
			{spellID = 74001, unitID = "player", caster = "player", filter = "BUFF"},
			-- Combat Insight
			{spellID = 74002, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shadow Reflection
			{spellID = 152151, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cheating Death
			{spellID = 45182, unitID = "player", caster = "player", filter = "BUFF"},
			-- Blade Flurry
			{spellID = 13877, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burst of Speed
			{spellID = 108212, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sprint
			{spellID = 2983, unitID = "player", caster = "player", filter = "BUFF"},
			-- Feint
			{spellID = 1966, unitID = "player", caster = "player", filter = "BUFF"},
			-- Subterfuge
			{spellID = 115192, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON}, 

			-- Buffs
			-- Jolly Roger
			{spellID = 199603, unitID = "player", caster = "player", filter = "BUFF"},
			-- Grand Melee
			{spellID = 193358, unitID = "player", caster = "player", filter = "BUFF"},
			-- True Bearing
			{spellID = 193359, unitID = "player", caster = "player", filter = "BUFF"},
			-- Buried Treasure
			{spellID = 199600, unitID = "player", caster = "player", filter = "BUFF"},
			-- Broadsides
			{spellID = 193356, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shark Infested Waters
			{spellID = 193357, unitID = "player", caster = "player", filter = "BUFF"},

			-- Item Sets
			-- Deathly Shadows (T18)
			{spellID = 188700, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Agility
			{spellID = 60233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Conquest (Agility, Proc)
			{spellID = 190026, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Agility]
			-- Blood Frenzy (Haste, Proc) [Bloodthirsty Instinct]
			{spellID = 221796, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON}, 

			-- Rupture
			{spellID = 1943, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Garrote
			{spellID = 703, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Gouge
			{spellID = 1776, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Hemorrhage
			{spellID = 16511, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Find Weakness
			{spellID = 91021, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Vendetta
			{spellID = 79140, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Nightblade
			{spellID = 195452, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Ghostly Strike
			{spellID = 196937, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Deadly Poison
			{spellID = 2818, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Crippling Poison
			{spellID = 3409, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Wound Poison
			{spellID = 8680, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD},

			-- Blind
			{spellID = 2094, unitID = "focus", caster = "player", filter = "DEBUFF"},
			-- Sap
			{spellID = 6770, unitID = "focus", caster = "player", filter = "DEBUFF"},
		},
	},
	["SHAMAN"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Elemental Mastery
			{spellID = 16166, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ascendance
			{spellID = 114049, unitID = "player", caster = "player", filter = "BUFF"},
			-- Spiritwalker's Grace
			{spellID = 79206, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unleash Life
			{spellID = 73685, unitID = "player", caster = "player", filter = "BUFF"},
			-- Stone Bulwark
			{spellID = 114893, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ancestral Guidance
			{spellID = 108281, unitID = "player", caster = "player", filter = "BUFF"},
			-- Astral Shift
			{spellID = 108271, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Lava Surge
			{spellID = 77762, unitID = "player", caster = "player", filter = "BUFF"},
			-- Elemental Blast
			{spellID = 118522, unitID = "player", caster = "player", filter = "BUFF"},
			-- Tidal Waves
			{spellID = 53390, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Agility
			{spellID = 60233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Intellect
			{spellID = 60234, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- Now is the time! (Spell Power, Proc) [Mithril Wristwatch]
			{spellID = 127923, unitID = "player", caster = "player", filter = "BUFF"},
			-- Essence of Life (Haste, Proc) [Thousand-Year Pickled Egg]
			{spellID = 127915, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Dominance (Intellect, Proc)
			{spellID = 190027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Conquest (Agility, Proc)
			{spellID = 190026, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Agility]
			-- Blood Frenzy (Haste, Proc) [Bloodthirsty Instinct]
			{spellID = 221796, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Intellect]
			-- Accelerando (Haste, Proc) [Erratic Metronome]
			{spellID = 225719, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nefarious Pact (Cast speed, Proc) [Whispers in the Dark]
			{spellID = 225774, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},
			-- Focused Lightning (Mastery, Proc) [Stormsinger Fulmination Charge]
			{spellID = 215632, unitID = "player", caster = "player", filter = "BUFF"},
			-- Collapsing Shadow (Agility, Use) [Obelisk of the Void]
			{spellID = 215476, unitID = "player", caster = "player", filter = "BUFF"},
			-- Elune's Light (Agility, Use) [Moonlit Prism]
			{spellID = 215648, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Intensity (Crit, Proc) [Infernal Writ]
			{spellID = 215816, unitID = "player", caster = "player", filter = "BUFF"},
			-- Maddening Whispers (Damage, Proc) [Wriggling Sinew]
			{spellID = 222046, unitID = "player", caster = "player", filter = "BUFF"},
			-- Healing
			-- Constellations (Mastery, Haste, or Critical Strike, Proc) [Etraeus' Celestial Map]
			{spellID = 225136, unitID = "player", caster = "player", filter = "BUFF"},
			-- Heightened Senses (Haste and Intellect, Proc) [Heightened Senses]
			{spellID = 221752, unitID = "player", caster = "player", filter = "BUFF"},
			-- Phased Webbing (Mastery, Proc) [Thrumming Gossamer]
			{spellID = 215198, unitID = "player", caster = "player", filter = "BUFF"},
			-- Solemnity (Haste, Proc) [Flask of the Solemn Night]
			{spellID = 224347, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Stormstrike
			{spellID = 17364, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Flame Shock
			{spellID = 188389, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Frost Shock
			{spellID = 196840, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Earthgrab
			{spellID = 64695, unitID = "target", caster = "player", filter = "DEBUFF"},

			-- Trinket Effects
			-- Mark of Doom [Prophecy of Fear]
			{spellID = 184073, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD},

			-- Hex
			{spellID = 51514, unitID = "focus", caster = "player", filter = "DEBUFF"},
		},
	},
	["WARLOCK"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Unending Resolve
			{spellID = 104773, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Harvest
			{spellID = 196098, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Swap
			{spellID = 86211, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Regeneration
			{spellID = 108359, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Rush
			{spellID = 111400, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sacrificial Pact
			{spellID = 108416, unitID = "player", caster = "player", filter = "BUFF"},
			-- Healthstone
			{spellID = 6262, unitID = "player", caster = "player", filter = "BUFF"},
			
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Buffs
			-- Backdraft
			{spellID = 117828, unitID = "player", caster = "player", filter = "BUFF"},
			-- Grimore of Synergy
			{spellID = 171982, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Intellect
			{spellID = 60234, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Now is the time! (Spell Power, Proc) [Mithril Wristwatch]
			{spellID = 127923, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Dominance (Intellect, Proc)
			{spellID = 190027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Intellect]
			-- Accelerando (Haste, Proc) [Erratic Metronome]
			{spellID = 225719, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nefarious Pact (Cast speed, Proc) [Whispers in the Dark]
			{spellID = 225774, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},
			-- Focused Lightning (Mastery, Proc) [Stormsinger Fulmination Charge]
			{spellID = 215632, unitID = "player", caster = "player", filter = "BUFF"},
			-- Collapsing Shadow (Agility, Use) [Obelisk of the Void]
			{spellID = 215476, unitID = "player", caster = "player", filter = "BUFF"},
			-- Elune's Light (Agility, Use) [Moonlit Prism]
			{spellID = 215648, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Intensity (Crit, Proc) [Infernal Writ]
			{spellID = 215816, unitID = "player", caster = "player", filter = "BUFF"},
			-- Maddening Whispers (Damage, Proc) [Wriggling Sinew]
			{spellID = 222046, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
			
			{spellID = 216708, unitID = "player", caster = "all", filter = "BUFF"},
			{spellID = 216695, unitID = "player", caster = "all", filter = "BUFF"},
			
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Self
			-- Enslave Demon
			{spellID = 1098, unitID = "target", caster = "player", filter = "DEBUFF"},

			-- Trinket Effects
			-- Mark of Doom [Prophecy of Fear]
			{spellID = 184073, unitID = "target", caster = "player", filter = "DEBUFF"},
			
			{spellID = 63106, unitID = "target", caster = "player", filter = "DEBUFF"},
			{spellID = 980, unitID = "target", caster = "player", filter = "DEBUFF"},
			{spellID = 146739, unitID = "target", caster = "player", filter = "DEBUFF"},
			{spellID = 233490, unitID = "target", caster = "player", filter = "DEBUFF"},
			{spellID = 27243, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = 25,
			BarWidth = 189,
			Position = {"LEFT", Anchor_PVEPVPCD}, 

			-- Banish
			{spellID = 710, unitID = "focus", caster = "player", filter = "DEBUFF"},
			-- Fear
			{spellID = 118699, unitID = "focus", caster = "player", filter = "DEBUFF"},
		
			
			
		},
	},
	["WARRIOR"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorBUFF_ICON},

			-- Shield Wall
			{spellID = 871, unitID = "player", caster = "player", filter = "BUFF"},
			-- Last Stand
			{spellID = 12975, unitID = "player", caster = "player", filter = "BUFF"},
			-- Enraged Regeneration
			{spellID = 184364, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shield Block
			{spellID = 2565, unitID = "player", caster = "player", filter = "BUFF"},
			-- Spell Reflection
			{spellID = 23920, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ravager
			{spellID = 152277, unitID = "player", caster = "player", filter = "BUFF", spec = 3},
			-- Die by the Sword
			{spellID = 118038, unitID = "player", caster = "player", filter = "BUFF"},
			-- Berserker Rage
			{spellID = 18499, unitID = "player", caster = "player", filter = "BUFF"},
			-- Avatar
			{spellID = 107574, unitID = "player", caster = "player", filter = "BUFF"},
			-- Bloodbath
			{spellID = 12292, unitID = "player", caster = "player", filter = "BUFF"},
			-- Recklesness
			{spellID = 1719, unitID = "player", caster = "player", filter = "BUFF"},
			-- Victorious
			{spellID = 32216, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorP_PROC_ICON},

			-- Sudden Death
			{spellID = 52437, unitID = "player", caster = "player", filter = "BUFF"},
			-- Raging Blow!
			{spellID = 131116, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ultimatum
			{spellID = 122510, unitID = "player", caster = "player", filter = "BUFF"},
			-- Meat Cleaver
			{spellID = 85739, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unyielding Strikes
			{spellID = 169686, unitID = "player", caster = "player", filter = "BUFF"},
			-- Enrage
			{spellID = 184362, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- Alchemy Stones
			-- Strength
			{spellID = 60229, unitID = "player", caster = "player", filter = "BUFF"},
			-- Hallow's End
			-- Drunken Evasiveness (Bonus Armor, Use) [Brawler's Statue]
			{spellID = 127967, unitID = "player", caster = "player", filter = "BUFF"},
			-- Reflection of Torment (Attack Power, Proc) [Coren's Cold Chromium]
			{spellID = 127928, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets
			-- Savage Fortitude (Health, Use) [Battlemaster]
			{spellID = 181706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Victory (Strength, Proc)
			{spellID = 190025, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rapid Adaptation (Versatility, Use)
			{spellID = 170397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Tanking
			-- Living Carapace (Damage Reduction, Use) [Animated Exoskeleton]
			{spellID = 225033, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Aura (Leech, Use) [Fang of Tichcondrius]
			{spellID = 225130, unitID = "player", caster = "player", filter = "BUFF"},
			-- Infernal Contract (Damage Reduction, Use) [Infernal Contract]
			{spellID = 225140, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sands of Time (DoT, Proc) [Royal Dagger Haft]
			{spellID = 225720, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowy Reflection (Damage Reduction, Proc) [Phantasmal Echo]
			{spellID = 222479, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nightmarish Ichor (Versatility, Proc) [Goblet of Nightmarish Ichor]
			{spellID = 222027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wild God's Fury (Health, Use) [Unbridled Fury]
			{spellID = 221695, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkening Soul (Damage Reduction, Proc) [Grotesque Statuette]
			{spellID = 222209, unitID = "player", caster = "player", filter = "BUFF"},
			-- Crystalline Body (Damage Reduction, Use) [Shard of Rokmora]
			{spellID = 214366, unitID = "player", caster = "player", filter = "BUFF"},
			-- Stance of the Mountain (Damage Reduction, Use) [Talisman of the Cragshaper]
			{spellID = 214423, unitID = "player", caster = "player", filter = "BUFF"},
			-- Warlord's Fortitude (Health and Mastery, Proc) [Parjesh's Medallion]
			{spellID = 214622, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nerubian Chitin (Armor, Proc) [Impenetrable Nerubian Husk]
			{spellID = 214494, unitID = "player", caster = "player", filter = "BUFF"},
			-- Damage [Strength]
			-- Fiery Enchant (Crit, Proc) [Entwined Elemental Foci]
			{spellID = 225726, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frost Enchant (Mastery, Proc) [Entwined Elemental Foci]
			{spellID = 225729, unitID = "player", caster = "player", filter = "BUFF"},
			-- Arcane Enchant (Haste, Proc) [Entwined Elemental Foci]
			{spellID = 225730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Ancient's Blessing (Crit, Proc) [Nature's Call]
			{spellID = 222517, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Wisp's Blessing (Mastery, Proc) [Nature's Call]
			{spellID = 222518, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cleansed Sister's Blessing (Haste, Proc) [Nature's Call]
			{spellID = 222519, unitID = "player", caster = "player", filter = "BUFF"},
			-- Howl of Ingvar (Crit, Proc) [Memento of Angerboda]
			{spellID = 214802, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wail of Svala (Haste, Proc) [Memento of Angerboda]
			{spellID = 214803, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dirge of Angerboda (Mastery, Proc) [Memento of Angerboda]
			{spellID = 214807, unitID = "player", caster = "player", filter = "BUFF"},
			-- Down Draft (Haste, Proc) [Nightmare Egg Shell]
			{spellID = 214342, unitID = "player", caster = "player", filter = "BUFF"},
			-- Valarjar's Path (Primary stat, Use) [Horn of Valor]
			{spellID = 215956, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- Mark of the Claw (Crit and Haste)
			{spellID = 190909, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mark of the Heavy Hide (Armor)
			{spellID = 228399, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"LEFT", AnchorT_DEBUFF_ICON},

			-- Rend
			{spellID = 772, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Colossus Smash
			{spellID = 167105, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Hamstring
			{spellID = 1715, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Demoralizing Shout
			{spellID = 1160, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Trinket Effects
			-- Fel Burn [Empty Drinking Horn]
			{spellID = 184256, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
	},
	["ALL"] = {
		{
			Name = "SPECIAL_P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 37,
			Position = {"RIGHT", AnchorT_SPECIAL_P_BUFF_ICON}, 

			-- Ashran
			-- Ancient Artifact
			{spellID = 168506, unitID = "player", caster = "all", filter = "BUFF"},
			-- Boulder Shield
			{spellID = 169373, unitID = "player", caster = "all", filter = "BUFF"},
			-- Scroll of Speed
			{spellID = 171250, unitID = "player", caster = "all", filter = "BUFF"},
			-- Scroll of Protection
			{spellID = 171249, unitID = "player", caster = "all", filter = "BUFF"},
			-- Star Root Tuber
			{spellID = 161495, unitID = "player", caster = "all", filter = "BUFF"},
			-- Wand of Lightning Shield
			{spellID = 171725, unitID = "player", caster = "all", filter = "BUFF"},

			-- Potions: Legion
			-- Potion of Prolonged Power
			{spellID = 229206, unitID = "player", caster = "player", filter = "BUFF"},
			-- Potion of the Old War
			{spellID = 188028, unitID = "player", caster = "player", filter = "BUFF"},
			-- Potion of Deadly Grace
			{spellID = 188027, unitID = "player", caster = "player", filter = "BUFF"},
			-- Leytorrent Potion
			{spellID = 188030, unitID = "player", caster = "player", filter = "BUFF"},
			-- Skaggldrynk
			{spellID = 188023, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unbending Potion
			{spellID = 188029, unitID = "player", caster = "player", filter = "BUFF"},
			-- Potions: Miscellaneous
			-- Skystep Potion
			{spellID = 188024, unitID = "player", caster = "player", filter = "BUFF"},
			-- Invisibility Potion
			{spellID = 11392, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Darkwater Potion
			{spellID = 105707, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Draenic Invisibility Potion
			{spellID = 175833, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Draenic Swiftness Potion
			{spellID = 175790, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Speed [Swiftness Potion]
			{spellID = 2379, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Potions: Brawler's Guild
			-- Brawler's Draenic Agility Potion
			{spellID = 176107, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Brawler's Draenic Intellect Potion
			{spellID = 176108, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Brawler's Draenic Strength Potion
			{spellID = 176109, unitID = "player", caster = "player", filter = "BUFF", absID = true},

			-- Raid Amplifiers: General
			-- Ancient Hysteria
			{spellID = 90355, unitID = "player", caster = "all", filter = "BUFF"},
			-- Netherwinds
			{spellID = 160452, unitID = "player", caster = "all", filter = "BUFF"},
			-- Drums of Fury
			{spellID = 178207, unitID = "player", caster = "all", filter = "BUFF"},
			-- Drums of Rage
			{spellID = 146555, unitID = "player", caster = "all", filter = "BUFF"},
			-- Bloodlust
			{spellID = 2825, unitID = "player", caster = "all", filter = "BUFF"},
			-- Heroism
			{spellID = 32182, unitID = "player", caster = "all", filter = "BUFF"},
			-- Time Warp
			{spellID = 80353, unitID = "player", caster = "all", filter = "BUFF"},

			-- Legendary Rings
			-- Maalus, the Blood Drinker
			{spellID = 187806, unitID = "player", caster = "all", filter = "BUFF"},
			-- Nithramus, the All-Seer
			{spellID = 187616, unitID = "player", caster = "all", filter = "BUFF"},
			-- Sanctus, Sigil of the Unbroken
			{spellID = 187617, unitID = "player", caster = "all", filter = "BUFF"},
			-- Thorasus, the Stone Heart of Draenor
			{spellID = 187619, unitID = "player", caster = "all", filter = "BUFF"},

			-- Professions
			-- Goblin Glider [Goblin Glider Kit]
			{spellID = 126389, unitID = "player", caster = "all", filter = "BUFF", absID = true},
			-- Nitro Boosts
			{spellID = 54861, unitID = "player", caster = "player", filter = "BUFF"},
			-- Parachute
			{spellID = 55001, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shieldtronic Shield
			{spellID = 173260, unitID = "player", caster = "all", filter = "BUFF", absID = true},
			-- Stealth Field [Stealthman 54]
			{spellID = 156136, unitID = "player", caster = "all", filter = "BUFF", absID = true},

			-- Racial
			-- Berserking (Troll)
			{spellID = 26297, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Blood Fury (Orc)
			{spellID = 20572, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkflight (Worgen)
			{spellID = 68992, unitID = "player", caster = "player", filter = "BUFF"},
			-- Gift of the Naaru (Draenei)
			{spellID = 28880, unitID = "player", caster = "all", filter = "BUFF"},
			-- Shadowmeld (Night Elf)
			{spellID = 58984, unitID = "player", caster = "player", filter = "BUFF"},
			-- Stoneform (Dwarf)
			{spellID = 65116, unitID = "player", caster = "player", filter = "BUFF"},

			-- Zone Buffs
			-- Speed (Battlegrounds)
			{spellID = 23451, unitID = "player", caster = "all", filter = "BUFF", absID = true},
			-- Fel Sludge (Tanaan Jungle)
			{spellID = 188520, unitID = "player", caster = "all", filter = "DEBUFF", absID = true},
			-- Strange Feeling (Brawler's Guild)
			{spellID = 134851, unitID = "player", caster = "all", filter = "DEBUFF", absID = true},

			-- Damage Reduction
			-- Life Cocoon
			{spellID = 116849, unitID = "player", caster = "all", filter = "BUFF"},
			-- Guardian Spirit
			{spellID = 47788, unitID = "player", caster = "all", filter = "BUFF"},
			-- Pain Suppression
			{spellID = 33206, unitID = "player", caster = "all", filter = "BUFF"},
			-- Ironbark
			{spellID = 102342, unitID = "player", caster = "all", filter = "BUFF"},
			-- Aura Mastery
			{spellID = 31821, unitID = "player", caster = "all", filter = "BUFF"},
			-- Blessing of Protection
			{spellID = 1022, unitID = "player", caster = "all", filter = "BUFF"},
			-- Blessing of Sacrifice
			{spellID = 6940, unitID = "player", caster = "all", filter = "BUFF"},
			-- Blessing of Spellwarding
			{spellID = 204018, unitID = "player", caster = "all", filter = "BUFF"},
			-- Vigilance
			{spellID = 114030, unitID = "player", caster = "all", filter = "BUFF"},
			-- Rallying Cry
			{spellID = 97463, unitID = "player", caster = "all", filter = "BUFF"},

			-- Other
			-- Symbol of Hope
			{spellID = 64901, unitID = "player", caster = "all", filter = "BUFF"},
			-- Innervate
			{spellID = 29166, unitID = "player", caster = "all", filter = "BUFF"},
			-- Grounding Totem
			{spellID = 8178, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mass Spell Reflection
			{spellID = 114028, unitID = "player", caster = "all", filter = "BUFF"},
			-- Tiger's Lust
			{spellID = 116841, unitID = "player", caster = "all", filter = "BUFF"},
			-- Body and Soul
			{spellID = 65081, unitID = "player", caster = "all", filter = "BUFF"},
			-- Angelic Feather
			{spellID = 121557, unitID = "player", caster = "all", filter = "BUFF"},
			-- Stampeding Roar
			{spellID = 77764, unitID = "player", caster = "all", filter = "BUFF"},
			-- Blessing of Freedom
			{spellID = 1044, unitID = "player", caster = "all", filter = "BUFF"},
			-- Tricks of the Trade
			{spellID = 57934, unitID = "player", caster = "all", filter = "BUFF"},
			-- Slow Fall
			{spellID = 130, unitID = "player", caster = "all", filter = "BUFF"},
			-- Levitate
			{spellID = 1706, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "PVE/PVP_DEBUFF",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 60,
			Position = {"LEFT", Anchor_PVEDEBUFF},

			-- Crowd Controls
			-- Death Knight
			-- Asphyxiate
			{spellID = 108194, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Monstrous Blow (Mutated Ghoul)
			{spellID = 91797, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Gnaw (Ghoul)
			{spellID = 91800, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Druid
			-- Cyclone
			{spellID = 33786, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Incapacitating Roar
			{spellID = 99, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mighty Bash
			{spellID = 5211, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Maim
			{spellID = 22570, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Rake
			{spellID = 163505, unitID = "player", caster = "all", filter = "DEBUFF", absID = true},

			-- Hunter
			-- Freezing Trap
			{spellID = 3355, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Wyvern Sting
			{spellID = 19386, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Binding Shot
			{spellID = 117526, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Intimidation
			{spellID = 24394, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Mage
			-- Polymorph
			{spellID = 118, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Ring of Frost
			{spellID = 82691, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Dragon's Breath
			{spellID = 31661, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Monk
			-- Paralysis
			{spellID = 115078, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Leg Sweep
			{spellID = 119381, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Fists of Fury
			{spellID = 120086, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Paladin
			-- Repentance
			{spellID = 20066, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Hammer of Justice
			{spellID = 853, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Blinding Light
			{spellID = 105421, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Priest
			-- Dominate Mind
			{spellID = 605, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Psychic Horror
			{spellID = 64044, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Psychic Scream
			{spellID = 8122, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Sin and Punishment
			{spellID = 87204, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Rogue
			-- Sap
			{spellID = 6770, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Blind
			{spellID = 2094, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cheap Shot
			{spellID = 1833, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Kidney Shot
			{spellID = 408, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Between the Eyes
			{spellID = 199804, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Gouge
			{spellID = 1776, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Shaman
			-- Hex
			{spellID = 51514, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Static Charge
			{spellID = 118905, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Pulverize (Earth Elemental)
			{spellID = 118345, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Warlock
			-- Fear
			{spellID = 118699, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Seduction (Succubus)
			{spellID = 6358, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mesmerize (Shivarra)
			{spellID = 115268, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Howl of Terror
			{spellID = 5484, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Axe Toss (Felguard)
			{spellID = 89766, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowfury
			{spellID = 30283, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mortal Coil
			{spellID = 6789, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Meteor Strike (Abyssal)
			{spellID = 171156, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Warrior
			-- Intimidating Shout
			{spellID = 5246, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Storm Bolt
			{spellID = 132169, unitID = "player", caster = "all", filter = "DEBUFF", absID = true},
			-- Shockwave
			{spellID = 132168, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Racial
			-- Quaking Palm
			{spellID = 107079, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- War Stomp
			{spellID = 20549, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Silences
			-- Strangulate
			{spellID = 47476, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Solar Beam
			{spellID = 78675, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Avenger's Shield
			{spellID = 31935, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Silence
			{spellID = 15487, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Garrote
			{spellID = 1330, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 31117, unitID = "player", caster = "all", filter = "DEBUFF", absID = true},
			-- Arcane Torrent
			{spellID = 28730, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Roots
			-- Chains of Ice
			{spellID = 45524, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Entangling Roots
			{spellID = 339, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mass Entanglement
			{spellID = 102359, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Immobilized
			{spellID = 45334, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Entrapment
			{spellID = 135373, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Narrow Escape
			{spellID = 136634, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frostbite
			{spellID = 198121, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Nova
			{spellID = 122, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Ice Nova
			{spellID = 157997, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Freeze (Water Elemental)
			{spellID = 33395, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Disable
			{spellID = 116706, unitID = "player", caster = "all", filter = "DEBUFF", absID = true},
			-- Void Tendril's Grasp
			{spellID = 114404, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Earthgrab
			{spellID = 64695, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Debilitate (Terrorguard)
			{spellID = 170996, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Staggering Shout
			{spellID = 107566, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Slows
			-- Infected Wounds
			{spellID = 58180, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Typhoon
			{spellID = 61391, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Concussive Shot
			{spellID = 5116, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Breath (Chimaera)
			{spellID = 54644, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Ice Trap
			{spellID = 135299, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frozen Ammo
			{spellID = 162546, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Warp Time (Warp Stalker)
			{spellID = 35346, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Ankle Crack (Crocolisk)
			{spellID = 50433, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Blast Wave
			{spellID = 157981, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cone of Cold
			{spellID = 120, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Flurry
			{spellID = 228354, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Slow
			{spellID = 31589, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frostbolt
			{spellID = 116, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frostfire Bolt
			{spellID = 44614, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Chilled
			--BETA {spellID = 7321, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mind Flay
			{spellID = 15407, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Deadly Throw
			{spellID = 26679, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Crippling Poison
			{spellID = 3409, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Earthbind
			{spellID = 3600, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Earthquake
			{spellID = 77505, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Shock
			{spellID = 196840, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Thunderstorm
			{spellID = 51490, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cripple (Doomguard)
			{spellID = 170995, unitID = "player", caster = "all", filter = "DEBUFF", absID = true},
			-- Conflagrate
			{spellID = 17962, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Hamstring
			{spellID = 1715, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Piercing Howl
			{spellID = 12323, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Warbringer
			{spellID = 7922, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Other
			-- Dark Simulacrum
			{spellID = 77606, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shroud of Purgatory
			{spellID = 116888, unitID = "player", caster = "player", filter = "DEBUFF"},
			-- Cauterize
			{spellID = 87023, unitID = "player", caster = "player", filter = "DEBUFF"},
			-- Touch of Karma
			{spellID = 125174, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Smoke Bomb
			{spellID = 76577, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Rocket Fuel Leak
			{spellID = 94794, unitID = "player", caster = "player", filter = "DEBUFF"},

			-- Raids: Legion
			-- The Emerald Nightmare
			-- Nythendra
			-- Infested
			{spellID = 204504, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Rot
			{spellID = 203096, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Il'gynoth, Heart of Corruption
			-- Fixate
			{spellID = 210099, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Spew Corruption
			{spellID = 208929, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cursed Blood
			{spellID = 215128, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Erethe Renferal
			-- Raking Talons
			{spellID = 215582, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Wind Burn
			{spellID = 218519, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Web of Pain
			{spellID = 215307, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Necrotic Venom
			{spellID = 215449, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Twisting Shadows
			{spellID = 210850, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shimmering Feather
			{spellID = 212993, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Ursoc
			-- Focused Gaze
			{spellID = 198006, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Momentum
			{spellID = 198108, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Dragons of Nightmare
			-- Mark of Ysondre
			{spellID = 203102, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mark of Taerar
			{spellID = 203121, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mark of Emeriss
			{spellID = 203125, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mark of Lethon
			{spellID = 203124, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Nightmare Bloom
			{spellID = 207681, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Defiled Vines
			{spellID = 203770, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Volatile Infection
			{spellID = 203787, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cenarius
			-- Creeping Nightmares
			{spellID = 210279, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Nightmare Javelin
			{spellID = 211507, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Nightmare Brambles
			{spellID = 210315, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Scorned Touch
			{spellID = 211471, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Replenishing Roots
			{spellID = 211612, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Xavius
			-- Nightmare Blades
			{spellID = 211802, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Dream Simulacrum
			{spellID = 206005, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Tormenting Fixation
			{spellID = 205771, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Corruption Meteor
			{spellID = 224508, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Bonds of Terror
			{spellID = 210451, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Corruption: Descent into Madness
			{spellID = 208431, unitID = "player", caster = "all", filter = "DEBUFF"},
		},
		{
			Name = "T_BUFF",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = 60,
			Position = {"LEFT", AnchorT_BUFF_ICON},

			-- Death Knight
			-- Anti-Magic Shell
			{spellID = 48707, unitID = "target", caster = "all", filter = "BUFF"},
			-- Desecrated Ground
			{spellID = 115018, unitID = "target", caster = "all", filter = "BUFF"},
			-- Lichborne
			{spellID = 49039, unitID = "target", caster = "all", filter = "BUFF"},
			-- Icebound Fortitude
			{spellID = 48792, unitID = "target", caster = "all", filter = "BUFF"},
			-- Pillar of Frost
			{spellID = 51271, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Asphyxiate
			{spellID = 108194, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Gnaw (Ghoul)
			{spellID = 91800, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Monstrous Blow (Mutated Ghoul)
			{spellID = 91797, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Strangulate
			{spellID = 47476, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Demon Hunter
			-- Metamorphosis
			{spellID = 162264, unitID = "target", caster = "all", filter = "BUFF", absID = true},
			-- Spectral Sight
			{spellID = 188501, unitID = "target", caster = "all", filter = "BUFF"},
			-- Netherwalk
			{spellID = 196555, unitID = "target", caster = "all", filter = "BUFF"},
			-- Nether Bond
			{spellID = 207810, unitID = "target", caster = "all", filter = "BUFF"},
			-- Soul Barrier
			{spellID = 227225, unitID = "target", caster = "all", filter = "BUFF"},

			-- Druid
			-- Survival Instincts
			{spellID = 61336, unitID = "target", caster = "all", filter = "BUFF"},
			-- Barkskin
			{spellID = 22812, unitID = "target", caster = "all", filter = "BUFF"},
			-- Ironbark
			{spellID = 102342, unitID = "target", caster = "all", filter = "BUFF"},
			-- Nature's Grasp
			{spellID = 170856, unitID = "target", caster = "all", filter = "BUFF"},
			-- Stampeding Roar
			{spellID = 77764, unitID = "target", caster = "all", filter = "BUFF"},
			-- Incarnation: Tree of Life
			{spellID = 117679, unitID = "target", caster = "all", filter = "BUFF"},
			-- Berserk
			{spellID = 106951, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Cyclone
			{spellID = 33786, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mighty Bash
			{spellID = 5211, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Rake
			{spellID = 163505, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Maim
			{spellID = 22570, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Incapacitating Roar
			{spellID = 99, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Solar Beam
			{spellID = 78675, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Entangling Roots
			{spellID = 339, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Hunter
			-- Aspect of the Turtle
			{spellID = 186265, unitID = "target", caster = "all", filter = "BUFF"},
			-- Feign Death
			{spellID = 5384, unitID = "target", caster = "all", filter = "BUFF"},
			-- Posthaste
			{spellID = 118922, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Freezing Trap
			{spellID = 3355, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Wyvern Sting
			{spellID = 19386, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Binding Shot
			{spellID = 117526, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Intimidation
			{spellID = 24394, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Mage
			-- Ice Block
			{spellID = 45438, unitID = "target", caster = "all", filter = "BUFF"},
			-- Invisibility
			{spellID = 66, unitID = "target", caster = "all", filter = "BUFF"},
			-- Greater Invisibility
			{spellID = 113862, unitID = "target", caster = "all", filter = "BUFF"},
			-- Temporal Shield
			--BETA {spellID = 115610, unitID = "target", caster = "all", filter = "BUFF"},
			-- Alter Time
			{spellID = 110909, unitID = "target", caster = "all", filter = "BUFF"},
			-- Evanesce
			{spellID = 157913, unitID = "target", caster = "all", filter = "BUFF"},
			-- Evocation
			{spellID = 12051, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Cauterize
			{spellID = 87023, unitID = "target", caster = "target", filter = "DEBUFF"},
			-- Polymorph
			{spellID = 118, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Ring of Frost
			{spellID = 82691, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Dragon's Breath
			{spellID = 31661, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Monk
			-- Diffuse Magic
			{spellID = 122783, unitID = "target", caster = "all", filter = "BUFF"},
			-- Touch of Karma
			{spellID = 125174, unitID = "target", caster = "all", filter = "BUFF"},
			-- Ring of Peace
			{spellID = 116844, unitID = "target", caster = "all", filter = "BUFF"},
			-- Dampen Harm
			{spellID = 122278, unitID = "target", caster = "all", filter = "BUFF"},
			-- Nimble Brew
			{spellID = 213664, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Paralysis
			{spellID = 115078, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Leg Sweep
			{spellID = 119381, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fists of Fury
			{spellID = 120086, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Paladin
			-- Divine Shield
			{spellID = 642, unitID = "target", caster = "all", filter = "BUFF"},
			-- Guardian of Ancient Kings
			{spellID = 86659, unitID = "target", caster = "all", filter = "BUFF"},
			-- Blessing of Protection
			{spellID = 1022, unitID = "target", caster = "all", filter = "BUFF"},
			-- Divine Protection
			{spellID = 498, unitID = "target", caster = "all", filter = "BUFF"},
			-- Ardent Defender
			{spellID = 31850, unitID = "target", caster = "all", filter = "BUFF"},
			-- Aura Mastery
			{spellID = 31821, unitID = "target", caster = "all", filter = "BUFF"},
			-- Blessing of Spellwarding
			{spellID = 204018, unitID = "target", caster = "all", filter = "BUFF"},
			-- Blessing of Sacrifice
			{spellID = 6940, unitID = "target", caster = "all", filter = "BUFF"},
			-- Blessing of Freedom
			{spellID = 1044, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Repentance
			{spellID = 20066, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Hammer of Justice
			{spellID = 853, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Blinding Light
			{spellID = 105421, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Avenger's Shield
			{spellID = 31935, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Priest
			-- Dispersion
			{spellID = 47585, unitID = "target", caster = "all", filter = "BUFF"},
			-- Pain Suppression
			{spellID = 33206, unitID = "target", caster = "all", filter = "BUFF"},
			-- Guardian Spirit
			{spellID = 47788, unitID = "target", caster = "all", filter = "BUFF"},
			-- Spectral Guise
			{spellID = 119030, unitID = "target", caster = "all", filter = "BUFF"},
			-- Phantasm
			{spellID = 114239, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Dominate Mind
			{spellID = 605, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Psychic Horror
			{spellID = 64044, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Psychic Scream
			{spellID = 8122, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Silence
			{spellID = 15487, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Rogue
			-- Cloak of Shadows
			{spellID = 31224, unitID = "target", caster = "all", filter = "BUFF"},
			-- Cheating Death
			{spellID = 45182, unitID = "target", caster = "all", filter = "BUFF"},
			-- Evasion
			{spellID = 5277, unitID = "target", caster = "all", filter = "BUFF"},
			-- Combat Insight
			{spellID = 74002, unitID = "target", caster = "all", filter = "BUFF"},
			-- Shadow Dance
			{spellID = 185313, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Sap
			{spellID = 6770, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Blind
			{spellID = 2094, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Cheap Shot
			{spellID = 1833, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Kidney Shot
			{spellID = 408, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Between the Eyes
			{spellID = 199804, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Garrote
			{spellID = 1330, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Smoke Bomb
			{spellID = 76577, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Shaman
			-- Grounding Totem
			{spellID = 8178, unitID = "target", caster = "all", filter = "BUFF"},
			-- Spiritwalker's Grace
			{spellID = 79206, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Hex
			{spellID = 51514, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Static Charge
			{spellID = 118905, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Pulverize (Earth Elemental)
			{spellID = 118345, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Warlock
			-- Soulstone
			{spellID = 20707, unitID = "target", caster = "all", filter = "BUFF"},
			-- Unending Resolve
			{spellID = 104773, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Banish
			{spellID = 710, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Axe Toss (Felguard)
			{spellID = 89766, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fear
			{spellID = 118699, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Seduction (Succubus)
			{spellID = 6358, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mesmerize (Shivarra)
			{spellID = 115268, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Howl of Terror
			{spellID = 5484, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mortal Coil
			{spellID = 6789, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Shadowfury
			{spellID = 30283, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Meteor Strike (Abyssal)
			{spellID = 171156, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Debilitate (Terrorguard)
			{spellID = 170996, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 31117, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},

			-- Warrior
			-- Bladestorm
			{spellID = 46924, unitID = "target", caster = "all", filter = "BUFF"},
			-- Spell Reflection
			{spellID = 23920, unitID = "target", caster = "all", filter = "BUFF"},
			-- Mass Spell Reflection
			{spellID = 114028, unitID = "target", caster = "all", filter = "BUFF"},
			-- Shield Wall
			{spellID = 871, unitID = "target", caster = "all", filter = "BUFF"},
			-- Die by the Sword
			{spellID = 118038, unitID = "target", caster = "all", filter = "BUFF"},
			-- Last Stand
			{spellID = 12975, unitID = "target", caster = "all", filter = "BUFF"},
			-- Berserker Rage
			{spellID = 18499, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Intimidating Shout
			{spellID = 5246, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Storm Bolt
			{spellID = 132169, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Shockwave
			{spellID = 132168, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Racial
			-- Arcane Torrent
			{spellID = 28730, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Quaking Palm
			{spellID = 107079, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- War Stomp
			{spellID = 20549, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Professions
			-- Shieldtronic Shield
			{spellID = 173260, unitID = "target", caster = "all", filter = "BUFF"},

			-- Player vs. Player
			-- Ashran
			-- Ancient Artifact
			{spellID = 168506, unitID = "target", caster = "all", filter = "BUFF"},
			-- Boulder Shield
			{spellID = 169373, unitID = "target", caster = "all", filter = "BUFF"},
			-- Scroll of Protection
			{spellID = 171249, unitID = "target", caster = "all", filter = "BUFF"},
			-- Star Root Tuber
			{spellID = 161495, unitID = "target", caster = "all", filter = "BUFF"},
			-- Battlegrounds
			-- Netherstorm Flag
			{spellID = 34976, unitID = "target", caster = "all", filter = "BUFF"},
			-- Orb of Power
			{spellID = 121175, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Warsong Flag
			{spellID = 23333, unitID = "target", caster = "all", filter = "BUFF"},
			{spellID = 23335, unitID = "target", caster = "all", filter = "BUFF"},
			-- Seaforium Bombs
			{spellID = 66271, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Drinking in Arena
			-- Ba'ruun's Bountiful Bloom
			{spellID = 167268, unitID = "target", caster = "all", filter = "BUFF"},
			-- Drinking
			{spellID = 80167, unitID = "target", caster = "all", filter = "BUFF"},
			-- Mage Food
			{spellID = 167152, unitID = "target", caster = "all", filter = "BUFF"},
		},
	},
}
SpellActivationOverlayFrame:SetFrameStrata("BACKGROUND")
local Filger = {}
local MyUnits = {player = true, vehicle = true, pet = true}
local class = select(2, UnitClass("player"))
local classcolor = RAID_CLASS_COLORS[class]

function Filger:UnitBuff(unitID, inSpellID, spn, absID)
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitBuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitBuff(unitID, spn)
	end
	return nil
end

function Filger:UnitDebuff(unitID, inSpellID, spn, absID)
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitDebuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitDebuff(unitID, spn)
	end
	return nil
end

function Filger:UpdateCD()
	local time = self.value.start + self.value.duration - GetTime()

	if self:GetParent().Mode == "BAR" then
		self.statusbar:SetValue(time)
		if time <= 60 then
			self.time:SetFormattedText("%.1f", time)
		else
			self.time:SetFormattedText("%d:%.2d", time / 60, time % 60)
		end
	else
		if time < 0 then
			local frame = self:GetParent()
			frame.actives[self.activeIndex] = nil
			self:SetScript("OnUpdate", nil)
			Filger.DisplayActives(frame)
		end
	end
end

function Filger:DisplayActives()
	if not self.actives then return end
	if not self.bars then self.bars = {} end
	local id = self.Id
	local index = 1
	local previous = nil

	for _, _ in pairs(self.actives) do
		local bar = self.bars[index]
		if not bar then
			bar = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self)
			bar:SetScale(1)
			CreateStyle(bar, 2)

			if index == 1 then
				bar:SetPoint(unpack(self.Position))
			else
				if self.Direction == "UP" then
					bar:SetPoint("BOTTOM", previous, "TOP", 0, self.Interval)
				elseif self.Direction == "RIGHT" then
					bar:SetPoint("LEFT", previous, "RIGHT", self.Mode == "ICON" and self.Interval or (self.BarWidth + self.Interval + 7), 0)
				elseif self.Direction == "LEFT" then
					bar:SetPoint("RIGHT", previous, "LEFT", self.Mode == "ICON" and -self.Interval or -(self.BarWidth + self.Interval + 7), 0)
				else
					bar:SetPoint("TOP", previous, "BOTTOM", 0, -self.Interval)
				end
			end

			if bar.icon then
				bar.icon = _G[bar.icon:GetName()]
			else
				bar.icon = bar:CreateTexture("$parentIcon", "BORDER")
				bar.icon:SetPoint("TOPLEFT", 2, -2)
				bar.icon:SetPoint("BOTTOMRIGHT", -2, 2)
				bar.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end

			if self.Mode == "ICON" then
				if bar.cooldown then
					bar.cooldown = _G[bar.cooldown:GetName()]
				else
					bar.cooldown = CreateFrame("Cooldown", "$parentCD", bar, "CooldownFrameTemplate")
					bar.cooldown:SetAllPoints(bar.icon)
					bar.cooldown:SetReverse(true)
					bar.cooldown:SetFrameLevel(2)
				end

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "OVERLAY")
					bar.count:SetFont(Qulight["media"].pxfont, 10, "OUTLINE")
					bar.count:SetShadowOffset(1, -1)
					bar.count:SetPoint("BOTTOMRIGHT", 1, -1)
					bar.count:SetJustifyH("CENTER")
				end
			else
				if bar.statusbar then
					bar.statusbar = _G[bar.statusbar:GetName()]
				else
					bar.statusbar = CreateFrame("StatusBar", "$parentStatusBar", bar)
					bar.statusbar:SetWidth(self.BarWidth)
					bar.statusbar:SetHeight(self.IconSize - 10)
					bar.statusbar:SetStatusBarTexture(Qulight["media"].texture)
					bar.statusbar:SetStatusBarColor(.05,.05,.05, .9)
					if self.IconSide == "LEFT" then
						bar.statusbar:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", 5, 2)
					elseif self.IconSide == "RIGHT" then
						bar.statusbar:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -5, 2)
					end
				end
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(0)

				if bar.bg then
					bar.bg = _G[bar.bg:GetName()]
				else
					bar.bg = CreateFrame("Frame", "$parentBG", bar.statusbar)
					bar.bg:SetPoint("TOPLEFT", -2, 2)
					bar.bg:SetPoint("BOTTOMRIGHT", 2, -2)
					bar.bg:SetFrameStrata("BACKGROUND")
					CreateStyle(bar.bg, 2)
				end

				if bar.background then
					bar.background = _G[bar.background:GetName()]
				else
					bar.background = bar.statusbar:CreateTexture(nil, "BACKGROUND")
					bar.background:SetAllPoints()
					bar.background:SetTexture(Qulight["media"].texture)
					bar.background:SetVertexColor(.05,.05,.05, 0.25)
				end

				if bar.time then
					bar.time = _G[bar.time:GetName()]
				else
					bar.time = bar.statusbar:CreateFontString("$parentTime", "OVERLAY")
					bar.time:SetFont(Qulight["media"].pxfont, 10, "OUTLINE")
					bar.time:SetShadowOffset(1, -1)
					bar.time:SetPoint("RIGHT", bar.statusbar, 0, 0)
					bar.time:SetJustifyH("RIGHT")
				end

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "OVERLAY")
					bar.count:SetFont(Qulight["media"].pxfont, 10, "OUTLINE")
					bar.count:SetShadowOffset(1, -1)
					bar.count:SetPoint("BOTTOMRIGHT", 1, 0)
					bar.count:SetJustifyH("CENTER")
				end

				if bar.spellname then
					bar.spellname = _G[bar.spellname:GetName()]
				else
					bar.spellname = bar.statusbar:CreateFontString("$parentSpellName", "OVERLAY")
					bar.spellname:SetFont(Qulight["media"].pxfont, 10, "OUTLINE")
					bar.spellname:SetShadowOffset(1, -1)
					bar.spellname:SetPoint("LEFT", bar.statusbar, 2, 0)
					bar.spellname:SetPoint("RIGHT", bar.time, "LEFT")
					bar.spellname:SetJustifyH("LEFT")
				end
			end
			bar.spellID = 0
			self.bars[index] = bar
		end
		previous = bar
		index = index + 1
	end

	if not self.sortedIndex then self.sortedIndex = {} end

	for n in pairs(self.sortedIndex) do
		self.sortedIndex[n] = 999
	end

	local activeCount = 1
	for n in pairs(self.actives) do
		self.sortedIndex[activeCount] = n
		activeCount = activeCount + 1
	end
	table.sort(self.sortedIndex)

	index = 1

	for n in pairs(self.sortedIndex) do
		if n >= activeCount then
			break
		end
		local activeIndex = self.sortedIndex[n]
		local value = self.actives[activeIndex]
		local bar = self.bars[index]
		bar.spellName = GetSpellInfo(value.spid)
		if self.Mode == "BAR" then
			bar.spellname:SetText(bar.spellName)
		end
		bar.icon:SetTexture(value.icon)
		if value.count and value.count > 1 then
			bar.count:SetText(value.count)
			bar.count:Show()
		else
			bar.count:Hide()
		end
		if value.duration and value.duration > 0 then
			if self.Mode == "ICON" then
				CooldownFrame_Set(bar.cooldown, value.start, value.duration, 1)
				if value.data.filter == "CD" or value.data.filter == "ICD" then
					bar.value = value
					bar.activeIndex = activeIndex
					bar:SetScript("OnUpdate", Filger.UpdateCD)
				else
					bar:SetScript("OnUpdate", nil)
				end
				bar.cooldown:Show()
			else
				bar.statusbar:SetMinMaxValues(0, value.duration)
				bar.value = value
				bar.activeIndex = activeIndex
				bar:SetScript("OnUpdate", Filger.UpdateCD)
			end
		else
			if self.Mode == "ICON" then
				bar.cooldown:Hide()
			else
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(1)
				bar.time:SetText("")
			end
			bar:SetScript("OnUpdate", nil)
		end
		bar.spellID = value.spid
		bar:SetWidth(self.IconSize or 37)
		bar:SetHeight(self.IconSize or 37)
		bar:SetAlpha(value.data.opacity or 1)
		bar:Show()
		index = index + 1
	end

	for i = index, #self.bars, 1 do
		local bar = self.bars[i]
		bar:Hide()
	end
end

function Filger:OnEvent(event, unit)
	if event == "SPELL_UPDATE_COOLDOWN" or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "UNIT_AURA" and (unit == "target" or unit == "player" or unit == "pet" or unit == "focus") then
		local needUpdate = false
		local id = self.Id

		for i = 1, #Filger_Spells[class][id], 1 do
			local data = Filger_Spells[class][id][i]
			local found = false
			local name, icon, count, duration, start, spid
			spid = 0

			if data.filter == "BUFF" then
				local caster, spn, expirationTime
				spn, _, _ = GetSpellInfo(data.spellID)
				name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = Filger:UnitBuff(data.unitID, data.spellID, spn, data.absID)
				if name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all") or MyUnits[caster]) then
					start = expirationTime - duration
					found = true
					end
			elseif data.filter == "DEBUFF" then
				local caster, spn, expirationTime
				spn, _, _ = GetSpellInfo(data.spellID)
				name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = Filger:UnitDebuff(data.unitID, data.spellID, spn, data.absID)
				if name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all") or MyUnits[caster]) then
					start = expirationTime - duration
					found = true
				end
			elseif data.filter == "CD" then
				if data.spellID then
					name, _, icon = GetSpellInfo(data.spellID)
					if data.absID then
						start, duration = GetSpellCooldown(data.spellID)
					else
						start, duration = GetSpellCooldown(name)
					end
					spid = data.spellID
				elseif data.slotID then
					spid = data.slotID
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if slotLink then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
						start, duration = GetInventoryItemCooldown("player", data.slotID)
					end
				end
				if name and (duration or 0) > 1.5 then
					found = true
				end
			elseif data.filter == "ICD" then
				if data.trigger == "BUFF" then
					local spn
					spn, _, icon = GetSpellInfo(data.spellID)
					name, _, _, _, _, _, _, _, _, _, spid = Filger:UnitBuff("player", data.spellID, spn, data.absID)
				elseif data.trigger == "DEBUFF" then
					local spn
					spn, _, icon = GetSpellInfo(data.spellID)
					name, _, _, _, _, _, _, _, _, _, spid = Filger:UnitDebuff("player", data.spellID, spn, data.absID)
				end
				if name then
					if data.slotID then
						local slotLink = GetInventoryItemLink("player", data.slotID)
						_, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					end
					duration = data.duration
					start = GetTime()
					found = true
				end
			end

			if found then
				if not self.actives then self.actives = {} end
				if not self.actives[i] then
					self.actives[i] = {data = data, name = name, icon = icon, count = count, start = start, duration = duration, spid = spid}
					needUpdate = true
				else
					if data.filter ~= "ICD" and (self.actives[i].count ~= count or self.actives[i].start ~= start or self.actives[i].duration ~= duration) then
						self.actives[i].count = count
						self.actives[i].start = start
						self.actives[i].duration = duration
						needUpdate = true
					end
				end
			else
				if data.filter ~= "ICD" and self.actives and self.actives[i] then
					self.actives[i] = nil
					needUpdate = true
				end
			end
		end

		if needUpdate and self.actives then
			Filger.DisplayActives(self)
		end
	end
end

class = select(2, UnitClass("player"))

if Filger_Spells and Filger_Spells["ALL"] then
	if not Filger_Spells[class] then
		Filger_Spells[class] = {}
	end

	for i = 1, #Filger_Spells["ALL"], 1 do
		local merge = false
		local spellListAll = Filger_Spells["ALL"][i]
		local spellListClass = nil
		for j = 1, #Filger_Spells[class], 1 do
			spellListClass = Filger_Spells[class][j]
			local mergeAll = spellListAll.Merge or false
			local mergeClass = spellListClass.Merge or false
			if spellListClass.Name == spellListAll.Name and (mergeAll or mergeClass) then
				merge = true
				break
			end
		end
		if not merge or not spellListClass then
			table.insert(Filger_Spells[class], Filger_Spells["ALL"][i])
		else
			for j = 1, #spellListAll, 1 do
				table.insert(spellListClass, spellListAll[j])
			end
		end
	end
end

if Filger_Spells and Filger_Spells[class] then
	for index in pairs(Filger_Spells) do
		if index ~= class then
			Filger_Spells[index] = nil
		end
	end

	local idx = {}
	for i = 1, #Filger_Spells[class], 1 do
		local jdx = {}
		local data = Filger_Spells[class][i]

		for j = 1, #data, 1 do
			local spn
			if data[j].spellID then
				spn = GetSpellInfo(data[j].spellID)
			else
				local slotLink = GetInventoryItemLink("player", data[j].slotID)
				if slotLink then
					spn = GetItemInfo(slotLink)
				end
			end
			if not spn and not data[j].slotID then
				print("|cffff0000WARNING: spell/slot ID ["..(data[j].spellID or data[j].slotID or "UNKNOWN").."")
				table.insert(jdx, j)
			end
		end

		for _, v in ipairs(jdx) do
			table.remove(data, v)
		end

		if #data == 0 then
			print("")
			table.insert(idx, i)
		end
	end

	for _, v in ipairs(idx) do
		table.remove(Filger_Spells[class], v)
	end

	for i = 1, #Filger_Spells[class], 1 do
		local data = Filger_Spells[class][i]
		local frame = CreateFrame("Frame", "FilgerFrame"..i.."_"..data.Name, UIParent)
		frame.Id = i
		frame.Name = data.Name
		frame.Direction = data.Direction or "DOWN"
		frame.IconSide = data.IconSide or "LEFT"
		frame.Mode = data.Mode or "ICON"
		frame.Interval = data.Interval or 3
		frame:SetAlpha(data.Alpha or 1)
		frame.IconSize = data.IconSize or 37
		frame.BarWidth = data.BarWidth or 186
		frame.Position = data.Position or "CENTER"
		frame:SetPoint(unpack(data.Position))

		if Filger_Settings.config_mode then
			frame.actives = {}
			for j = 1, math.min(Filger_Settings.max_test_icon, #Filger_Spells[class][i]), 1 do
				local data = Filger_Spells[class][i][j]
				local name, icon
				if data.spellID then
					name, _, icon = GetSpellInfo(data.spellID)
				elseif data.slotID then
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if slotLink then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					end
				end
				frame.actives[j] = {data = data, name = name, icon = icon, count = 9, start = 0, duration = 0, spid = data.spellID or data.slotID}
			end
			Filger.DisplayActives(frame)
		else
			for j = 1, #Filger_Spells[class][i], 1 do
				local data = Filger_Spells[class][i][j]
				if data.filter == "CD" then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
					break
				end
			end
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
			frame:RegisterEvent("PLAYER_TARGET_CHANGED")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:SetScript("OnEvent", Filger.OnEvent)
		end
	end
end