--CreateThread(function()
--    while true do
--        Wait(100000)
--        print("server->ka_server:CreateThread..loop 10 sec.")
        
--    end
-- b2M7@9x0ceo9@m7bkend)


local function MessageUpdate( playerId, args )

    local argString = args 
    local playerName = GetPlayerName(playerId)
    local lresult = 0
    local insertId = 0
    local lbFinishJob = false
    print ( "args " .. argString  )
    print ( "playerName " .. playerName )

    if (playerId > 0) then
        
        MySQL.Async.insert ('INSERT INTO ka_main (name,args) VALUES (@name , @arg)',
        {   ['@name'] = playerName, 
            ["@arg"] = argString },
        function(insertId)        
         
           lresult = insertId 
           lbFinishJob = true 
        end)      
        repeat Citizen.Wait(0) until lbFinishJob == true   
        -- we need to delay to wain database 
        -- server finish job
        print("lresult out side function  " .. lresult  )
        return lresult 
    else
        print("MessageUpdate:Fuck! there is no player id...")
        return -1
    end        
    
end 

-- event for picking up fountain->player
RegisterNetEvent('ka:msgupdate')
AddEventHandler('ka:msgupdate', function(msgs)
    local s = source
    local argString = table.concat(msgs, " ")
    local result = MessageUpdate(source, argString)
    print( "row id:" .. result )
    print( "source " .. s )
    -- triggerClientEvent('event_name',' source ',' paramer 1','parameter 2')
    if ( result >= 0 ) then 
        TriggerClientEvent('ka:callback_server' , s , result  ,"^2".. argString .. " id=" .. result .. "^0")
    else
        TriggerClientEvent('ka:callback_server' , s , result  ,"^1".. "Fuck it is not work!" .."^0")
    end
end)