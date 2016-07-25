if not Qulight["chatt"].enable == true then return end

RGBToHex1 = function(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("|cff%02x%02x%02x", r*255, g*255, b*255)
end

local origs = {}

local function Strip(info, name)
	return string.format("|Hplayer:%s|h[%s]|h", info, name:gsub("%-[^|]+", ""))
end

-- Function to rename channel and other stuff
local AddMessage = function(self, text, ...)
	if type(text) == "string" then
		text = text:gsub("|h%[(%d+)%. .-%]|h", "|h[%1]|h")
		text = text:gsub("|Hplayer:(.-)|h%[(.-)%]|h", Strip)
	end
	return origs[self](self, text, ...)
end

-- Global strings
_G.CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE_CHAT|h[".."R".."]|h %s:\32"
_G.CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE_CHAT|h[".."RL".."]|h %s:\32"
_G.CHAT_BN_WHISPER_GET = "Fr".." %s:\32"
_G.CHAT_GUILD_GET = "|Hchannel:GUILD|h[".."G".."]|h %s:\32"
_G.CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[".."O".."]|h %s:\32"
_G.CHAT_PARTY_GET = "|Hchannel:PARTY|h[".."P".."]|h %s:\32"
_G.CHAT_PARTY_LEADER_GET = "|Hchannel:PARTY|h[".."PL".."]|h %s:\32"
_G.CHAT_PARTY_GUIDE_GET = CHAT_PARTY_LEADER_GET
_G.CHAT_RAID_GET = "|Hchannel:RAID|h[".."R".."]|h %s:\32"
_G.CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[".."RL".."]|h %s:\32"
_G.CHAT_RAID_WARNING_GET = "[".."RW".."] %s:\32"
_G.CHAT_PET_BATTLE_COMBAT_LOG_GET = "|Hchannel:PET_BATTLE_COMBAT_LOG|h[".."PB".."]|h:\32"
_G.CHAT_PET_BATTLE_INFO_GET = "|Hchannel:PET_BATTLE_INFO|h[".."PB".."]|h:\32"
_G.CHAT_SAY_GET = "%s:\32"
_G.CHAT_WHISPER_GET = "Fr".." %s:\32"
_G.CHAT_YELL_GET = "%s:\32"
_G.CHAT_FLAG_AFK = "|cffE7E716".."[AFK]".."|r "
_G.CHAT_FLAG_DND = "|cffFF0000".."[DND]".."|r "
_G.CHAT_FLAG_GM = "|cff4154F5".."[GM]".."|r "
_G.ERR_FRIEND_ONLINE_SS = "|Hplayer:%s|h[%s]|h ".."has come |cff298F00online|r."
_G.ERR_FRIEND_OFFLINE_S = "[%s] ".."has gone |cffff0000offline|r."

local function Kill(object)
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	end
	object.Show = dummy
	object:Hide()
end
dummy = function() return end

Kill(FriendsMicroButton)
Kill(ChatFrameMenuButton)

local function CreateBackdrop(f, t, tex)
	if f.backdrop then return end
	
	local b = CreateFrame("Frame", nil, f)
	b:SetPoint("TOPLEFT", -2, 2)
	b:SetPoint("BOTTOMRIGHT", 2, -2)
	CreateStyle(b, 2)
	
	f.backdrop = b
end

local function StripTextures(object, kill)
	for i = 1, object:GetNumRegions() do
		local region = select(i, object:GetRegions())
		if region:GetObjectType() == "Texture" then
			if kill then
				Kill(region)
			else
				region:SetTexture(nil)
			end
		end
	end
end
-- Set chat style
local function SetChatStyle(frame)
	local id = frame:GetID()
	local chat = frame:GetName()

	_G[chat]:SetFrameLevel(5)

	-- Removes crap from the bottom of the chatbox so it can go to the bottom of the screen
	_G[chat]:SetClampedToScreen(false)

	-- Stop the chat chat from fading out
	_G[chat]:SetFading(false)

	-- Hide textures
	for j = 1, #CHAT_FRAME_TEXTURES do
		_G[chat..CHAT_FRAME_TEXTURES[j]]:SetTexture(nil)
	end

	-- Removes Default ChatFrame Tabs texture
	Kill(_G[format("ChatFrame%sTabLeft", id)])
	Kill(_G[format("ChatFrame%sTabMiddle", id)])
	Kill(_G[format("ChatFrame%sTabRight", id)])

	Kill(_G[format("ChatFrame%sTabSelectedLeft", id)])
	Kill(_G[format("ChatFrame%sTabSelectedMiddle", id)])
	Kill(_G[format("ChatFrame%sTabSelectedRight", id)])

	Kill(_G[format("ChatFrame%sTabHighlightLeft", id)])
	Kill(_G[format("ChatFrame%sTabHighlightMiddle", id)])
	Kill(_G[format("ChatFrame%sTabHighlightRight", id)])

	-- Killing off the new chat tab selected feature
	Kill(_G[format("ChatFrame%sTabSelectedLeft", id)])
	Kill(_G[format("ChatFrame%sTabSelectedMiddle", id)])
	Kill(_G[format("ChatFrame%sTabSelectedRight", id)])

	Kill(_G[format("ChatFrame%sButtonFrameUpButton", id)])
	Kill(_G[format("ChatFrame%sButtonFrameDownButton", id)])
	Kill(_G[format("ChatFrame%sButtonFrameBottomButton", id)])
	Kill(_G[format("ChatFrame%sButtonFrameMinimizeButton", id)])
	Kill(_G[format("ChatFrame%sButtonFrame", id)])
	
	Kill(_G[format("ChatFrame%sEditBoxFocusLeft", id)])
	Kill(_G[format("ChatFrame%sEditBoxFocusMid", id)])
	Kill(_G[format("ChatFrame%sEditBoxFocusRight", id)])
	
	-- Kills off the retarded new circle around the editbox
	Kill(_G[format("ChatFrame%sEditBoxLeft", id)])
	Kill(_G[format("ChatFrame%sEditBoxMid", id)])
	Kill(_G[format("ChatFrame%sEditBoxRight", id)])

	Kill(_G[format("ChatFrame%sTabGlow", id)])
	
	
	
	-- Kill bubble tex/glow
	if _G[chat.."Tab"].conversationIcon then Kill(_G[chat.."Tab"].conversationIcon) end

	-- Disable alt key usage
	_G[chat.."EditBox"]:SetAltArrowKeyMode(false)
	_G[chat.."EditBox"]:Hide()
	
		-- Script to hide editbox instead of fading editbox to 0.35 alpha via IM Style
	_G[chat.."EditBox"]:HookScript("OnEditFocusGained", function(self) self:Show() end)
	_G[chat.."EditBox"]:HookScript("OnEditFocusLost", function(self) self:Hide() end)
	
	_G[chat.."Tab"]:HookScript("OnClick", function() _G[chat.."EditBox"]:Hide() end)

	local editbox = _G["ChatFrame"..id.."EditBox"]
	local left, mid, right = select(6, editbox:GetRegions())
	Kill(left); Kill(mid); Kill(right)
	editbox:ClearAllPoints();
	editbox:SetPoint("CENTER", DataLeftPanel)
	editbox:SetWidth(440)
	editbox:SetHeight(15)
	editbox:SetFrameLevel(1)
	CreateStyle(editbox, 2, 1 , 1, 1)

	
	-- Rename combat log tab
	if _G[chat] == _G["ChatFrame2"] then
		StripTextures(CombatLogQuickButtonFrame_Custom)
		CreateBackdrop(CombatLogQuickButtonFrame_Custom)
		CombatLogQuickButtonFrame_Custom.backdrop:SetPoint("TOPLEFT", 1, -4)
		CombatLogQuickButtonFrame_Custom.backdrop:SetPoint("BOTTOMRIGHT", 0, 0)
		CombatLogQuickButtonFrame_CustomAdditionalFilterButton:SetSize(12, 12)
		CombatLogQuickButtonFrame_CustomAdditionalFilterButton:SetHitRectInsets (0, 0, 0, 0)
		CombatLogQuickButtonFrame_CustomProgressBar:ClearAllPoints()
		CombatLogQuickButtonFrame_CustomProgressBar:SetPoint("TOPLEFT", CombatLogQuickButtonFrame_Custom.backdrop, 2, -2)
		CombatLogQuickButtonFrame_CustomProgressBar:SetPoint("BOTTOMRIGHT", CombatLogQuickButtonFrame_Custom.backdrop, -2, 2)
		CombatLogQuickButtonFrame_CustomProgressBar:SetStatusBarTexture(Qulight["media"].texture)
		CombatLogQuickButtonFrameButton1:SetPoint("BOTTOM", 0, 0)
	end

	frame.skinned = true
end

-- Setup chatframes 1 to 10 on login
local function SetupChat(self)
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		SetChatStyle(frame)
	end

	-- Remember last channel
	local var
	if Qulight["chatt"].sticky == true then
		var = 1
	else
		var = 0
	end
	ChatTypeInfo.SAY.sticky = var
	ChatTypeInfo.PARTY.sticky = var
	ChatTypeInfo.PARTY_LEADER.sticky = var
	ChatTypeInfo.GUILD.sticky = var
	ChatTypeInfo.OFFICER.sticky = var
	ChatTypeInfo.RAID.sticky = var
	ChatTypeInfo.RAID_WARNING.sticky = var
	ChatTypeInfo.INSTANCE_CHAT.sticky = var
	ChatTypeInfo.INSTANCE_CHAT_LEADER.sticky = var
	ChatTypeInfo.WHISPER.sticky = var
	ChatTypeInfo.BN_WHISPER.sticky = var
	ChatTypeInfo.CHANNEL.sticky = var
end

local function SetupChatPosAndFont(self)
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format("ChatFrame%s", i)]
		local id = chat:GetID()
		local _, fontSize = FCF_GetChatWindowInfo(id)

		-- Min. size for chat font
		if fontSize < 11 then
			FCF_SetChatWindowFontSize(nil, chat, 11)
		else
			FCF_SetChatWindowFontSize(nil, chat, fontSize)
		end

		-- Font and font style for chat
		chat:SetFont(Qulight["media"].font, Qulight["media"].fontsize, "OVERLAY")
		chat:SetShadowOffset(1, -1)

		-- Force chat position
		if i == 1 then
			chat:ClearAllPoints()
			chat:SetSize(410, 124)
			chat:SetPoint("BOTTOMLEFT", ChatBackground, "BOTTOMLEFT", 6, 22)
			
			FCF_SavePositionAndDimensions(chat)
		elseif i == 2 then
			if Qulight["chatt"].combatlog ~= true then
				FCF_DockFrame(chat)
				ChatFrame2Tab:EnableMouse(false)
				ChatFrame2Tab:SetText("")
				ChatFrame2Tab.SetText = dummy
				ChatFrame2Tab:SetWidth(0.001)
				ChatFrame2Tab.SetWidth = dummy
			end
		end
	end

	-- Reposition battle.net popup over chat #1
		BNToastFrame:HookScript("OnShow", function(self)
		self:ClearAllPoints()
		self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 3,200)
	end)
end

local UIChat = CreateFrame("Frame")
UIChat:RegisterEvent("ADDON_LOADED")
UIChat:RegisterEvent("PLAYER_ENTERING_WORLD")
UIChat:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" then
		if addon == "Blizzard_CombatLog" then
			self:UnregisterEvent("ADDON_LOADED")
			SetupChat(self)
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		SetupChatPosAndFont(self)
	end
end)

-- Setup temp chat (BN, WHISPER) when needed
local function SetupTempChat()
	local frame = FCF_GetCurrentChatFrame()
	if frame.skinned then return end
	SetChatStyle(frame)
end
hooksecurefunc("FCF_OpenTemporaryWindow", SetupTempChat)

-- Disable pet battle tab
local old = FCFManager_GetNumDedicatedFrames
function FCFManager_GetNumDedicatedFrames(...)
	return select(1, ...) ~= "PET_BATTLE_COMBAT_LOG" and old(...) or 1
end

realm = GetRealmName()

-- Remove player's realm name
local function RemoveRealmName(self, event, msg, author, ...)
	local realm = string.gsub(realm, " ", "")
	if msg:find("-" .. realm) then
		return false, gsub(msg, "%-"..realm, ""), author, ...
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", RemoveRealmName)

----------------------------------------------------------------------------------------
--	Save slash command typo
----------------------------------------------------------------------------------------
local function TypoHistory_Posthook_AddMessage(chat, text)
	if strfind(text, HELP_TEXT_SIMPLE) then
		ChatEdit_AddHistory(chat.editBox)
	end
end

for i = 1, NUM_CHAT_WINDOWS do
	if i ~= 2 then
		hooksecurefunc(_G["ChatFrame"..i], "AddMessage", TypoHistory_Posthook_AddMessage)
	end
end


----------------------------------------------------------------------------------------
--	Based on Fane(by Haste)
----------------------------------------------------------------------------------------
local Fane = CreateFrame("Frame")

local updateFS = function(self, inc, ...)
	local fstring = self:GetFontString()

	fstring:SetFont(Qulight["media"].font, Qulight["media"].fontsize, "OVERLAY")
	fstring:SetShadowOffset(1, -1)

	if (...) then
		fstring:SetTextColor(...)
	end
end

local OnEnter = function(self)
	local emphasis = _G["ChatFrame"..self:GetID().."TabFlash"]:IsShown()
	updateFS(self, emphasis, 1, 0, 0)
end

local OnLeave = function(self)
	local r, g, b
	local id = self:GetID()
	local emphasis = _G["ChatFrame"..id.."TabFlash"]:IsShown()

	if _G["ChatFrame"..id] == SELECTED_CHAT_FRAME then
		r, g, b = 1, 0, 0
	elseif emphasis then
		r, g, b = 1, 0, 0
	else
		r, g, b = 1, 1, 1
	end

	updateFS(self, emphasis, r, g, b)
end

local ChatFrame2_SetAlpha = function(self, alpha)
	if CombatLogQuickButtonFrame_Custom then
		CombatLogQuickButtonFrame_Custom:SetAlpha(alpha)
	end
end

local ChatFrame2_GetAlpha = function(self)
	if CombatLogQuickButtonFrame_Custom then
		return CombatLogQuickButtonFrame_Custom:GetAlpha()
	end
end

local faneifyTab = function(frame, sel)
	local i = frame:GetID()

	if not frame.Fane then
		frame:HookScript("OnEnter", OnEnter)
		frame:HookScript("OnLeave", OnLeave)
		if Qulight["chatt"].tabsmouseover ~= true then
			frame:SetAlpha(1)

			if i ~= 2 then
				-- Might not be the best solution, but we avoid hooking into the UIFrameFade
				-- system this way.
				frame.SetAlpha = UIFrameFadeRemoveFrame
			else
				frame.SetAlpha = ChatFrame2_SetAlpha
				frame.GetAlpha = ChatFrame2_GetAlpha

				-- We do this here as people might be using AddonLoader together with Fane
				if CombatLogQuickButtonFrame_Custom then
					CombatLogQuickButtonFrame_Custom:SetAlpha(0.4)
				end
			end
		end

		frame.Fane = true
	end

	-- We can't trust sel
	if i == SELECTED_CHAT_FRAME:GetID() then
		updateFS(frame, nil, 1, 0, 0)
	else
		updateFS(frame, nil, 1, 1, 1)
	end
end

hooksecurefunc("FCF_StartAlertFlash", function(frame)
	local tab = _G["ChatFrame"..frame:GetID().."Tab"]
	updateFS(tab, true, 1, 0, 0)
end)

hooksecurefunc("FCFTab_UpdateColors", faneifyTab)

for i = 1, NUM_CHAT_WINDOWS do
	faneifyTab(_G["ChatFrame"..i.."Tab"])
end

function Fane:ADDON_LOADED(event, addon)
	if addon == "Blizzard_CombatLog" then
		self:UnregisterEvent(event)
		self[event] = nil

		return CombatLogQuickButtonFrame_Custom:SetAlpha(0.4)
	end
end
Fane:RegisterEvent("ADDON_LOADED")


-----------------------------------------------------------------------------
-- Copy Chat (by Shestak)
-----------------------------------------------------------------------------

local lines = {}
local frame = nil
local editBox = nil
local isf = nil

local function CreateCopyFrame()
	frame = CreateFrame("Frame", "ChatCopyFrame", UIParent)
	CreateStyle(frame, 2)
	frame:SetWidth(440)
	frame:SetHeight(250)
	frame:SetScale(1)
	frame:SetPoint("BOTTOM", ChatBackground, "TOP", 0, 2)
	frame:Hide()
	frame:SetFrameStrata("DIALOG")

	local scrollArea = CreateFrame("ScrollFrame", "ChatCopyScroll", frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -30)
	scrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 8)

	editBox = CreateFrame("EditBox", "ChatCopyEditBox", frame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(false)
	editBox:SetFontObject(ChatFontNormal)
	editBox:SetWidth(440)
	editBox:SetHeight(250)
	editBox:SetScript("OnEscapePressed", function() frame:Hide() end)

	scrollArea:SetScrollChild(editBox)

	local close = CreateFrame("Button", "CopyCloseButton", frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", frame, "TOPRIGHT")
	close:GetNormalTexture():SetDesaturated(1)

	isf = true
end

local function GetLines(...)
	local ct = 1
	for i = select("#", ...), 1, -1 do
		local region = select(i, ...)
		if region:GetObjectType() == "FontString" then
			lines[ct] = tostring(region:GetText())
			ct = ct + 1
		end
	end
	return ct - 1
end

local function Copy(cf)
	local _, size = cf:GetFont()
	FCF_SetChatWindowFontSize(cf, cf, 0.01)
	local lineCt = GetLines(cf:GetRegions())
	local text = table.concat(lines, "\n", 1, lineCt)
	FCF_SetChatWindowFontSize(cf, cf, size)
	if not isf then CreateCopyFrame() end
	if frame:IsShown() then frame:Hide() return end
	frame:Show()
	editBox:SetText(text)
end

copyicon = "Interface\\AddOns\\QulightUI\\Root\\Media\\copy"

for i = 1, NUM_CHAT_WINDOWS do
	local cf = _G[format("ChatFrame%d",  i)]
	local button = CreateFrame("Button", format("ButtonCF%d", i), cf)
	button:SetPoint("TOPRIGHT", 5, 0)
	button:SetHeight(20)
	button:SetWidth(20)
	button:SetNormalTexture(copyicon)
	button:SetAlpha(0)
	CreateStyle(button, 2)

	
	
	
	button:SetScript("OnMouseUp", function(self)
		Copy(cf)
	end)
	button:SetScript("OnEnter", function() 
		button:SetAlpha(1) 
	end)
	button:SetScript("OnLeave", function() button:SetAlpha(0) end)

end

for i=1, NUM_CHAT_WINDOWS do
	local editbox = _G["ChatFrame"..i.."EditBox"]
	editbox:HookScript("OnTextChanged", function(self)
		local text = self:GetText()
		
		local new, found = gsub(text, "|Kf(%S+)|k(%S+)%s(%S+)k:%s", "%2 %3: ")
		
		if found > 0 then
			new = new:gsub('|', '')
			self:SetText(new)
		end
	end)
end

local gsub = gsub
local color = "16FF5D"
local usebracket = false
local usecolor = true

local function PrintURL(url)
	if (usecolor) then
		if (usebracket) then
			url = "|cff"..color.."|Hurl:"..url.."|h["..url.."]|h|r "
		else
			url = "|cff"..color.."|Hurl:"..url.."|h"..url.."|h|r "
		end
	else
		if (usebracket) then
			url = "|Hurl:"..url.."|h["..url.."]|h "
		else
			url = "|Hurl:"..url.."|h"..url.."|h "
		end
	end
	return url
end

local FindURL = function(self, event, msg, ...)
	local newMsg, found = gsub(msg, "(%a+)://(%S+)%s?", PrintURL("%1://%2"))
	if found > 0 then return false, newMsg, ... end
	
	newMsg, found = gsub(msg, "www%.([_A-Za-z0-9-]+)%.(%S+)%s?", PrintURL("www.%1.%2"))
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", PrintURL("%1@%2%3%4"))
	if found > 0 then return false, newMsg, ... end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_CONVERSATION", FindURL)

local currentLink = nil
local ChatFrame_OnHyperlinkShow_Original = ChatFrame_OnHyperlinkShow
ChatFrame_OnHyperlinkShow = function(self, link, ...)
	if (link):sub(1, 3) == "url" then
		local ChatFrameEditBox = ChatEdit_ChooseBoxForSend()
		currentLink = (link):sub(5)
		if (not ChatFrameEditBox:IsShown()) then
			ChatEdit_ActivateChat(ChatFrameEditBox)
		end
		ChatFrameEditBox:Insert(currentLink)
		ChatFrameEditBox:HighlightText()
		currentLink = nil
		return
	end
	ChatFrame_OnHyperlinkShow_Original(self, link, ...)
end

for i=1, NUM_CHAT_WINDOWS do
	local editbox = _G["ChatFrame"..i.."EditBox"]
	editbox:HookScript("OnTextChanged", function(self)
		local text = self:GetText()
		if text:len() < 5 then
			if text:sub(1, 4) == "/tt " then
				local unitname, realm = UnitName("target")
				if unitname then
					if unitname then unitname = gsub(unitname, " ", "") end
					if unitname and not UnitIsSameServer("player", "target") then
						unitname = unitname .. "-" .. gsub(realm, " ", "")
					end
					
					ChatFrame_SendTell((unitname), ChatFrame1)
				end
			end
		end
	end)
end

SLASH_TELLTARGET1 = "/tt"
SLASH_TELLTARGET2 = "/telltarget"
SlashCmdList.TELLTARGET = function(msg)
	SendChatMessage(msg, "WHISPER")
end


if not Qulight["misk"].armory_link == true then return end
----------------------------------------------------------------------------------------
--	Armory link on right click player name in chat
----------------------------------------------------------------------------------------
-- Find the Realm and Local
local realmName = string.lower(GetRealmName())
local realmLocal = string.lower(GetCVar("portal"))
local link

if realmLocal == "ru" then realmLocal = "eu" end

local function urlencode(obj)
	local currentIndex = 1;
	local charArray = {}
	while currentIndex <= #obj do
		local char = string.byte(obj, currentIndex);
		charArray[currentIndex] = char
		currentIndex = currentIndex + 1
	end
	local converchar = "";
	for _, char in ipairs(charArray) do
		converchar = converchar..string.format("%%%X", char)
	end
	return converchar;
end

realmName = realmName:gsub("'", "")
realmName = realmName:gsub(" ", "-")
local myserver = realmName:gsub("-", "")

if client == "ruRU" then
	link = "ru"
elseif client == "frFR" then
	link = "fr"
elseif client == "deDE" then
	link = "de"
elseif client == "esES" or client == "esMX" then
	link = "es"
elseif client == "ptBR" or client == "ptPT" then
	link = "pt"
elseif client == "itIT" then
	link = "it"
elseif client == "zhTW" then
	link = "zh"
elseif client == "koKR" then
	link = "ko"
else
	link = "en"
end

StaticPopupDialogs.LINK_COPY_DIALOG = {
	text = "Armory",
	button1 = OKAY,
	timeout = 0,
	whileDead = true,
	hasEditBox = true,
	editBoxWidth = 350,
	OnShow = function(self, ...) self.editBox:SetFocus() end,
	EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
	preferredIndex = 5,
}

-- Dropdown menu link
hooksecurefunc("UnitPopup_OnClick", function(self)
	local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
	local name = dropdownFrame.name
	local server = dropdownFrame.server
	if not server then
		server = myserver
	else
		server = string.lower(server:gsub("'", ""))
		server = server:gsub(" ", "-")
	end

	if name and self.value == "ARMORYLINK" then
		local inputBox = StaticPopup_Show("LINK_COPY_DIALOG")
		if realmLocal == "us" or realmLocal == "eu" or realmLocal == "tw" or realmLocal == "kr" then
			if server == myserver then
				linkurl = "http://"..realmLocal..".battle.net/wow/"..link.."/character/"..realmName.."/"..name.."/advanced"
			else
				linkurl = "http://"..realmLocal..".battle.net/wow/"..link.."/search?q="..name.."&f=wowcharacter"
			end
			inputBox.editBox:SetText(linkurl)
			inputBox.editBox:HighlightText()
			return
		elseif realmLocal == "cn" then
			local n, r = name:match"(.*)-(.*)"
			n = n or name
			r = r or GetRealmName()

			linkurl = "http://www.battlenet.com.cn/wow/character/"..urlencode(r).."/"..urlencode(n).."/advanced"
			inputBox.editBox:SetText(linkurl)
			inputBox.editBox:HighlightText()
			return
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00Unsupported realm location.|r")
			StaticPopup_Hide("LINK_COPY_DIALOG")
			return
		end
	end
end)

UnitPopupButtons["ARMORYLINK"] = {text = "Armory", dist = 0, func = UnitPopup_OnClick}

-- Comment armory function, becourse they causes error then choose in raid maintank
tinsert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"] - 1, "ARMORYLINK")
tinsert(UnitPopupMenus["PARTY"], #UnitPopupMenus["PARTY"] - 1, "ARMORYLINK")
tinsert(UnitPopupMenus["RAID"], #UnitPopupMenus["RAID"] - 1, "ARMORYLINK")
tinsert(UnitPopupMenus["PLAYER"], #UnitPopupMenus["PLAYER"] - 1, "ARMORYLINK")