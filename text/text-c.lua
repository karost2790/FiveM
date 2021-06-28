local color = {
    r=274,
    g=223,
    b=88,
    a=255
}


Citizen.CreateThread(function()
    while 1>0 do
        Citizen.Wait(5)
        SetTextFont(0)  -- 0 -> 4
        SetTextScale(0.4,0.4)
        SetTextColour(color.r, color.b, color.g, color.a)
        SetTextEntry("STRING")
        AddTextComponentString("My Epic Server!")
        DrwaText(0.0001, 0.0001)
    end

    -- The Rectangle
    DrawRect(150,100,3.2,0.05,66,134,255,245)

    
end)