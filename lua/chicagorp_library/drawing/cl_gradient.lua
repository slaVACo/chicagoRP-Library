local gradientLeftMat = Material("vgui/gradient-l") -- gradient-d, gradient-r, gradient-u, gradient-l, gradient_down, gradient_up
local gradientRightMat = Material("vgui/gradient-r") -- gradient-d, gradient-r, gradient-u, gradient-l, gradient_down, gradient_up

function chicagoRP.DrawOutlinedGradientRect(panel, firstcolor, secondcolor, thickness)
    if (!IsValid(panel) or !panel:IsVisible()) then return end
    local w, h = panel:GetSize()

    surface.SetDrawColor(firstcolor:Unpack())
    surface.SetMaterial(gradientLeftMat)
    surface.DrawTexturedRectUV(0, 0, w, thickness, 0, 0, 1, 0) -- top
    surface.DrawTexturedRectUV(0, h - thickness, w, thickness, 0, 1, 1, 1) -- bottom
    surface.DrawTexturedRectUV(0, 0 + thickness, thickness, h - thickness, 0, 0.1, 0, 1) -- left
    surface.DrawTexturedRectUV(w - thickness, 0 + thickness, thickness, h - thickness, 1, 0.1, 1, 1) -- right

    surface.SetDrawColor(secondcolor:Unpack())
    surface.SetMaterial(gradientRightMat)
    surface.DrawTexturedRectUV(0, 0, w, thickness, 0, 0, 1, 0) -- top
    surface.DrawTexturedRectUV(0, h - thickness, w, thickness, 0, 1, 1, 1) -- bottom
    surface.DrawTexturedRectUV(0, 0 + thickness, thickness, h - thickness, 0, 0, 0, 1) -- left
    surface.DrawTexturedRectUV(w - thickness, 0 + thickness, thickness, h - thickness, 1, 0.1, 1, 1) -- right
end

print("gradient loaded")