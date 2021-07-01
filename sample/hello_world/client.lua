function PrintHello(name)
    local age = 10

    print("Hello World! My name is " .. name .. 'I am ' .. age)

end


RegisterCommand("printHello", function(source, args)
    local inputName = tostring(args[1])
    PrintHello(inputName)
end, false)
