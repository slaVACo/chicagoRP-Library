function chicagoRP.Pulse(panel, clrredfrom, clrgreento, clrblueto, alphato, speed, outline, firstcolor, secondcolor)
    if outline == nil then outline = false end

    local Pulse = self.Pulse

    if !Pulse and outline then
        chicagoRP.DrawOutlinedGradientRect(panel, firstcolor, secondcolor, 3)
    end

    local w, h = panel:GetSize()
    local pulseBuf, pulseStep = panel.__pulseBuf or 0, RealFrameTime() * speed

    if Pulse and pulseBuf < 1 then
        pulseBuf = math.min(1, pulseStep + pulseBuf)
    elseif !Pulse and pulseBuf > 0 then
        pulseBuf = math.max(0, pulseBuf - pulseStep)
    end

    panel.__pulseBuf = pulseBuf
    pulseBuf = math.EaseInOut(pulseBuf, 0.2, 0.2)
    local clrR, clrG, clrB, clrA = Lerp(pulseBuf, clrredto, clrredfrom), Lerp(pulseBuf, clrgreenfrom, clrgreento), Lerp(pulseBuf, clrbluefrom, clrblueto), Lerp(pulseBuf, alphafrom, alphato)
    local outlinePulse = Lerp(pulseBuf, 0, 4)

    surface.SetDrawColor(clrR, clrG, clrB, clrA)
    surface.DrawRect(0, 0, w, h)

    if !disableoutline then chicagoRP.DrawOutlinedGradientRect(panel, firstcolor, secondcolor, outlinePulse) end
end