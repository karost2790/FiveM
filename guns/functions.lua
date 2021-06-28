function alert(msg)
    --print("gunc alert")
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(string)
    --print("gunc notify")
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true,false)
end 
--https://runtime.fivem.net/doc/natives/#_0xBF0FD6E56C964FCB
--Ped ped, Hash weaponHash, int ammoCount, BOOL isHidden, BOOL equipNow
function giveWeapon(weaponHash)
    --print("gunc giveWeapon")
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false)
end

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car)do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehical = CreateVehicle(car, x + 3, y + 3, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end
