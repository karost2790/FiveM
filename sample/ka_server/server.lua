CreateThread(function()
    while true do
        Wait(100000)
        print("server->CreateThread..loop 10 sec.")
        
    end
end)


local function MessageUpdate( playerId, args )

    local argString = args 
    local playerName = GetPlayerName(playerId)
    result = 0
    print ( "args " .. argString  )
    print ( "playerName " .. playerName )

    if (playerId > 0) then
        
        MySQL.Async.insert ('INSERT INTO ka_main (name,args) VALUES (@name , @arg)',
        {   ['@name'] = playerName, 
            ["@arg"] = argString },
        function(insertId)
           print("insertId " .. insertId ) 
           result  = tonumber(insertId)
        end)
        print("tonumber " .. result)
        return result
    else
        print("Fuck! there is no player id...")
        return -1
    end        
    
end 

-- event for picking up fountain->player
RegisterNetEvent('ka:msgupdate')
AddEventHandler('ka:msgupdate', function(msgs)
    local s = source
    local argString = table.concat(msgs, " ")
    local result = MessageUpdate(source, argString)
    print( result )
    if ( result > 0 ) then 
        TriggerClientEvent('ka:callback_server' , s ,"^2".. argString .."^0")
    else
        TriggerClientEvent('ka:callback_server' , s ,"^1".. "Fuck it is not work!" .."^0")
    end
end)