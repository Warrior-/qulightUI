local _, private = ...

--[[ Lua Globals ]]
-- luacheck: globals

--[[ Core ]]
local Aurora = private.Aurora
local Base = Aurora.Base
local Skin = Aurora.Skin
local Color, Util = Aurora.Color, Aurora.Util

--[[ do AddOns\Blizzard_BindingUI.lua
end ]]

do --[[ AddOns\Blizzard_BindingUI.xml ]]
    function Skin.KeyBindingFrameBindingButtonTemplate(Button)
        Skin.UIMenuButtonStretchTemplate(Button)
    end
    function Skin.KeyBindingFrameBindingTemplate(Frame)
        Skin.KeyBindingFrameBindingButtonTemplate(Frame.key1Button)
        Skin.KeyBindingFrameBindingButtonTemplate(Frame.key2Button)
    end
end

function private.AddOns.Blizzard_BindingUI()
    local KeyBindingFrame = _G.KeyBindingFrame
    Base.SetBackdrop(KeyBindingFrame)

    KeyBindingFrame.header:DisableDrawLayer("BACKGROUND")
    KeyBindingFrame.header:DisableDrawLayer("BORDER")
    KeyBindingFrame.header.text:ClearAllPoints()
    KeyBindingFrame.header.text:SetPoint("TOP", KeyBindingFrame, "TOP", 0, -8)

    Skin.UICheckButtonTemplate(KeyBindingFrame.characterSpecificButton)
    Skin.UIPanelButtonTemplate(KeyBindingFrame.unbindButton)
    Skin.UIPanelButtonTemplate(KeyBindingFrame.okayButton)
    Skin.UIPanelButtonTemplate(KeyBindingFrame.cancelButton)
    Util.PositionRelative("BOTTOMRIGHT", KeyBindingFrame, "BOTTOMRIGHT", -10, 10, 5, "Left", {
        KeyBindingFrame.cancelButton,
        KeyBindingFrame.okayButton,
        KeyBindingFrame.unbindButton
    })

    Skin.UIPanelButtonTemplate(KeyBindingFrame.defaultsButton)
    KeyBindingFrame.defaultsButton:SetPoint("BOTTOMLEFT", 10, 10)

    Base.SetBackdrop(KeyBindingFrame.bindingsContainer, Color.frame)
    Skin.OptionsFrameListTemplate(KeyBindingFrame.categoryList)
    Skin.FauxScrollFrameTemplate(KeyBindingFrame.scrollFrame)
    KeyBindingFrame.scrollFrame.scrollBorderTop:Hide()
    KeyBindingFrame.scrollFrame.scrollBorderBottom:Hide()
    KeyBindingFrame.scrollFrame.scrollBorderMiddle:Hide()
    KeyBindingFrame.scrollFrame.scrollFrameScrollBarBackground:Hide()


    for i = 1, _G.KEY_BINDINGS_DISPLAYED do
        Skin.KeyBindingFrameBindingTemplate(KeyBindingFrame.keyBindingRows[i])
    end

    --[[ Scale ]]--
end
