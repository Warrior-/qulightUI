----------------------------------------------------------------------------------------
--	Move ObjectiveTrackerFrame
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame", "WatchFrameAnchor", UIParent)
frame:ClearAllPoints()
frame.ClearAllPoints = function() return end
frame:SetWidth(250)
frame:SetHeight(500)
frame:SetPoint("TOPRIGHT", AnchorWatchFrame)
frame.SetPoint = function() return end

ObjectiveTrackerFrame:ClearAllPoints()
ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, 0)
ObjectiveTrackerFrame:SetHeight(tonumber(string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")) / 1.6)

hooksecurefunc(ObjectiveTrackerFrame, "SetPoint", function(_, _, parent)
	if parent ~= frame then
		ObjectiveTrackerFrame:ClearAllPoints()
		ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, 0)
	end
end)

----------------------------------------------------------------------------------------
--	Skin ObjectiveTrackerFrame item buttons
----------------------------------------------------------------------------------------
hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	local item = block.itemButton

	if item and not item.skinned then
		item:SetSize(34, 34)
		item:SetNormalTexture(nil)
		CreateStyle(item, 3)

		item.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		item.icon:SetPoint("TOPLEFT", item, 2, -2)
		item.icon:SetPoint("BOTTOMRIGHT", item, -2, 2)

		item.HotKey:ClearAllPoints()
		item.HotKey:SetPoint("BOTTOMRIGHT", 0, 2)
		item.HotKey:SetFont(Qulight["media"].font, 10, "OUTLINE")

		item.Count:ClearAllPoints()
		item.Count:SetPoint("TOPLEFT", 1, -1)
		item.Count:SetFont(Qulight["media"].font, 10, "OUTLINE")

		item.skinned = true
	end
end)

for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
	local header = ObjectiveTrackerFrame.BlocksFrame[headerName].Background:Hide()
end

	SkinCloseButton(ObjectiveTrackerFrame.HeaderMenu.MinimizeButton, nil, "-", true)

	hooksecurefunc("ObjectiveTracker_Collapse", function()
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.text:SetText("+")
	end)

	hooksecurefunc("ObjectiveTracker_Expand", function()
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.text:SetText("-")
	end)
end