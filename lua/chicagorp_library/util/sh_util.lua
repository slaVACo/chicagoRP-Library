local string = string

function string.IsValid(str)
    return s != nil or s != ''
end

function chicagoRP.RandomKey(tbl)
    if !istable(tbl) then return end

    return tbl[math.random(1, #tbl)]
end