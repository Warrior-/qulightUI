----------------------------------------------------------------------------------------
-- Quest level(yQuestLevel by yleaf)
----------------------------------------------------------------------------------------
local function update()
	local buttons = QuestLogScrollFrame.buttons
	local numButtons = #buttons
	local scrollOffset = HybridScrollFrame_GetOffset(QuestLogScrollFrame)
	local numEntries, numQuests = GetNumQuestLogEntries()
	
	for i = 1, numButtons do
		local questIndex = i + scrollOffset
		local questLogTitle = buttons[i]
		if questIndex <= numEntries then
			local title, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questIndex)
			if not isHeader then
				questLogTitle:SetText("[" .. level .. "] " .. title)
				QuestLogTitleButton_Resize(questLogTitle)
			end
		end
	end
end
hooksecurefunc("QuestLog_Update", update)
QuestLogScrollFrameScrollBar:HookScript("OnValueChanged", update)
----------------------------------------------------------------------------------------
-- Clear UIErrors frame(ncError by Nightcracker)
----------------------------------------------------------------------------------------
if Qulight["general"].BlizzardsErrorFrameHiding then
	local f, o, ncErrorDB = CreateFrame("Frame"), "No error ye", {
		["Inventory is full"] = true,
	}
	f:SetScript("OnEvent", function(self, event, error)
		if ncErrorDB[error] then
			UIErrorsFrame:AddMessage(error)
		else
		o = error
		end
	end)
	SLASH_NCERROR1 = "/error"
	function SlashCmdLisNCERROR() print(o) end
	UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
	f:RegisterEvent("UI_ERROR_MESSAGE")
end
----------------------------------------------------------------------------------------
-- Auto greed on green items(by Tekkub)
----------------------------------------------------------------------------------------
if Qulight["general"].AutoGreed  then
	local agog = CreateFrame("Frame", nil, UIParent)
	agog:RegisterEvent("START_LOOT_ROLL")
	agog:SetScript("OnEvent", function(_, _, id)
	if not id then return end 
	local _, _, _, quality, bop, _, _, canDE = GetLootRollItemInfo(id)
	if quality == 2 and not bop then RollOnLoot(id, canDE and 3 or 2) end
	end)
end
----------------------------------------------------------------------------------------
-- Disenchant confirmation(tekKrush by Tekkub)
----------------------------------------------------------------------------------------
if Qulight["general"].AutoDisenchant then
	local acd = CreateFrame("Frame")
	acd:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
	acd:SetScript("OnEvent", function(self, event, id, rollType)
		for i=1,STATICPOPUP_NUMDIALOGS do
			local frame = _G["StaticPopup"..i]
			if frame.which == "CONFIRM_LOOT_ROLL" and frame.data == id and frame.data2 == rollType and frame:IsVisible() then StaticPopup_OnClick(frame, 1) end
		end
	end)
	
	StaticPopupDialogs["LOOT_BIND"].OnCancel = function(self, slot)
	if GetNumPartyMembers() == 0 and GetNumRaidMembers() == 0 then ConfirmLootSlot(slot) end
	end
end
----------------------------------------------------------------------------------------
-- Universal Mount macro : /script Mountz ("your_ground_mount","your_flying_mount") 
----------------------------------------------------------------------------------------
function Mountz(groundmount, flyingmount)
    local num = GetNumCompanions("MOUNT")
    if not num or IsMounted() then
        Dismount()
        return
    end
    if CanExitVehicle() then 
        VehicleExit()
        return
    end
    local x, y = GetPlayerMapPosition("player")
    
    local flyablex = (IsFlyableArea() and (not (GetZoneText() == L_DALARAN or (GetZoneText() == L_WINTERGRASP and wgtime == nil)) or GetSubZoneText() == L_KRASUS or (GetSubZoneText() == L_UNDERBELLY and ((x*100)<32)) or (GetSubZoneText() == L_VC and (x*100)<33))) and (UnitLevel("player")>67 or (GetCurrentMapContinent()==3 and UnitLevel("player")>59))
    if IsAltKeyDown() then
        flyablex = not flyablex
    end
    for i=1, num, 1 do
        local _, info = GetCompanionInfo("MOUNT", i)
        if flyingmount and info == flyingmount and flyablex then
            CallCompanion("MOUNT", i)
            return
        elseif groundmount and info == groundmount and not flyablex then
            CallCompanion("MOUNT", i)
            return
        end
    end
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function()
		local c = 0
		for b=0,4 do
			for s=1,GetContainerNumSlots(b) do
				local l = GetContainerItemLink(b, s)
				if l then
					local p = select(11, GetItemInfo(l))*select(2, GetContainerItemInfo(b, s))
					if select(3, GetItemInfo(l))==0 then
						UseContainerItem(b, s)
						PickupMerchantItem()
						c = c+p
					end
				end
			end
		end
		if c>0 then
			local g, s, c = math.floor(c/10000) or 0, math.floor((c%10000)/100) or 0, c%100
			DEFAULT_CHAT_FRAME:AddMessage("Your vendor trash has been sold and you earned".." |cffffffff"..g.."|cffffd700g|r".." |cffffffff"..s.."|cffc7c7cfs|r".." |cffffffff"..c.."|cffeda55fc|r"..".",255,255,0)
		end
	if Qulight["general"].AutoRepair then
			cost, possible = GetRepairAllCost()
			if cost>0 then
				if possible then
					RepairAllItems()
					local c = cost%100
					local s = math.floor((cost%10000)/100)
					local g = math.floor(cost/10000)
					DEFAULT_CHAT_FRAME:AddMessage("Your items have been repaired for".." |cffffffff"..g.."|cffffd700g|r".." |cffffffff"..s.."|cffc7c7cfs|r".." |cffffffff"..c.."|cffeda55fc|r"..".",255,255,0)
				else
					DEFAULT_CHAT_FRAME:AddMessage("You don't have enough money for repair!",255,0,0)
				end
			end
	end		
end)
f:RegisterEvent("MERCHANT_SHOW")
local savedMerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick
function MerchantItemButton_OnModifiedClick(self, ...)
	if ( IsAltKeyDown() ) then
		local maxStack = select(8, GetItemInfo(GetMerchantItemLink(self:GetID())))
		local name, texture, price, quantity, numAvailable, isUsable, extendedCost = GetMerchantItemInfo(self:GetID())
		if ( maxStack and maxStack > 1 ) then
			BuyMerchantItem(self:GetID(), floor(maxStack / quantity))
		end
	end
	savedMerchantItemButton_OnModifiedClick(self, ...)
end

if Qulight["misk"].AutoScreen then
local function TakeScreen(delay, func, ...)
local waitTable = {}
local waitFrame = CreateFrame("Frame", "WaitFrame", UIParent)
	waitFrame:SetScript("onUpdate", function (self, elapse)
		local count = #waitTable
		local i = 1
		while (i <= count) do
			local waitRecord = tremove(waitTable, i)
			local d = tremove(waitRecord, 1)
			local f = tremove(waitRecord, 1)
			local p = tremove(waitRecord, 1)
			if (d > elapse) then
				tinsert(waitTable, i, {d-elapse, f, p})
				i = i + 1
			else
				count = count - 1
				f(unpack(p))
			end
		end
	end)
	tinsert(waitTable, {delay, func, {...} })
end
local function OnEvent(...)
	TakeScreen(1, Screenshot)
end
local AchScreen = CreateFrame("Frame")
AchScreen:RegisterEvent("ACHIEVEMENT_EARNED")
AchScreen:SetScript("OnEvent", OnEvent)
end


RaidBossEmoteFrame:ClearAllPoints()
RaidBossEmoteFrame:SetPoint("TOP", UIParent, "TOP", 0, -200) 
RaidBossEmoteFrame:SetScale(.9)

RaidWarningFrame:ClearAllPoints()
RaidWarningFrame:SetPoint("TOP", UIParent, "TOP", 0, -260) 
RaidWarningFrame:SetScale(.8)
