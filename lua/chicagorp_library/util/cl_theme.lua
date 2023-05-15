local primaryclr_r = CreateClientConVar("chicagoRP_clr_primary_r", 255, true, false, "Changes the theme's (R) color value for primary text.", 1, 255)
local primaryclr_g = CreateClientConVar("chicagoRP_clr_primary_g", 255, true, false, "Changes the theme's (G) color value for primary text.", 1, 255)
local primaryclr_b = CreateClientConVar("chicagoRP_clr_primary_b", 255, true, false, "Changes the theme's (B) color value for primary text.", 1, 255)
local secondaryclr_r = CreateClientConVar("chicagoRP_clr_secondary_r", 130, true, false, "Changes the theme's (R) color value for secondary text.", 1, 255)
local secondaryclr_g = CreateClientConVar("chicagoRP_clr_secondary_g", 25, true, false, "Changes the theme's (G) color value for secondary text.", 1, 255)
local secondaryclr_b = CreateClientConVar("chicagoRP_clr_secondary_b", 40, true, false, "Changes the theme's (B) color value for secondary text.", 1, 255)
local accentclr_r = CreateClientConVar("chicagoRP_clr_accent_r", 180, true, false, "Changes the theme's (R) color value for accent text.", 1, 255)
local accentclr_g = CreateClientConVar("chicagoRP_clr_accent_g", 20, true, false, "Changes the theme's (G) color value for accent text.", 1, 255)
local accentclr_b = CreateClientConVar("chicagoRP_clr_accent_b", 5, true, false, "Changes the theme's (B) color value for accent text.", 1, 255)
local primarygradient_r = CreateClientConVar("chicagoRP_clr_primarygradient_r", 230, true, false, "Changes the (R) color value for the settings GUI's primary gradient.", 1, 255)
local primarygradient_g = CreateClientConVar("chicagoRP_clr_primarygradient_g", 45, true, false, "Changes the (G) color value for the settings GUI's primary gradient.", 1, 255)
local primarygradient_b = CreateClientConVar("chicagoRP_clr_primarygradient_b", 40, true, false, "Changes the (B) color value for the settings GUI's primary gradient.", 1, 255)
local secondarygradient_r = CreateClientConVar("chicagoRP_clr_secondarygradient_r", 245, true, false, "Changes the (R) color value for the settings GUI's secondary gradient.", 1, 255)
local secondarygradient_g = CreateClientConVar("chicagoRP_clr_secondarygradient_g", 135, true, false, "Changes the (G) color value for the settings GUI's secondary gradient.", 1, 255)
local secondarygradient_b = CreateClientConVar("chicagoRP_clr_secondarygradient_b", 70, true, false, "Changes the (B) color value for the settings GUI's secondary gradient.", 1, 255)

local primaryclr = nil
local secondaryclr = nil
local accentclr = nil
local primarygradient = nil
local secondarygradient = nil

local function InvalidateColors()
	primaryclr = Color(primaryclr_r:GetInt(), primaryclr_g:GetInt(), primaryclr_b:GetInt(), 255)
	secondaryclr = Color(secondaryclr_r:GetInt(), secondaryclr_g:GetInt(), secondaryclr_b:GetInt(), 255)
	accentclr = Color(CVaaccentclr_rrAccentRed:GetInt(), accentclr_g:GetInt(), accentclr_b:GetInt(), 220)
	primarygradient = Color(primarygradient_r:GetInt(), primarygradient_g:GetInt(), primarygradient_b:GetInt(), 180)
	secondarygradient = Color(secondarygradient_r:GetInt(), secondarygradient_g:GetInt(), secondarygradient_b:GetInt(), 180)
end

InvalidateColors()

function chicagoRP.GetPrimaryColor()
	return primaryclr
end

function chicagoRP.GetSecondaryColor()
	return secondaryclr
end

function chicagoRP.GetAccentColor()
	return accentclr
end

function chicagoRP.GetGradientColors()
	return primarygradient, secondarygradient
end