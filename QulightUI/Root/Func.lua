function UIScale()
	if Qulight["general"].AutoScale == true then
	Qulight["general"].UiScale = min(2, max(.64, 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")))
	end
end
UIScale()

local mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/Qulight["general"].UiScale
local function scale(x)
    return mult*math.floor(x/mult+.5)
end
function Scale(x) return scale(x) end
mult = mult

function CreatePanel(f, w, h, a1, p, a2, x, y)
	local _, class = UnitClass("player")
	local r, g, b = RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b
	sh = scale(h)
	sw = scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(a1, p, a2, x, y)
	f:SetBackdrop({
	  bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
      edgeFile = "Interface\\Buttons\\WHITE8x8", 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	f:SetBackdropColor(.05,.05,.05,0)
	f:SetBackdropBorderColor(.15,.15,.15,0)
end
function SimpleBackground(f, w, h, a1, p, a2, x, y)
	local _, class = UnitClass("player")
	local r, g, b = RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b
	sh = scale(h)
	sw = scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(a1, p, a2, x, y)
	f:SetBackdrop({
	  bgFile = Qulight["media"].texture,
      edgeFile = Qulight["media"].texture, 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = mult, right = mult, top = mult, bottom = mult}
	})
	f:SetBackdropColor(.07,.07,.07, 1)
	f:SetBackdropBorderColor(0, 0, 0, 1)
end
local style = {
	bgFile =  Qulight["media"].texture,
	edgeFile = Qulight["media"].glow, 
	edgeSize = 4,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
}
function CreateStyle(f, size, level, alpha, alphaborder) --
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(level or 0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -size, size)
	shadow:SetPoint("BOTTOMRIGHT", size, -size)
	shadow:SetBackdrop(style)
	shadow:SetBackdropColor(.08,.08,.08, alpha or .9)
	shadow:SetBackdropBorderColor(0, 0, 0, alphaborder or 1)
	f.shadow = shadow
	return shadow
end
function frame1px(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetBackdropColor(.05,.05,.05,0)
	f:SetBackdropBorderColor(.15,.15,.15,0)	
end