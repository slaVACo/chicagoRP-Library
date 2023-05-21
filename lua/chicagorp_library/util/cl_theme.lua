local primaryclr_r = CreateClientConVar("chicagoRP_clr_primary_r", 255, true, false, "Changes the theme's (R) color value for primary text.", 1, 255)
local primaryclr_g = CreateClientConVar("chicagoRP_clr_primary_g", 255, true, false, "Changes the theme's (G) color value for primary text.", 1, 255)
local primaryclr_b = CreateClientConVar("chicagoRP_clr_primary_b", 255, true, false, "Changes the theme's (B) color value for primary text.", 1, 255)
local secondaryclr_r = CreateClientConVar("chicagoRP_clr_secondary_r", 130, true, false, "Changes the theme's (R) color value for secondary text.", 1, 255)
local secondaryclr_g = CreateClientConVar("chicagoRP_clr_secondary_g", 25, true, false, "Changes the theme's (G) color value for secondary text.", 1, 255)
local secondaryclr_b = CreateClientConVar("chicagoRP_clr_secondary_b", 40, true, false, "Changes the theme's (B) color value for secondary text.", 1, 255)
local primarygradient_r = CreateClientConVar("chicagoRP_clr_primarygradient_r", 230, true, false, "Changes the (R) color value for the settings GUI's primary gradient.", 1, 255)
local primarygradient_g = CreateClientConVar("chicagoRP_clr_primarygradient_g", 45, true, false, "Changes the (G) color value for the settings GUI's primary gradient.", 1, 255)
local primarygradient_b = CreateClientConVar("chicagoRP_clr_primarygradient_b", 40, true, false, "Changes the (B) color value for the settings GUI's primary gradient.", 1, 255)
local secondarygradient_r = CreateClientConVar("chicagoRP_clr_secondarygradient_r", 245, true, false, "Changes the (R) color value for the settings GUI's secondary gradient.", 1, 255)
local secondarygradient_g = CreateClientConVar("chicagoRP_clr_secondarygradient_g", 135, true, false, "Changes the (G) color value for the settings GUI's secondary gradient.", 1, 255)
local secondarygradient_b = CreateClientConVar("chicagoRP_clr_secondarygradient_b", 70, true, false, "Changes the (B) color value for the settings GUI's secondary gradient.", 1, 255)

local primaryclr = Color(primaryclr_r:GetInt(), primaryclr_g:GetInt(), primaryclr_b:GetInt(), 255)
local secondaryclr = Color(secondaryclr_r:GetInt(), secondaryclr_g:GetInt(), secondaryclr_b:GetInt(), 255)
local primarygradient = Color(primarygradient_r:GetInt(), primarygradient_g:GetInt(), primarygradient_b:GetInt(), 180)
local secondarygradient = Color(secondarygradient_r:GetInt(), secondarygradient_g:GetInt(), secondarygradient_b:GetInt(), 180)

function chicagoRP.GetPrimaryColor(new)
	if new then return Color(primaryclr_r:GetInt(), primaryclr_g:GetInt(), primaryclr_b:GetInt(), 255) end

	return primaryclr
end

function chicagoRP.GetSecondaryColor(new)
	if new then return Color(secondaryclr_r:GetInt(), secondaryclr_g:GetInt(), secondaryclr_b:GetInt(), 255) end

	return secondaryclr
end

function chicagoRP.GetGradientColors(new)
	if new then return Color(primarygradient_r:GetInt(), primarygradient_g:GetInt(), primarygradient_b:GetInt(), 180), Color(secondarygradient_r:GetInt(), secondarygradient_g:GetInt(), secondarygradient_b:GetInt(), 180) end

	return primarygradient, secondarygradient
end