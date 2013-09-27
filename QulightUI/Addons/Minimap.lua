if not Qulight["minimapp"].enable == true then return end

Minimap:ClearAllPoints()
Minimap:SetPoint("CENTER", minimaplol, "CENTER", 0, 0)
Minimap:SetSize(Qulight["minimapp"].size,Qulight["minimapp"].size)
local dummy = function() end
local _G = getfenv(0)

MinimapBorder:Hide()
MinimapBorderTop:Hide()
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MiniMapVoiceChatFrame:Hide()
MinimapNorthTag:SetTexture(nil)
MinimapZoneTextButton:Hide()

MiniMapTracking:Show()
local trackborder = CreateFrame("Frame", nil, UIParent)
trackborder:SetFrameLevel(4)
trackborder:SetFrameStrata("BACKGROUND")
trackborder:SetHeight(20)
trackborder:SetWidth(20)
trackborder:SetPoint("BOTTOMLEFT", minimaplol, "BOTTOMLEFT", 2, 2)
CreateShadow(trackborder)

MiniMapTrackingBackground:Hide()
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("CENTER", trackborder, 2, -2)
MiniMapTrackingButton:SetHighlightTexture(nil)
MiniMapTrackingButtonBorder:Hide()
MiniMapTrackingIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
MiniMapTrackingIcon:SetWidth(16)
MiniMapTrackingIcon:SetHeight(16)
	
GameTimeFrame:Hide()
MinimapCluster:EnableMouse(false)

MiniMapTrackingBackground:SetAlpha(0)
MiniMapTrackingButton:SetAlpha(0)
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("BOTTOMRIGHT", Minimap, 0, 0)
MiniMapTracking:SetScale(.9)

local function StripTextures(object, kill)
	for i=1, object:GetNumRegions() do
		local region = select(i, object:GetRegions())
		if region:GetObjectType() == "Texture" then
			if kill then
				region:Hide()
			else
				region:SetTexture(nil)
			end
		end
	end		
end

QueueStatusMinimapButton:SetParent(Minimap)
QueueStatusMinimapButton:ClearAllPoints()
QueueStatusMinimapButton:SetPoint("BOTTOMRIGHT", 0, 0)
QueueStatusMinimapButtonBorder:Hide()
StripTextures(QueueStatusFrame)
CreateShadow(QueueStatusFrame)

MiniMapWorldMapButton:Hide()

local function UpdateLFGTooltip()
QueueStatusFrame:ClearAllPoints()
QueueStatusFrame:SetPoint("TOPRIGHT", QueueStatusMinimapButton, "TOPLEFT", 0, 0)
end
QueueStatusFrame:HookScript("OnShow", UpdateLFGTooltip)
QueueStatusFrame:SetFrameStrata("TOOLTIP")

MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint("TOPRIGHT", Minimap, 0, 0)
MiniMapMailFrame:SetFrameStrata("LOW")
MiniMapMailIcon:SetTexture("Interface\\AddOns\\QulightUI\\Root\\Media\\mail.tga")
MiniMapMailBorder:Hide()

MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:Hide()

Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(self, d)
	if d > 0 then
		_G.MinimapZoomIn:Click()
	elseif d < 0 then
		_G.MinimapZoomOut:Click()
	end
end)

MiniMapInstanceDifficulty:SetParent(Minimap)
MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, 0, 0)
MiniMapInstanceDifficulty:SetScale(0.75)

GuildInstanceDifficulty:SetParent(Minimap)
GuildInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, 0, 0)
GuildInstanceDifficulty:SetScale(0.75)

MiniMapTrackingBackground:SetAlpha(1)
MiniMapTrackingButton:SetAlpha(1)
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("TOPLEFT", Minimap, 0, 0)
MiniMapTracking:SetScale(.9)


level = UnitLevel("player")
----------------------------------------------------------------------------------------
--	Right click menu
----------------------------------------------------------------------------------------
local menuFrame = CreateFrame("Frame", "MinimapRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local micromenu = {
	{text = CHARACTER_BUTTON, notCheckable = 1, func = function()
		ToggleCharacter("PaperDollFrame")
	end},
	{text = SPELLBOOK_ABILITIES_BUTTON, notCheckable = 1, func = function()
		if InCombatLockdown() then
			print("|cffffff00"..ERR_NOT_IN_COMBAT..".|r") return
		end
		ToggleSpellBook(BOOKTYPE_SPELL)
	end},
	{text = TALENTS_BUTTON, notCheckable = 1, func = function()
		if not PlayerTalentFrame then
			TalentFrame_LoadUI()
		end
		if level >= SHOW_TALENT_LEVEL then
			ToggleTalentFrame()
		else
			print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, SHOW_TALENT_LEVEL).."|r")
		end
	end},
	{text = ACHIEVEMENT_BUTTON, notCheckable = 1, func = function()
		ToggleAchievementFrame()
	end},
	{text = QUESTLOG_BUTTON, notCheckable = 1, func = function()
		ToggleFrame(QuestLogFrame)
	end},
	{text = ACHIEVEMENTS_GUILD_TAB, notCheckable = 1, func = function()
		if IsInGuild() then
			if not GuildFrame then
				LoadAddOn("Blizzard_GuildUI")
			end
			ToggleGuildFrame()
			GuildFrame_TabClicked(GuildFrameTab2)
		else
			if not LookingForGuildFrame then
				LoadAddOn("Blizzard_LookingForGuildUI")
			end
			if not LookingForGuildFrame then return end
			LookingForGuildFrame_Toggle()
		end
	end},
	{text = SOCIAL_BUTTON, notCheckable = 1, func = function()
		ToggleFriendsFrame(1)
	end},
	{text = PLAYER_V_PLAYER, notCheckable = 1, func = function()
		if level >= SHOW_PVP_LEVEL then
			TogglePVPUI()
		else
			print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, SHOW_PVP_LEVEL).."|r")
		end
	end},
	{text = DUNGEONS_BUTTON, notCheckable = 1, func = function()
		if level >= SHOW_LFD_LEVEL then
			PVEFrame_ToggleFrame()
		else
			print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, SHOW_LFD_LEVEL).."|r")
		end
	end},
	{text = LOOKING_FOR_RAID, notCheckable = 1, func = function()
		ToggleRaidFrame(3)
	end},
	{text = MOUNTS_AND_PETS, notCheckable = 1, func = function()
		TogglePetJournal()
	end},
	{text = ENCOUNTER_JOURNAL, notCheckable = 1, func = function()
		if not IsAddOnLoaded("Blizzard_EncounterJournal") then
			LoadAddOn("Blizzard_EncounterJournal")
		end
		ToggleEncounterJournal()
	end},
	{text = HELP_BUTTON, notCheckable = 1, func = function()
		ToggleHelpFrame()
	end},
	{text = L_MINIMAP_CALENDAR, notCheckable = 1, func = function()
		if not CalendarFrame then
			LoadAddOn("Blizzard_Calendar")
		end
		Calendar_Toggle()
	end},
	{text = BATTLEFIELD_MINIMAP, notCheckable = true, func = function()
		ToggleBattlefieldMinimap()
	end},

}

Minimap:SetScript("OnMouseUp", function(self, btn)
	if btn == "RightButton" then
		EasyMenu(micromenu, menuFrame, "cursor", 0, 0, "MENU", 2)
	
	else
		Minimap_OnClick(self)
	end
end)

Minimap:SetMaskTexture('Interface\\ChatFrame\\ChatFrameBackground')

if not IsAddOnLoaded("Blizzard_TimeManager") then
	LoadAddOn("Blizzard_TimeManager")
end
local function Kill(object)
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	end
	object.Show = dummy
	object:Hide()
end
local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
clockFrame:Hide()
clockTime:SetFont("Fonts\\FRIZQT__.ttf", 10, "OUTLINE")
clockTime:SetTextColor(1,1,1)
TimeManagerClockButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -1)
clockTime:Hide()
TimeManagerClockButton:Hide()