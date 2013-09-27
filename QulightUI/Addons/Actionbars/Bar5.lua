if not Qulight["actionbar"].enable == true then return end

local bar = QuBar5
bar:SetAlpha(1)
MultiBarRight:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarRightButton"..i]
	local b2 = _G["MultiBarRightButton"..i-1]
	b:SetSize(buttonsize, buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOPLEFT", bar, buttonspacing, -buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", buttonspacing*1.1, 0)
	end
end