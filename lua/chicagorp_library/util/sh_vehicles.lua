local function GetSimfphysPassengers(vehicle)
    if !IsValid(vehicle) then return end
    if !vehicle:IsSimfphyscar() then return end
    
    local plytable = {}
    local parent = vehicle:GetParent()
    local children = parent:GetChildren()
    local count = #children

    for i = 1, count do
        local child = children[i]
        local passenger = child:GetDriver()

        if IsValid(passenger) then
            table.insert(plytable, passenger)
        end
    end

    return plytable
end

function chicagoRP.GetVehicle(vehicle)
    if !IsValid(vehicle) then return end

    if simfphys or SVMOD:GetAddonState() then
        local vehparent = vehicle:GetParent()

        if vehicle:IsSimfphyscar() and IsValid(vehparent) then
           return vehparent
        elseif SVMOD and SVMOD:IsVehicle(vehicle) then
            return vehicle:SV_GetDriverSeat():GetParent()
        else
            return vehicle
        end
    else
        return vehicle
    end
end

function chicagoRP.GetVehiclePassengers(vehicle)
    if !IsValid(vehicle) then return end
    local vehparent = vehicle:GetParent()

    if simfphys and vehicle:IsSimfphyscar() and IsValid(vehparent) then
        print("simfphys vehicle")
        return GetSimfphysPassengers(vehicle)
    elseif SVMOD and SVMOD:GetAddonState() and SVMOD:IsVehicle(vehicle) then
        print("svmod vehicle")
        return vehicle:SV_GetAllPlayers()
    else
        print("regular vehicle")
        return vehicle:GetDriver()
    end
end

function chicagoRP.IsDriver(ply, vehicle)
    if !IsValid(ply) then return end
    if !IsValid(vehicle) then return end
    if !ply:InVehicle() then return end

    local vehparent = ply:GetVehicle():GetParent()

    if simfphys or SVMOD:GetAddonState() == true then
        if IsValid(ply:GetSimfphys()) and IsValid(vehparent) then
            return ply:IsDrivingSimfphys()
        elseif SVMOD and SVMOD:IsVehicle(vehicle) then
            return vehicle:SV_GetDriverSeat():GetDriver() == ply
        else
            return true
        end
    end
end