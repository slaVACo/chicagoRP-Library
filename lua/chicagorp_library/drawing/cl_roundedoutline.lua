--[[
PIXEL UI
Copyright (C) 2021 Tom O'Sullivan (Tom.bat)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]

local roundedOutlineMat = surface.GetTextureID("vgui/white")
local roundedBoxCache = {}
local roundedOutlineCache = {}

function chicagoRP.DrawOutlinedRoundedBox(borderSize, x, y, w, h, col, outlinecol, thickness, outlinemat) -- written by Tom "TomDotBat" O'Sullivan
    thickness = thickness or 1

    if borderSize <= 0 then
        return
    end

    local fullRight = x + w
    local fullBottom = y + h

    local left, right = x + borderSize, fullRight - borderSize
    local top, bottom = y + borderSize, fullBottom - borderSize

    local halfBorder = borderSize * .6

    local width, height = w - borderSize * 2, h - borderSize * 2

    surface.SetDrawColor(col.r, col.g, col.b, col.a)
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

    surface.SetDrawColor(outlinecol.r, outlinecol.g, outlinecol.b, outlinecol.a)

    if outlinemat != nil then
        surface.SetTexture(outlinemat)
    else
        surface.SetTexture(roundedOutlineMat)
    end

    for i = 1, #cache do 
        surface.DrawPoly(cache[i])
    end
end