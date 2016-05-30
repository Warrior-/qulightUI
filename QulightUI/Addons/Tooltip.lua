if not Qulight["tooltip"].enable then return end
local _, ns = ...
local oUF = ns.oUF or oUF
 
if not oUF then return end
 
local shadows = {
	bgFile = Qulight["media"].texture,
	edgeFile = Qulight["media"].glow,
	edgeSize = 4,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
}
 
local Tooltip = CreateFrame("Frame", "Tooltip", UIParent)
 
local _G = getfenv(0)
 
local GameTooltip, GameTooltipStatusBar = _G["GameTooltip"], _G["GameTooltipStatusBar"]
 
local gsub, find, format = string.gsub, string.find, string.format
local Tooltips = {
	GameTooltip,
	ItemRefTooltip,
	ItemRefShoppingTooltip1,
	ItemRefShoppingTooltip2,
	ItemRefShoppingTooltip3,
	AutoCompleteBox,
	ConsolidatedBuffsTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	ShoppingTooltip3,
	WorldMapTooltip,
	WorldMapCompareTooltip1,
	WorldMapCompareTooltip2,
	WorldMapCompareTooltip3,
}
 
for _, tt in pairs(Tooltips) do
	tt:SetBackdrop(nil)
 
local shadow = CreateFrame("Frame", nil, tt)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(tt:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -2, 2)
	shadow:SetPoint("BOTTOMRIGHT", 2, -9)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor(.08,.08,.08, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
end
 
local ItemRefTooltip = ItemRefTooltip
 
local linkTypes = {item = true, enchant = true, spell = true, quest = true, unit = true, talent = true, achievement = true, glyph = true}
 
local classification = {
	worldboss = "|cffAF5050Boss|r",
	rareelite = "|cffAF5050+ Rare|r",
	elite = "|cffAF5050+|r",
	rare = "|cffAF5050Rare|r",
}
 
local NeedBackdropBorderRefresh = true
 
function CreateShadowTooltip(f) --
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -2, 2)
	shadow:SetPoint("BOTTOMRIGHT", 2, -9)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor(.08,.08,.08, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.shadow = shadow
	return shadow
end
 
local anchor = CreateFrame("Frame", "TooltipAnchor", UIParent)
anchor:SetSize(160, 160)
anchor:SetFrameStrata("TOOLTIP")
anchor:SetFrameLevel(20)
anchor:SetClampedToScreen(true)
anchor:SetAlpha(0)
anchor:SetPoint("TOPRIGHT", RightUpInfoPanel)
 
AnchorTooltips = CreateFrame("Frame","Move_Tooltip",UIParent)
if Qulight["general"].centerpanel then
		AnchorTooltips:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 235)
	else
		AnchorTooltips:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 218)
end
CreateAnchor(AnchorTooltips, "Move tooltips", 100, 110)
 
local function UpdateTooltip(self)
	local owner = self:GetOwner()
	if not owner then return end
	local name = owner:GetName()
 
	local x = 5
 
	if self:GetAnchorType() == "ANCHOR_CURSOR" then
		if NeedBackdropBorderRefresh then
			self:ClearAllPoints()
 
			self:SetBackdropColor(.05,.05,.05,0)
			if not Qulight["tooltip"].cursor then
				self:SetBackdropBorderColor(.15,.15,.15,0)
			end
		end
	elseif self:GetAnchorType() == "ANCHOR_NONE" and InCombatLockdown() and Qulight["tooltip"].hidecombat == true then
		self:Hide()
		return
	end
 
	if self:GetAnchorType() == "ANCHOR_NONE" and TooltipAnchor then
		local point = TooltipAnchor:GetPoint()
		if point == "TOPLEFT" then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMRIGHT", AnchorTooltips)
		elseif point == "TOP" then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMRIGHT", AnchorTooltips)
		elseif point == "TOPRIGHT" then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMRIGHT", AnchorTooltips)
		elseif point == "BOTTOMLEFT" or point == "LEFT" then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMRIGHT", AnchorTooltips)
		elseif point == "BOTTOMRIGHT" or point == "RIGHT" then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMRIGHT", AnchorTooltips)
		else
			self:ClearAllPoints()
			self:SetPoint("BOTTOMRIGHT", AnchorTooltips)
		end
	end
end
 
local function SetTooltipDefaultAnchor(self, parent)
	if Qulight["tooltip"].cursor == true then
			if parent ~= UIParent then
				self:SetOwner(parent, "ANCHOR_NONE")
			else
				self:SetOwner(parent, "ANCHOR_CURSOR")
			end
		else
			self:SetOwner(parent, "ANCHOR_NONE")
		end
 
		self:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -111111, -111111)
	end
hooksecurefunc("GameTooltip_SetDefaultAnchor", SetTooltipDefaultAnchor)
 
GameTooltip:HookScript("OnUpdate", function(self, ...) UpdateTooltip(self) end)
 
local function Hex(color)
	return string.format('|cff%02x%02x%02x', color.r * 255, color.g * 255, color.b * 255)
end
 
local function GetColor(unit)
	if(UnitIsPlayer(unit) and not UnitHasVehicleUI(unit)) then
		local _, class = UnitClass(unit)
		local color = RAID_CLASS_COLORS[class]
		if not color then return end
		local r,g,b = color.r, color.g, color.b
		return Hex(color), r, g, b
	else
		local color = FACTION_BAR_COLORS[UnitReaction(unit, "player")]
		if not color then return end
		local r,g,b = color.r, color.g, color.b
		return Hex(color), r, g, b
	end
end
 
local function ShortValue(value)
	if value >= 1e8 then
		return ("%.0fm"):format(value / 1e6)
	elseif value >= 1e7 then
		return ("%.1fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e6 then
		return ("%.2fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e5 then
		return ("%.0fk"):format(value / 1e3)
	elseif value >= 1e3 then
		return ("%.1fk"):format(value / 1e3):gsub("%.?0+([km])$", "%1")
	else
		return value
	end
end
 
 
local function StatusBarOnValueChanged(self, value)
	GameTooltipStatusBar:SetScript("OnValueChanged", function(self, value)
		if not value then return end
		local min, max = self:GetMinMaxValues()
		if (value < min) or (value > max) then return end
		self:SetStatusBarColor(0, 1, 0)
		local _, unit = GameTooltip:GetUnit()
		if unit then
			min, max = UnitHealth(unit), UnitHealthMax(unit)
			if not self.text then
				self.text = self:CreateFontString(nil, "OVERLAY")
				self.text:SetPoint("CENTER", GameTooltipStatusBar, 0, 1.5)
				self.text:SetFont(Qulight["media"].font, 10, "THINOUTLINE")
			end
		self.text:Show()
		local hp = ShortValue(min).." / "..ShortValue(max)
		self.text:SetText(hp)
		end
	end)
end
 
GameTooltipStatusBar:SetScript("OnValueChanged", StatusBarOnValueChanged)
 
local healthBar = GameTooltipStatusBar
healthBar:ClearAllPoints()
healthBar:SetHeight(6)
healthBar:SetPoint("BOTTOMLEFT", healthBar:GetParent(), "TOPLEFT", 2, 5)
healthBar:SetPoint("BOTTOMRIGHT", healthBar:GetParent(), "TOPRIGHT", -2, 5)
healthBar:SetStatusBarTexture(Qulight["media"].texture)
 
local healthBarBG = CreateFrame("Frame", "StatusBarBG", healthBar)
healthBarBG:SetFrameLevel(healthBar:GetFrameLevel() - 1)
healthBarBG:SetPoint("TOPLEFT", -2, 2)
healthBarBG:SetPoint("BOTTOMRIGHT", 2, -2)
CreateStyle(healthBarBG, 2)
 
local function OnTooltipSetUnit(self)
	local lines = self:NumLines()
	local GMF = GetMouseFocus()
	local unit = (select(2, self:GetUnit())) or (GMF and GMF:GetAttribute("unit"))
 
	if (not unit) and (UnitExists("mouseover")) then
		unit = "mouseover"
	end
 
	if not unit then self:Hide() return end
 
	if (self:GetOwner() ~= UIParent and Qulight["tooltip"].hideuf) then self:Hide() return end
 
	if (UnitIsUnit(unit,"mouseover")) then
		unit = "mouseover"
	end
 
	local race = UnitRace(unit)
	local class = UnitClass(unit)
	local level = UnitLevel(unit)
	local guild = GetGuildInfo(unit)
	local name, realm = UnitName(unit)
	local crtype = UnitCreatureType(unit)
	local classif = UnitClassification(unit)
	local title = UnitPVPName(unit)
	local r, g, b = GetQuestDifficultyColor(level).r, GetQuestDifficultyColor(level).g, GetQuestDifficultyColor(level).b
 
	local color = GetColor(unit)
	if not color then color = "|CFFFFFFFF" end
	if not realm then realm = "" end
 
	_G["GameTooltipTextLeft1"]:SetFormattedText("%s%s%s", color, title or name, realm and realm ~= "" and " - "..realm.."|r" or "|r")
 
	if title and Qulight["tooltip"].title == true then
	local text = GameTooltipTextLeft1:GetText()
	title = title:gsub(name, "")
	text = text:gsub(title, "")
	if text then GameTooltipTextLeft1:SetText(text) end
	end
 
	if(UnitIsPlayer(unit)) then
		if UnitIsAFK(unit) then
			self:AppendText((" %s"):format(CHAT_FLAG_AFK))
		elseif UnitIsDND(unit) then
			self:AppendText((" %s"):format(CHAT_FLAG_DND))
		end
 
		local offset = 2
		if guild then
			_G["GameTooltipTextLeft2"]:SetFormattedText("%s", IsInGuild() and GetGuildInfo("player") == guild and "|cff0090ff"..guild.."|r" or "|cff00ff10"..guild.."|r")
			offset = offset + 1
		end
 
		for i= offset, lines do
			if(_G["GameTooltipTextLeft"..i]:GetText():find("^"..LEVEL)) then
				if race then
					_G["GameTooltipTextLeft"..i]:SetFormattedText("|cff%02x%02x%02x%s|r %s %s%s", r*255, g*255, b*255, level > 0 and level or "??", race, color, class.."|r")
				else
					_G["GameTooltipTextLeft"..i]:SetFormattedText("|cff%02x%02x%02x%s|r %s%s", r*255, g*255, b*255, Level > 0 and Level or "??", color, class .."|r")
				end
 
				break
			end
		end
	else
		for i = 2, lines do
			if((_G["GameTooltipTextLeft"..i]:GetText():find("^"..LEVEL)) or (crtype and _G["GameTooltipTextLeft"..i]:GetText():find("^"..crtype))) then
				if level == -1 and classif == "elite" then classif = "worldboss" end
				_G["GameTooltipTextLeft"..i]:SetFormattedText("|cff%02x%02x%02x%s|r%s %s", r*255, g*255, b*255, classif ~= "worldboss" and level ~= 0 and level or "", classification[classif] or "", crtype or "")
				break
			end
		end
	end
 
	local pvpLine
	for i = 1, lines do
		local text = _G["GameTooltipTextLeft"..i]:GetText()
		if text and text == PVP_ENABLED then
			pvpLine = _G["GameTooltipTextLeft"..i]
			pvpLine:SetText()
			break
		end
	end
 
	if UnitExists(unit.."target") and unit~="player" then
		local hex, r, g, b = GetColor(unit.."target")
		if not r and not g and not b then r, g, b = 1, 1, 1 end
		GameTooltip:AddLine(UnitName(unit.."target"), r, g, b)
	end
 
	self.fadeOut = nil
end
GameTooltip:HookScript("OnTooltipSetUnit", OnTooltipSetUnit)
 
oUF_colors = setmetatable({
	tapped = {0.55, 0.57, 0.61},
	disconnected = {0.84, 0.75, 0.65},
	power = setmetatable({
		["MANA"] = {0.31, 0.45, 0.63},
		["RAGE"] = {0.69, 0.31, 0.31},
		["FOCUS"] = {0.71, 0.43, 0.27},
		["ENERGY"] = {0.65, 0.63, 0.35},
		["RUNES"] = {0.55, 0.57, 0.61},
		["RUNIC_POWER"] = {0, 0.82, 1},
		["AMMOSLOT"] = {0.8, 0.6, 0},
		["FUEL"] = {0, 0.55, 0.5},
		["POWER_TYPE_STEAM"] = {0.55, 0.57, 0.61},
		["POWER_TYPE_PYRITE"] = {0.60, 0.09, 0.17},
	}, {__index = oUF.colors.power}),
	happiness = setmetatable({
		[1] = {.69,.31,.31},
		[2] = {.65,.63,.35},
		[3] = {.33,.59,.33},
	}, {__index = oUF.colors.happiness}),
	runes = setmetatable({
		[1] = {.69,.31,.31},
		[2] = {.33,.59,.33},
		[3] = {.31,.45,.63},
		[4] = {.84,.75,.65},
	}, {__index = oUF.colors.runes}),
	reaction = setmetatable({
		[1] = { 222/255, 95/255, 95/255 }, -- Hated
		[2] = { 222/255, 95/255, 95/255 }, -- Hostile
		[3] = { 222/255, 95/255, 95/255 }, -- Unfriendly
		[4] = { 218/255, 197/255, 92/255 }, -- Neutral
		[5] = { 75/255, 175/255, 76/255 }, -- Friendly
		[6] = { 75/255, 175/255, 76/255 }, -- Honored
		[7] = { 75/255, 175/255, 76/255 }, -- Revered
		[8] = { 75/255, 175/255, 76/255 }, -- Exalted
	}, {__index = oUF.colors.reaction}),
	class = setmetatable({
		["DEATHKNIGHT"] = { 196/255, 30/255, 60/255 },
		["DRUID"] = { 255/255, 125/255, 10/255 },
		["HUNTER"] = { 171/255, 214/255, 116/255 },
		["MAGE"] = { 104/255, 205/255, 255/255 },
		["PALADIN"] = { 245/255, 140/255, 186/255 },
		["PRIEST"] = { 212/255, 212/255, 212/255 },
		["ROGUE"] = { 255/255, 243/255, 82/255 },
		["SHAMAN"] = { 41/255, 79/255, 155/255 },
		["WARLOCK"] = { 148/255, 130/255, 201/255 },
		["WARRIOR"] = { 199/255, 156/255, 110/255 },
	}, {__index = oUF.colors.class}),
}, {__index = oUF.colors})
 
local BorderColor = function(self)
	local GetMouseFocus = GetMouseFocus()
	local unit = (select(2, self:GetUnit())) or (GetMouseFocus and GetMouseFocus:GetAttribute("unit"))
		
	if (not Unit) and (UnitExists("mouseover")) then
		Unit = 'mouseover'
	end

	local reaction = unit and UnitReaction(unit, "player")
	local player = unit and UnitIsPlayer(unit)
	local tapped = unit and UnitIsTapped(unit)
	local tappedbyme = unit and UnitIsTappedByPlayer(unit)
	local connected = unit and UnitIsConnected(unit)
	local dead = unit and UnitIsDead(unit)
	local r, g, b
 
	if player then
		local class = select(2, UnitClass(unit))
		local c = oUF_colors.class[class]
		r, g, b = c[1], c[2], c[3]
		healthBar:SetStatusBarColor(r, g, b)
	elseif reaction then
		local c = oUF_colors.reaction[reaction]
		r, g, b = c[1], c[2], c[3]
		healthBar:SetStatusBarColor(r, g, b)
	else
		local _, link = self:GetItem()
		local quality = link and select(3, GetItemInfo(link))
		if quality and quality >= 2 then
			local r, g, b = GetItemQualityColor(quality)
			healthBar:SetStatusBarColor(.15,.15,.15,0)
		end
	end
end
 
function frame1px(f)
	f:SetBackdrop({
		bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=],
	edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1,
		insets = {left = -1, right = -1, top = -1, bottom = -1}
	})
	f:SetBackdropColor(.05,.05,.05,0)
	f:SetBackdropBorderColor(.15,.15,.15,0)
end

local SetStyle = function(self)
	frame1px(self)
	CreateShadowTooltip(self)
	BorderColor(self)
end
 
local SetStyleSafely = function(self)
	--frame1px(self)
	CreateShadowTooltip(self)
	BorderColor(self)
end
 
Tooltip:RegisterEvent("PLAYER_ENTERING_WORLD")
Tooltip:RegisterEvent("ADDON_LOADED")
Tooltip:SetScript("OnEvent", function(self, event, addon)
	if event == "PLAYER_ENTERING_WORLD" then
		for _, tt in pairs(Tooltips) do
			tt:HookScript("OnShow", SetStyleSafely)
		end
 
		ItemRefTooltip:HookScript("OnTooltipSetItem", SetStyle)
		ItemRefTooltip:HookScript("OnShow", SetStyle)	
		frame1px(FriendsTooltip)
		CreateStyle(FriendsTooltip, 2)
		
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
		healthBar:ClearAllPoints()
		healthBar:SetPoint("TOPLEFT", healthBar:GetParent(), "BOTTOMLEFT", 6, 5)
		healthBar:SetPoint("TOPRIGHT", healthBar:GetParent(), "BOTTOMRIGHT", -6, 5)
		
		if Qulight["tooltip"].hidebuttons == true then
			local CombatHideActionButtonsTooltip = function(self)
				if not IsShiftKeyDown() then
					self:Hide()
				end
			end
		 
			hooksecurefunc(GameTooltip, "SetAction", CombatHideActionButtonsTooltip)
			hooksecurefunc(GameTooltip, "SetPetAction", CombatHideActionButtonsTooltip)
			hooksecurefunc(GameTooltip, "SetShapeshift", CombatHideActionButtonsTooltip)
		end
	else
		if addon ~= "Blizzard_DebugTools" then return end
		
		if FrameStackTooltip then
			FrameStackTooltip:SetScale(1)
			
			EventTraceTooltip:HookScript("OnShow", function(self) CreateStyle(self, 2) end)
		end
		
		if EventTraceTooltip then
			EventTraceTooltip:HookScript("OnShow", function(self) CreateStyle(self, 2) end)
		end
	end
end)

----------------------------------------------------------------------------------------
--	Adds item icons to tooltips()
----------------------------------------------------------------------------------------
local function AddIcon(self, icon)
	if icon then
		local title = _G[self:GetName() .. "TextLeft1"]
		if title and not title:GetText():find("|T" .. icon) then
			title:SetFormattedText("|T%s:20:20:0:0:64:64:5:59:5:59:%d|t %s", icon, 20, title:GetText())
		end
	end
end

local function hookItem(tip)
	tip:HookScript("OnTooltipSetItem", function(self, ...)
		local name, link = self:GetItem()
		local icon = link and GetItemIcon(link)
		AddIcon(self, icon)
	end)
end
hookItem(_G["GameTooltip"])
hookItem(_G["ItemRefTooltip"])

local function hookSpell(tip)
	tip:HookScript("OnTooltipSetSpell", function(self, ...)
		if self:GetSpell() then
			local name, rank, icon = GetSpellInfo(self:GetSpell())
			AddIcon(self, icon)
		end
	end)
end
hookSpell(_G["GameTooltip"])
hookSpell(_G["ItemRefTooltip"])

----------------------------------------------------------------------------------------
--	Spell/Item IDs(idTip by silverwind)
----------------------------------------------------------------------------------------
if Qulight["tooltip"].spellid then

	local select, UnitBuff, UnitDebuff, UnitAura, tonumber, strfind, hooksecurefunc =
	select, UnitBuff, UnitDebuff, UnitAura, tonumber, strfind, hooksecurefunc

	local function addLine(self, id, isItem)
		if isItem then
			self:AddLine("|cffffffff".."Item ID:".." "..id)
		else
			self:AddLine("|cffffffff".."Spell ID:".." "..id)
		end
		self:Show()
	end

	hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
		local id = select(11, UnitBuff(...))
		if id then addLine(self, id) end
	end)

	hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
		local id = select(11, UnitDebuff(...))
		if id then addLine(self, id) end
	end)

	hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
		local id = select(11, UnitAura(...))
		if id then addLine(self, id) end
	end)

	GameTooltip:HookScript("OnTooltipSetSpell", function(self)
		local id = select(3, self:GetSpell())
		if id then addLine(self, id) end
	end)
		
	hooksecurefunc("SetItemRef", function(link, ...)
		local id = tonumber(link:match("spell:(%d+)"))
		if id then addLine(ItemRefTooltip, id) end
	end)

	local function attachItemTooltip(self)
		local link = select(2, self:GetItem())
		if not link then return end
		local id = select(3, strfind(link, "^|%x+|Hitem:(%-?%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%-?%d+):(%-?%d+)"))
		if id then addLine(self, id, true) end
	end
	
	GameTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
	ItemRefTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
	ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
	ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
	ShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
	ShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
end


----------------------------------------------------------------------------------------
--	Fix compare tooltips(by Blizzard)(../FrameXML/GameTooltip.lua)
----------------------------------------------------------------------------------------
hooksecurefunc("GameTooltip_ShowCompareItem", function(self, shift)
	if not self then
		self = GameTooltip
	end

	-- Find correct side
	local shoppingTooltip1, shoppingTooltip2 = unpack(self.shoppingTooltips)
	local primaryItemShown, secondaryItemShown = shoppingTooltip1:SetCompareItem(shoppingTooltip2, self)
	local side = "left"
	local rightDist = 0
	local leftPos = self:GetLeft()
	local rightPos = self:GetRight()

	if not rightPos then
		rightPos = 0
	end
	if not leftPos then
		leftPos = 0
	end

	rightDist = GetScreenWidth() - rightPos

	if leftPos and (rightDist < leftPos) then
		side = "left"
	else
		side = "right"
	end

	-- See if we should slide the tooltip
	if self:GetAnchorType() and self:GetAnchorType() ~= "ANCHOR_PRESERVE" then
		local totalWidth = 0
		if primaryItemShown then
			totalWidth = totalWidth + shoppingTooltip1:GetWidth()
		end
		if secondaryItemShown then
			totalWidth = totalWidth + shoppingTooltip2:GetWidth()
		end

		if side == "left" and totalWidth > leftPos then
			self:SetAnchorType(self:GetAnchorType(), totalWidth - leftPos, 0)
		elseif side == "right" and (rightPos + totalWidth) > GetScreenWidth() then
			self:SetAnchorType(self:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0)
		end
	end

	-- Anchor the compare tooltips
	if secondaryItemShown then
		shoppingTooltip2:SetOwner(self, "ANCHOR_NONE")
		shoppingTooltip2:ClearAllPoints()
		if side and side == "left" then
			shoppingTooltip2:SetPoint("TOPRIGHT", self, "TOPLEFT", -3, -10)
		else
			shoppingTooltip2:SetPoint("TOPLEFT", self, "TOPRIGHT", 3, -10)
		end

		shoppingTooltip1:SetOwner(self, "ANCHOR_NONE")
		shoppingTooltip1:ClearAllPoints()

		if side and side == "left" then
			shoppingTooltip1:SetPoint("TOPRIGHT", shoppingTooltip2, "TOPLEFT", -3, 0)
		else
			shoppingTooltip1:SetPoint("TOPLEFT", shoppingTooltip2, "TOPRIGHT", 3, 0)
		end
	else
		shoppingTooltip1:SetOwner(self, "ANCHOR_NONE")
		shoppingTooltip1:ClearAllPoints()

		if side and side == "left" then
			shoppingTooltip1:SetPoint("TOPRIGHT", self, "TOPLEFT", -3, -10)
		else
			shoppingTooltip1:SetPoint("TOPLEFT", self, "TOPRIGHT", 3, -10)
		end

		shoppingTooltip2:Hide()
	end

	shoppingTooltip1:SetCompareItem(shoppingTooltip2, self)
	shoppingTooltip1:Show()
end)


if Qulight["tooltip"].itemlevel then

----------------------------------------------------------------------------------------
--	Equipped average item level(Cloudy Unit Info by Cloudyfa)
----------------------------------------------------------------------------------------

--- Variables ---
local currentID, currentGUID
local GearDB, SpecDB = {}, {}

local nextInspectRequest = 0
local lastInspectRequest = 0

local prefixColor = "|cffF9D700"
local detailColor = "|cffffffff"

local gearPrefix = STAT_FORMAT:format(STAT_AVERAGE_ITEM_LEVEL).."|Heqppditmlvl|h |h"..HIGHLIGHT_FONT_COLOR_CODE
local specPrefix = SPECIALIZATION .. ": "

--- Create Frame ---
local f = CreateFrame("Frame")
f:RegisterEvent("UNIT_INVENTORY_CHANGED")
f:RegisterEvent("INSPECT_READY")

--- Set Unit Info ---
local function SetUnitInfo(gear, spec)
	if (not gear) and (not spec) then return end

	local _, unit = GameTooltip:GetUnit()
	if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

	local gearLine, specLine
	for i = 2, GameTooltip:NumLines() do
		local line = _G["GameTooltipTextLeft" .. i]
		local text = line:GetText()

		if text and strfind(text, gearPrefix) then
			gearLine = line
		elseif text and strfind(text, specPrefix) then
			specLine = line
		end
	end

	if gear then
		gear = prefixColor .. gearPrefix .. detailColor .. gear

		if gearLine then
			gearLine:SetText(gear)
		else
			GameTooltip:AddLine(gear)
		end
	end

	if spec then
		spec = prefixColor .. specPrefix .. detailColor .. spec

		if specLine then
			specLine:SetText(spec)
		else
			GameTooltip:AddLine(spec)
		end
	end

	GameTooltip:Show()
end

--- BOA Item Level ---
local function BOALevel(level, slot)
	if (level > 80) and (slot ~= "INVTYPE_CLOAK") and (slot ~= "INVTYPE_HEAD") and (slot ~= "INVTYPE_LEGS") then
		level = 80
	elseif (level > 85) then
		level = 85
	end

	if (level > 83) then
		level = 333 - (85 - level) * 8
	elseif (level > 80) then
		level = 317 - (83 - level) * 17
	elseif (level >= 68) then
		level = 187 - (80 - level) * 4
	elseif (level >= 58) then
		level = 109 - (68 - level) * 3
	else
		level = level + 5
	end

	return level
end

--- PVP Item Detect ---
local function IsPVPItem(link)
	local itemStats = GetItemStats(link)

	for stat in pairs(itemStats) do
		if (stat == "ITEM_MOD_RESILIENCE_RATING_SHORT") or (stat == "ITEM_MOD_PVP_POWER_SHORT") then
			return true
		end
	end

	return false
end

-- iLevel retrieval
local S_ITEM_LEVEL = "^" .. gsub(ITEM_LEVEL, "%%d", "(%%d+)")
local scantip = CreateFrame("GameTooltip", "ItemLevelScanTooltip", nil, "GameTooltipTemplate")
scantip:SetOwner(UIParent, "ANCHOR_NONE")

local function GetItemLevel(itemLink)
	scantip:SetOwner(UIParent, "ANCHOR_NONE")
	scantip:SetHyperlink(itemLink)
	for i = 2, scantip:NumLines() do -- Line 1 = name so skip
		local text = _G["ItemLevelScanTooltipTextLeft"..i]:GetText()
		if text and text ~= "" then
			local currentLevel = strmatch(text, S_ITEM_LEVEL)
			if currentLevel then
				return currentLevel
			end
		end
	end
	scantip:Hide()
end

--- Unit Gear Info ---
local function UnitGear(id)
	if (not id) or (UnitGUID(id) ~= currentGUID) then return end

	local ulvl = UnitLevel(id)
	local class = select(2, UnitClass(id))

	local ilvl, boa, pvp = 0, 0, 0
	local total, count, delay = 0, 16, nil
	local mainhand, offhand, twohand = 1, 1, 0

	for i = 1, 17 do
		if (i ~= 4) then
			local itemTexture = GetInventoryItemTexture(id, i)

			if itemTexture then
				local itemLink = GetInventoryItemLink(id, i)

				if (not itemLink) then
					delay = true
				else
					local _, _, quality, level, _, _, _, _, slot = GetItemInfo(itemLink)
					local currentLevel = GetItemLevel(itemLink)
					
					if (not quality) or (not level) then
						delay = true
					else
						if currentLevel then
							total = total + currentLevel
						else
							total = total + level
						end
						if IsPVPItem(itemLink) then
							pvp = pvp + 1
						end

						if (i >= 16) then
							if (slot == "INVTYPE_2HWEAPON") or (slot == "INVTYPE_RANGED") or ((slot == "INVTYPE_RANGEDRIGHT") and (class == "HUNTER")) then
								twohand = twohand + 1
							end
						end
					end
				end
			else
				if (i == 16) then
					mainhand = 0
				elseif (i == 17) then
					offhand = 0
				end
			end
		end
	end

	if (mainhand == 0) and (offhand == 0) or (twohand == 1) then
		count = count - 1
	end

	if (not delay) then
		if (id == "player") and (GetAverageItemLevel() > 0) then
			_, ilvl = GetAverageItemLevel()
		else
			ilvl = total / count
		end

		if (ilvl > 0) then ilvl = string.format("%.1f", ilvl) end
		if (boa > 0) then ilvl = ilvl .. "  |cffe6cc80" .. boa .. " BOA" end
		if (pvp > 0) then ilvl = ilvl .. "  |cffa335ee" .. pvp .. " PvP" end
	else
		ilvl = nil
	end

	return ilvl
end

--- Unit Specialization ---
local function UnitSpec(id)
	if (not id) or (UnitGUID(id) ~= currentGUID) then return end

	local specName

	if (id == "player") then
		local specIndex = GetSpecialization()

		if specIndex then
			_, specName = GetSpecializationInfo(specIndex)
		else
			specName = NONE
		end
	else
		local specID = GetInspectSpecialization(id)

		if specID and (specID > 0) then
			_, specName = GetSpecializationInfoByID(specID)
		elseif (specID == 0) then
			specName = NONE
		end
	end

	return specName
end

--- Scan Current Unit ---
local function ScanUnit(id, forced)
	local cachedGear, cachedSpec

	if UnitIsUnit(id, "player") then
		cachedGear = UnitGear("player")
		cachedSpec = UnitSpec("player")

		SetUnitInfo(cachedGear or CONTINUED, cachedSpec or CONTINUED)
	else
		if (not id) or (UnitGUID(id) ~= currentGUID) then return end

		cachedGear = GearDB[currentGUID]
		--cachedSpec = SpecDB[currentGUID]
		--always to get spec
		cachedSpec = UnitSpec("player")

		--cachedGear? ok...skip get gear
		if cachedGear and not forced then
			SetUnitInfo(cachedGear, cachedSpec or CONTINUED)
		end

		if not (IsShiftKeyDown() or forced) then
			if UnitAffectingCombat("player") then return end
		end

		if (not UnitIsVisible(id)) then return end
		if UnitIsDeadOrGhost("player") or UnitOnTaxi("player") then return end
		if InspectFrame and InspectFrame:IsShown() then return end
		
		--press shift To refresh
		if IsShiftKeyDown() then
			SetUnitInfo(CONTINUED, CONTINUED)
		else
			SetUnitInfo(cachedGear or CONTINUED, cachedSpec or CONTINUED)
		end

		local timeSinceLastInspect = GetTime() - lastInspectRequest
		if (timeSinceLastInspect >= 1.5) then
			nextInspectRequest = 0
		else
			nextInspectRequest = 1.5 - timeSinceLastInspect
		end
		f:Show()
	end
end

--- Character Info Sheet ---
hooksecurefunc("PaperDollFrame_SetItemLevel", function(self, unit)
	if (unit ~= "player") then return end

	local total, equip = GetAverageItemLevel()
	if (total > 0) then total = string.format("%.1f", total) end
	if (equip > 0) then equip = string.format("%.1f", equip) end

	local ilvl = equip
--
	if (equip < total) then
		ilvl = equip .. " / " .. total
	end

	local ilvlLine = _G[self:GetName() .. "StatText"]
	ilvlLine:SetText(ilvl)
--
	self.tooltip = detailColor .. STAT_AVERAGE_ITEM_LEVEL .. " " .. ilvl
end)

--- Handle Events ---
f:SetScript("OnEvent", function(self, event, ...)
	if (event == "UNIT_INVENTORY_CHANGED") then
		local id = ...
		if (UnitGUID(id) == currentGUID) then
			ScanUnit(id, true)
		end
	elseif (event == "INSPECT_READY") then
		local guid = ...
		if (guid ~= currentGUID) then return end

		local gear = UnitGear(currentID)
		GearDB[currentGUID] = gear

		local spec = UnitSpec(currentID)
		SpecDB[currentGUID] = spec

		if (not gear) or (not spec) then
			ScanUnit(currentID, true)
		else
			SetUnitInfo(gear, spec)
		end
	end
end)

f:SetScript("OnUpdate", function(self, elapsed)
	nextInspectRequest = nextInspectRequest - elapsed
	if (nextInspectRequest > 0) then return end

	self:Hide()

	if currentID and (UnitGUID(currentID) == currentGUID) then
		lastInspectRequest = GetTime()
		NotifyInspect(currentID)
	end
end)

GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	local _, unit = self:GetUnit()

	if (not unit) or (not CanInspect(unit)) then return end
	if (UnitLevel(unit) > 0) and (UnitLevel(unit) < 10) then return end

	currentID, currentGUID = unit, UnitGUID(unit)
	ScanUnit(unit)
end)
end
----------------------------------------------------------------------------------------
--	Fix blank tooltip
----------------------------------------------------------------------------------------
local FixTooltip = CreateFrame("Frame")
FixTooltip:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
FixTooltip:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
FixTooltip:SetScript("OnEvent", function()
	for i = 1, 12 do
		local button = _G["ActionButton" .. i]
		if GameTooltip:GetOwner() == button then
			GameTooltip:Hide()
		end
	end
end)

local FixTooltipBags = CreateFrame("Frame")
FixTooltipBags:RegisterEvent("BAG_UPDATE_DELAYED")
FixTooltipBags:SetScript("OnEvent", function()
	if StuffingFrameBags and StuffingFrameBags:IsShown() then
		GameTooltip:Hide()
	end
end)


----------------------------------------------------------------------------------------
--	Your achievement status in tooltip(Enhanced Achievements by Syzgyn)
----------------------------------------------------------------------------------------
local colors = {
	["GREEN"] = {
		["r"] = 0.25,
		["g"] = 0.75,
		["b"] = 0.25,
	},
	["GRAY"] = {
		["r"] = 0.5,
		["g"] = 0.5,
		["b"] = 0.5,
	},
}

local function SetHyperlink(tooltip, refString)
	local output = {[0] = {}, [1] = {}}
	if select(3, string.find(refString, "(%a-):")) ~= "achievement" then return end

	local _, _, achievementID = string.find(refString, ":(%d+):")
	local numCriteria = GetAchievementNumCriteria(achievementID)
	local _, _, GUID = string.find(refString, ":%d+:(.-):")

	if GUID == string.sub(UnitGUID("player"), 3) then
		tooltip:Show()
		return
	end

	tooltip:AddLine(" ")
	local _, _, _, completed, month, day, year, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID)

	if completed then
		if year < 10 then year = "0"..year end

		if client == "ruRU" then
			tooltip:AddLine("Your Status: Completed on "..day.."/"..month.."/"..year, 0, 1, 0)
		else
			tooltip:AddLine("Your Status: Completed on "..month.."/"..day.."/"..year, 0, 1, 0)
		end

		if earnedBy then
			tooltip:AddLine(format(ACHIEVEMENT_EARNED_BY, earnedBy))
			if not wasEarnedByMe then
				tooltip:AddLine(format(ACHIEVEMENT_NOT_COMPLETED_BY, name))
			elseif name ~= earnedBy then
				tooltip:AddLine(format(ACHIEVEMENT_COMPLETED_BY, name))
			end
		end
	elseif numCriteria == 0 then
		tooltip:AddLine("Your Status: Incomplete")
	else
		tooltip:AddLine("Your Status:")
		for i = 1, numCriteria, 2 do
			for a = 0, 1 do
				output[a].text = nil
				output[a].color = nil
				if i + a <= numCriteria then
					local name, _, completed, quantity, reqQuantity = GetAchievementCriteriaInfo(achievementID, i + a)
					if completed then
						output[a].text = name
						output[a].color = "GREEN"
					else
						if quantity < reqQuantity and reqQuantity > 1 then
							output[a].text = name.." ("..quantity.."/"..reqQuantity..")"
							output[a].color = "GRAY"
						else
							output[a].text = name
							output[a].color = "GRAY"
						end
					end
				else
					output[a].text = nil
				end
			end
			if output[1].text == nil then
				tooltip:AddLine(output[0].text, colors[output[0].color].r, colors[output[0].color].g, colors[output[0].color].b)
			else
				tooltip:AddDoubleLine(output[0].text, output[1].text, colors[output[0].color].r, colors[output[0].color].g, colors[output[0].color].b, colors[output[1].color].r, colors[output[1].color].g, colors[output[1].color].b)
			end
			output = {[0] = {}, [1] = {}}
		end
	end
	tooltip:Show()
end

hooksecurefunc(GameTooltip, "SetHyperlink", SetHyperlink)
hooksecurefunc(ItemRefTooltip, "SetHyperlink", SetHyperlink)