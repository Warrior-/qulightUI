local csf = CreateFrame("Frame")
csf:SetScript("OnEvent", function()
SetCVar("cameraDistanceMaxFactor", 3.4)
SetCVar("ShowClassColorInNameplate", 1)
SetCVar("buffDurations",1)
SetCVar("scriptErrors", 1)

end)
csf:RegisterEvent("PLAYER_LOGIN")

----------------------------------------------------------------------------------------
-- Launcher
----------------------------------------------------------------------------------------
local function positionsetup()
	QulightDataPerChar = {}
end

local QulightOnLogon = CreateFrame("Frame")
QulightOnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
QulightOnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
	if (QulightData == nil) then QulightData = {} end
	if (QulightDataPerChar == nil) then QulightDataPerChar = {} end

	print(" ")
	print("Welcome to |cFF00A2FFQulight UI|r")
	print(" ")
	print("|cFF00A2FFhttp://QulightUI.org |r - Site UI;")
	print(" ")
	print("|cFF00A2FF/config |r - Config Qulight UI;")
	print("|cFF00A2FF/ui |r - Command for change all UI positions.")
	print("|cFF00A2FF/ui reset |r - Set default UI postions.")
end)

resolution = ({GetScreenResolutions()})[GetCurrentResolution()] or GetCVar("gxWindowedResolution")
getscreenwidth, getscreenheight = DecodeResolution(resolution)

if getscreenwidth < 1024 and GetCVar("gxMonitor") == "0" then
		SetCVar("useUiScale", 0)
		StaticPopup_Show("DISABLE_UI")
	else
		SetCVar("useUiScale", 1)
		if Qulight["general"].UiScale > 1.28 then Qulight["general"].UiScale = 1.28 end
		if Qulight["general"].UiScale < 0.64 then Qulight["general"].UiScale = 0.64 end

		-- Set our uiscale
		SetCVar("uiScale", Qulight["general"].UiScale)

		-- Hack for 4K and WQHD Resolution
		local customScale = min(2, max(0.32, 768 / string.match(resolution, "%d+x(%d+)")))
		if Qulight["general"].AutoScale == true and customScale < 0.64 then
			UIParent:SetScale(customScale)
		elseif customScale < 0.64 then
			UIParent:SetScale(Qulight["general"].UiScale)
		end
end