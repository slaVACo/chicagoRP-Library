AddCSLuaFile()

chicagoRP = chicagoRP or {}

for i, f in pairs(file.Find("chicagorp_library/drawing/*.lua", "LUA")) do
    if string.Left(f, 3) == "cl_" then
        if CLIENT then
            include("chicagorp_library/drawing/" .. f)
        else
            AddCSLuaFile("chicagorp_library/drawing/" .. f)
        end
    else
        print("chicagoRP Settings detected unaccounted for lua file '" .. f .. "' - check prefixes!")
    end

    print("chicagoRP Library successfully loaded!")
end