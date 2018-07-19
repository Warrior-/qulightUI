-----------------
-- Slash commands
-----------------
SlashCmdList["FRAME"] = function() print(GetMouseFocus():GetName()) end
SLASH_FRAME1 = "/gn"
SLASH_FRAME2 = "/frame"

SlashCmdList["GETPARENT"] = function() print(GetMouseFocus():GetParent():GetName()) end
SLASH_GETPARENT1 = "/gp"
SLASH_GETPARENT2 = "/parent"

SlashCmdList["RELOADUI"] = function() ReloadUI() end
SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = ".κδ"

SlashCmdList["RCSLASH"] = function() DoReadyCheck() end
SLASH_RCSLASH1 = "/rc"
SLASH_RCSLASH2 = "/κρ"

SlashCmdList["TICKET"] = function() ToggleHelpFrame() end
SLASH_TICKET1 = "/ticket"
SLASH_TICKET2 = "/gm"
SLASH_TICKET3 = "/γμ"

SLASH_FRAME1 = "/frame"
SlashCmdList["FRAME"] = function(arg)
	if arg ~= "" then
		arg = _G[arg]
	else
		arg = GetMouseFocus()
	end
	if arg ~= nil and arg:GetName() ~= nil then
		local SetPoint, relativeTo, relativePoint, xOfs, yOfs = arg:GetPoint()
		ChatFrame1:AddMessage("|cffCC0000----------------------------")
		ChatFrame1:AddMessage("Name: |cffFFD100"..arg:GetName())
		if arg:GetParent() and arg:GetParent():GetName() then
			ChatFrame1:AddMessage("Parent: |cffFFD100"..arg:GetParent():GetName())
		end
 
		ChatFrame1:AddMessage("Width: |cffFFD100"..format("%.2f",arg:GetWidth()))
		ChatFrame1:AddMessage("Height: |cffFFD100"..format("%.2f",arg:GetHeight()))
		ChatFrame1:AddMessage("Strata: |cffFFD100"..arg:GetFrameStrata())
		ChatFrame1:AddMessage("Level: |cffFFD100"..arg:GetFrameLevel())
 
		if xOfs then
			ChatFrame1:AddMessage("X: |cffFFD100"..format("%.2f",xOfs))
		end
		if yOfs then
			ChatFrame1:AddMessage("Y: |cffFFD100"..format("%.2f",yOfs))
		end
		if relativeTo and relativeTo:GetName() then
			ChatFrame1:AddMessage("SetPoint: |cffFFD100"..SetPoint.."|r anchored to "..relativeTo:GetName().."'s |cffFFD100"..relativePoint)
		end
		ChatFrame1:AddMessage("|cffCC0000----------------------------")
	elseif arg == nil then
		ChatFrame1:AddMessage("Invalid frame name")
	else
		ChatFrame1:AddMessage("Could not find frame info")
	end
end
-----------------
-- Check Player's Role
-----------------
CheckRole = function()
	local role = ""
	local tree = GetSpecialization()
	
	if tree then
		role = select(6, GetSpecializationInfo(tree))
	end

	return role
end
-----------------
-- wait Frame
-----------------
local waitTable = {}
local waitFrame
function Delay(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false
	end
	if(waitFrame == nil) then
		waitFrame = CreateFrame("Frame","WaitFrame", UIParent)
		waitFrame:SetScript("onUpdate",function (self,elapse)
			local count = #waitTable
			local i = 1
			while(i<=count) do
				local waitRecord = tremove(waitTable,i)
				local d = tremove(waitRecord,1)
				local f = tremove(waitRecord,1)
				local p = tremove(waitRecord,1)
				if(d>elapse) then
				  tinsert(waitTable,i,{d-elapse,f,p})
				  i = i + 1
				else
				  count = count - 1
				  f(unpack(p))
				end
			end
		end)
	end
	tinsert(waitTable,{delay,func,{...}})
	return true
end

local function AlertFrame_SetLootAnchors(alertAnchor)
	if MissingLootFrame:IsShown() then
		MissingLootFrame:ClearAllPoints()
		MissingLootFrame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
		if GroupLootContainer:IsShown() then
			GroupLootContainer:ClearAllPoints()
			GroupLootContainer:SetPoint(POSITION, MissingLootFrame, ANCHOR_POINT, 0, YOFFSET)
		end
	elseif GroupLootContainer:IsShown() then
		GroupLootContainer:ClearAllPoints()
		GroupLootContainer:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
--hooksecurefunc("AlertFrame_SetLootAnchors", AlertFrame_SetLootAnchors)

local function AlertFrame_SetLootWonAnchors(alertAnchor)
	for i = 1, #LOOT_WON_ALERT_FRAMES do
		local frame = LOOT_WON_ALERT_FRAMES[i]
		if frame:IsShown() then
			frame:ClearAllPoints()
			frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
			alertAnchor = frame
		end
	end
end
--hooksecurefunc("AlertFrame_SetLootWonAnchors", AlertFrame_SetLootWonAnchors)

local function AlertFrame_SetMoneyWonAnchors(alertAnchor)
	for i = 1, #MONEY_WON_ALERT_FRAMES do
		local frame = MONEY_WON_ALERT_FRAMES[i]
		if frame:IsShown() then
			frame:ClearAllPoints()
			frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
			alertAnchor = frame
		end
	end
end
--hooksecurefunc("AlertFrame_SetMoneyWonAnchors", AlertFrame_SetMoneyWonAnchors)

local function AlertFrame_SetAchievementAnchors(alertAnchor)
	if AchievementAlertFrame1 then
		for i = 1, MAX_ACHIEVEMENT_ALERTS do
			local frame = _G["AchievementAlertFrame"..i]
			if frame and frame:IsShown() then
				frame:ClearAllPoints()
				frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
				alertAnchor = frame
			end
		end
	end
end
--hooksecurefunc("AlertFrame_SetAchievementAnchors", AlertFrame_SetAchievementAnchors)

local function AlertFrame_SetCriteriaAnchors(alertAnchor)
	if CriteriaAlertFrame1 then
		for i = 1, MAX_ACHIEVEMENT_ALERTS do
			local frame = _G["CriteriaAlertFrame"..i]
			if frame and frame:IsShown() then
				frame:ClearAllPoints()
				frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
				alertAnchor = frame
			end
		end
	end
end
--hooksecurefunc("AlertFrame_SetCriteriaAnchors", AlertFrame_SetCriteriaAnchors)

local function AlertFrame_SetChallengeModeAnchors(alertAnchor)
	local frame = ChallengeModeAlertFrame1
	if frame:IsShown() then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
--hooksecurefunc("AlertFrame_SetChallengeModeAnchors", AlertFrame_SetChallengeModeAnchors)

local function AlertFrame_SetDungeonCompletionAnchors(alertAnchor)
	local frame = DungeonCompletionAlertFrame1
	if frame:IsShown() then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
--hooksecurefunc("AlertFrame_SetDungeonCompletionAnchors", AlertFrame_SetDungeonCompletionAnchors)

local function AlertFrame_SetScenarioAnchors(alertAnchor)
	local frame = ScenarioAlertFrame1
	if frame:IsShown() then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
--hooksecurefunc("AlertFrame_SetScenarioAnchors", AlertFrame_SetScenarioAnchors)

local function AlertFrame_SetGuildChallengeAnchors(alertAnchor)
	local frame = GuildChallengeAlertFrame
	if frame:IsShown() then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
--hooksecurefunc("AlertFrame_SetGuildChallengeAnchors", AlertFrame_SetGuildChallengeAnchors)

function AlertFrame_SetGarrisonBuildingAlertFrameAnchors(alertAnchor)
	local frame = GarrisonBuildingAlertFrame
	if frame:IsShown() then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
--hooksecurefunc("AlertFrame_SetGarrisonBuildingAlertFrameAnchors", AlertFrame_SetGarrisonBuildingAlertFrameAnchors)

function AlertFrame_SetGarrisonBuildingAlertFrameAnchors(alertAnchor)
	local frame = GarrisonBuildingAlertFrame
	if frame:IsShown() then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
--hooksecurefunc("AlertFrame_SetGarrisonMissionAlertFrameAnchors", AlertFrame_SetGarrisonMissionAlertFrameAnchors)

function AlertFrame_SetGarrisonBuildingAlertFrameAnchors(alertAnchor)
	local frame = GarrisonMissionAlertFrame
	if frame:IsShown() then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET)
	end
end
----------------------------------------------------------------------------------------
--	AutoInvite
----------------------------------------------------------------------------------------
if Qulight["general"].autoinvite then

	local CheckFriend = function(name)
		for i = 1, GetNumFriends() do
			if GetFriendInfo(i) == name then
				return true
			end
		end
		for i = 1, select(2, BNGetNumFriends()) do
			local presenceID, _, _, _, _, _, client, isOnline = BNGetFriendInfo(i)
			if client == "WoW" and isOnline then
				local _, toonName, _, realmName = BNGetToonInfo(presenceID)
				if name == toonName or name == toonName.."-"..realmName then
					return true
				end
			end
		end
		if IsInGuild() then
			for i = 1, GetNumGuildMembers() do
				if GetGuildRosterInfo(i) == name then
					return true
				end
			end
		end
	end

	local ai = CreateFrame("Frame")
	ai:RegisterEvent("PARTY_INVITE_REQUEST")
	ai:SetScript("OnEvent", function(self, event, name)
		if QueueStatusMinimapButton:IsShown() or GetNumGroupMembers() > 0 then return end
		if CheckFriend(name) then
			RaidNotice_AddMessage(RaidWarningFrame, "Accepted invite from: "..name, {r = 0.41, g = 0.8, b = 0.94}, 3)
			print(format("|cffffff00".."Accepted invite from: "..name.."."))
			AcceptGroup()
			for i = 1, STATICPOPUP_NUMDIALOGS do
				local frame = _G["StaticPopup"..i]
				if frame:IsVisible() and frame.which == "PARTY_INVITE" then
					frame.inviteAccepted = 1
					StaticPopup_Hide("PARTY_INVITE")
					return
				elseif frame:IsVisible() and frame.which == "PARTY_INVITE_XREALM" then
					frame.inviteAccepted = 1
					StaticPopup_Hide("PARTY_INVITE_XREALM")
					return
				end
			end
		else
			SendWho(name)
		end
end)
end

local function ForceTaintPopupHide()
 if GetBuildInfo == "5.4.1" then
  hooksecurefunc("StaticPopup_Show", function(which)
   if (which == "ADDON_ACTION_FORBIDDEN") then
    StaticPopup_Hide(which)
   end
  end)
 end
end

local Fixes = CreateFrame("Frame")
Fixes:RegisterEvent("PLAYER_ENTERING_WORLD")
Fixes:SetScript("OnEvent", function(self, event, ...)
 if event == "PLAYER_ENTERING_WORLD" then
  ForceTaintPopupHide()
  self:UnregisterEvent("PLAYER_ENTERING_WORLD")
 end
end)

----------------------------------------------------------------------------------------
--	Creating Coordinate 
----------------------------------------------------------------------------------------
local coords = CreateFrame("Frame", "CoordsFrame", WorldMapFrame)
coords:SetFrameLevel(90)
coords.PlayerText = coords:CreateFontString(nil, "ARTWORK", "GameFontNormal")
coords.PlayerText:SetPoint("BOTTOMLEFT", WorldMapFrame.UIElementsFrame, "BOTTOMLEFT", 5, 5)
coords.PlayerText:SetJustifyH("LEFT")
coords.PlayerText:SetText(UnitName("player")..": 0,0")
coords.PlayerText:SetTextColor(1, 1, 1)

coords.MouseText = coords:CreateFontString(nil, "ARTWORK", "GameFontNormal")
coords.MouseText:SetJustifyH("LEFT")
coords.MouseText:SetPoint("BOTTOMLEFT", coords.PlayerText, "TOPLEFT", 0, 5)
coords.MouseText:SetText("Mouse:   0, 0")
coords.MouseText:SetTextColor(1, 1, 1)

local int = 0
WorldMapFrame:HookScript("OnUpdate", function(self, elapsed)
	int = int + 1
	if int >= 3 then
		local x, y = GetPlayerMapPosition("player")

		if not GetPlayerMapPosition("player") then
			x = 0
			y = 0
		end

		x = math.floor(100 * x)
		y = math.floor(100 * y)
		if x ~= 0 and y ~= 0 then
			coords.PlayerText:SetText(UnitName("player")..":   "..x..", "..y)
		else
			coords.PlayerText:SetText(" ")
		end

		local scale = WorldMapDetailFrame:GetEffectiveScale()
		local width = WorldMapDetailFrame:GetWidth()
		local height = WorldMapDetailFrame:GetHeight()
		local centerX, centerY = WorldMapDetailFrame:GetCenter()
		local x, y = GetCursorPosition()
		local adjustedX = (x / scale - (centerX - (width/2))) / width
		local adjustedY = (centerY + (height/2) - y / scale) / height

		if adjustedX >= 0 and adjustedY >= 0 and adjustedX <= 1 and adjustedY <= 1 then
			adjustedX = math.floor(100 * adjustedX)
			adjustedY = math.floor(100 * adjustedY)
			coords.MouseText:SetText(MOUSE_LABEL..":   "..adjustedX..", "..adjustedY)
		else
			coords.MouseText:SetText(" ")
		end
		int = 0
	end
end)

----------------------------------------------------------------------------------------
--	Item level on slot buttons in Character/InspectFrame(iLevel by Sanex)
----------------------------------------------------------------------------------------
local _G = getfenv(0)
local equiped = {} -- Table to store equiped items

local f = CreateFrame("Frame", nil, _G.PaperDollFrame) -- iLvel number frame
local g -- iLvel number for Inspect frame
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

-- Tooltip and scanning by Phanx @ http://www.wowinterface.com/forums/showthread.php?p=271406
local S_ITEM_LEVEL = "^" .. gsub(ITEM_LEVEL, "%%d", "(%%d+)")

local scantip = CreateFrame("GameTooltip", "iLvlScanningTooltip", nil, "GameTooltipTemplate")
scantip:SetOwner(UIParent, "ANCHOR_NONE")

local function _getRealItemLevel(slotId, unit)
	local realItemLevel
	local hasItem = scantip:SetInventoryItem(unit, slotId)
	if not hasItem then return nil end -- With this we don't get ilvl for offhand if we equip 2h weapon

	for i = 2, scantip:NumLines() do -- Line 1 is always the name so you can skip it.
		local text = _G["iLvlScanningTooltipTextLeft"..i]:GetText()
		if text and text ~= "" then
			realItemLevel = realItemLevel or strmatch(text, S_ITEM_LEVEL)

			if realItemLevel then
				return tonumber(realItemLevel)
			end
 		end
	end

	return realItemLevel
end

local function _updateItems(unit, frame)
	for i = 1, 17 do -- Only check changed player items or items without ilvl text, skip the shirt (4) and always update Inspects
		local itemLink = GetInventoryItemLink(unit, i)
		if i ~= 4 and ((frame == f and (equiped[i] ~= itemLink or frame[i]:GetText() == nil)) or frame == g) then
			if frame == f then
				equiped[i] = itemLink
			end

			local delay = false
			if itemLink then
				local _, _, quality = GetItemInfo(itemLink)

				if (quality == 6) and (i == 16 or i == 17) then
					local relics = {select(4, strsplit(":", itemLink))}
					for i = 1, 3 do
						local relicID = relics[i] ~= "" and relics[i]
						local relicLink = select(2, GetItemGem(itemLink, i))
						if relicID and not relicLink then
							delay = true
						end
					end
					if delay then
						C_Timer.After(0.1, function()
							local realItemLevel = _getRealItemLevel(i, unit)
							realItemLevel = realItemLevel or ""
							frame[i]:SetText("|cFFFFFF00"..realItemLevel)
						end)
 					end
 				end
			end

			local realItemLevel = _getRealItemLevel(i, unit)
			realItemLevel = realItemLevel or ""
			if realItemLevel and realItemLevel == 1 then
				realItemLevel = ""
			end
			frame[i]:SetText("|cFFFFFF00"..realItemLevel)
 		end
 	end
end

local function _createStrings()
	local function _stringFactory(parent)
		local s = f:CreateFontString(nil, "OVERLAY", "SystemFont_Outline_Small")
		s:SetPoint("TOP", parent, "TOP", 0, -2)

		return s
	end

	f:SetFrameLevel(_G.CharacterHeadSlot:GetFrameLevel())

	f[1] = _stringFactory(_G.CharacterHeadSlot)
	f[2] = _stringFactory(_G.CharacterNeckSlot)
	f[3] = _stringFactory(_G.CharacterShoulderSlot)
	f[15] = _stringFactory(_G.CharacterBackSlot)
	f[5] = _stringFactory(_G.CharacterChestSlot)
	f[9] = _stringFactory(_G.CharacterWristSlot)

	f[10] = _stringFactory(_G.CharacterHandsSlot)
	f[6] = _stringFactory(_G.CharacterWaistSlot)
	f[7] = _stringFactory(_G.CharacterLegsSlot)
	f[8] = _stringFactory(_G.CharacterFeetSlot)
	f[11] = _stringFactory(_G.CharacterFinger0Slot)
	f[12] = _stringFactory(_G.CharacterFinger1Slot)
	f[13] = _stringFactory(_G.CharacterTrinket0Slot)
	f[14] = _stringFactory(_G.CharacterTrinket1Slot)

	f[16] = _stringFactory(_G.CharacterMainHandSlot)
	f[17] = _stringFactory(_G.CharacterSecondaryHandSlot)

	f:Hide()
end

local function _createGStrings()
	local function _stringFactory(parent)
		local s = g:CreateFontString(nil, "OVERLAY", "SystemFont_Outline_Small")
		s:SetPoint("TOP", parent, "TOP", 0, -2)

		return s
 	end

	g:SetFrameLevel(_G.InspectHeadSlot:GetFrameLevel())

	g[1] = _stringFactory(_G.InspectHeadSlot)
	g[2] = _stringFactory(_G.InspectNeckSlot)
	g[3] = _stringFactory(_G.InspectShoulderSlot)
	g[15] = _stringFactory(_G.InspectBackSlot)
	g[5] = _stringFactory(_G.InspectChestSlot)
	g[9] = _stringFactory(_G.InspectWristSlot)

	g[10] = _stringFactory(_G.InspectHandsSlot)
	g[6] = _stringFactory(_G.InspectWaistSlot)
	g[7] = _stringFactory(_G.InspectLegsSlot)
	g[8] = _stringFactory(_G.InspectFeetSlot)
	g[11] = _stringFactory(_G.InspectFinger0Slot)
	g[12] = _stringFactory(_G.InspectFinger1Slot)
	g[13] = _stringFactory(_G.InspectTrinket0Slot)
	g[14] = _stringFactory(_G.InspectTrinket1Slot)

	g[16] = _stringFactory(_G.InspectMainHandSlot)
	g[17] = _stringFactory(_G.InspectSecondaryHandSlot)

	g:Hide()
end

local function OnEvent(self, event, ...) -- Event handler
	if event == "ADDON_LOADED" and (...) == "Blizzard_InspectUI" then
		self:UnregisterEvent(event)

		g = CreateFrame("Frame", nil, _G.InspectPaperDollFrame) -- iLevel number frame for Inspect
		_createGStrings()
		_createGStrings = nil

		_G.InspectPaperDollFrame:HookScript("OnShow", function(self)
			g:SetFrameLevel(_G.InspectHeadSlot:GetFrameLevel())
			f:RegisterEvent("INSPECT_READY")
			f:RegisterEvent("UNIT_INVENTORY_CHANGED")
			_updateItems("target", g)
			g:Show()
		end)

		_G.InspectPaperDollFrame:HookScript("OnHide", function(self)
			f:UnregisterEvent("INSPECT_READY")
			f:UnregisterEvent("UNIT_INVENTORY_CHANGED")
			g:Hide()
		end)
	elseif event == "PLAYER_LOGIN" then
		self:UnregisterEvent(event)

		_createStrings()
		_createStrings = nil

		_G.PaperDollFrame:HookScript("OnShow", function(self)
			f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
			f:RegisterEvent("ITEM_UPGRADE_MASTER_UPDATE")
			f:RegisterEvent("ARTIFACT_UPDATE")
			f:RegisterEvent("SOCKET_INFO_UPDATE")
			f:RegisterEvent("COMBAT_RATING_UPDATE")
			_updateItems("player", f)
			f:Show()
		end)

		_G.PaperDollFrame:HookScript("OnHide", function(self)
			f:UnregisterEvent("PLAYER_EQUIPMENT_CHANGED")
			f:UnregisterEvent("ITEM_UPGRADE_MASTER_UPDATE")
			f:UnregisterEvent("ARTIFACT_UPDATE")
			f:UnregisterEvent("SOCKET_INFO_UPDATE")
			f:UnregisterEvent("COMBAT_RATING_UPDATE")
			f:Hide()
		end)
	elseif event == "PLAYER_EQUIPMENT_CHANGED" or event == "ITEM_UPGRADE_MASTER_UPDATE"
	or event == "ARTIFACT_UPDATE" or event == "SOCKET_INFO_UPDATE" or event == "COMBAT_RATING_UPDATE" then
		if (...) == 16 then
			equiped[16] = nil
			equiped[17] = nil
		end
		_updateItems("player", f)
	elseif event == "INSPECT_READY" or event == "UNIT_INVENTORY_CHANGED" then
		_updateItems("target", g)
	end
end
f:SetScript("OnEvent", OnEvent)