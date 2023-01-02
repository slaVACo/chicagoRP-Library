local ScrnW, ScrnH = ScrW(), ScrH()

function chicagoRP.HorizontalScreenScale(size)
    return math.Round(size * (ScrnW / 1920.0))
end

function chicagoRP.VerticalScreenScale(size)
    return math.Round(size * (ScrnH / 1080.0))
end

function chicagoRP.AdvancedHorizontalScreenScale(size, divisor)
    return math.Round(size * (divisor / 1920.0))
end

function chicagoRP.AdvancedVerticalScreenScale(size, divisor)
    return math.Round(size * (divisor / 1080.0))
end

hook.Add("OnScreenSizeChanged", "chicagoRP_screenscalechange", function(_, _)
    ScrnW = ScrW()
    ScrnH = ScrH()
end)