UIParentLoadAddOn('Blizzard_DebugTools')
RaidBuffs = {
	DRUID = {
		{774, "TOPRIGHT", {0.8, 0.4, 0.8}},					-- Rejuvenation
		{8936, "BOTTOMLEFT", {0.2, 0.8, 0.2}},				-- Regrowth
		{33763, "TOPLEFT", {0.4, 0.8, 0.2}},				-- Lifebloom
		{48438, "BOTTOMRIGHT", {0.8, 0.4, 0}},				-- Wild Growth
		{102342, "LEFT", {0.45, 0.3, 0.2}, true},			-- Ironbark
		{155777, "RIGHT", {0.4, 0.9, 0.4}},					-- Rejuvenation (Germination)
	},
	MONK = {
		{119611, "TOPRIGHT", {0.2, 0.7, 0.7}},				-- Renewing Mist
		{124682, "BOTTOMLEFT", {0.4, 0.8, 0.2}},			-- Enveloping Mist
		{115175, "BOTTOMRIGHT", {0.7, 0.4, 0}},				-- Soothing Mist
		{191840, "TOPLEFT", {0.1, 0.4, 0.9}},				-- Essence Font
		{116849, "LEFT", {0.81, 0.85, 0.1}, true},			-- Life Cocoon
	},
	PALADIN = {
		{53563, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Light
		{156910, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Faith
		{200025, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Virtue
		{114163, "BOTTOMLEFT", {0.9, 0.6, 0.4}},			-- Eternal Flame
		{1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true},			-- Blessing of Protection
		{1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true},		-- Blessing of Freedom
		{204013, "BOTTOMRIGHT", {0.93, 0.75, 0}, true},		-- Blessing of Salvation
		{6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true},		-- Blessing of Sacrifice
		{204018, "BOTTOMRIGHT", {0.4, 0.6, 0.8}, true},		-- Blessing of Spellwarding
	},
	PRIEST = {
		{194384, "TOPRIGHT", {0.8, 0.4, 0.2}},				-- Atonement
		{41635, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},			-- Prayer of Mending
		{139, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, 				-- Renew
		{17, "TOPLEFT", {0.81, 0.85, 0.1}, true},			-- Power Word: Shield
		{33206, "LEFT", {0.89, 0.1, 0.1}, true},			-- Pain Suppression
		{47788, "LEFT", {0.86, 0.52, 0}, true},				-- Guardian Spirit
	},
	SHAMAN = {
		{61295, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Riptide
		{204288, "BOTTOMRIGHT", {0.2, 0.7, 0.2}, true},		-- Earth Shield
	},
	HUNTER = {
		{35079, "TOPRIGHT", {0.2, 0.2, 1}},					-- Misdirection
	},
	ROGUE = {
		{57934, "TOPRIGHT", {0.89, 0.1, 0.1}},				-- Tricks of the Trade
	},
	WARLOCK = {
		{20707, "TOPRIGHT", {0.7, 0.32, 0.75}},				-- Soulstone
	},
	WARRIOR = {
		{114030, "TOPLEFT", {0.2, 0.2, 1}},					-- Vigilance
		{3411, "TOPRIGHT", {0.89, 0.1, 0.1}},				-- Intervene
	},
	ALL = {
		{23333, "LEFT", {1, 0, 0}, true}, 					-- Warsong flag, Horde
		{23335, "LEFT", {0, 0, 1}, true},					-- Warsong flag, Alliance
		{34976, "LEFT", {1, 0, 0}, true}, 					-- Netherstorm Flag
	},
}

RaidBuffsIgnore = {
	-- [65148] = true,		-- Sacred Shield (Proc)
}

local function SpellName(id)
	local name = GetSpellInfo(id)
	if name then
		return name
	else
		print("|cffff0000WARNING: spell ID ["..tostring(id).."] no longer exists! Report this to Shestak.|r")
		return "Empty"
	end
end

RaidDebuffs = {
-----------------------------------------------------------------
-- Legion
----------------------------------------------------------------
-- Antorus, the Burning Throne
	-- Argus the Unmaker
	[SpellName(251815)] = 3, -- Edge of Obliteration
	[SpellName(248499)] = 4, -- Sweeping Scythe
	[SpellName(250669)] = 5, -- Soulburst
	[SpellName(251570)] = 6, -- Soulbomb
	[SpellName(248396)] = 6, -- Soulblight
	[SpellName(258039)] = 3, -- Deadly Scythe
	[SpellName(252729)] = 3, -- Cosmic Ray
	[SpellName(256899)] = 4, -- Soul Detonation
	[SpellName(252634)] = 4, -- Cosmic Smash
	[SpellName(252616)] = 4, -- Cosmic Beacon
	[SpellName(255200)] = 3, -- Aggramar's Boon
	[SpellName(255199)] = 4, -- Avatar of Aggramar
	[SpellName(258647)] = 3, -- Gift of the Sea
	[SpellName(253901)] = 3, -- Strength of the Sea
	[SpellName(257299)] = 4, -- Ember of Rage
	[SpellName(248167)] = 3, -- Death Fog
	[SpellName(258646)] = 3, -- Gift of the Sky
	[SpellName(253903)] = 3, -- Strength of the Sky

	-- Aggramar
	[SpellName(244291)] = 3, -- Foe Breaker
	[SpellName(255060)] = 3, -- Empowered Foe Breaker
	[SpellName(245995)] = 4, -- Scorching Blaze
	[SpellName(246014)] = 3, -- Searing Tempest
	[SpellName(244912)] = 3, -- Blazing Eruption
	[SpellName(247135)] = 3, -- Scorched Earth
	[SpellName(247091)] = 3, -- Catalyzed
	[SpellName(245631)] = 3, -- Unchecked Flame
	[SpellName(245916)] = 3, -- Molten Remnants
	[SpellName(245990)] = 4, -- Taeshalach's Reach
	[SpellName(254452)] = 3, -- Ravenous Blaze
	[SpellName(244736)] = 3, -- Wake of Flame
	[SpellName(247079)] = 3, -- Empowered Flame Rend

	-- The Coven of Shivarra
	[SpellName(244899)] = 3, 	-- Fiery Strike
	[SpellName(245518)] = 3, 	-- Flashfreeze
	[SpellName(245586)] = 3, 	-- Chilled Blood
	[SpellName(246763)] = 3, 	-- Fury of Golganneth
	[SpellName(245674)] = 3, 	-- Flames of Khaz'goroth
	[SpellName(245910)] = 3, 	-- Spectral Army of Norgannon
	[SpellName(253520)] = 3, 	-- Fulminating Pulse

	-- Varimathras
	[SpellName(244042)] = 3, 	-- Marked Prey
	[SpellName(243961)] = 3, 	-- Misery
	[SpellName(248732)] = 3, 	-- Echoes of Doom
	[SpellName(244093)] = 3, 	-- Necrotic Embrace

	-- Kin'garoth
	[SpellName(233062)] = 3, 	-- Infernal Burning
	[SpellName(230345)] = 3, 	-- Crashing Comet
	[SpellName(244312)] = 3, 	-- Forging Strike
	[SpellName(246840)] = 3, 	-- Ruiner
	[SpellName(248061)] = 3, 	-- Purging Protocol
	[SpellName(246706)] = 3, 	-- Demolish

	-- Imonar the Soulhunter
	[SpellName(248424)] = 3, 	-- Gathering Power
	[SpellName(247552)] = 3, 	-- Sleep Canister
	[SpellName(247565)] = 3, 	-- Slumber Gas
	[SpellName(250224)] = 3, 	-- Shocked
	[SpellName(248252)] = 3, 	-- Infernal Rockets
	[SpellName(247687)] = 3, 	-- Sever
	[SpellName(247716)] = 3, 	-- Charged Blasts
	[SpellName(250255)] = 3, 	-- Empowered Shock Lance
	[SpellName(247641)] = 3, 	-- Stasis Trap

	-- Eonar the Life-Binder
	[SpellName(248326)] = 3, 	-- Rain of Fel
	[SpellName(248861)] = 3, 	-- Spear of Doom
	[SpellName(249016)] = 3, 	-- Feedback - Targeted
	[SpellName(249015)] = 3, 	-- Feedback - Burning Embers
	[SpellName(249014)] = 3, 	-- Feedback - Foul Steps
	[SpellName(249017)] = 3, 	-- Feedback - Arcane Singularity

	-- Portal Keeper Hasabel
	[SpellName(244016)] = 3, 	-- Reality Tear
	[SpellName(245157)] = 3, 	-- Everburning Light
	[SpellName(245075)] = 3, 	-- Hungering Gloom
	[SpellName(245240)] = 3, 	-- Oppressive Gloom
	[SpellName(244709)] = 3, 	-- Fiery Detonation
	[SpellName(246208)] = 3, 	-- Acidic Web
	[SpellName(246075)] = 3, 	-- Catastrophic Implosion
	[SpellName(244826)] = 3, 	-- Fel Miasma
	[SpellName(246316)] = 3, 	-- Poison Essence
	[SpellName(244849)] = 3, 	-- Caustic Slime
	[SpellName(245118)] = 3, 	-- Cloying Shadows
	[SpellName(245050)] = 3, 	-- Delusions
	[SpellName(245040)] = 3, 	-- Corrupt
	[SpellName(244926)] = 3, 	-- Felsilk Wrap
	[SpellName(244607)] = 3, 	-- Flames of Xoroth

	-- Antoran High Command
	[SpellName(245121)] = 3, 	-- Entropic Blast
	[SpellName(244748)] = 3, 	-- Shocked
	[SpellName(244824)] = 3, 	-- Warp Field
	[SpellName(244892)] = 3, 	-- Exploit Weakness
	[SpellName(244172)] = 3, 	-- Psychic Assault
	[SpellName(244388)] = 3, 	-- Psychic Scarring
	[SpellName(244420)] = 3, 	-- Chaos Pulse

	-- Felhounds of Sargeras
	[SpellName(245022)] = 3, 	-- Burning Remnant
	[SpellName(251445)] = 3, 	-- Smouldering
	[SpellName(251448)] = 3, 	-- Burning Maw
	[SpellName(244086)] = 3, 	-- Molten Touch
	[SpellName(244091)] = 3, 	-- Singed
	[SpellName(244768)] = 3, 	-- Desolate Gaze
	[SpellName(244767)] = 3, 	-- Desolate Path
	[SpellName(244471)] = 3, 	-- Enflame Corruption
	[SpellName(248815)] = 3, 	-- Enflamed
	[SpellName(244517)] = 3, 	-- Lingering Flames
	[SpellName(245098)] = 3, 	-- Decay
	[SpellName(251447)] = 3, 	-- Corrupting Maw
	[SpellName(244131)] = 3,	-- Consuming Sphere
	[SpellName(245024)] = 3,	-- Consumed
	[SpellName(244071)] = 3,	-- Weight of Darkness
	[SpellName(244578)] = 3,	-- Siphon Corruption
	[SpellName(248819)] = 3,	-- Siphoned

	-- Garothi Worldbreaker
	[SpellName(244761)] = 3, 	-- Annihilation
	[SpellName(246369)] = 3, 	-- Searing Barrage
	[SpellName(246848)] = 3, 	-- Luring Destruction
	[SpellName(246220)] = 3, 	-- Fel Bombardment
	[SpellName(247159)] = 3, 	-- Luring Destruction
	[SpellName(244122)] = 3, 	-- Carnage

-- Tomb of Sargeras
	-- Goroth
	[SpellName(231363)] = 3,	-- Burning Armor
	[SpellName(233279)] = 3,	-- Shattering Star
	[SpellName(230345)] = 3,	-- Crashing Comet
	[SpellName(234346)] = 4,	-- Fel Eruption
	-- Demonic Inquisition
	[SpellName(233983)] = 3,	-- Echoing Anguish
	[SpellName(233895)] = 3,	-- Suffocating Dark
	-- Harjatan
	[SpellName(231998)] = 3,	-- Jagged Abrasion
	[SpellName(231770)] = 4,	-- Drenched
	[SpellName(231729)] = 3,	-- Aqueous Burst
	[SpellName(231768)] = 3,	-- Drenching Waters
	-- Sisters of the Moon
	[SpellName(234996)] = 4,	-- Umbra Suffusion
	[SpellName(234995)] = 4,	-- Lunar Suffusion
	[SpellName(236516)] = 3,	-- Twilight Volley
	[SpellName(236519)] = 3,	-- Moon Burn
	[SpellName(239264)] = 3,	-- Lunar Fire
	[SpellName(236712)] = 3,	-- Lunar Beacon
	-- Mistress Sassz'ine
	[SpellName(230201)] = 3,	-- Burden of Pain
	[SpellName(230139)] = 3,	-- Hydra Shot
	[SpellName(230358)] = 3,	-- Thundering Shock
	[SpellName(232913)] = 3,	-- Befouling Ink
	-- The Desolate Host
	[SpellName(235907)] = 3,	-- Collapsing Fissure
	[SpellName(235989)] = 3,	-- Tormented Cries
	[SpellName(235933)] = 3,	-- Spear of Anguish
	[SpellName(235968)] = 3,	-- Grasping Darkness
	[SpellName(236340)] = 3,	-- Crush Mind
	[SpellName(236449)] = 3,	-- Soulbind
	[SpellName(236515)] = 3,	-- Shattering Scream
	[SpellName(236241)] = 3,	-- Soul Rot
	-- Maiden of Vigilance
	[SpellName(235213)] = 3,	-- Light Infusion
	[SpellName(235240)] = 3,	-- Fel Infusion
	[SpellName(240209)] = 4,	-- Unstable Soul
	-- Fallen Avatar
	[SpellName(236494)] = 3,	-- Desolate
	[SpellName(236604)] = 3,	-- Shadowy Blades
	[SpellName(234059)] = 3,	-- Unbound Chaos
	[SpellName(239058)] = 3,	-- Touch of Sargeras
	[SpellName(239739)] = 3,	-- Dark Mark
	[SpellName(242017)] = 3,	-- Black Winds
	-- Kil'Jaeden
	[SpellName(236710)] = 3,	-- Shadow Reflection: Erupting
	[SpellName(236378)] = 3,	-- Shadow Reflection: Wailing
	[SpellName(238429)] = 3,	-- Bursting Dreadflame
	[SpellName(238505)] = 3,	-- Focused Dreadflame
	[SpellName(239155)] = 3,	-- Gravity Squeeze
	[SpellName(239253)] = 3,	-- Flaming Orb
	[SpellName(239130)] = 3,	-- Tear Rift
	[SpellName(238505)] = 3,	-- Focused Dreadflame
-- Trial of Valor
	-- Odyn
	[SpellName(198088)] = 3,	-- Glowing Fragment
	[SpellName(228915)] = 3,	-- Stormforged Spear
	[SpellName(227959)] = 3,	 -- Storm of Justice
	[SpellName(227475)] = 3,	-- Cleansing Flame
	-- Guarm
	[SpellName(227570)] = 3,	-- Dark Discharge
	[SpellName(227566)] = 3, 	-- Salty Spittle
	[SpellName(227539)] = 3,	-- Fiery Phlegm
	[SpellName(228250)] = 4,	-- Shadow Lick
	[SpellName(228246)] = 4,	-- Frost Lick
	[SpellName(228226)] = 4,	-- Flame Lick
	-- Helya
	[SpellName(228054)] = 3,	-- Taint of the Sea
	[SpellName(227982)] = 3,	-- Bilewater Redox
	[SpellName(193367)] = 3,	-- Fetid Rot
	[SpellName(227903)] = 3,	-- Orb of Corruption
	[SpellName(228058)] = 3,	-- Orb of Corrosion
	[SpellName(228519)] = 3,	-- Anchor Slam
	[SpellName(202476)] = 3,	-- Rabid
	[SpellName(232450)] = 3,	-- Corrupted Axion

-- The Nighthold
	-- Skorpyron
	-- Chronomatic Anomaly
	[SpellName(206609)] = 3,	-- Time Release
	-- Trilliax
	[SpellName(206788)] = 3,	-- Toxic Slice
	-- Spellblade Aluriel
	[SpellName(212492)] = 3,	-- Annihilate
	[SpellName(212587)] = 3,	-- Mark of Frost
	-- Tichondrius
	[SpellName(206480)] = 3,	-- Carrion Plague
	[SpellName(216040)] = 3,	-- Burning Soul
	[SpellName(208230)] = 3,	-- Feast of Blood
	-- Krosus
	-- High Botanist Tel'arn
	[SpellName(218304)] = 3,	-- Parasitic Fetter
	-- Star Augur Etraeus
	[SpellName(206936)] = 3,	-- Icy Ejection
	-- Gul'dan
	[SpellName(206222)] = 3,	-- Bonds of Fel
	[SpellName(212568)] = 3,	-- Drain
-- The Emerald Nightmare
    	-- Nythendra
   	[SpellName(204504)] = 5,    -- Infested (dot, stacks)
  	[SpellName(203096)] = 3,    -- Rot (AoE people around you)
   	[SpellName(204463)] = 3,    -- Volatile Rot (exploding tank)
  	[SpellName(203646)] = 4,    -- Burst of Corruption
  	-- Il'gynoth, Heart of Corruption
 	[SpellName(215845)] = 3,    -- Dispersed Spores (dot)
 	[SpellName(210099)] = 6,    -- Fixate (fixate)
 	[SpellName(209469)] = 5,    -- Touch of Corruption (dot, stacks, magic)
 	[SpellName(210984)] = 3,    -- Eye of Fate (tank debuff, stacks)
  	[SpellName(208697)] = 4,    -- Mind Flay (dot)
 	[SpellName(208929)] = 3,    -- Spew Corruption (dot, drops pools)
 	[SpellName(215128)] = 3,    -- Cursed Blood (dot, weak bomb)
  	-- Erethe Renferal
   	[SpellName(215582)] = 4,    -- Raking Talons (tank debuff, stacks)
   	[SpellName(218519)] = 4,    -- Wind Burn (debuff, stacks)
   	[SpellName(215307)] = 4,    -- Web of Pain (linked with another player)
   	[SpellName(215449)] = 3,    -- Necrotic Venom (dot)
   	[SpellName(215460)] = 3,    -- Necrotic Venom (dot, drops pools)
  	[SpellName(210850)] = 4,    -- Twisting Shadows (dot, drops vortex)
  	-- Ursoc
  	[SpellName(197943)] = 3,    -- Overwhelm (tank debuff, stacks)
  	[SpellName(204859)] = 4,    -- Rend Flesh (tank debuff, dot)
  	[SpellName(198006)] = 3,    -- Focused Gaze (fixate)
  	[SpellName(198108)] = 3,    -- Momentum (debuff)
	-- Dragons of Nightmare
    	[SpellName(207681)] = 4,    -- Nightmare Bloom (standing in, should be at least 1 player)
    	[SpellName(203770)] = 3,    -- Defiled Vines (root, magic)
   	[SpellName(203787)] = 3,    -- Volatile Infection (AoE dot)
   	[SpellName(204044)] = 3,    -- Shadow Burst (dot, stacks)
   	[SpellName(205341)] = 3,    -- Seeping Fog (dot, sleep, magic)
    	[SpellName(204078)] = 3,    -- Bellowing Roar (fear)
    	-- Cenarius
    	[SpellName(210315)] = 3,    -- Nightmare Brambles (dot, root, magic)
   	[SpellName(226821)] = 3,    -- Desiccating Stomp (melee split damage debuf, stacks)
   	[SpellName(211507)] = 3,    -- Nightmare Javelin (dot, magic)
   	[SpellName(211471)] = 3,    -- Scorned Touch (spreading dot, slow)
    	[SpellName(214529)] = 3,    -- Spear of Nightmares (tank debuff, stacks)
	[SpellName(210279)] = 3,	-- Creeping Nightmare
    	-- Xavius
   	[SpellName(208431)] = 3,    -- Descent into Madness (buff before mind control)
   	[SpellName(206651)] = 3,    -- Darkening Soul (tank debuff, dot, stacks, magic, explosion on dispel)
    	[SpellName(209158)] = 3,    -- Blackening Soul (tank debuff, dot, stacks, magic, explosion on dispel)
    	[SpellName(211802)] = 3,    -- Nightmare Blades (fixate)
    	[SpellName(205771)] = 3,    -- Tormenting Fixation (ad fixate)
    	[SpellName(210451)] = 3,    -- Bonds of Terror (linked with another player)
   	[SpellName(224508)] = 3,    -- Corruption Meteor (split damage debuff)
-- Dungeon
	-- Mythic+ Affixes
	[SpellName(221772)] = 5,	-- Overflowing
	[SpellName(209858)] = 5,	-- Necrotic
	[SpellName(226512)] = 5,	-- Sanguine
	-- Black Rook Hold
	-- Trash Mobs
	[SpellName(194969)] = 3,	-- Soul Echoes
	[SpellName(225962)] = 3,	-- Bloodthirsty Leap
	[SpellName(200261)] = 3,	-- Bonebreaking Strike
	[SpellName(222397)] = 3,	-- Boulder Crush
	[SpellName(214001)] = 3,	-- Raven's Dive
	-- Illysanna Ravencrest
	[SpellName(197546)] = 3,	-- Brutal Glaive
	[SpellName(197484)] = 3,	-- Dark Rush
	[SpellName(197687)] = 4,	-- Eye Beams
	-- Smashspite
	[SpellName(198446)] = 3,	-- Fel Vomit
	[SpellName(198245)] = 3,	-- Brutal Haymaker
	-- Lord Ravencrest
	[SpellName(201733)] = 3,	-- Stinging Swarm
	-- Court of Stars
	-- Trash Mobs
	[SpellName(209413)] = 3,	-- Suppress
	[SpellName(209512)] = 3,	-- Disrupting Energy
	[SpellName(211473)] = 3,	-- Shadow Slash
	[SpellName(211464)] = 3,	-- Fel Detonation
	[SpellName(207980)] = 3,	-- Disintegration Beam
	[SpellName(207979)] = 3,	-- Shockwave
	-- Advisor Melandrus
	[SpellName(209602)] = 3,	-- Blade Surge
	[SpellName(224333)] = 4,	-- Enveloping Winds
	-- Darkheart Thicket
	-- Trash Mobs
	[SpellName(200620)] = 3,	-- Frantic Rip
	[SpellName(225484)] = 3,	-- Grievous Rip
	[SpellName(200631)] = 4,	-- Unnerving Screech
	[SpellName(201400)] = 3,	-- Dread Inferno
	[SpellName(201361)] = 4,	-- Darksoul Bite
	-- Archdruid Glaidalis
	[SpellName(198408)] = 4,	-- Nightfall
	[SpellName(196376)] = 3,	-- Grievous Tear
	-- Shade of Xavius
	[SpellName(200289)] = 4,	-- Growing Paranoia
	[SpellName(200329)] = 4,	-- Overwhelming Terror
	[SpellName(200238)] = 3,	-- Feed on the Weak
	-- Eye of Azshara
	-- Trash Mobs
	[SpellName(196111)] = 4,	-- Jagged Claws
	[SpellName(195561)] = 3,	-- Blinding Peck
	-- Warlord Parjesh
	[SpellName(192094)] = 3,	-- Impaling Spear
	-- Serpentrix
	[SpellName(191855)] = 3,	-- Toxic Wound
	[SpellName(191858)] = 4,	-- Toxic Puddle
	-- King Deepbeard
	[SpellName(193018)] = 3,	-- Gaseous Bubbles
	-- Halls of Valor
	-- Trash Mobs
	[SpellName(198605)] = 3,	-- Thunderstrike
	[SpellName(199805)] = 3,	-- Crackle
	[SpellName(199050)] = 3,	-- Mortal Hew
	[SpellName(199341)] = 3,	-- Bear Trap
	[SpellName(196194)] = 3,	-- Raven's Dive
	[SpellName(199674)] = 3,	-- Wicked Dagger
	-- Hymdall
	[SpellName(193092)] = 3,	-- Bloodletting Sweep
	-- Hyrja
	[SpellName(192048)] = 3,	-- Expel Light
	-- Fenryr
	[SpellName(197556)] = 4,	-- Ravenous Leap
	[SpellName(196838)] = 3,	-- Scent of Blood
	[SpellName(196497)] = 4,	-- Ravenous Leap
	-- Odyn
	[SpellName(198088)] = 4,	-- Glowing Fragment
	-- Maw of Souls
	-- Trash Mobs
	[SpellName(201566)] = 3,	-- Swirling Muck
	[SpellName(191960)] = 5,	-- Barbed Spear
	[SpellName(199061)] = 4,	-- Hew Soul
	[SpellName(222397)] = 4,	-- Breach Armor
	[SpellName(201397)] = 4,	-- Brackwater Blast
	[SpellName(194102)] = 4,	-- Poisonous Sludge
	-- Harbaron
	[SpellName(194325)] = 3,	-- Fragment
	[SpellName(194235)] = 4,	-- Nether Rip
	-- Helya
	[SpellName(185539)] = 3,	-- Rapid Rupture
	-- Neltharion's Lair
	-- Trash Mobs
	[SpellName(226296)] = 3,	-- Piercing Shards
	[SpellName(193639)] = 4,	-- Bone Chomp
	[SpellName(202181)] = 3,	-- Stone Gaze
	[SpellName(186616)] = 3,	-- Petrified
	[SpellName(202231)] = 3,	-- Leech
	[SpellName(200154)] = 4,	-- Burning Hatred
	[SpellName(193585)] = 3,	-- Bound
	-- Rokmora
	[SpellName(192799)] = 3,	-- Choking Dust
	-- Naraxas
	[SpellName(205549)] = 3,	-- Rancid Maw
	-- The Arcway
	-- Trash Mobs
	[SpellName(202156)] = 4,	-- Corrosion
	[SpellName(210688)] = 3,	-- Collapsing Rift
	[SpellName(226269)] = 3,	-- Torment
	[SpellName(211756)] = 3,	-- Searing Wound
	[SpellName(211217)] = 3,	-- Arcane Slicer
	[SpellName(211543)] = 3,	-- Devour
	-- Corstilax
	[SpellName(195791)] = 3,	-- Quarantine
	-- Ivanyr
	[SpellName(196804)] = 3,	-- Nether Link
	[SpellName(196562)] = 3,	-- Volatile Magic
	-- Nal'tira
	[SpellName(200040)] = 4,	-- Nether Venom
	[SpellName(200227)] = 3,	-- Tangled Web
	-- Advisor Vandros
	[SpellName(220871)] = 3,	-- Unstable Mana
	-- Vault of the Wardens
	-- Trash Mobs
	[SpellName(191735)] = 3,	-- Deafening Screech
	[SpellName(210202)] = 4,	-- Foul Stench
	[SpellName(202658)] = 3,	-- Drain
	[SpellName(193164)] = 3,	-- Gift of the Doomsayer
	[SpellName(202615)] = 3,	-- Torment
	[SpellName(193969)] = 3,	-- Razors
	-- Inquisitor Tormentorum
	[SpellName(201488)] = 3,	-- Frightening Shout
	[SpellName(225416)] = 3,	-- Intercept
	[SpellName(214804)] = 3,	-- Seed of Corruption
	[SpellName(201488)] = 3,	-- Frightening Shout
	-- Glazer
	[SpellName(194945)] = 3,	-- Lingering Gaze
	-- Ash'Golm
	[SpellName(192519)] = 3,	-- Lava
	-- Cordana Felsong
	[SpellName(197541)] = 3,	-- Detonation
	[SpellName(213583)] = 4,	-- Deepening Shadows
	-- Violet Hold
	-- Trash Mobs
	[SpellName(204608)] = 3,	-- Fel Prison
	[SpellName(204901)] = 3,	-- Carrion Swarm
	[SpellName(205097)] = 3,	-- Fel Blind
	[SpellName(205096)] = 3,	-- Fel Poison
	-- Anub'esset
	[SpellName(202217)] = 3,	-- Mandible Strike
	-- Blood-Princess Thal'ena
	[SpellName(202779)] = 3,	-- Essence of the Blood Princess
	-- Millificent Manastorm
	[SpellName(201159)] = 3,	-- Delta Finger Laser X-treme
	-- Mindflayer Kaahrj
	[SpellName(197783)] = 3,	-- Shadow Crash
	-- Shivermaw
	[SpellName(201960)] = 3,	-- Ice Bomb
	[SpellName(202062)] = 3,	-- Frigid Winds
	-- Lord Malgath
[SpellName(204962)] = 3, -- Shadow Bomb
-----------------------------------------------------------------
-- Draenor
-----------------------------------------------------------------
-- Hellfire Citadel
	-- Hellfire Assault
	[SpellName(184369)] = 7,	-- Howling Axe
	[SpellName(180079)] = 4,	-- Fellfire Munition
	-- Fel Reaver
	[SpellName(179897)] = 6,	-- Blitz
	[SpellName(185978)] = 7,	-- Firebomb Vulnerability
	[SpellName(182373)] = 4,	-- Flame Vulnerability
	[SpellName(182280)] = 8,	-- Artillery
	[SpellName(182074)] = 3,	-- Immolation
	[SpellName(182001)] = 3,	-- Unstable Orb
	-- Gorefiend
	[SpellName(179867)] = 3,	-- Gorefiend's Corruption
	[SpellName(181295)] = 4,	-- Digest
	[SpellName(179977)] = 8,	-- Touch of Doom
	[SpellName(179864)] = 6,	-- Shadow of Death
	[SpellName(179909)] = 9,	-- Shared Fate
	-- Kilrogg Deadeye
	[SpellName(180389)] = 4,	-- Heart Seeker
	[SpellName(181488)] = 3,	-- Vision of Death
	-- Socrethar
	[SpellName(182038)] = 3,	-- Shattered Defense
	[SpellName(188666)] = 7,	-- Eternal Hunger (Mythic - Fixate)
	[SpellName(189627)] = 7,	-- Volatile Fel Orb (Fixate)
	[SpellName(180415)] = 4,	-- Fel Prison
	[SpellName(184124)] = 3,	-- Gift of the Man'ari
	[SpellName(189540)] = 4,	-- Overwhelming Power
	-- Xhul'horac
	[SpellName(188208)] = 7,	-- Ablaze
	[SpellName(186073)] = 7,	-- Felsinged
	[SpellName(186407)] = 8,	-- Fel Surge
	[SpellName(186500)] = 9,	-- Chains of Fel
	[SpellName(186063)] = 7,	-- Wasting Void
	[SpellName(186333)] = 8,	-- Void Surge
	[SpellName(186785)] = 6,	-- Withering Gaze
	[SpellName(186448)] = 6,	-- Felblaze Flurry
	-- Fel Lord Zakuun
	[SpellName(181508)] = 9,	-- Seed of Destruction
	[SpellName(181653)] = 7,	-- Fel Crystals
	[SpellName(179428)] = 8,	-- Rumbling Fissure
	[SpellName(182008)] = 3,	-- Latent Energy
	[SpellName(179407)] = 6,	-- Disembodied
	[SpellName(189032)] = 5,	-- Befouled
	-- Kormrok
	[SpellName(187819)] = 7,	-- Crush
	[SpellName(181345)] = 7,	-- Foul Crush (Tank)
	-- Tyrant Velhari
	[SpellName(185237)] = 6,	-- Touch of Harm
	[SpellName(185241)] = 7,	-- Edict of Condemnation
	[SpellName(180526)] = 7,	-- Font of Corruption
	[SpellName(180000)] = 6,	-- Seal of Decay
	-- Shadow-Lord Iskar
	[SpellName(181957)] = 9,	-- Phantasmal Wind
	[SpellName(182200)] = 4,	-- Fel Chakram
	[SpellName(182325)] = 2,	-- Phantasmal Wounds
	[SpellName(185239)] = 1,	-- Radiance of Anzu
	[SpellName(185510)] = 3,	-- Dark Bindings
	[SpellName(182600)] = 2,	-- Fel Fire
	[SpellName(179219)] = 3,	-- Phantasmal Fel Bomb
	[SpellName(181753)] = 3,	-- Fel Bomb
	-- Mannoroth
	[SpellName(181275)] = 8,	-- Curse of Legion
	[SpellName(181099)] = 7,	-- Mark of Doom
	[SpellName(181597)] = 4,	-- Mannoroth's Gaze
	[SpellName(182006)] = 4,	-- Empowered Mannoroth's Gaze
	[SpellName(181841)] = 6,	-- Shadowforce
	[SpellName(182088)] = 6,	-- Empowered Shadowforce
	-- Hellfire Council
	[SpellName(184360)] = 7,	-- Fel Rage
	[SpellName(184449)] = 5,	-- Mark of Necromancer
	[SpellName(184652)] = 3,	-- Reap
	-- Archimonde
	[SpellName(184964)] = 7,	-- Shackled Torment
	[SpellName(186123)] = 6,	-- Focused Chaos
	[SpellName(185014)] = 6,	-- Wrought Chaos
	[SpellName(189891)] = 8,	-- Nether Tear
	[SpellName(186961)] = 8,	-- Nether Banish
	[SpellName(183634)] = 7,	-- Shadowfel Burst
	[SpellName(189895)] = 6,	-- Void Star Fixate
	[SpellName(190049)] = 4,	-- Nether Corruption
	[SpellName(189897)] = 4,	-- Doomfire
	[SpellName(187742)] = 4,	-- Shadow Blast
-- Blackrock Foundry
	-- Gruul
	[SpellName(155080)] = 4,	-- Inferno Slice
	[SpellName(155078)] = 3,	-- Overwhelming Blows
	[SpellName(162322)] = 5,	-- Inferno Strike
	[SpellName(155506)] = 2,	-- Petrified
	[SpellName(173192)] = 4,	-- Cave In
	[SpellName(155326)] = 3,	-- Petrifying Slam
	[SpellName(165298)] = 4,	-- Flare (Mythic)
	-- Oregorger
	[SpellName(156203)] = 5,	-- Retched Blackrock
	[SpellName(156374)] = 5,	-- Explosive Shard
	[SpellName(156297)] = 3,	-- Acid Torrent
	[SpellName(173471)] = 4,	-- Acid Maw
	[SpellName(155900)] = 2,	-- Rolling Fury
	-- Blast Furnace
	[SpellName(156934)] = 5,	-- Rupture
	[SpellName(155192)] = 4,	-- Bomb
	[SpellName(176121)] = 6,	-- Volatile Fire
	[SpellName(155743)] = 5,	-- Slag Pool
	[SpellName(155240)] = 3,	-- Tempered
	[SpellName(155242)] = 3,	-- Heat
	[SpellName(155225)] = 5,	-- Melt
	-- Hans'gar and Franzok
	[SpellName(157139)] = 3,	-- Shattered Vertebrae
	[SpellName(160838)] = 2,	-- Disrupting Roar
	[SpellName(155818)] = 4,	-- Scorching Burns
	[SpellName(161570)] = 4,	-- Searing Plates
	[SpellName(157853)] = 4,	-- Aftershock
	-- Flamebender Ka'graz
	[SpellName(155074)] = 1,	-- Charring Breath
	[SpellName(155049)] = 2,	-- Singe
	[SpellName(154932)] = 4,	-- Molten Torrent
	[SpellName(155277)] = 5,	-- Blazing Radiance
	[SpellName(155314)] = 1,	-- Lava Slash
	[SpellName(163284)] = 2,	-- Rising Flames
	[SpellName(162293)] = 3,	-- Empowered Armament
	[SpellName(155493)] = 3,	-- Firestorm
	[SpellName(163633)] = 4,	-- Magma Monsoon
	-- Kromog
	[SpellName(156766)] = 1,	-- Warped Armor
	[SpellName(161839)] = 3,	-- Rune of Crushing Earth
	[SpellName(156844)] = 3,	-- Stone Breath
	-- Beastlord Darmac
	[SpellName(155365)] = 4,	-- Pinned Down
	[SpellName(155061)] = 1,	-- Rend and Tear
	[SpellName(154989)] = 3,	-- Inferno Breath
	[SpellName(154981)] = 5,	-- Conflagration
	[SpellName(155030)] = 2,	-- Seared Flesh
	[SpellName(155236)] = 2,	-- Crush Armor
	[SpellName(155499)] = 3,	-- Superheated Shrapnel
	[SpellName(155657)] = 4,	-- Flame Infusion
	[SpellName(159044)] = 1,	-- Epicenter
	[SpellName(162276)] = 3,	-- Unsteady Mythic
	[SpellName(155222)] = 4,	-- Tantrum
	-- Operator Thogar
	[SpellName(155921)] = 2,	-- Enkindle
	[SpellName(165195)] = 4,	-- Prototype Pulse Grenade
	[SpellName(156310)] = 3,	-- Lava Shock
	[SpellName(159481)] = 3,	-- Delayed Siege Bomb
	[SpellName(164380)] = 2,	-- Burning
	[SpellName(164280)] = 2,	-- Heat Blast
	[SpellName(155701)] = 3,	-- Serrated Slash
	-- Iron Maidens
	[SpellName(156629)] = 2,	-- Rapid Fire
	[SpellName(164264)] = 3,	-- Penetrating Shot
	[SpellName(158602)] = 1,	-- Dominator Blast
	[SpellName(156112)] = 4,	-- Convulsive Shadows
	[SpellName(158315)] = 2,	-- Dark Hunt
	[SpellName(159724)] = 3,	-- Blood Ritual
	[SpellName(158010)] = 2,	-- Bloodsoaked Heartseeker
	[SpellName(158692)] = 1,	-- Deadly Throw
	[SpellName(156601)] = 3,	-- Sanguine Strikes
	[SpellName(170395)] = 3,	-- Sorka Sprey
	[SpellName(170405)] = 3,	-- Maraks Blood Calling
	[SpellName(158686)] = 4,	-- Expose Armor
	[SpellName(159585)] = 5,	-- Deploy Turret
	-- Blackhand
	[SpellName(156096)] = 5,	-- Marked for Death
	[SpellName(156743)] = 4,	-- Impaled
	[SpellName(156047)] = 3,	-- Slagged
	[SpellName(156401)] = 3,	-- Molten Slag
	[SpellName(156404)] = 3,	-- Burned
	[SpellName(158054)] = 3,	-- Shattering Smash
	[SpellName(156888)] = 3,	-- Overheated
	[SpellName(157000)] = 5,	-- Attach Slag Bombs
	[SpellName(156999)] = 5,	-- Throw Slag Bombs
-- Highmaul
	--Trash
	[SpellName(175601)] = 3,	-- Tainted Claws
	[SpellName(175599)] = 3,	-- Devour
	[SpellName(172066)] = 3,	-- Radiating Poison
	[SpellName(166779)] = 3,	-- Staggering Blow
	[SpellName(175636)] = 3,	-- Rune of Destruction
	[SpellName(175654)] = 3,	-- Rune of Disintegration
	[SpellName(166185)] = 3,	-- Rending Slash
	[SpellName(166175)] = 3,	-- Earth Devastating Slam
	[SpellName(174404)] = 3,	-- Frozen Core
	[SpellName(173763)] = 3,	-- Wild Flames
	[SpellName(174500)] = 3,	-- Rending Throw
	[SpellName(174939)] = 3,	-- Time Stop
	[SpellName(172115)] = 3,	-- Earthen Thrust
	[SpellName(166200)] = 3,	-- Arcane Volatility
	[SpellName(174473)] = 3,	-- Corrupted Blood
	-- Kargath Bladefist
	[SpellName(158986)] = 2,	-- Berserker Rush
	[SpellName(159178)] = 5,	-- Open Wounds
	[SpellName(162497)] = 3,	-- On the Hunt
	[SpellName(159113)] = 5,	-- Impale
	[SpellName(159213)] = 3,	-- Monsters Brawl
	[SpellName(159410)] = 4,	-- Mauling Brew
	[SpellName(160521)] = 2,	-- Vile Breath
	[SpellName(159386)] = 3,	-- Iron Bomb
	[SpellName(159188)] = 3,	-- Grapple
	[SpellName(159202)] = 4,	-- Flame jet
	-- The Butcher
	[SpellName(156151)] = 3,	-- The Tenderizer
	[SpellName(156147)] = 5,	-- The Cleaver
	[SpellName(156152)] = 3,	-- Gushing Wounds
	[SpellName(163046)] = 4,	-- Pale Vitriol
	-- Tectus
	[SpellName(162346)] = 4,	-- Crystalline Barrage
	[SpellName(162892)] = 4,	-- Petrification
	[SpellName(162475)] = 5,	-- Tectonic Upheaval
	-- Brackenspore
	[SpellName(163242)] = 5,	-- Infesting Spores
	[SpellName(159426)] = 5,	-- Rejuvenating Spores
	[SpellName(163241)] = 4,	-- Rot
	[SpellName(159220)] = 2,	-- Necrotic Breath
	[SpellName(160179)] = 2,	-- Mind Fungus
	[SpellName(165223)] = 6,	-- Burning Infusion
	[SpellName(163666)] = 3,	-- Pulsing Heat
	[SpellName(163590)] = 5,	-- Creeping Moss
	[SpellName(159972)] = 3,	-- Flesh Eater
	-- Twin Ogron
	[SpellName(155569)] = 3,	-- Injured
	[SpellName(158241)] = 4,	-- Blaze
	[SpellName(163374)] = 4,	-- Arcane Volatility
	[SpellName(167200)] = 3,	-- Arcane Wound
	[SpellName(163297)] = 3,	-- Arcane Twisted
	[SpellName(158026)] = 5,	-- Enfeebling Roar
	[SpellName(159709)] = 5,	-- Weakened Defenses
	[SpellName(158200)] = 4,	-- Quake
	-- Koragh
	[SpellName(172813)] = 5,	-- Expel Magic: Frost
	[SpellName(162185)] = 5,	-- Expel Magic: Fire
	[SpellName(162184)] = 3,	-- Expel Magic: Shadow
	[SpellName(162186)] = 2,	-- Expel Magic: Arcane
	[SpellName(161345)] = 2,	-- Suppression Field
	[SpellName(161242)] = 3,	-- Caustic Energy
	[SpellName(172886)] = 4,	-- Mark of Nullification
	[SpellName(172895)] = 4,	-- Expel Magic: Fel
	[SpellName(163472)] = 2,	-- Dominating Power
	[SpellName(161358)] = 4,	-- Suppression Field
	[SpellName(156803)] = 3,	-- Nullification Barrier
	-- Imperator Mar'gok
	[SpellName(157763)] = 3,	-- Fixate
	[SpellName(159515)] = 4,	-- Accelerated Assault
	[SpellName(156225)] = 4,	-- Branded
	[SpellName(164004)] = 4,	-- Branded: Displacement
	[SpellName(164006)] = 4,	-- Branded: Replication
	[SpellName(164005)] = 4,	-- Branded: Fortification
	[SpellName(158605)] = 2,	-- Mark of Chaos
	[SpellName(164176)] = 2,	-- Mark of Chaos: Displacement
	[SpellName(164178)] = 2,	-- Mark of Chaos: Fortification
	[SpellName(164191)] = 2,	-- Mark of Chaos: Replication
	[SpellName(158619)] = 3,	-- Fetter
	[SpellName(157349)] = 4,	-- Force Nova
	[SpellName(164232)] = 4,	-- Force Nova: Displacement
	[SpellName(164235)] = 4,	-- Force Nova: Fortification
	[SpellName(164240)] = 4,	-- Force Nova: Replication
	[SpellName(165102)] = 4,	-- Infinite Darkness
	[SpellName(157801)] = 3,	-- Slow
-----------------------------------------------------------------
-- Pandaria
-----------------------------------------------------------------
-- Siege of Orgrimmar
	-- Immerseus
	[SpellName(143436)] = 3,	-- Corrosive Blast (Tank switch)
	-- The Fallen Protectors
	[SpellName(143434)] = 4,	-- Shadow Word: Bane (Dispel)
	[SpellName(143198)] = 3,	-- Garrote (DoT)
	[SpellName(143842)] = 5,	-- Mark of Anguish
	[SpellName(147383)] = 3,	-- Debilitation
	-- Norushen
	[SpellName(146124)] = 4,	-- Self Doubt (Tank switch)
	[SpellName(144514)] = 3,	-- Lingering Corruption (Dispel)
	-- Sha of Pride
	[SpellName(144358)] = 4,	-- Wounded Pride (Tank switch)
	[SpellName(144351)] = 3,	-- Mark of Arrogance (Dispel)
	[SpellName(146594)] = 3,	-- Gift of the Titans
	[SpellName(147207)] = 3,	-- Weakened Resolve (Heroic)
	-- Galakras
	[SpellName(147029)] = 3,	-- Flames of Galakrond (DoT)
	[SpellName(146902)] = 3,	-- Poison-Tipped Blades (Poison stacks)
	-- Iron Juggernaut
	[SpellName(144467)] = 4,	-- Ignite Armor (Tank stacks)
	[SpellName(144459)] = 3,	-- Laser Burn (DoT)
	-- Kor'kron Dark Shaman
	[SpellName(144215)] = 3,	-- Froststorm Strike (Tank stacks)
	[SpellName(144089)] = 3,	-- Toxic Mist (DoT)
	[SpellName(144330)] = 3,	-- Iron Prison (Heroic)
	-- General Nazgrim
	[SpellName(143494)] = 3,	-- Sundering Blow (Tank stacks)
	[SpellName(143638)] = 3,	-- Bonecracker (DoT)
	[SpellName(143431)] = 3,	-- Magistrike (Dispel)
	[SpellName(143480)] = 3,	-- Assassin's Mark (Fixate)
	-- Malkorok
	[SpellName(142990)] = 4,	-- Fatal Strike (Tank stacks)
	[SpellName(142864)] = 3,	-- Ancient Barrier
	[SpellName(142865)] = 3,	-- Strong Ancient Barrier
	[SpellName(142913)] = 4,	-- Displaced Energy (Dispel)
	-- Spoils of Pandaria
	[SpellName(145218)] = 3,	-- Harden Flesh (Dispel)
	[SpellName(146235)] = 3,	-- Breath of Fire (Dispel)
	-- Thok the Bloodthirsty
	[SpellName(143766)] = 3,	-- Panic (Tank stacks)
	[SpellName(143780)] = 3,	-- Acid Breath (Tank stacks)
	[SpellName(143773)] = 3,	-- Freezing Breath (Tank Stacks)
	[SpellName(143800)] = 3,	-- Icy Blood (Random Stacks)
	[SpellName(143767)] = 3,	-- Scorching Breath (Tank Stacks)
	[SpellName(143791)] = 3,	-- Corrosive Blood (Dispel)
	-- Siegecrafter Blackfuse
	[SpellName(143385)] = 3,	-- Electrostatic Charge (Tank stacks)
	[SpellName(144236)] = 3,	-- Pattern Recognition
	-- Paragons of the Klaxxi
	[SpellName(143974)] = 4,	-- Shield Bash (Tank stun)
	[SpellName(142315)] = 4,	-- Caustic Blood (Tank stacks)
	[SpellName(143701)] = 3,	-- Whirling (DoT)
	[SpellName(142948)] = 3,	-- Aim
	-- Garrosh Hellscream
	[SpellName(145183)] = 3,	-- Gripping Despair (Tank stacks)
	[SpellName(145195)] = 3,	-- Empowered Gripping Despair (Tank stacks)
	[SpellName(145065)] = 3,	-- Touch of Y'Shaarj
	[SpellName(145171)] = 3,	-- Empowered Touch of Y'Shaarj
-- Throne of Thunder
	-- Jin'rokh the Breaker
	[SpellName(137162)] = 4,	-- Static Burst (Tank switch)
	[SpellName(138349)] = 3,	-- Static Wound (Tank stacks)
	[SpellName(137371)] = 4,	-- Thundering Throw (Tank stun)
	[SpellName(138732)] = 3,	-- Ionization (Heroic - Dispel)
	[SpellName(137422)] = 3,	-- Focused Lightning (Fixated - Kiting)
	-- Horridon
	[SpellName(136767)] = 3,	-- Triple Puncture (Tank stacks)
	[SpellName(136708)] = 4,	-- Stone Gaze (Stun - Dispel)
	[SpellName(136654)] = 3,	-- Rending Charge (DoT)
	[SpellName(136719)] = 3,	-- Blazing Sunlight (Dispel)
	[SpellName(136587)] = 3,	-- Venom Bolt Volley (Dispel)
	[SpellName(136710)] = 3,	-- Deadly Plague (Dispel)
	[SpellName(136512)] = 3,	-- Hex of Confusion (Dispel)
	-- Council of Elders
	[SpellName(136903)] = 3,	-- Frigid Assault (Tank stacks)
	[SpellName(136922)] = 3,	-- Frostbite (DoT)
	[SpellName(136992)] = 3,	-- Biting Cold (DoT)
	[SpellName(136857)] = 4,	-- Entrapped (Dispel)
	[SpellName(137359)] = 3,	-- Marked Soul (Fixated - Kiting)
	[SpellName(137641)] = 3,	-- Soul Fragment (Heroic)
	-- Tortos
	[SpellName(136753)] = 3,	-- Slashing Talons (Tank DoT)
	[SpellName(137633)] = 3,	-- Crystal Shell (Heroic)
	[SpellName(140701)] = 4,	-- Crystal Shell: Full Capacity! (Heroic)
	-- Megaera
	[SpellName(137731)] = 3,	-- Ignite Flesh (Tank stacks)
	[SpellName(139843)] = 3,	-- Arctic Freeze (Tank stacks)
	[SpellName(139840)] = 3,	-- Rot Armor (Tank stacks)
	[SpellName(134391)] = 4,	-- Cinder (DoT - Dispell)
	[SpellName(139857)] = 4,	-- Torrent of Ice (Fixated - Kiting)
	[SpellName(140179)] = 4,	-- Suppression (Heroic - Dispell)
	-- Ji-Kun
	[SpellName(134366)] = 4,	-- Talon Rake (Tank stacks)
	[SpellName(140092)] = 3,	-- Infected Talons (Tank DoT)
	[SpellName(134256)] = 3,	-- Slimed (DoT)
	-- Durumu the Forgotten
	[SpellName(133768)] = 4,	-- Arterial Cut (Tank DoT)
	[SpellName(133767)] = 3,	-- Serious Wound (Tank stacks)
	[SpellName(133798)] = 3,	-- Life Drain (Stun)
	[SpellName(133597)] = 3,	-- Dark Parasite (Heroic - Dispel)
	-- Primordius
	[SpellName(136050)] = 3,	-- Malformed Blood (Tank stacks)
	[SpellName(136228)] = 4,	-- Volatile Pathogen (DoT)
	-- Dark Animus
	[SpellName(138569)] = 4,	-- Explosive Slam (Tank stacks)
	[SpellName(138609)] = 4,	-- Matter Swap (Dispel)
	[SpellName(138659)] = 3,	-- Touch of the Animus (DoT)
	-- Iron Qon
	[SpellName(134691)] = 3,	-- Impale (Tank stacks)
	[SpellName(136192)] = 4,	-- Lightning Storm (Stun)
	[SpellName(136193)] = 3,	-- Arcing Lightning
	-- Twin Consorts
	[SpellName(137408)] = 3,	-- Fan of Flames (Tank stacks)
	[SpellName(136722)] = 3,	-- Slumber Spores (Dispel)
	[SpellName(137341)] = 3,	-- Beast of Nightmares (Fixate)
	[SpellName(137360)] = 3,	-- Corrupted Healing (Healer stacks)
	-- Lei Shen
	[SpellName(135000)] = 3,	-- Decapitate (Tank only)
	[SpellName(136478)] = 3,	-- Fusion Slash (Tank only)
	[SpellName(136914)] = 3,	-- Electrical Shock (Tank staks)
	[SpellName(135695)] = 3,	-- Static Shock (Damage Split)
	[SpellName(136295)] = 3,	-- Overcharged
	[SpellName(139011)] = 3,	-- Helm of Command (Heroic)
	-- Ra-den
	[SpellName(138297)] = 3,	-- Unstable Vita
	[SpellName(138329)] = 3,	-- Unleashed Anima
	[SpellName(138372)] = 4,	-- Vita Sensitivity
-- Terrace of Endless Spring
	-- Protectors of the Endless
	[SpellName(117519)] = 3,	-- Touch of Sha
	[SpellName(117436)] = 4,	-- Lightning Prison
	-- Tsulong
	[SpellName(122752)] = 3,	-- Shadow Breath
	[SpellName(123011)] = 3,	-- Terrorize
	[SpellName(122777)] = 3,	-- Nightmares
	[SpellName(123036)] = 3,	-- Fright
	-- Lei Shi
	[SpellName(123121)] = 3,	-- Spray
	[SpellName(123705)] = 3,	-- Scary Fog
	-- Sha of Fear
	[SpellName(119086)] = 3,	-- Penetrating Bolt
	[SpellName(120669)] = 3,	-- Naked and Afraid
	[SpellName(120629)] = 3,	-- Huddle in Terror
-- Heart of Fear
	-- Imperial Vizier Zor'lok
	[SpellName(122761)] = 3,	-- Exhale
	[SpellName(122740)] = 3,	-- Convert
	-- Blade Lord Ta'yak
	[SpellName(123180)] = 3,	-- Wind Step
	[SpellName(123474)] = 3,	-- Overwhelming Assault
	-- Garalon
	[SpellName(122835)] = 3,	-- Pheromones
	[SpellName(123081)] = 4,	-- Pungency
	-- Wind Lord Mel'jarak
	[SpellName(129078)] = 4,	-- Amber Prison
	[SpellName(122055)] = 3,	-- Residue
	[SpellName(122064)] = 3,	-- Corrosive Resin
	[SpellName(123963)] = 4,	-- Kor'thik Strike
	-- Amber-Shaper Un'sok
	[SpellName(121949)] = 3,	-- Parasitic Growth
	[SpellName(122370)] = 3,	-- Reshape Life
	-- Grand Empress Shek'zeer
	[SpellName(123707)] = 3,	-- Eyes of the Empress
	[SpellName(123713)] = 3,	-- Servant of the Empress
	[SpellName(123788)] = 3,	-- Cry of Terror
	[SpellName(124849)] = 3,	-- Consuming Terror
	[SpellName(124863)] = 3,	-- Visions of Demise
-- Mogu'shan Vaults
	-- The Stone Guard
	[SpellName(125206)] = 3,	-- Rend Flesh
	[SpellName(130395)] = 3,	-- Jasper Chains
	[SpellName(116281)] = 3,	-- Cobalt Mine Blast
	-- Feng the Accursed
	[SpellName(131788)] = 3,	-- Lightning Lash
	[SpellName(116942)] = 3,	-- Flaming Spear
	[SpellName(131790)] = 3,	-- Arcane Shock
	[SpellName(131792)] = 3,	-- Shadowburn
	[SpellName(116374)] = 4,	-- Lightning Charge
	[SpellName(116784)] = 3,	-- Wildfire Spark
	[SpellName(116417)] = 3,	-- Arcane Resonance
	-- Gara'jal the Spiritbinder
	[SpellName(122151)] = 4,	-- Voodoo Doll
	[SpellName(116161)] = 3,	-- Crossed Over
	[SpellName(117723)] = 3,	-- Frail Soul
	-- The Spirit Kings
	[SpellName(117708)] = 3,	-- Maddening Shout
	[SpellName(118048)] = 3,	-- Pillaged
	[SpellName(118135)] = 3,	-- Pinned Down
	[SpellName(118163)] = 3,	-- Robbed Blind
	-- Elegon
	[SpellName(117878)] = 3,	-- Overcharged
	[SpellName(117949)] = 3,	-- Closed Circuit
	[SpellName(132222)] = 3,	-- Destabilizing Energies
	-- Will of the Emperor
	[SpellName(116835)] = 3,	-- Devastating Arc
	[SpellName(116778)] = 3,	-- Focused Defense
	[SpellName(116525)] = 3,	-- Focused Assault
-- Sha of Anger
	[SpellName(119626)] = 3,	-- Aggressive Behavior
-- Other
	[SpellName(87023)] = 4,		-- Cauterize
	[SpellName(94794)] = 4,		-- Rocket Fuel Leak
	[SpellName(116888)] = 4,	-- Shroud of Purgatory
	[SpellName(121175)] = 2,	-- Orb of Power
	-----------------------------------------------------------------
-- Other
-----------------------------------------------------------------
	[SpellName(87023)] = 4,		-- Cauterize
	[SpellName(94794)] = 4,		-- Rocket Fuel Leak
	[SpellName(116888)] = 4,	-- Shroud of Purgatory
	[SpellName(121175)] = 2,	-- Orb of Power	

-----------------------------------------------------------------
-- BFA Dungeon
-----------------------------------------------------------------
--Freehold
	[SpellName(258323)] = 3, -- Infected Wound
	[SpellName(257775)] = 3, -- Plague Step
	[SpellName(257908)] = 4, -- Oiled Blade
	[SpellName(257436)] = 3, -- Poisoning Strike
	[SpellName(274389)] = 3, -- Rat Traps
	[SpellName(274555)] = 4, -- Scabrous Bites
	[SpellName(258875)] = 4, -- Blackout Barrel
	[SpellName(256363)] = 3, -- Ripper Punch
	
--Shrine of the Storm
	[SpellName(264560)] = 3, -- Choking Brine
	[SpellName(268233)] = 4, -- Electrifying Shock
	[SpellName(268322)] = 3, -- Touch of the Drowned
	[SpellName(268896)] = 3, -- Mind Rend
	[SpellName(268104)] = 3, -- Explosive Void
	[SpellName(267034)] = 5, -- Whispers of Power
	[SpellName(276268)] = 3, -- Heaving Blow
	[SpellName(264166)] = 3, -- Undertow
	[SpellName(264526)] = 3, -- Grasp of the Depths
	[SpellName(274633)] = 4, -- Sundering Blow
	[SpellName(268214)] = 5, -- Carving Flesh
	[SpellName(267818)] = 4, -- Slicing Blast
	[SpellName(268309)] = 4, -- Unending Darkness
	[SpellName(268317)] = 4, -- Rip Mind
	[SpellName(268391)] = 3, -- Mental Assault
	[SpellName(274720)] = 3, -- Abyssal Strike
	[SpellName(269131)] = 4, -- Ancient Mindbender

--Siege of Boralus
	[SpellName(257168)] = 4, -- Cursed Slash
	[SpellName(272588)] = 4, -- Rotting Wounds
	[SpellName(272571)] = 4, -- Choking Waters
	[SpellName(274991)] = 3, -- Putrid Waters
	[SpellName(275835)] = 4, -- Stinging Venom Coating
	[SpellName(273930)] = 3, -- Hindering Cut
	[SpellName(257292)] = 3, -- Heavy Slash
	[SpellName(261428)] = 3, -- Hangman's Noose
	[SpellName(256897)] = 3, -- Clamping Jaws
	[SpellName(272874)] = 3, -- Trample
	[SpellName(273470)] = 3, -- Gut Shot
	[SpellName(272834)] = 3, -- Viscous Slobber
	[SpellName(257169)] = 4, -- Terrifying Roar
	[SpellName(272713)] = 3, -- Crushing Slam
	
-- Tol Dagor
	[SpellName(258128)] = 4, -- Debilitating Shout
	[SpellName(265889)] = 3, -- Torch Strike
	[SpellName(257791)] = 4, -- Howling Fear
	[SpellName(258864)] = 3, -- Suppression Fire
	[SpellName(257028)] = 4, -- Fuselighter
	[SpellName(258917)] = 3, -- Righteous Flames
	[SpellName(257777)] = 3, -- Crippling Shiv
	[SpellName(258079)] = 4, -- Massive Chomp
	[SpellName(258058)] = 4, -- Squeeze
	[SpellName(260016)] = 4, -- Itchy Bite
	[SpellName(257119)] = 5, -- Sand Trap
	[SpellName(260067)] = 3, -- Vicious Mauling
	[SpellName(258313)] = 3, -- Handcuff
	[SpellName(259711)] = 3, -- Lockdown
	[SpellName(256198)] = 3, -- Azerite Rounds: Incendiary
	[SpellName(256101)] = 4, -- Explosive Burst
	[SpellName(256044)] = 6, -- Deadeye
	[SpellName(256474)] = 4, -- Heartstopper Venom
	
--Waycrest Manor
	[SpellName(260703)] = 3, -- Unstable Runic Mark
	[SpellName(263905)] = 3, -- Marking Cleave
	[SpellName(265880)] = 4, -- Dread Mark
	[SpellName(265882)] = 3, -- Lingering Dread
	[SpellName(264105)] = 3, -- Runic Mark
	[SpellName(264050)] = 4, -- Infected Thorn
	[SpellName(261440)] = 4, -- Virulent Pathogen
	[SpellName(263891)] = 4, -- Grasping Thorns
	[SpellName(264378)] = 4, -- Fragment Soul
	[SpellName(266035)] = 3, -- Bone Splinter
	[SpellName(266036)] = 4, -- Drain Essence
	[SpellName(260907)] = 5, -- Soul Manipulation
	[SpellName(260741)] = 5, -- Jagged Nettles
	[SpellName(264556)] = 3, -- Tearing Strike
	[SpellName(265760)] = 5, -- Thorned Barrage
	[SpellName(260551)] = 3, -- Soul Thorns
	[SpellName(263943)] = 4, -- Etch
	[SpellName(265881)] = 4, -- Decaying Touch
	[SpellName(261438)] = 4, -- Wasting Strike
	[SpellName(268202)] = 5, -- Death Lens
	[SpellName(278456)] = 4, -- Infest
	
-- Atal'Dazar
	[SpellName(252781)] = 5, -- Unstable Hex
	[SpellName(250096)] = 5, -- Wracking Pain
	[SpellName(250371)] = 5, -- Lingering Nausea
	[SpellName(253562)] = 3, -- Wildfire
	[SpellName(255582)] = 4, -- Molten Gold
	[SpellName(255041)] = 4, -- Terrifying Screech
	[SpellName(255371)] = 4, -- Terrifying Visage
	[SpellName(252687)] = 4, -- Venomfang Strike
	[SpellName(254959)] = 5, -- Soulburn
	[SpellName(255814)] = 5, -- Rending Maul
	[SpellName(255421)] = 5, -- Devour
	[SpellName(255434)] = 4, -- Serrated Teeth
	[SpellName(256577)] = 5, -- Soulfeast
	
--King's Rest
	[SpellName(270492)] = 4, -- Hex
	[SpellName(267763)] = 4, -- Wretched Discharge
	[SpellName(276031)] = 4, -- Pit of Despair
	[SpellName(265773)] = 5, -- Spit Gold
	[SpellName(270920)] = 5, -- Seduction
	[SpellName(270865)] = 4, -- Hidden Blade
	[SpellName(271564)] = 4, -- Embalming Fluid
	[SpellName(270507)] = 4, -- Poison Barrage
	[SpellName(267273)] = 4, -- Poison Nova
	[SpellName(270003)] = 4, -- Suppression Slam
	[SpellName(270084)] = 3, -- Axe Barrage
	[SpellName(267618)] = 3, -- Drain Fluids
	[SpellName(267626)] = 5, -- Dessication
	[SpellName(270487)] = 4, -- Severing Blade
	[SpellName(266238)] = 5, -- Shattered Defenses
	[SpellName(266231)] = 4, -- Severing Axe
	[SpellName(266191)] = 5, -- Whirling Axes
	[SpellName(272388)] = 4, -- Shadow Barrage
	[SpellName(271640)] = 4, -- Dark Revelation
	[SpellName(268796)] = 5, -- Impaling Spear
	
--Motherlode
	[SpellName(263074)] = 4, -- Festering Bite
	[SpellName(280605)] = 4, -- Brain Freeze
	[SpellName(257337)] = 4, -- Shocking Claw
	[SpellName(270882)] = 5, -- Blazing Azerite
	[SpellName(268797)] = 4, -- Transmute: Enemy to Goo
	[SpellName(259856)] = 4, -- Chemical Burn
	[SpellName(269302)] = 3, -- Toxic Blades
	[SpellName(280604)] = 3, -- Iced Spritzer
	[SpellName(257371)] = 4, -- Tear Gas
	[SpellName(257544)] = 4, -- Jagged Cut
	[SpellName(268846)] = 4, -- Echo Blade
	[SpellName(262794)] = 5, -- Energy Lash
	[SpellName(262513)] = 5, -- Azerite Heartseeker
	[SpellName(260829)] = 5, -- Homing Missle (travelling)
	[SpellName(260838)] = 5, -- Homing Missle (exploded)
	[SpellName(263637)] = 4, -- Clothesline
	
--Temple of Sethraliss
	[SpellName(269686)] = 4, -- Plague
	[SpellName(268013)] = 3, -- Flame Shock
	[SpellName(268008)] = 4, -- Snake Charm
	[SpellName(273563)] = 4, -- Neurotoxin
	[SpellName(272657)] = 3, -- Noxious Breath
	[SpellName(267027)] = 3, -- Cytotoxin
	[SpellName(272699)] = 3, -- Venomous Spit
	[SpellName(263371)] = 4, -- Conduction
	[SpellName(272655)] = 4, -- Scouring Sand
	[SpellName(263914)] = 4, -- Blinding Sand
	[SpellName(263958)] = 5, -- A Knot of Snakes
	[SpellName(266923)] = 4, -- Galvanize
	[SpellName(268007)] = 4, -- Heart Attack
	
--Underrot
	[SpellName(265468)] = 4, -- Withering Curse
	[SpellName(278961)] = 4, -- Decaying Mind
	[SpellName(259714)] = 4, -- Decaying Spores
	[SpellName(272180)] = 4, -- Death Bolt
	[SpellName(272609)] = 4, -- Maddening Gaze
	[SpellName(269301)] = 4, -- Putrid Blood
	[SpellName(265533)] = 4, -- Blood Maw
	[SpellName(265019)] = 5, -- Savage Cleave
	[SpellName(265377)] = 4, -- Hooked Snare
	[SpellName(265625)] = 5, -- Dark Omen
	[SpellName(260685)] = 3, -- Taint of G'huun
	[SpellName(266107)] = 5, -- Thirst for Blood
	[SpellName(260455)] = 3, -- Serrated Fangs

-- Mythic+ Affixes (Legion, unsure if changes in BFA)
	[SpellName(226489)] = 5,	-- Sanguine Ichor
	[SpellName(209858)] = 5,	-- Necrotic Rot
	[SpellName(240559)] = 5,	-- Grievous Wound
	[SpellName(240443)] = 5,	-- Burst
	
-----------------------------------------------------------------
-- Uldir Raid
-----------------------------------------------------------------
-- Taloc
	[SpellName(270290)] = 5, -- Blood Storm
	[SpellName(271296)] = 5, -- Cudgel of Gore
	[SpellName(275270)] = 5, -- Fixate
	[SpellName(271224)] = 4, -- Plasma Discharge
	[SpellName(271225)] = 4, -- Plasma Discharge

-- MOTHER
	[SpellName(268277)] = 3, -- Purifying Flame
	[SpellName(268253)] = 3, -- Surgical Beam
	[SpellName(268095)] = 3, -- Cleansing Purge
	[SpellName(267787)] = 3, -- Sundering Scalpel
	[SpellName(268198)] = 3, -- Clinging Corruption
	[SpellName(267821)] = 3, -- Defense Grid
	[SpellName(267787)] = 5, -- Sanitizing Strike

-- Fetid Devourer
	[SpellName(262313)] = 5, -- Malodorous Miasma
	[SpellName(262292)] = 4, -- Rotting Regurgitation
	[SpellName(262314)] = 3, -- Putrid Paroxysm

-- Zek'voz, Herald of N'zoth
	[SpellName(265237)] = 6, -- Shatter
	[SpellName(265264)] = 5, -- Void Lash
	[SpellName(265360)] = 5, -- Roiling Deceit
	[SpellName(265662)] = 4, -- Corruptor's Pact
	[SpellName(265646)] = 5, -- Will of the Corruptor
	
-- Vectis
	[SpellName(265127)] = 4, -- Lingering Infection
	[SpellName(265178)] = 3, -- Evolving Affliction
	[SpellName(265206)] = 5, -- Immunosuppression
	[SpellName(265212)] = 5, -- Gestate
	[SpellName(265129)] = 4, -- Omega Vector
	[SpellName(267160)] = 4, -- Omega Vector
	[SpellName(267161)] = 4, -- Omega Vector
	[SpellName(267162)] = 4, -- Omega Vector
	[SpellName(267163)] = 4, -- Omega Vector
	[SpellName(267164)] = 4, -- Omega Vector

-- Zul, Reborn
	[SpellName(273365)] = 4, -- Dark Revelation
	[SpellName(273434)] = 5, -- Pit of Despair
	[SpellName(274195)] = 3, -- Corrupted Blood
	[SpellName(272018)] = 4, -- Absorbed in Darkness

-- Mythrax
	[SpellName(272336)] = 3, -- Annihilation
	[SpellName(272536)] = 5, -- Imminent Ruin
	[SpellName(274693)] = 4, -- Essence Shear
	[SpellName(272407)] = 3, -- Oblivion Sphere

-- G'huun
	[SpellName(263436)] = 5, -- Imperfect Physiology
	[SpellName(263227)] = 5, -- Putrid Blood
	[SpellName(263372)] = 4, -- Power Matrix
	[SpellName(272506)] = 4, -- Explosive Corruption
	[SpellName(267409)] = 4, -- Dark Bargain
	[SpellName(267430)] = 3, -- Torment
	[SpellName(263235)] = 5, -- Blood Feast
	[SpellName(270287)] = 3, -- Blighted Ground

-----------------------------------------------------------------
-- PvP
-----------------------------------------------------------------
	-- Death Knight
		[SpellName(108194)] = 3,	-- Asphyxiate
		[SpellName(91797)] = 3,		-- Monstrous Blow (Mutated Ghoul)
		[SpellName(91800)] = 3,		-- Gnaw (Ghoul)
		[SpellName(47476)] = 3,		-- Strangulate
		-- Druid
		[SpellName(33786)] = 3,		-- Cyclone
		[SpellName(78675)] = 3,		-- Solar Beam
		[SpellName(339)] = 2,		-- Entangling Roots
		-- Hunter
		[SpellName(3355)] = 3,		-- Freezing Trap
		[SpellName(19386)] = 3,		-- Wyvern Sting
		[SpellName(117526)] = 3,	-- Binding Shot
		[SpellName(24394)] = 3,		-- Intimidation
		-- Mage
		[SpellName(61305)] = 3,		-- Polymorph
		[SpellName(82691)] = 3,		-- Ring of Frost
		[SpellName(31661)] = 3,		-- Dragon's Breath
		[SpellName(122)] = 2,		-- Frost Nova
		-- Monk
		[SpellName(115078)] = 3,	-- Paralysis
		[SpellName(119381)] = 3,	-- Leg Sweep
		-- Paladin
		[SpellName(20066)] = 3,		-- Repentance
		[SpellName(853)] = 3,		-- Hammer of Justice
		[SpellName(105421)] = 3,	-- Blinding Light
		-- Priest
		[SpellName(605)] = 3,		-- Dominate Mind
		[SpellName(8122)] = 3,		-- Psychic Scream
		[SpellName(64044)] = 3,		-- Psychic Horror
		[SpellName(15487)] = 3,		-- Silence
		-- Rogue
		[SpellName(6770)] = 3,		-- Sap
		[SpellName(2094)] = 3,		-- Blind
		[SpellName(1776)] = 3,		-- Gouge
		[SpellName(1330)] = 3,		-- Garrote - Silence
		-- Shaman
		[SpellName(51514)] = 3,		-- Hex
		[SpellName(118905)] = 3,	-- Static Charge
		-- Warlock
		[SpellName(118699)] = 3,	-- Fear
		[SpellName(6789)] = 3,		-- Mortal Coil
		[SpellName(5484)] = 3,		-- Howl of Terror
		[SpellName(6358)] = 3,		-- Seduction (Succubus)
		[SpellName(115268)] = 3,	-- Mesmerize (Shivarra)
		[SpellName(30283)] = 3,		-- Shadowfury
		-- Warrior
		[SpellName(46968)] = 3,		-- Shockwave
		[SpellName(132169)] = 3,	-- Storm Bolt
		[SpellName(194958)] = 3,	-- Intimidating Shout
}

RaidDebuffsReverse = {
	--[spellID] = true,			-- Spell name
}

RaidDebuffsIgnore = {
	[142862] = true,			-- Ancient Barrier
	[138309] = true,			-- Slimed
	[166057] = true,			-- Biting Cold
	[137619] = true,			-- Marked for Death
}


SpawnMenu = function(self)
	local unit = self.unit:gsub("(.)", string.upper, 1)
	if unit == "Targettarget" or unit == "focustarget" or unit == "pettarget" then return end

	if _G[unit.."FrameDropDown"] then
		ToggleDropDownMenu(nil, nil, _G[unit.."FrameDropDown"], "cursor")
	elseif self.unit:match("party") then
		ToggleDropDownMenu(nil, nil, _G["PartyMemberFrame"..self.id.."DropDown"], "cursor")
	else
		FriendsDropDown.unit = self.unit
		FriendsDropDown.id = self.id
		FriendsDropDown.initialize = RaidFrameDropDown_Initialize
		ToggleDropDownMenu(nil, nil, FriendsDropDown, "cursor")
	end
end

PostUpdateRaidHealth = function(health, unit, min, max)
	local self = health:GetParent()
	local power = self.Power
	if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
		health:SetValue(0)
		if not UnitIsConnected(unit) then
			health.value:SetText("|cffD7BEA5".."Offline".."|r")
		elseif UnitIsDead(unit) then
			health.value:SetText("|cffD7BEA5".."Dead".."|r")
		elseif UnitIsGhost(unit) then
			health.value:SetText("|cffD7BEA5".."Ghost".."|r")
		end
	else
		local r, g, b
		if not UnitIsPlayer(unit) and UnitIsFriend(unit, "player") and Qulight.raidframes.own_color ~= true then
			local c = oUF_colors.reaction[5]
			local r, g, b = c[1], c[2], c[3]
			health:SetStatusBarColor(r, g, b)
			if health.bg and health.bg.multiplier then
				local mu = health.bg.multiplier
				health.bg:SetVertexColor(r * mu, g * mu, b * mu)
			end
		end
		if Qulight.raidframes.bar_color_value == true and not (UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit)) then
			if Qulight.raidframes.own_color == true then
				r, g, b = 0.4, 0.4, 0.4
			else
				r, g, b = health:GetStatusBarColor()
			end
			--local newr, newg, newb = oUF.ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

			health:SetStatusBarColor(newr, newg, newb)
			if health.bg and health.bg.multiplier then
				local mu = health.bg.multiplier
				health.bg:SetVertexColor(newr * mu, newg * mu, newb * mu)
			end
		end
		if min ~= max then
			--r, g, b = oUF.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
			if self:GetParent():GetName():match("oUF_PartyDPS") then
				if Qulight.raidframes.color_value == true then
					health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
				else
					health.value:SetFormattedText("|cffffffff%s - %d%%|r", ShortValue(min), floor(min / max * 100))
				end
			else
				if Qulight.raidframes.color_value == true then
					if Qulight.raidframes.deficit_health == true then
						health.value:SetText("|cffffffff".."-"..ShortValue(max - min))
					else
						health.value:SetFormattedText("|cff%02x%02x%02x%d%%|r", r * 255, g * 255, b * 255, floor(min / max * 100))
					end
				else
					if Qulight.raidframes.deficit_health == true then
						health.value:SetText("|cffffffff".."-"..ShortValue(max - min))
					else
						health.value:SetFormattedText("|cffffffff%d%%|r", floor(min / max * 100))
					end
				end
			end
		else
			if Qulight.raidframes.color_value == true then
				health.value:SetText("|cff559655"..ShortValue(max).."|r")
			else
				health.value:SetText("|cffffffff"..ShortValue(max).."|r")
			end
		end
		if Qulight.raidframes.alpha_health == true then
			if min / max > 0.95 then
				health:SetAlpha(0.6)
				power:SetAlpha(0.6)
			else
				health:SetAlpha(1)
				power:SetAlpha(1)
			end
		end
	end
end

local fs = function(parent, layer, font, fontsiz, outline, r, g, b, justify)
    local string = parent:CreateFontString(nil, layer)
    string:SetFont(font, fontsiz, outline)
    string:SetShadowOffset(1, 1)
    string:SetTextColor(r, g, b)
    if justify then
        string:SetJustifyH(justify)
    end
    return string
end

UpdateThreat = function(self, event, unit)
	if self.unit ~= unit then return end
	local threat = UnitThreatSituation(self.unit)
	if threat and threat > 1 then
		r, g, b = GetThreatStatusColor(threat)
	end
end

local CountOffSets = {
	TOPLEFT = {9, 0},
	TOPRIGHT = {-8, 0},
	BOTTOMLEFT = {9, 0},
	BOTTOMRIGHT = {-8, 0},
	LEFT = {9, 0},
	RIGHT = {-8, 0},
	TOP = {0, 0},
	BOTTOM = {0, 0},
}

CreateAuraWatchIcon = function(self, icon)
	CreateStyle(icon, 2)
	icon.icon:SetPoint("TOPLEFT", icon, 1, -1)
	icon.icon:SetPoint("BOTTOMRIGHT", icon, -1, 1)
	icon.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	icon.icon:SetDrawLayer("ARTWORK")
	if icon.cd then
		icon.cd:SetReverse(true)
	end
	icon.overlay:SetTexture()
end

CreateAuraWatch = function(self, unit)
	local auras = CreateFrame("Frame", nil, self)
	auras:SetPoint("TOPLEFT", self.Health, 0, 0)
	auras:SetPoint("BOTTOMRIGHT", self.Health, 0, 0)
	auras.icons = {}
	auras.PostCreateIcon = CreateAuraWatchIcon

	if not Qulight.raidframes.show_timer then
		auras.hideCooldown = true
	end

	local buffs = {}

	if RaidBuffs["ALL"] then
		for key, value in pairs(RaidBuffs["ALL"]) do
			tinsert(buffs, value)
		end
	end

	if RaidBuffs[myclass] then
		for key, value in pairs(RaidBuffs[myclass]) do
			tinsert(buffs, value)
		end
	end

	if buffs then
		for key, spell in pairs(buffs) do
			local icon = CreateFrame("Frame", nil, auras)
			icon.spellID = spell[1]
			icon.anyUnit = spell[4]
			icon.strictMatching = spell[5]
			icon:SetWidth(10)
			icon:SetHeight(10)
			icon:SetPoint(spell[2], 0, 0)

			local tex = icon:CreateTexture(nil, "OVERLAY")
			tex:SetAllPoints(icon)
			tex:SetTexture(Qulight["media"].blank)
			if spell[3] then
				tex:SetVertexColor(unpack(spell[3]))
			else
				tex:SetVertexColor(0.8, 0.8, 0.8)
			end

			local count = SetFontString(icon, Qulight["media"].pxfont, Qulight["raidframes"].fontsize, Qulight["raidframes"].outline)
			count:SetPoint("CENTER", unpack(CountOffSets[spell[2]]))
			icon.count = count

			auras.icons[spell[1]] = icon
		end
	end

	self.AuraWatch = auras
end

----------------------------------------------------------------------------------------
--	UnitFrames based on oUF_Caellian(by Caellian)
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF

-- Frame size
local unit_width = Qulight.raidframes.width
local unit_height = Qulight.raidframes.height

-- Create layout
local function Shared(self, unit)
	local unit = (self:GetParent():GetName():match("oUF_Party")) and "party"
	or (self:GetParent():GetName():match("oUF_Raid")) and "raid"

	-- Set our own colors
	self.colors = oUF_colors

	-- Register click
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	-- Menu
	self.menu = SpawnMenu

	-- Backdrop for every units
	CreateStyle(self, 4)

	-- Health bar
	self.Health = CreateFrame("StatusBar", nil, self)
	self.Health:SetPoint("TOPLEFT")
	self.Health:SetPoint("TOPRIGHT")
	if (self:GetAttribute("unitsuffix") == "pet" or self:GetAttribute("unitsuffix") == "target") then
		self.Health:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 3)
		self.Health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 3)
	else
		self.Health:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 0)
		self.Health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0)
	end
	self.Health:SetStatusBarTexture(Qulight.media.texture)
	self.Health.PostUpdate = function(health, unit)
		if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
			health:SetValue(0)
		end
	end

	if Qulight.raidframes.vertical_health == true then
		self.Health:SetOrientation("VERTICAL")
	end

	self.Health.PostUpdate = function(health, unit)
		if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
			health:SetValue(0)
		end
	end
	self.Health.frequentUpdates = true
	if Qulight.raidframes.own_color == true then
		self.Health.colorDisconnected = false
		self.Health.colorReaction = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor(0.1, 0.1, 0.1)
	else
		self.Health.colorDisconnected = true
		self.Health.colorReaction = true
		self.Health.colorClass = true
	end
	
	-- Health bar background
	self.Health.bg = self.Health:CreateTexture(nil, "BORDER")
	self.Health.bg:SetAllPoints(self.Health)
	self.Health.bg:SetTexture(Qulight.media.texture)
	
	if Qulight.raidframes.own_color == true then
		self.Health.bg:SetVertexColor(0.5, 0.5, 0.5, 1)
	else
		self.Health.bg.multiplier = 0.2
	end

	-- Names
	self.Info = SetFontString(self.Health, Qulight["media"].font, 10, Qulight["raidframes"].outline)
	if (self:GetAttribute("unitsuffix") == "pet" or self:GetAttribute("unitsuffix") == "target") and unit ~= "tank" then
		self.Info:SetPoint("TOP", self.Health, "TOP", 0, -2)
	else
		self.Info:SetPoint("TOP", self.Health, "TOP", 0, -2)
	end
	self:Tag(self.Info, "[GetNameColor][nameshort]")
	if Qulight.raidframes.hp_value == true then
		if not (self:GetAttribute("unitsuffix") == "pet" or (self:GetAttribute("unitsuffix") == "target" and unit ~= "tank")) then
			self.Health.value = SetFontString(self.Health, Qulight["media"].pxfont, 10, Qulight["raidframes"].outline)
			self.Health.value:SetPoint("BOTTOM", self.Health, "BOTTOM", 0, 7)
			self.Health.value:SetTextColor(1, 1, 1)
		end	
		self.Health.PostUpdate = PostUpdateRaidHealth	
	end
	
	if not (self:GetAttribute("unitsuffix") == "pet" or (self:GetAttribute("unitsuffix") == "target" and unit ~= "tank")) then
		if Qulight.raidframes.power == true then
		-- Power bar
		self.Power = CreateFrame("StatusBar", nil, self)
		self.Power:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 3, 3)
		self.Power:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -3, 3)
		self.Power:SetPoint("TOP", self, "BOTTOM", 0, 6)
		self.Power:SetStatusBarTexture(Qulight.media.texture)
		self.Power:SetFrameStrata("MEDIUM")
		CreateStyle(self.Power, 2)
		self.Power:SetWidth(unit_width)

		self.Power.PostUpdate = function(power, unit)
			if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
				power:SetValue(0)
			end
		end
		
		self.Power:SetFrameLevel(10)
		self.Power.frequentUpdates = true
		self.Power.colorDisconnected = true
		if Qulight.raidframes.own_color == true then
			self.Power.colorClass = true
		else
			self.Power.colorPower = true
		end

		-- Power bar background
		self.Power.bg = self.Power:CreateTexture(nil, "BORDER")
		self.Power.bg:SetAllPoints(self.Power)
		self.Power.bg:SetTexture(Qulight.media.texture)
		self.Power.bg:SetAlpha(1)
		self.Power.bg.multiplier = 0.2
		end
	end		

	-- Agro border
	if Qulight.raidframes.aggro_border == true then
		table.insert(self.__elements, UpdateThreat)
		self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateThreat)
		self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", UpdateThreat)
		self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", UpdateThreat)
	end

	-- Raid marks
	if Qulight.raidframes.icons_raid_mark == true then
		self.RaidTargetIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.RaidTargetIndicator:SetSize(15, 15)
		self.RaidTargetIndicator:SetTexture("Interface\\AddOns\\QulightUI\\Root\\Media\\raidicons")	
		self.RaidTargetIndicator:SetPoint("BOTTOM", self.Health, 0, 6)
	end

	-- LFD role icons
	if Qulight.raidframes.icons_role == true and not (self:GetAttribute("unitsuffix") == "target") then
        local lfd = fs(self.Health, "OVERLAY", fontsymbol, 10, OUTLINE, 1, 1, 1)
		lfd:SetPoint("TOPRIGHT", self.Health, 0, -3)
		lfd:SetJustifyH"LEFT"
	    self:Tag(lfd, '[LFD]')
	end

	-- Ready check icons
	if Qulight.raidframes.icons_ready_check == true and not (self:GetAttribute("unitsuffix") == "target" or self:GetAttribute("unitsuffix") == "targettarget") then
		self.ReadyCheck = self.Health:CreateTexture(nil, "OVERLAY")
		self.ReadyCheck:SetSize(12, 12)
		self.ReadyCheck:SetPoint("BOTTOMRIGHT", self.Health, 2, 5)
	end

	-- Leader/Assistant/ML icons
	if Qulight.raidframes.icons_leader == true and not (self:GetAttribute("unitsuffix") == "target" or self:GetAttribute("unitsuffix") == "targettarget") then
		-- Leader icon
		self.LeaderIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.LeaderIndicator:SetSize(12, 12)
		self.LeaderIndicator:SetPoint("TOPLEFT", self.Health, -3, 8)

		-- Assistant icon
		self.Assistant = self.Health:CreateTexture(nil, "OVERLAY")
		self.Assistant:SetSize(12, 12)
		self.Assistant:SetPoint("TOPLEFT", self.Health, -3, 8)

		-- Master looter icon
		self.AssistantIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.AssistantIndicator:SetSize(12, 12)
		self.AssistantIndicator:SetPoint("TOPRIGHT", self.Health, 3, 8)
	end

	-- Resurrect icon
	self.ResurrectIndicator = self.Health:CreateTexture(nil, "OVERLAY")
	self.ResurrectIndicator:SetSize(13, 13)
	self.ResurrectIndicator:SetPoint("BOTTOMRIGHT", self.Health, 2, -7)

	-- Debuff highlight
	if not (self:GetAttribute("unitsuffix") == "target" or self:GetAttribute("unitsuffix") == "targettarget") then
		self.DebuffHighlight = self.Health:CreateTexture(nil, "OVERLAY")
		self.DebuffHighlight:SetAllPoints(self.Health)
		self.DebuffHighlight:SetTexture([=[Interface\AddOns\QulightUI\Root\Media\white.tga]=])
		self.DebuffHighlight:SetVertexColor(0, 0, 0, 0)
		self.DebuffHighlight:SetBlendMode("ADD")
		self.DebuffHighlightAlpha = 1
		self.DebuffHighlightFilter = true
	end

	-- Incoming heal text/bar
	-- if Qulight.raidframes.plugins_healcomm == true then
		-- local mhpb = CreateFrame("StatusBar", nil, self.Health)
		-- if Qulight.raidframes.vertical_health == true then
			-- mhpb:SetOrientation("VERTICAL")
			-- mhpb:SetPoint("BOTTOM", self.Health:GetStatusBarTexture(), "TOP", 0, 0)
			-- mhpb:SetHeight(unit_height)
		-- else
			-- mhpb:SetPoint("TOPLEFT", self.Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
			-- mhpb:SetPoint("BOTTOMLEFT", self.Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		-- end
		-- mhpb:SetWidth(unit_width)
		-- mhpb:SetStatusBarTexture(Qulight.media.texture)
		-- mhpb:SetStatusBarColor(0, 1, 0.5, 0.2)

		-- local ohpb = CreateFrame("StatusBar", nil, self.Health)
		-- if Qulight.raidframes.vertical_health == true then
			-- ohpb:SetOrientation("VERTICAL")
			-- ohpb:SetPoint("BOTTOM", mhpb:GetStatusBarTexture(), "TOP", 0, 0)
			-- ohpb:SetHeight(unit_height)
		-- else
			-- ohpb:SetPoint("TOPLEFT", mhpb:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
			-- ohpb:SetPoint("BOTTOMLEFT", mhpb:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		-- end
		-- ohpb:SetWidth(unit_width)
		-- ohpb:SetStatusBarTexture(Qulight.media.texture)
		-- ohpb:SetStatusBarColor(0, 1, 0, 0.2)

		-- self.HealPrediction = {
			-- myBar = mhpb,
			-- otherBar = ohpb,
			-- maxOverflow = 1,
		-- }
	-- end

	-- Range alpha
	if Qulight.raidframes.show_range == true and not (self:GetAttribute("unitsuffix") == "target" or self:GetAttribute("unitsuffix") == "targettarget") then
		self.Range = {insideAlpha = 1, outsideAlpha = Qulight.raidframes.range_alpha}
	end

	-- Smooth bars
	--if Qulight.raidframes.plugins_smooth_bar == true then
		--self.Health.Smooth = true
		--if not (self:GetAttribute("unitsuffix") == "pet" or self:GetAttribute("unitsuffix") == "target") then
		--end
	--end

	if Qulight.raidframes.plugins_aura_watch == true and not (self:GetAttribute("unitsuffix") == "pet" or self:GetAttribute("unitsuffix") == "target" or self:GetAttribute("unitsuffix") == "targettarget") then
		-- Classbuffs
		--CreateAuraWatch(self, unit)

		-- Raid debuffs
		self.RaidDebuffs = CreateFrame("Frame", nil, self)
		self.RaidDebuffs:SetHeight(28)
		self.RaidDebuffs:SetWidth(28)
		self.RaidDebuffs:SetPoint("CENTER", self, 0, 1)
		self.RaidDebuffs:SetFrameStrata("MEDIUM")
		self.RaidDebuffs:SetFrameLevel(10)
		CreateStyle(self.RaidDebuffs, 2)

		self.RaidDebuffs.icon = self.RaidDebuffs:CreateTexture(nil, "BORDER")
		self.RaidDebuffs.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		self.RaidDebuffs.icon:SetPoint("TOPLEFT", 2, -2)
		self.RaidDebuffs.icon:SetPoint("BOTTOMRIGHT", -2, 2)

		if Qulight.raidframes.plugins_aura_watch_timer == true then
			self.RaidDebuffs.time = SetFontString(self.RaidDebuffs, Qulight["media"].pxfont, Qulight["raidframes"].fontsize, Qulight["raidframes"].outline)
			self.RaidDebuffs.time:SetPoint("CENTER", 1, 1)
			self.RaidDebuffs.time:SetTextColor(1, 1, 1)
		end

		self.RaidDebuffs.count = SetFontString(self.RaidDebuffs, Qulight["media"].pxfont, Qulight["raidframes"].fontsize, Qulight["raidframes"].outline)
		self.RaidDebuffs.count:SetPoint("BOTTOMRIGHT", self.RaidDebuffs, "BOTTOMRIGHT", 3, -1)
		self.RaidDebuffs.count:SetTextColor(1, 1, 1)

		if Qulight.raidframes.show_spiral == true then
			self.RaidDebuffs.cd = CreateFrame("Cooldown", nil, self.RaidDebuffs, "CooldownFrameTemplate")
			self.RaidDebuffs.cd:SetPoint("TOPLEFT", 2, -2)
			self.RaidDebuffs.cd:SetPoint("BOTTOMRIGHT", -2, 2)
			self.RaidDebuffs.cd:SetReverse(true)
			self.RaidDebuffs.cd:SetDrawEdge(false)
			self.RaidDebuffs.cd.noOCC = true
			self.RaidDebuffs.parent = CreateFrame("Frame", nil, self.RaidDebuffs)
			self.RaidDebuffs.parent:SetFrameLevel(self.RaidDebuffs.cd:GetFrameLevel() + 1)
			if Qulight.raidframes.plugins_aura_watch_timer == true then
				self.RaidDebuffs.time:SetParent(self.RaidDebuffs.parent)
			end
			self.RaidDebuffs.count:SetParent(self.RaidDebuffs.parent)
		end

		self.RaidDebuffs.ShowDispellableDebuff = Qulight.raidframes.plugins_debuffhighlight_icon
		self.RaidDebuffs.FilterDispellableDebuff = true
		self.RaidDebuffs.MatchBySpellName = true
		self.RaidDebuffs.Debuffs = RaidDebuffs
	end

	return self
end

oUF:Factory(function(self)
CompactRaidFrameManager:UnregisterAllEvents()
	CompactRaidFrameManager.Show = dummy
	CompactRaidFrameManager:Hide()

	CompactRaidFrameContainer:UnregisterAllEvents()
	CompactRaidFrameContainer.Show = dummy
	CompactRaidFrameContainer:Hide()
	oUF:RegisterStyle("QulightRaid", Shared)
	oUF:SetActiveStyle("QulightRaid")
	if Qulight.raidframes.show_party == true then
		-- Party
		local party = self:SpawnHeader("oUF_Party", nil, "custom [@raid6,exists][petbattle] hide;show",
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]],
			"initial-width", unit_width,
			"initial-height", unit_height,
			"showSolo", Qulight.raidframes.solo_mode,
			"showPlayer", Qulight.raidframes.player_in_party,
			"showParty", true,
			"showRaid", true,
			"xOffset", 5,
			"point", "LEFT"
		)
		if Qulight.raidframes.player_in_party == true then
			party:SetPoint("TOPLEFT", Anchorraid, Qulight.raidframes.party_heal)
		else
			party:SetPoint(Qulight.raidframes.party_heal[1], Qulight.raidframes.party_heal[2], Qulight.raidframes.party_heal[3], Qulight.raidframes.party_heal[4] + 32, Qulight.raidframes.party_heal[5])
		end

	end

	if Qulight.raidframes.show_raid == true then
		if Qulight.raidframes.raid_groups_vertical then
			-- Raid vertical
			local raid = {}
			for i = 1, Qulight.raidframes.raid_groups do
				local raidgroup = self:SpawnHeader("oUF_RaidHeal"..i, nil, "custom [@raid6,exists][petbattle] show;hide",
					"oUF-initialConfigFunction", [[
						local header = self:GetParent()
						self:SetWidth(header:GetAttribute("initial-width"))
						self:SetHeight(header:GetAttribute("initial-height"))
					]],
					"initial-width", unit_width,
					"initial-height", unit_height,
					"showRaid", true,
					"yOffset", -5,
					"point", "TOPLEFT",
					"groupFilter", tostring(i),
					"maxColumns", 5,
					"unitsPerColumn", 1,
					"columnSpacing", 5,
					"columnAnchorPoint", "TOP"
				)
				if i == 1 then
					raidgroup:SetPoint("TOPLEFT", Anchorraid, Qulight.raidframes.raid_heal)
				else
					raidgroup:SetPoint("TOPLEFT", raid[i-1], "TOPRIGHT", 5, 0)
				end
				raid[i] = raidgroup
			end
		else
			-- Raid horizontal
			local raid = {}
			for i = 1, Qulight.raidframes.raid_groups do
				local raidgroup = self:SpawnHeader("oUF_RaidHeal"..i, nil, "custom [@raid6,exists][petbattle] show;hide",
					"oUF-initialConfigFunction", [[
						local header = self:GetParent()
						self:SetWidth(header:GetAttribute("initial-width"))
						self:SetHeight(header:GetAttribute("initial-height"))
					]],
					"initial-width", unit_width,
					"initial-height", unit_height,
					"showRaid", true,
					"groupFilter", tostring(i),
					"point", "LEFT",
					"yOffset", -5,
					"maxColumns", 5,
					"unitsPerColumn", 1,
					"columnSpacing", 5,
					"columnAnchorPoint", "LEFT"
				)
				if i == 1 then
					raidgroup:SetPoint("TOPLEFT", Anchorraid, Qulight.raidframes.raid_heal)
				else
					raidgroup:SetPoint("TOPLEFT", raid[i-1], "BOTTOMLEFT", 0, -5)
				end
				raid[i] = raidgroup
			end
		end

	end
end)