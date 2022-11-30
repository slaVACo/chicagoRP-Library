local roundedOutlineMat = surface.GetTextureID("vgui/white")
local roundedBoxCache = {}

function chicagoRP.DrawOutlinedRoundedBox(borderSize, x, y, w, h, col, thickness) -- credit to TomDotBat, lawfully used thanks to GPL 3.0 license
    thickness = thickness or 1

    surface.SetDrawColor(col.r, col.g, col.b, col.a)

    if borderSize <= 0 then
        return
    end

    local fullRight = x + w
    local fullBottom = y + h

    local left, right = x + borderSize, fullRight - borderSize
    local top, bottom = y + borderSize, fullBottom - borderSize

    local halfBorder = borderSize * .6

    local width, height = w - borderSize * 2, h - borderSize * 2

    surface.DrawRect(x, top, thickness, height) -- left
    surface.DrawRect(x + w - thickness, top, thickness, height) -- right
    surface.DrawRect(left, y, width, thickness) -- top
    surface.DrawRect(left, y + h - thickness, width, thickness) --bottom

    local cacheName = borderSize .. x .. y .. w .. h .. thickness
    local cache = roundedBoxCache[cacheName]
    if !cache then
        cache = {
            { --Top Right
                {x = right, y = y}, --Outer
                {x = right + halfBorder, y = top - halfBorder},
                {x = fullRight, y = top},

                {x = fullRight - thickness, y = top}, --Inner
                {x = right + halfBorder - thickness, y = top - halfBorder + thickness},
                {x = right, y = y + thickness}
            },
            { --Bottom Right
                {x = fullRight, y = bottom}, --Outer
                {x = right + halfBorder, y = bottom + halfBorder},
                {x = right, y = fullBottom},

                {x = right, y = fullBottom - thickness}, --Inner
                {x = right + halfBorder - thickness, y = bottom + halfBorder - thickness},
                {x = fullRight - thickness, y = bottom}
            },
            { --Bottom Left
                {x = left, y = fullBottom}, --Outer
                {x = left - halfBorder, y = bottom + halfBorder},
                {x = x, y = bottom},

                {x = x + thickness, y = bottom}, --Inner
                {x = left - halfBorder + thickness, y = bottom + halfBorder - thickness},
                {x = left, y = fullBottom - thickness},
            },
            { --Top Left
                {x = x, y = top}, --Outer
                {x = left - halfBorder, y = top - halfBorder},
                {x = left, y = y},

                {x = left, y = y + thickness}, --Inner
                {x = left - halfBorder + thickness, y = top - halfBorder + thickness},
                {x = x + thickness, y = top}
            }
        }

        roundedBoxCache[cacheName] = cache
    end

    surface.SetTexture(roundedOutlineMat)

    for k,v in ipairs(cache) do
        surface.DrawPoly(v)
    end
end