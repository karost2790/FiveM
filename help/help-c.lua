RegisterCommand("help", function()
    msg("Server's Discord: discord.gg/karost")
    msg("Server's Website: website.com")
end, false)

function msg(text)
    TriggerEvent("chatMessage","[Server]", {255,0,0}, text)
end