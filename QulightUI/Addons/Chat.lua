if not Qulight["chatt"].enable == true then return end

ToggleChatColorNamesByClassGroup(true, "SAY")
ToggleChatColorNamesByClassGroup(true, "EMOTE")
ToggleChatColorNamesByClassGroup(true, "YELL")
ToggleChatColorNamesByClassGroup(true, "GUILD")
ToggleChatColorNamesByClassGroup(true, "OFFICER")
ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
ToggleChatColorNamesByClassGroup(true, "WHISPER")
ToggleChatColorNamesByClassGroup(true, "PARTY")
ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
ToggleChatColorNamesByClassGroup(true, "RAID")
ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")	
ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
ToggleChatColorNamesByClassGroup(true, "CHANNEL8")
ToggleChatColorNamesByClassGroup(true, "CHANNEL9")
ToggleChatColorNamesByClassGroup(true, "CHANNEL10")
ToggleChatColorNamesByClassGroup(true, "CHANNEL11")			

--General
ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
--Trade
ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
--Local Defense
ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
			
local Chat = CreateFrame("Frame")
local tabalpha = 1
local tabnoalpha = 0
local _G = _G
local origs = {}
local type = type
hidecombat = true

local function Kill(object)
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	end
	object.Show = dummy
	object:Hide()
end
dummy = function() return end
for i = 1, 10 do
	local x=({_G["ChatFrame"..i.."EditBox"]:GetRegions()})
	x[9]:SetAlpha(0)
	x[10]:SetAlpha(0)
	x[11]:SetAlpha(0)
end
for i = 1, NUM_CHAT_WINDOWS do
    if ( i ~= 2 ) then
      local f = _G["ChatFrame"..i]
      local am = f.AddMessage
      f.AddMessage = function(frame, text, ...)
        return am(frame, text:gsub('|h%[(%d+)%. .-%]|h', '|h[%1]|h'), ...)
      end
    end
end 
_G.CHAT_BATTLEGROUND_GET = "|Hchannel:Battleground|h".."[BG]".."|h %s:\32"
_G.CHAT_BATTLEGROUND_LEADER_GET = "|Hchannel:Battleground|h".."[BG]".."|h %s:\32"
_G.CHAT_BN_WHISPER_INFORM_GET = "T: %s "
_G.CHAT_BN_WHISPER_GET = "F: %s "
_G.CHAT_GUILD_GET = "|Hchannel:Guild|h".."[G]".."|h %s:\32"
_G.CHAT_OFFICER_GET = "|Hchannel:o|h".."[O]".."|h %s:\32"
_G.CHAT_PARTY_GET = "|Hchannel:Party|h".."[P]".."|h %s:\32"
_G.CHAT_PARTY_GUIDE_GET = "|Hchannel:party|h".."[P]".."|h %s:\32"
_G.CHAT_PARTY_LEADER_GET = "|Hchannel:party|h".."[P]".."|h %s:\32"
_G.CHAT_RAID_GET = "|Hchannel:raid|h".."[R]".."|h %s:\32"
_G.CHAT_RAID_LEADER_GET = "|Hchannel:raid|h".."[R]".."|h %s:\32"
_G.CHAT_RAID_WARNING_GET = "[W]".." %s:\32"
_G.CHAT_SAY_GET = "%s:\32"
_G.CHAT_WHISPER_GET = "Fr".." %s:\32"
_G.CHAT_WHISPER_INFORM_GET = "To %s "
_G.CHAT_YELL_GET = "%s:\32"

_G.CHAT_FLAG_AFK = "|cffFF0000".."[AFK]".."|r "
_G.CHAT_FLAG_DND = "|cffE7E716".."[DND]".."|r "
_G.CHAT_FLAG_GM = "|cff4154F5".."[GM]".."|r "
 
_G.ERR_FRIEND_ONLINE_SS = "|Hplayer:%s|h[%s]|h ".."is now |cff298F00online|r".."!"
_G.ERR_FRIEND_OFFLINE_S = "%s ".."is now |cffff0000offline|r".."!"

Kill(FriendsMicroButton)
Kill(ChatFrameMenuButton)

if hidecombat==true then
    local EventFrame = CreateFrame("Frame");
    EventFrame:RegisterEvent("ADDON_LOADED");
    local function EventHandler(self, event, ...)
        if ... == "Blizzard_CombatLog" then
            local topbar = _G["CombatLogQuickButtonFrame_Custom"];
            if not topbar then return end
            topbar:Hide();
            topbar:HookScript("OnShow", function(self) topbar:Hide(); end);
            topbar:SetHeight(0);
        end
    end
    EventFrame:SetScript("OnEvent", EventHandler);
end
local function SetChatStyle(frame)
	local id = frame:GetID()
	local chat = frame:GetName()
	
	_G[chat]:SetClampRectInsets(0,0,0,0)
		
	for j = 1, #CHAT_FRAME_TEXTURES do
		_G[chat..CHAT_FRAME_TEXTURES[j]]:SetTexture(nil)
	end
			
	Kill(_G[format("ChatFrame%sTabLeft", id)])
	Kill(_G[format("ChatFrame%sTabMiddle", id)])
	Kill(_G[format("ChatFrame%sTabRight", id)])

	Kill(_G[format("ChatFrame%sTabSelectedLeft", id)])
	Kill(_G[format("ChatFrame%sTabSelectedMiddle", id)])
	Kill(_G[format("ChatFrame%sTabSelectedRight", id)])
	
	Kill(_G[format("ChatFrame%sTabHighlightLeft", id)])
	Kill(_G[format("ChatFrame%sTabHighlightMiddle", id)])
	Kill(_G[format("ChatFrame%sTabHighlightRight", id)])

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

	local a, b, c = select(6, _G[chat.."EditBox"]:GetRegions()); Kill (a); Kill (b); Kill (c)
				
	_G[chat.."EditBox"]:SetAltArrowKeyMode(false)
	_G[chat.."EditBox"]:Hide()
	_G[chat.."EditBox"]:HookScript("OnEditFocusLost", function(self) self:Hide() end)
	_G[chat.."Tab"]:HookScript("OnClick", function() _G[chat.."EditBox"]:Hide() end)

	local editbox = _G["ChatFrame"..id.."EditBox"]
	local left, mid, right = select(6, editbox:GetRegions())
	left:Hide(); mid:Hide(); right:Hide()
	editbox:ClearAllPoints();
	editbox:SetPoint("CENTER", DataLeftPanel)
	editbox:SetWidth(440)
	editbox:SetHeight(15)
	SimpleShadow(editbox)
end
local function SetupChat(self)	
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		SetChatStyle(frame)
		FCFTab_UpdateAlpha(frame)
	end

	ChatTypeInfo.WHISPER.sticky = 1
	ChatTypeInfo.BN_WHISPER.sticky = 1
	ChatTypeInfo.OFFICER.sticky = 1
	ChatTypeInfo.RAID_WARNING.sticky = 1
	ChatTypeInfo.CHANNEL.sticky = 1
end

local function SetupChatPosAndFont(self)	
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format("ChatFrame%s", i)]
		local tab = _G[format("ChatFrame%sTab", i)]
		local id = chat:GetID()
		local name = FCF_GetChatWindowInfo(id)
		local point = GetChatWindowSavedPosition(id)
		local _, fontSize = FCF_GetChatWindowInfo(id)
		local _, _, _, _, _, _, _, _, docked, _ = GetChatWindowInfo(id)
		local _, fontSize = FCF_GetChatWindowInfo(id)
		
		FCF_SetChatWindowFontSize(nil, chat, Qulight["media"].fontsize)	
		ChatFrame1:ClearAllPoints()
		ChatFrame1:SetPoint("BOTTOMLEFT", ChatBackground, "BOTTOMLEFT", 6, 22)
	end	
end
Chat:RegisterEvent("ADDON_LOADED")
Chat:RegisterEvent("PLAYER_ENTERING_WORLD")
Chat:SetScript("OnEvent", function(self, event, ...)
	for i = 1, NUM_CHAT_WINDOWS do
		_G["ChatFrame"..i]:SetClampRectInsets(0,0,0,0)
		_G["ChatFrame"..i]:SetWidth(410)
		_G["ChatFrame"..i]:SetHeight(124)
	end		
	local addon = ...
	if event == "ADDON_LOADED" then
		if addon == "Blizzard_CombatLog" then
			self:UnregisterEvent("ADDON_LOADED")
			SetupChat(self)
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		SetupChatPosAndFont(self)
		Chat:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
	if event == "PLAYER_LOGIN" then
		SetupChatPosAndFont(self)
	end
end)
local function SetupTempChat()
	local frame = FCF_GetCurrentChatFrame()
	SetChatStyle(frame)
end
hooksecurefunc("FCF_OpenTemporaryWindow", SetupTempChat)
for i = 1, NUM_CHAT_WINDOWS do
	local editBox = _G["ChatFrame"..i.."EditBox"]
	editBox:HookScript("OnTextChanged", function(self)
	   local text = self:GetText()
	   if text:len() < 5 then
		  if text:sub(1, 4) == "/tt " then
			 local unitname, realm
			 unitname, realm = UnitName("target")
			 if unitname then unitname = gsub(unitname, " ", "") end
			 if unitname and not UnitIsSameServer("player", "target") then
				unitname = unitname .. "-" .. gsub(realm, " ", "")
			 end
			 ChatFrame_SendTell((unitname or "Invalid Target"), ChatFrame1)
		  end
	   end
	end)
end
local SetItemRef_orig = SetItemRef
function ReURL_SetItemRef(link, text, button, chatFrame)
	if (strsub(link, 1, 3) == "url") then
		local ChatFrameEditBox = ChatEdit_ChooseBoxForSend()
		local url = strsub(link, 5);
		if (not ChatFrameEditBox:IsShown()) then
			ChatEdit_ActivateChat(ChatFrameEditBox)
		end
		ChatFrameEditBox:Insert(url)
		ChatFrameEditBox:HighlightText()

	else
		SetItemRef_orig(link, text, button, chatFrame)
	end
end
SetItemRef = ReURL_SetItemRef
function ReURL_AddLinkSyntax(chatstring)
	if (type(chatstring) == "string") then
		local extraspace;
		if (not strfind(chatstring, "^ ")) then
			extraspace = true;
			chatstring = " "..chatstring;
		end
		chatstring = gsub (chatstring, " www%.([_A-Za-z0-9-]+)%.(%S+)%s?", ReURL_Link("www.%1.%2"))
		chatstring = gsub (chatstring, " (%a+)://(%S+)%s?", ReURL_Link("%1://%2"))
		chatstring = gsub (chatstring, " ([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", ReURL_Link("%1@%2%3%4"))
		chatstring = gsub (chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?):(%d%d?%d?%d?%d?)%s?", ReURL_Link("%1.%2.%3.%4:%5"))
		chatstring = gsub (chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%s?", ReURL_Link("%1.%2.%3.%4"))
		if (extraspace) then
			chatstring = strsub(chatstring, 2);
		end
	end
	return chatstring
end

REURL_COLOR = "16FF5D"
ReURL_Brackets = false
ReUR_CustomColor = true

function ReURL_Link(url)
	if (ReUR_CustomColor) then
		if (ReURL_Brackets) then
			url = " |cff"..REURL_COLOR.."|Hurl:"..url.."|h["..url.."]|h|r "
		else
			url = " |cff"..REURL_COLOR.."|Hurl:"..url.."|h"..url.."|h|r "
		end
	else
		if (ReURL_Brackets) then
			url = " |Hurl:"..url.."|h["..url.."]|h "
		else
			url = " |Hurl:"..url.."|h"..url.."|h "
		end
	end
	return url
end
for i=1, NUM_CHAT_WINDOWS do
	local frame = getglobal("ChatFrame"..i)
	local addmessage = frame.AddMessage
	frame.AddMessage = function(self, text, ...) addmessage(self, ReURL_AddLinkSyntax(text), ...) end
end

local Fane = CreateFrame'Frame'
local inherit = GameFontNormalSmall

local updateFS = function(self, inc, flags, ...)
	local fstring = self:GetFontString()

	local font, fontSize = inherit:GetFont()
	fstring:SetFont(font, 10, flags)
	if((...)) then
		fstring:SetTextColor(...)
	end
end

local OnEnter = function(self)
	local emphasis = _G["ChatFrame"..self:GetID()..'TabFlash']:IsShown()
	updateFS(self, emphasis, nil, unpack(Qulight["datatext"].color))
end

local OnLeave = function(self)
	local r, g, b, al
	local id = self:GetID()
	local emphasis = _G["ChatFrame"..id..'TabFlash']:IsShown()

	if (_G["ChatFrame"..id] == SELECTED_CHAT_FRAME) then
		r, g, b, al = 1, 0.7, 0.7, 1
	elseif emphasis then
		r, g, b, al = 1, 0, 0, 1
	else
		r, g, b, al = 1, 1, 1, 1
	end

	updateFS(self, emphasis, nil, r, g, b, al)
end

local ChatFrame2_SetAlpha = function(self, alpha)
	if(CombatLogQuickButtonFrame_Custom) then
		CombatLogQuickButtonFrame_Custom:SetAlpha(alpha)
	end
end

local ChatFrame2_GetAlpha = function(self)
	if(CombatLogQuickButtonFrame_Custom) then
		return CombatLogQuickButtonFrame_Custom:GetAlpha()
	end
end

local faneifyTab = function(frame, sel)
	local i = frame:GetID()

	if(not frame.Fane) then
		frame.leftTexture:Hide()
		frame.middleTexture:Hide()
		frame.rightTexture:Hide()

		frame.leftSelectedTexture:Hide()
		frame.middleSelectedTexture:Hide()
		frame.rightSelectedTexture:Hide()
		
		frame.glow:SetTexture(nil)

		frame.leftSelectedTexture.Show = frame.leftSelectedTexture.Hide
		frame.middleSelectedTexture.Show = frame.middleSelectedTexture.Hide
		frame.rightSelectedTexture.Show = frame.rightSelectedTexture.Hide

		frame.leftHighlightTexture:Hide()
		frame.middleHighlightTexture:Hide()
		frame.rightHighlightTexture:Hide()

		frame:HookScript('OnEnter', OnEnter)
		frame:HookScript('OnLeave', OnLeave)

		frame:SetAlpha(1)

		if(i ~= 2) then
			frame.SetAlpha = UIFrameFadeRemoveFrame
		else
			frame.SetAlpha = ChatFrame2_SetAlpha
			frame.GetAlpha = ChatFrame2_GetAlpha

			-- We do this here as people might be using AddonLoader together with Fane.
			if(CombatLogQuickButtonFrame_Custom) then
				CombatLogQuickButtonFrame_Custom:SetAlpha(.4)
			end
		end

		frame.Fane = true
	end
	
	-- We can't trust sel. :(
	if(i == SELECTED_CHAT_FRAME:GetID()) then
		updateFS(frame, nil, nil, 1, 0.7, 0.7, 1)
	else
		updateFS(frame, nil, nil, unpack(Qulight["datatext"].color))
	end
end

hooksecurefunc('FCF_StartAlertFlash', function(frame)
	local tab = _G['ChatFrame' .. frame:GetID() .. 'Tab']
	updateFS(tab, true, nil, 1, 0, 0)
end)

hooksecurefunc('FCFTab_UpdateColors', faneifyTab)


for i=1, NUM_CHAT_WINDOWS do
	faneifyTab(_G['ChatFrame' .. i .. 'Tab'])
end
function Fane:ADDON_LOADED(event, addon)
	if(addon == 'Blizzard_CombatLog') then
		self:UnregisterEvent(event)
		self[event] = nil

		return CombatLogQuickButtonFrame_Custom:SetAlpha(.4)
	end
end
Fane:RegisterEvent'ADDON_LOADED'

Fane:SetScript('OnEvent', function(self, event, ...)
	return self[event](self, event, ...)
end)
-----------------------------------------------------------------------------
-- Copy Chat (by Shestak)
-----------------------------------------------------------------------------
local lines = {}
local frame = nil
local editBox = nil
local isf = nil

local function FadeIn(f)
	UIFrameFadeIn(f, 0.4, f:GetAlpha(), 1)
end

local function FadeOut(f)
	UIFrameFadeOut(f, 0.8, f:GetAlpha(), 0)
end

local function CreatCopyFrame()
	frame = CreateFrame("Frame", "CopyFrame", UIParent)
	frame:SetBackdrop({
			bgFile = "Interface\\Buttons\\WHITE8x8",
			edgeFile = [=[Interface\ChatFrame\ChatFrameBackground]=],
			tile = 0, tileSize = 0, edgeSize = 1, 
			insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	
	local tex = frame:CreateTexture(nil, "BORDER")
	tex:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
	tex:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
	tex:SetVertexColor(.05,.05,.05,0)
	tex:SetDrawLayer("BORDER", -8)
	frame.tex = tex
	
	frame:SetBackdropColor(.05,.05,.05,0)
	frame:SetBackdropBorderColor(.15,.15,.15,0)
	frame:SetWidth(500)
	frame:SetHeight(300)
	frame:SetScale(0.9)
	frame:SetPoint("LEFT", UIParent, "LEFT", 10, 0)
	frame:Hide()
	frame:SetFrameStrata("DIALOG")
    CreateShadow(frame)

	local scrollArea = CreateFrame("ScrollFrame", "CopyScroll", frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -30)
	scrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 8)
	editBox = CreateFrame("EditBox", "CopyBox", frame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(false)
	editBox:SetFontObject(ChatFontNormal)
	editBox:SetWidth(500)
	editBox:SetHeight(300)
	editBox:SetScript("OnEscapePressed", function() frame:Hide() end)
	scrollArea:SetScrollChild(editBox)
	local close = CreateFrame("Button", "CopyCloseButton", frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", frame, "TOPRIGHT")
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
	if size < 11 then
		FCF_SetChatWindowFontSize(cf, cf, 11)
	else
		FCF_SetChatWindowFontSize(cf, cf, size)
	end
	if not isf then CreatCopyFrame() end
	if frame:IsShown() then frame:Hide() return end
	frame:Show()
	editBox:SetText(text:gsub("|[Tt]Interface\\TargetingFrame\\UI%-RaidTargetingIcon_(%d):0|[Tt]", "{rt%1}"))
end

for i = 1, NUM_CHAT_WINDOWS do
	local cf = _G[format("ChatFrame%d", i)]
	local button = CreateFrame("Button", format("ButtonCF%d", i), cf)
	button:SetHeight(20)
	button:SetWidth(20)
	button:SetAlpha(1)
	button:SetPoint("RIGHT", LeftTabPanel, "RIGHT")

	local buttontext = button:CreateFontString(nil,"OVERLAY",nil)
	buttontext:SetFont(Qulight["media"].font, 9, "OVERLAY")
	buttontext:SetText("C")
	buttontext:SetPoint("CENTER", 0, 0)
	buttontext:SetJustifyH("CENTER")
	buttontext:SetJustifyV("CENTER")
	buttontext:SetTextColor(unpack(Qulight["datatext"].color)) 

	button:SetScript("OnMouseUp", function(self, btn)
		if btn == "RightButton" then
			ToggleFrame(ChatMenu)
		elseif btn == "MiddleButton" then
			RandomRoll(1, 100)
		else
			Copy(cf)
		end
	end)
end

------------------------------------------------------------------------
--	Enhance/rewrite a Blizzard feature, chatframe mousewheel.
------------------------------------------------------------------------
local ScrollLines = 3 -- set the jump when a scroll is done !
function FloatingChatFrame_OnMouseScroll(self, delta)
	if delta < 0 then
		if IsShiftKeyDown() then
			self:ScrollToBottom()
		else
			for i = 1, ScrollLines do
				self:ScrollDown()
			end
		end
	elseif delta > 0 then
		if IsShiftKeyDown() then
			self:ScrollToTop()
		else
			for i = 1, ScrollLines do
				self:ScrollUp()
			end
		end
	end
end

local chatbubblehook = CreateFrame("Frame", nil, UIParent)
local noscalemult = 1
local tslu = 0
local numkids = 0
local bubbles = {}

if eyefinity then
	-- hide options, disable bubbles, not compatible eyefinity
	InterfaceOptionsSocialPanelChatBubbles:SetScale(0.00001)
	InterfaceOptionsSocialPanelPartyChat:SetScale(0.00001)
	SetCVar("chatBubbles", 0)
	SetCVar("chatBubblesParty", 0)
end

local function skinbubble(frame)
	for i=1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
		elseif region:GetObjectType() == "FontString" then
			frame.text = region
		end
	end
	
	frame:SetBackdrop({
		bgFile =  "Interface\\AddOns\\QulightUI\\Root\\Media\\statusbar4",
		edgeFile = "Interface\\AddOns\\QulightUI\\Root\\Media\\glowTex", 
		edgeSize = 4,
		insets = { left = 3, right = 3, top = 3, bottom = 3 }
	})
	frame:SetBackdropColor( .05,.05,.05, .9)
	frame:SetBackdropBorderColor(0, 0, 0, 1)
	frame:SetClampedToScreen(false)
	
	tinsert(bubbles, frame)
end

local function ischatbubble(frame)
	if frame:GetName() then return end
	if not frame:GetRegions() then return end
	return frame:GetRegions():GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
end

chatbubblehook:SetScript("OnUpdate", function(chatbubblehook, elapsed)
	tslu = tslu + elapsed

	if tslu > .05 then
		tslu = 0

		local newnumkids = WorldFrame:GetNumChildren()
		if newnumkids ~= numkids then
			for i=numkids + 1, newnumkids do
				local frame = select(i, WorldFrame:GetChildren())

				if ischatbubble(frame) then
					skinbubble(frame)
				end
			end
			numkids = newnumkids
		end
		
		for i, frame in next, bubbles do
			local r, g, b = frame.text:GetTextColor()
			frame:SetBackdropBorderColor(0, 0, 0, .8)
			
			-- bubbles is unfortunatly not compatible with eyefinity, we hide it event if they are enabled. :(
			if eyefinity then frame:SetScale(0.00001) end			
		end
	end
end)