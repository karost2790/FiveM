RegisterCommand("clear",function()
    --print("guns-c RegisterCommand")
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    notify('~r~Cleared All Weapons.')
end)

local cars = {"adder","comet","cheetah","faggio"}
RegisterCommand("car", function()
    local car = (cars[math.random(#cars)])
    spawnCar(car)
    notify("~p~Spawned car: ~h~~g~" .. car)
end)

RegisterCommand("die", function()
    SetEntityHealth(PlayerPedId(), 0)
    notify("~r~You die")
end)


Citizen.CreateThread(function()
    --print("guns-c CreateThread...")
    local h_key = 74
    local x_key = 73
    while true do 
        Citizen.Wait(1)
        if IsControlJustReleased(1, h_key --[[H key]]) then
            print("The key ".. h_key .. "was pressed")
            giveWeapon("weapon_pistol")
            giveWeapon("weapon_pumpshotgun")
                weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_SR_SUPP")
                weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
            giveWeapon("weapon_knife")
            alert("~b~Give Weapons Pistal Knife with ~INPUT_VEH_HEADLIGHT~")
        end
        if IsControlJustReleased(1, x_key --[[X key]]) then
            giveWeapon("weapon_combatmg")
            giveWeapon("weapon_heavysniper")
            alert("~g~Give Weapons Combat Machinegun with ~INPUT_VEH_DUCK~")
        end
    end
end)