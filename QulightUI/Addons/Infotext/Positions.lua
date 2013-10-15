if Qulight["datatext"].classcolor == true then
	local classcolor = RAID_CLASS_COLORS[myclass]
	Qulight["datatext"].color = {classcolor.r,classcolor.g,classcolor.b,1}
end

LeftDatatexts = {}
function PP(p, obj)
	if p == 1 then
		obj:SetHeight(DataLeftPanel:GetHeight())
		obj:SetPoint("LEFT", DataLeftPanel, "LEFT", 10, 0)
	elseif p == 2 then
		obj:SetHeight(DataLeftPanel:GetHeight())
		obj:SetPoint("CENTER", DataLeftPanel, "CENTER", 0, 0)
	elseif p == 3 then
		obj:SetHeight(DataLeftPanel:GetHeight())
		obj:SetPoint("RIGHT", DataLeftPanel, "RIGHT", -110, 0)
	elseif p == 4 then
		obj:SetHeight(DataRightPanel:GetHeight())
		obj:SetPoint("LEFT", DataRightPanel,"LEFT", 10, 0)
	elseif p == 5 then
		obj:SetHeight(DataRightPanel:GetHeight())
		obj:SetPoint("CENTER", DataRightPanel,"CENTER", -20, 0)
	elseif p == 6 then
		obj:SetHeight(DataRightPanel:GetHeight())
		obj:SetPoint("CENTER", DataRightPanel,"CENTER", 0, 0)
	elseif p == 7 then
		obj:SetHeight(DataLeftPanel:GetHeight())
		obj:SetPoint("RIGHT", DataLeftPanel,"RIGHT", -10, 0)
	elseif p == 8 then
		obj:SetHeight(DataRightPanel:GetHeight())
		obj:SetPoint("RIGHT", DataRightPanel,"RIGHT", -10, 0)
	elseif p == 9 then
		obj:SetHeight(DataRightPanel:GetHeight())
		obj:SetPoint("RIGHT", DataRightPanel,"RIGHT", -90, 0)
	elseif p == 10 then
		obj:SetHeight(DataRightPanel:GetHeight())
		obj:SetPoint("LEFT", righttabpanel,"LEFT", 10, 0)
	elseif p == 11 then
		obj:SetHeight(CenterDPSPanel:GetHeight())
		obj:SetPoint("LEFT", CenterDPSPanel,"LEFT", 10, 0)
	elseif p == 12 then
		obj:SetHeight(CenterDPSPanel:GetHeight())
		obj:SetPoint("RIGHT", CenterDPSPanel,"RIGHT", -10, 0)
	elseif p == 13 then
		obj:SetHeight(CenterDPSPanel:GetHeight())
		obj:SetPoint("CENTER", CenterDPSPanel,"CENTER", 0, 0)			
	elseif p == 14 then
		obj:SetHeight(minimaplol2:GetHeight())
		obj:SetPoint("LEFT", minimaplol2, "LEFT", 7, 1)			
	end
end