-- RegisterServerEvent('SaveLine')
RegisterNetEvent('aa:bb')
AddEventHandler('aa:bb', function(msg) 
  print('you got be kudding aa:bb '... msg)
end)



[[--
AddEventHandler('money:allowPickupNear', function(pedId)

--RegisterNetEvent('ka_main:msgLog')
RegisterServerEvent('ka_main:msgLog')
AddEventHandler('ka_main:msgLog', function(playerId, args)
    print('ka_main:msgLog....run')

    local argString = table.concat(args, " ")
    if (playerId > 0) then
        print("player id > 0....")
        MySQL.Async.insert ('INSERT INTO ka_main (name,args) VALUES (@name , @arg)',
        {   ['@name'] = GetPlayerName(playerId), 
            ["@arg"] = argString },
        function(insertId)
            local s = source
            TriggerClientEvent("output" , s ,"^2".. argString .."^0")
        end )
    else
        print("Fuck! there is no player id...")
    end        

end)
--]]
