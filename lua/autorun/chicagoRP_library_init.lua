AddCSLuaFile()

chicagoRP = chicagoRP or {}

if CLIENT then
    include("chicagorp_library/drawing/cl_blur.lua")
    include("chicagorp_library/drawing/cl_fade.lua")
    include("chicagorp_library/drawing/cl_gradient.lua")
    include("chicagorp_library/drawing/cl_pulse.lua")
    include("chicagorp_library/drawing/cl_roundedoutline.lua")
    include("chicagorp_library/drawing/cl_screenscale.lua")
    include("chicagorp_library/hooks/cl_hidehud.lua")
else
    AddCSLuaFile("chicagorp_library/drawing/cl_blur.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_fade.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_gradient.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_pulse.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_roundedoutline.lua")
    AddCSLuaFile("chicagorp_library/drawing/cl_screenscale.lua")
    AddCSLuaFile("chicagorp_library/hooks/cl_hidehud.lua")
end

AddCSLuaFile("chicagorp_library/util/sh_uuid.lua")
include("chicagorp_library/util/sh_uuid.lua")