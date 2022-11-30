function chicagoRP.HorizontalScreenScale(size)
    return math.Round(size * (ScrW() / 1920.0))
end

function chicagoRP.VerticalScreenScale(size)
    return math.Round(size * (ScrH() / 1080.0))
end

function chicagoRP.AdvancedHorizontalScreenScale(size, divisor)
    return math.Round(size * (divisor / 1920.0))
end

function chicagoRP.AdvancedVerticalScreenScale(size, divisor)
    return math.Round(size * (divisor / 1080.0))
end