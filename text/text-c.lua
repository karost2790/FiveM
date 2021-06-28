local white_color = {
    r=255,
    g=255,
    b=255,
    a=255
}


Citizen.CreateThread(function()
    while 1>0 do
        Citizen.Wait(5)

        SetTextFont(0)  -- 0 -> 4
        SetTextScale(0.4,0.4)
        SetTextColour(white_color.r, white_color.b, white_color.g, white_color.a)
        SetTextEntry("STRING")
        AddTextComponentString("Hello Guy Welcome to the Karost Fun Server :P")
        DrawText(0.0001, 0.0001)
    

        -- The Rectangle
        DrawRect(150,100,3.2,0.05,66,134,244,245)
    end

end)