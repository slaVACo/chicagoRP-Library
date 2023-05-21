function chicagoRP.ButtonFade(panel, clrfrom, clrto, alphafrom, alphato, speed, children)
    if !IsValid(panel) then return end
    if children == nil then children = false end

    local w, h = panel:GetSize()
    local hovered = panel:IsHovered()
    local haschild = panel:HasChildren()
    local childhovered = nil
    local buf, step = panel.__hoverBuf or 0, RealFrameTime() * speed

    if haschild and children then
        childhovered = panel:GetChild(0):IsHovered()
    end

    if (hovered or (hovered or childhovered)) and buf < 1 then
        buf = math.min(1, step + buf)
    elseif (!hovered and !childhovered) and buf > 0 then
        buf = math.max(0, buf - step)
    end

    panel.__hoverBuf = buf
    buf = math.EaseInOut(buf, 0.2, 0.2)
    local alpha, clr = Lerp(buf, alphafrom, alphato), Lerp(buf, clrfrom, clrto)

    surface.SetDrawColor(clr, clr, clr, alpha)
    surface.DrawRect(0, 0, w, h)
end

function chicagoRP.OutlineFade(panel, alphato, color1, color2, speed, children)
    if !IsValid(panel) then return end
    if children == nil then children = false end

    local hovered = panel:IsHovered()
    local haschild = panel:HasChildren()
    local childhovered = nil
    local Outlinebuf, Outlinestep = panel.__hoverOutlineBuf or 0, RealFrameTime() * speed

    if haschild and children then
        childhovered = panel:GetChild(0):IsHovered()
    end

    if (hovered or (hovered or childhovered)) and Outlinebuf < 1 then
        Outlinebuf = math.min(1, Outlinestep + Outlinebuf)
    elseif (!hovered and !childhovered) and Outlinebuf > 0 then
        Outlinebuf = math.max(0, Outlinebuf - Outlinestep)
    end

    panel.__hoverOutlineBuf = Outlinebuf
    Outlinebuf = math.EaseInOut(Outlinebuf, 0.5, 0.5)
    local alphaOutline = Lerp(Outlinebuf, 0, alphato)

    color1.a = alphaOutline
    color2.a = alphaOutline
end

function chicagoRP.PanelFadeIn(panel, length)
    if !IsValid(panel) then return end

    panel:SetAlpha(0)
    panel:AlphaTo(255, length, 0)
end

function chicagoRP.PanelFadeOut(panel, length)
    if !IsValid(panel) then return end

    panel:SetAlpha(255)
    panel:AlphaTo(0, length, 0)
end