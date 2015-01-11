WatchFrame:SetClampedToScreen(false)
WatchFrame:ClearAllPoints()
WatchFrame.ClearAllPoints = function() return end
WatchFrame:SetWidth(250)
WatchFrame:SetHeight(500)
WatchFrame:SetPoint("TOPRIGHT", AnchorWatchFrame)
WatchFrame.SetPoint = function() return end