
if not Qulight["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- setup MultiBarRight as bar #4
---------------------------------------------------------------------------

local bar = QuBar4
bar:SetAlpha(1)
MultiBarLeft:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarLeftButton"..i]
	local b2 = _G["MultiBarLeftButton"..i-1]
	b:RegisterForClicks("LeftButtonDown", "RightButtonUp")
	b:SetSize(buttonsize, buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOPLEFT", bar, buttonspacing,-buttonspacing)
	elseif i == (Qulight.actionbar.mainbarWidth+1) then
		b:SetPoint("TOP", UIParent, "BOTTOM", 0, -20)
	else
		b:SetPoint("LEFT", b2, "RIGHT", buttonspacing, 0)
	end
end