Citizen.CreateThread(function() 
    while true do 
        local player = GetPlayerPed(-1)
        Citizen.Wait(60*1000)
        
        SetDiscordAppId(860225672185249803)
        SetRichPresence( GetPlayerName(source) .. " is on " .. GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(player)))))
        
        SetDiscordRichPresenceAsset("logok_1024")
        SetDiscordRichPresenceAssetText(GetPlayerName(source))

        SetDiscordRichPresenceAssetSmall("logok_512")
        SetDiscordRichPresenceAssetSmallText("Health: " .. (GetEntityHealth(player) -100 ) ) 
        print("server->ka_discord:set info to Discoard every 1 min.")
    end         
end)