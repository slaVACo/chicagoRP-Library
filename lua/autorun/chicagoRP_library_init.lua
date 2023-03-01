AddCSLuaFile()

chicagoRP = chicagoRP or {}

for i, f in pairs(file.Find("chicagorp_library/*", "LUA")) do
    if string.Left(f, 3) == "sv_" then
        if SERVER then 
            include("chicagorp_library/*" .. f)
        end
    elseif string.Left(f, 3) == "cl_" then
        if CLIENT then
            include("chicagorp_library/*" .. f)
        else
            AddCSLuaFile("chicagorp_library/*" .. f)
        end
    elseif string.Left(f, 3) == "sh_" then
        AddCSLuaFile("chicagorp_library/*" .. f)
        include("chicagorp_library/*" .. f)
    else
        print("chicagoRP Settings detected unaccounted for lua file '" .. f .. "' - check prefixes!")
    end

    print("chicagoRP Library successfully loaded!")
end