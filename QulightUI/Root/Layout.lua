buttonsize = Qulight["actionbar"].buttonsize
buttonspacing = Qulight["actionbar"].buttonspacing
petbuttonsize = Qulight["actionbar"].petbuttonsize
petbuttonspacing = Qulight["actionbar"].petbuttonspacing

if Qulight["general"].topbottompanel then
	local BottomPanel = CreateFrame("Frame", "BottomPanel", UIParent)
	CreatePanel(BottomPanel, 4000, 25, "BOTTOM", 0, -5)
	CreateShadow(BottomPanel)
	BottomPanel:SetFrameLevel(0)

	local TopPanel = CreateFrame("Frame", "TopPanel", UIParent)
	CreatePanel(TopPanel, 4000, 25, "TOP", 0, 5)
	CreateShadow(TopPanel)
	TopPanel:SetFrameLevel(0)
end

Anchorchatbgdummy = CreateFrame("Frame","Move_chatbgdummy",UIParent)
Anchorchatbgdummy:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 3, 3)
CreateAnchor(Anchorchatbgdummy, "Move Chat", 440, 172)

local ChatPanel = CreateFrame("Frame", "ChatBackground", UIParent)
CreatePanel(ChatPanel, 440, 172, "BOTTOMLEFT", Anchorchatbgdummy)
CreateShadow(ChatPanel)

Anchordamagelol = CreateFrame("Frame","Move_damagelol",UIParent)
Anchordamagelol:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 3)
CreateAnchor(Anchordamagelol, "Move Damage Background", 440, 172)

local ChatPanelTwo = CreateFrame("Frame", "ChatPanelRight", UIParent)
CreatePanel(ChatPanelTwo, 440, 172, "BOTTOMRIGHT", Anchordamagelol)
CreateShadow(ChatPanelTwo)
ChatPanelTwo:SetFrameLevel(2)

if Qulight["chatt"].chatbar then
	local chatbar = CreateFrame("Frame", "chatbar", UIParent)
	CreatePanel(chatbar, 13, 103, "RIGHT", ChatBackground, "RIGHT", -4, -1)
	CreateShadow(chatbar)
	chatbar:SetFrameLevel(2)	
end

local LeftInfoPanel = CreateFrame("Frame", "DataLeftPanel", UIParent)
SimpleBackground(LeftInfoPanel, 430, 15, "BOTTOM", ChatPanel, "BOTTOM", 0, 5)
CreateShadowforInfoPanel(LeftInfoPanel)
LeftInfoPanel:SetFrameLevel(2)

local LeftTabPanel = CreateFrame("Frame", "LeftTabPanel", UIParent)
SimpleBackground(LeftTabPanel, 430, 15, "TOP", ChatPanel, "TOP", 0, -5)
CreateShadowforInfoPanel(LeftTabPanel)
LeftTabPanel:SetFrameLevel(2)	

local RightInfoPanel = CreateFrame("Frame", "DataRightPanel", UIParent)
SimpleBackground(RightInfoPanel, 430, 15, "BOTTOM", ChatPanelTwo, "BOTTOM", 0, 5)
CreateShadowforInfoPanel(RightInfoPanel)
RightInfoPanel:SetFrameLevel(2)	
if Qulight["general"].centerpanel then
local RightUpInfoPanel = CreateFrame ("Frame", "RightUpInfoPanel", UIParent)
CreatePanel(RightUpInfoPanel, 440, 15, "TOP", ChatPanelTwo, "TOP", 0, 16)
CreateShadow(RightUpInfoPanel)
RightUpInfoPanel:SetFrameLevel(2)

local LeftUpInfoPanel = CreateFrame("Frame", "LeftUpInfoPanel", UIParent)
CreatePanel(LeftUpInfoPanel, 440, 15, "TOP", ChatPanel, 0, 16)
CreateShadow(LeftUpInfoPanel)
LeftUpInfoPanel:SetFrameLevel(2)

end

Anchorminimaplol = CreateFrame("Frame","Move_minimaplol",UIParent)
Anchorminimaplol:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 3, -3)
CreateAnchor(Anchorminimaplol, "Move Minimap", Qulight["minimapp"].size+4, Qulight["minimapp"].size+4)
	
local minimaplol = CreateFrame("Frame", "minimaplol", UIParent)
CreatePanel(minimaplol, Qulight["minimapp"].size+4, Qulight["minimapp"].size+4, "BOTTOMRIGHT", Anchorminimaplol)
CreateShadow(minimaplol)
minimaplol:SetFrameLevel(2)

---------------------
--Acton Bar Panels
---------------------
if Qulight["actionbar"].enable then
	
	local mbWidth = Qulight.actionbar.mainbarWidth
	
	AnchorQuBar1 = CreateFrame("Frame","Move_Bar1",UIParent)
	AnchorQuBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 278)
	CreateAnchor(AnchorQuBar1, "Move Bar1", (buttonsize * mbWidth) + (buttonspacing * (mbWidth-1)), buttonsize)

	local QuBar1 = CreateFrame("Frame", "QuBar1", UIParent, "SecureHandlerStateTemplate")
	CreatePanel(QuBar1, 1, 1, "BOTTOM", AnchorQuBar1, "BOTTOM")
	QuBar1:SetWidth((buttonsize * mbWidth) + (buttonspacing * (mbWidth-1)))
	QuBar1:SetHeight((buttonsize * 2) + (buttonspacing * 3))
	QuBar1:SetFrameStrata("BACKGROUND")
	QuBar1:SetFrameLevel(1)

	local QuBar2 = CreateFrame("Frame", "QuBar2", UIParent)
	CreatePanel(QuBar2, 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 10)
	QuBar2:SetWidth((buttonsize * 6) + (buttonspacing * 7))
	QuBar2:SetHeight((buttonsize * 2) + (buttonspacing * 3))
	QuBar2:SetFrameStrata("BACKGROUND")
	QuBar2:SetFrameLevel(2)

	local QuBar3 = CreateFrame("Frame", "QuBar3", UIParent)
	CreatePanel(QuBar3, 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 10)
	QuBar3:SetWidth((buttonsize * 6) + (buttonspacing * 7))
	QuBar3:SetHeight((buttonsize * 2) + (buttonspacing * 3))
	QuBar3:SetFrameStrata("BACKGROUND")
	QuBar3:SetFrameLevel(2)

	AnchorQuBar5 = CreateFrame("Frame","Move_Bar5",UIParent)
	AnchorQuBar5:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 243)
	CreateAnchor(AnchorQuBar5, "Move Bar5", (buttonsize * mbWidth) + (buttonspacing * (mbWidth-1)), buttonsize)
	
	local QuBar5 = CreateFrame("Frame", "QuBar5", UIParent)
	CreatePanel(QuBar5, 1, 1, "TOP", AnchorQuBar5, "TOP")
	QuBar5:SetWidth((buttonsize * mbWidth) + (buttonspacing * (mbWidth-1)))
	QuBar5:SetHeight((buttonsize * 2) + (buttonspacing * 3))
	QuBar5:SetFrameStrata("BACKGROUND")
	QuBar5:SetFrameLevel(2)
	
	AnchorQuBar4 = CreateFrame("Frame","Move_Bar4",UIParent)
	AnchorQuBar4:SetPoint("TOPLEFT", ChatPanelTwo, "TOPLEFT", -3, 54)
	CreateAnchor(AnchorQuBar4, "Move Bar4", (buttonsize * 12) + (buttonspacing * 13), buttonsize)
	
	local QuBar4 = CreateFrame("Frame", "QuBar4", UIParent)
	CreatePanel(QuBar4, 20, 20, "TOP", AnchorQuBar4, "TOP")
	QuBar4:SetWidth((buttonsize * 12) + (buttonspacing * 13))
	QuBar4:SetHeight(buttonsize)
	QuBar4:SetFrameStrata("BACKGROUND")
	QuBar4:SetFrameLevel(2)
	QuBar4:SetAlpha(0)
	QuBar4:SetScale(0.99)
	
	AnchorQuBar6 = CreateFrame("Frame","Move_Bar6",UIParent)
	AnchorQuBar6:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 4)
	CreateAnchor(AnchorQuBar6, "Move Bar6", (buttonsize * 12) + (buttonspacing * 13), buttonsize)
	
	local QuBar6 = CreateFrame("Frame", "QuBar6", UIParent)
	QuBar6:SetWidth((buttonsize * 12) + (buttonspacing * 13))
	QuBar6:SetHeight(buttonsize)
	QuBar6:SetPoint("TOP", AnchorQuBar6, "TOP")
	QuBar6:SetFrameStrata("BACKGROUND")
	QuBar6:SetFrameLevel(2)
	QuBar6:SetAlpha(0)

	AnchorQuBar7 = CreateFrame("Frame","Move_Bar7",UIParent)
	AnchorQuBar7:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 41)
	CreateAnchor(AnchorQuBar7, "Move Bar7", (buttonsize * 12) + (buttonspacing * 13), buttonsize)
	
	local QuBar7 = CreateFrame("Frame", "QuBar7", UIParent)
	QuBar7:SetWidth((buttonsize * 12) + (buttonspacing * 13))
	QuBar7:SetHeight(buttonsize)
	QuBar7:SetPoint("TOP", AnchorQuBar7, "TOP")
	QuBar7:SetFrameStrata("BACKGROUND")
	QuBar7:SetFrameLevel(2)
	QuBar7:SetAlpha(0)

	Anchorpetbg = CreateFrame("Frame","Move_petbar",UIParent)
	Anchorpetbg:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 113, 193)
	CreateAnchor(Anchorpetbg, "Move petbar", (petbuttonsize * 10) + (petbuttonspacing * 11), petbuttonsize)
	
	local petbg = CreateFrame("Frame", "QuPetBar", UIParent, "SecureHandlerStateTemplate")
	CreatePanel(petbg, (petbuttonsize * 10) + (petbuttonspacing * 11),petbuttonsize + (petbuttonspacing * 2) , "TOP", Anchorpetbg, "TOP")

	local ltpetbg1 = CreateFrame("Frame", "QuLineToPetActionBarBackground", petbg)
	CreatePanel(ltpetbg1, 24, 265, "LEFT", petbg, "RIGHT", 0, 0)
	ltpetbg1:SetParent(petbg)
	ltpetbg1:SetFrameStrata("BACKGROUND")
	ltpetbg1:SetFrameLevel(0)
	CreateShadow(ltpetbg1)

	local invbarbg = CreateFrame("Frame", "InvQuActionBarBackground", UIParent)
	invbarbg:SetPoint("TOPLEFT", QuBar2)
	invbarbg:SetPoint("BOTTOMRIGHT", QuBar3)

end