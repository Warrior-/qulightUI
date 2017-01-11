local _, private = ...

-- [[ Lua Globals ]]
local _G = _G

-- [[ Core ]]
local F, C = unpack(select(2, ...))

_G.tinsert(C.themes["Aurora"], function()
	local ProductChoiceFrame = _G.ProductChoiceFrame

	ProductChoiceFrame.Inset.Bg:Hide()
	ProductChoiceFrame.Inset:DisableDrawLayer("BORDER")

	F.ReskinPortraitFrame(ProductChoiceFrame)
	F.Reskin(ProductChoiceFrame.Inset.ClaimButton)
end)
