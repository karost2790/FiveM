

RegisterNetEvent('ka:callback_server')
AddEventHandler('ka:callback_server', function(argument)
    local msg = argument
    print("output....run" .. argument )
    TriggerEvent("chatMessage", "[Success]",{ 0,255,0}, "Added " .. argument .. " into the database")
end)


RegisterCommand("msg", function(source, args)
  
    local xargs = args
    TriggerServerEvent('ka:msgupdate',xargs)
end,false)
