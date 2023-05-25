local string = string

function string.IsValid(str)
    return str != nil or str != ''
end

function chicagoRP.RandomKey(tbl)
    if !istable(tbl) then return end

    return tbl[math.random(1, #tbl)]
end
