if not Qulight["addonskins"].Aurora == true then return end
local F, C = unpack(select(2, ...))

C.modules["Blizzard_BattlefieldMinimap"] = function()
		F.SetBD(BattlefieldMinimap, -1, 1, -5, 3)
		BattlefieldMinimapCorner:Hide()
		BattlefieldMinimapBackground:Hide()
		BattlefieldMinimapCloseButton:Hide()
end