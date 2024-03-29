AddCSLuaFile()

chicagoRP = chicagoRP or {}

if CLIENT then
    include("chicagorp_library/derma/cl_dialogbox.lua")
    include("chicagorp_library/drawing/cl_blur.lua")
    include("chicagorp_library/drawing/cl_fade.lua")
    include("chicagorp_library/drawing/cl_gradient.lua")
    include("chicagorp_library/drawing/cl_pulse.lua")
    include("chicagorp_library/drawing/cl_roundedoutline.lua")
    include("chicagorp_library/drawing/cl_screenscale.lua")
    include("chicagorp_library/hooks/cl_hidehud.lua")
    include("chicagorp_library/util/cl_theme.lua")
else
    AddCSLuaFile("circles.lua")
    AddCSLuaFile("chicagorp_library/derma/cl_dialogbox.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_blur.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_fade.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_gradient.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_pulse.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_roundedoutline.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_screenscale.lua")
    AddCSLuaFile("chicagorp_library/hooks/cl_hidehud.lua")
    AddCSLuaFile("chicagorp_library/util/cl_theme.lua")
end

include("chicagorp_library/util/sh_util.lua")
include("chicagorp_library/util/sh_uuid.lua")
include("chicagorp_library/util/sh_vehicles.lua")
AddCSLuaFile("chicagorp_library/util/sh_util.lua")
AddCSLuaFile("chicagorp_library/util/sh_uuid.lua")
AddCSLuaFile("chicagorp_library/util/sh_vehicles.lua")