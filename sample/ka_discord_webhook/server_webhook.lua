local discord_webhook = {
    url = "https://discord.com/api/webhooks/860432865899315210/RN2_ynzVdRXGlkpms7y32Fyw1bP576ouVlmwV5D9sItiwXVvA-Ly31qnhxILfVrV17mP",
    image = "https://media.discordapp.net/attachments/858624760208293930/858686530057797642/karost_banner.png"
}

AddEventHandler("chatMessage", function(source, author, text)
    print('chatMessage: ' .. author .. ' = ' .. text )

    PerformHttpRequest(discord_webhook.url, 
    function(err, text, header) end, 
    'POST', 
    json.encode({username = author, content = text, avatar_url = discord_webhook.image}), 
    {["Content-Type"]= 'application/json'})
end)

RegisterCommand('getspace', function(source, args)
    --http://api.open-notify.org/astros.json
    PerformHttpRequest("http://api.open-notify.org/astros.json", 
    function(err, text, header)
        local data = json.decode(text)
        --- print(text)
        TriggerClientEvent("chat:addMessage", source, {
            args = {
                string.format("There are currently %s people in space", data.number )
            }    
        })
    end, 
    'GET', 
    json.encode({}), {["Content-Type"] = 'application/json'})
end)