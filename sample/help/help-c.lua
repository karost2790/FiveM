function msg(text)
    TriggerEvent("chatMessage","[Server]", {255,0,0}, text)
end

function debug(text)
    TriggerEvent("chatMessage","[Debug]", {255,0,0}, text)
end

exports('msg', msg)
exports('debug', debug)
