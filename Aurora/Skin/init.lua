local ADDON_NAME, private = ...

-- luacheck: globals select tostring tonumber

private.API_MAJOR, private.API_MINOR = 0, 3

local xpac, major, minor = _G.strsplit(".", _G.GetBuildInfo())
private.isPatch = tonumber(xpac) == 8 and (tonumber(major) >= 0 and tonumber(minor) >= 1)

private.uiScale = 1
private.disabled = {
    bags = false,
    fonts = false,
    tooltips = false,
    mainmenubar = false,
    uiScale = true,
    pixelScale = true
}


local classLocale, class, classID = _G.UnitClass("player")
private.charClass = {
    locale = classLocale,
    token = class,
    id = classID,
}

do -- private.font
    local fontPath = [[Interface\AddOns\Aurora\media\font.ttf]]
    if _G.LOCALE_koKR then
        fontPath = [[Fonts/2002.ttf]]
    elseif _G.LOCALE_zhCN then
        fontPath = [[Fonts/ARKai_T.ttf]]
    elseif _G.LOCALE_zhTW then
        fontPath = [[Fonts/blei00d.ttf]]
    end

    private.font = {
        normal = fontPath,
        chat = fontPath,
        crit = fontPath,
        header = fontPath,
    }
end

function private.nop() end
local debug do
    if _G.LibStub then
        local debugger
        local LTD = _G.LibStub("LibTextDump-1.0", true)
        function debug(...)
            if not debugger then
                if LTD then
                    debugger = LTD:New(ADDON_NAME .." Debug Output", 640, 480)
                    private.debugger = debugger
                else
                    return
                end
            end
            local time = _G.date("%H:%M:%S")
            local text = ("[%s]"):format(time)
            for i = 1, select("#", ...) do
                local arg = select(i, ...)
                text = text .. "     " .. tostring(arg)
            end
            debugger:AddLine(text)
        end
    else
        debug = private.nop
    end
    private.debug = debug
end

local Aurora = {
    Base = {},
    Scale = {},
    Hook = {},
    Skin = {},
    Color = {},
    Util = {},
}
private.Aurora = Aurora
_G.Aurora = Aurora

local eventFrame = _G.CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("UI_SCALE_CHANGED")
eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "UI_SCALE_CHANGED" then
        private.UpdateUIScale()
    else
        if addonName == ADDON_NAME then
            -- Setup function for the host addon
            private.OnLoad()
            private.UpdateUIScale()

            if private.disabled.uiScale then
                function Aurora.Scale.Value(value)
                    return value
                end
            end

            if _G.AuroraConfig then
                Aurora[2].buttonsHaveGradient = _G.AuroraConfig.buttonsHaveGradient
            end

            -- Skin FrameXML
            for i = 1, #private.FrameXML do
                local file, isShared = _G.strsplit(".", private.FrameXML[i])
                local fileList = private.FrameXML
                if isShared then
                    file = isShared
                    fileList = private.SharedXML
                end
                if fileList[file] then
                    fileList[file]()
                end
            end

            if not private.isPatch then
                private.FrameXML.ChannelFrame()
            end

            -- Skin prior loaded AddOns
            for addon, func in _G.next, private.AddOns do
                local loaded = _G.IsAddOnLoaded(addon)
                if loaded then
                    func()
                end
            end

            private.isLoaded = true
        else
            -- Skin AddOn
            local addonModule = private.AddOns[addonName]
            if addonModule then
                addonModule()
            end
        end

        -- Load deprected themes
        local addonModule = Aurora[2].themes[addonName]
        if addonModule then
            if _G.type(addonModule) == "function" then
                addonModule()
            else
                for _, moduleFunc in _G.next, addonModule do
                    moduleFunc()
                end
            end
        end
    end
end)
