--[[ 
    local mph = 2.2369
    local kph = 3.6
]]
function text(content)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.2,1.2)
    SetTextEntry("STRING")
    AddTextComponentString(content .. "Km/H")
    DrawText(0.9,0.7)
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(2)
        local speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))* 3.6)
        
        -- Check if the ped is in a vehicle then show speed data
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(math.floor(speed))
        end
    end
end)