local blurMat = Material("pp/blurscreen")
local Dynamic = 0

function chicagoRP.BlurBackground(panel, alpha, clipping)
    if (!IsValid(panel) or !panel:IsVisible()) then return end
    if alpha == nil then alpha = 100 end
    if clipping == nil then clipping = false end
    local layers, density = 1, 1
    local x, y = panel:LocalToScreen(0, 0)
    local FrameRate, Num, Dark = 1 / RealFrameTime(), 5, 150

    if clipping then DisableClipping(true) end
    surface.SetDrawColor(255, 255, 255, alpha)
    surface.SetMaterial(blurMat)

    for i = 1, Num do
        blurMat:SetFloat("$blur", (i / layers) * density * Dynamic)
        blurMat:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(-x, -y, ScrW(), ScrH())
    end

    surface.SetDrawColor(0, 0, 0, Dark * Dynamic)
    surface.DrawRect(0, 0, panel:GetWide(), panel:GetTall())
    Dynamic = math.Clamp(Dynamic + (1 / FrameRate) * 7, 0, 1)
    if clipping then DisableClipping(false) end
end

function chicagoRP.BlurSurroundings(panel, alpha)
    if (!IsValid(panel) or !panel:IsVisible()) then return end
    if alpha == nil then alpha = 100 end
    local layers, density, alpha = 1, 1, 100
    local x, y = 0, 0
    local scrW, scrH = ScrW(), ScrH()
    local FrameRate, Num, Dark = 1 / RealFrameTime(), 5, 150

    DisableClipping(true)
    surface.SetDrawColor(255, 255, 255, alpha)
    surface.SetMaterial(blurMat)

    for i = 1, Num do
        blurMat:SetFloat("$blur", (i / layers) * density * Dynamic)
        blurMat:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(-x, -y, scrW, scrH)
    end

    surface.SetDrawColor(0, 0, 0, Dark * Dynamic)
    surface.DrawRect(0, 0, scrW, scrH)
    DisableClipping(false)
    Dynamic = math.Clamp(Dynamic + (1 / FrameRate) * 7, 0, 1)
end