local _, private = ...

-- [[ Lua Globals ]]
local _G = _G

-- [[ Core ]]
local F, C = unpack(select(2, ...))

_G.tinsert(C.themes["Aurora"], function()
	_G.CharacterFrameInsetRight:DisableDrawLayer("BACKGROUND")
	_G.CharacterFrameInsetRight:DisableDrawLayer("BORDER")

	F.ReskinPortraitFrame(_G.CharacterFrame, true)

	local i = 1
	while _G["CharacterFrameTab"..i] do
		F.ReskinTab(_G["CharacterFrameTab"..i])
		i = i + 1
	end
end)
