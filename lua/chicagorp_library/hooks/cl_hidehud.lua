chicagoRP.HideHUD = false

hook.Add("HUDShouldDraw", "chicagoRP_vehicleradio_HideHUD", function()
    if chicagoRP.HideHUD == true then
        return false
    end
end)