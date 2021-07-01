
local rowInsert = 0
local messageServer = ""
RegisterNetEvent('ka:callback_server')
AddEventHandler('ka:callback_server', function( rowInsert, messageServer )   
    print("output row Insert " .. rowInsert )
    TriggerEvent("chatMessage", "[Success]",{ 0,255,0}, "Added " .. messageServer .. " into the database")
end)


RegisterCommand("msg", function(source, args)
  
    local xargs = args
    TriggerServerEvent('ka:msgupdate',xargs)
end,false)
