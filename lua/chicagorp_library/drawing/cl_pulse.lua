function chicagoRP.Pulse(panel, w, h, clrredto, clrredfrom, clrgreenfrom, clrgreento, clrbluefrom, clrblueto, alphafrom, alphato, pulsevalue, speed, disableoutline, firstcolor, secondcolor)
    if (disableoutline == nil) then disableoutline = false end

    if (pulsevalue != true) and disableoutline == false then
        chicagoRP.DrawOutlinedGradientRect(panel, firstcolor, secondcolor, 3)
    end

    local pulseBuf, pulseStep = panel.__pulseBuf or 0, RealFrameTime() * speed

    if (pulsevalue == true) and pulseBuf < 1 then
        pulseBuf = math.min(1, pulseStep + pulseBuf)
    elseif (pulsevalue != true) and pulseBuf > 0 then
        pulseBuf = math.max(0, pulseBuf - pulseStep)
    end

    panel.__pulseBuf = pulseBuf
    pulseBuf = math.EaseInOut(pulseBuf, 0.2, 0.2)
    local alphaPulse = Lerp(pulseBuf, alphafrom, alphato)
    local clrRed, clrGreen, clrBlue = Lerp(pulseBuf, clrredto, clrredfrom), Lerp(pulseBuf, clrgreenfrom, clrgreento), Lerp(pulseBuf, clrbluefrom, clrblueto)
    local outlinePulse = Lerp(pulseBuf, 0, 4)

    surface.SetDrawColor(clrRed, clrGreen, clrBlue, alphaPulse)
    surface.DrawRect(0, 0, w, h)

    if disableoutline == false then
        chicagoRP.DrawOutlinedGradientRect(panel, firstcolor, secondcolor, outlinePulse)
    end
end