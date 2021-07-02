local teams = {
    {name = "allies", model = "s_m_y_swat_01", weapon = "WEAPON_CARBINERIFLE"},
    {name = "enemies", model = "g_m_m_chicold_01", weapon = "WEAPON_ASSAULTRIFLE"}
}

for i=1, #teams, 1 do
    AddRelationshipGroup(teams[i].name)
end

local j = nil 

RegisterCommand("war", function(source, args)
   local totalPeople = tonumber(args[1]) 
   -- /war 20
   -- > 20 (int)
   for i = 1, totalPeople, 1 do
        j = math.random(1, #teams)
        local ped = GetHashKey(teams[j].model)
        RequestModel(ped)
        while not HasModelLoaded(ped) do 
            Citizen.Wait(1)
        end 
        --- current player location
        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
        newPed = CreatePed(4, ped, x+math.random(-totalPeople, totalPeople), -- 4 male
                                   y+math.random(-totalPeople, totalPeople),
                                   z, 0.0, false, true )
        SetPedCombatAttributes(newPed, 0, true) -- BF_CanUseCover
        SetPedCombatAttributes(newPed, 5, true) -- BF_CanFightArmedPedsWhenNotArmed
        SetPedCombatAttributes(newPed, 46, true) -- BF_AlwaysFight
        SetPedFleeAttributes(newPed, 0, true)

        SetPedRelationshipGroupHash(newPed, GetHashKey(teams[j].name))
        SetRelationshipBetweenGroups(5, GetHashKey(teams[1].name), GetHashKey(teams[2].name))
        if teams[j].name == "allies" then 
            SetRelationshipBetweenGroups(0, GetHashKey(teams[j].name, GetHashKey("PLAYER")))
            SetPedAccuracy(newPed, 100) 
        else 
            SetRelationshipBetweenGroups(5, GetHashKey(teams[j].name, GetHashKey("PLAYER")))
            SetPedAccuracy(newPed, 100)           
        end 
        TaskStartScenarioInPlace(newPed, "WORLD_HUMEN_SMOKING", 0, true)
        GiveWeaponToPed(newPed, GetHashKey(teams[j].weapon, 2000, true, false))
        SetPedArmour(newPed, 100)
        SetPedMaxHealth(newPed, 100)
    end
end, false)
