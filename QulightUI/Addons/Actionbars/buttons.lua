if not Qulight["actionbar"].enable == true then return end
-----------------
-- Color
-----------------
-- convert datatext color from rgb decimal to hex 
local dr, dg, db = unpack(Qulight["datatext"].color)
panelcolor = ("|cff%.2x%.2x%.2x"):format(dr * 255, dg * 255, db * 255)
-- class color
local r, g, b = unpack(Qulight["datatext"].color)
qColor = ("|cff%.2x%.2x%.2x"):format(r * 255, g * 255, b * 255)

-- exit vehicle button on left side of bottom action bar
local vehicleleft = CreateFrame("Button", "QuExitVehicleButtonLeft", UIParent, "SecureHandlerClickTemplate")
CreatePanel(vehicleleft, 20, 20, "BOTTOM", QuBar1, "BOTTOM", 0, -65)
CreateShadow(vehicleleft)

vehicleleft:RegisterForClicks("AnyUp")
vehicleleft:SetScript("OnClick", function() VehicleExit() end)
vehicleleftext = SetFontString(vehicleleft, Qulight.media.font, 15)
vehicleleftext:SetPoint("CENTER", 0, 0)
vehicleleftext:SetText("|cff4BAF4CV|r")
RegisterStateDriver(vehicleleft, "visibility", "[target=vehicle,exists] show;hide")


