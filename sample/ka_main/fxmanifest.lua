fx_version 'cerulean'
version '1.0.0'
description 'Basic programming practice'

author 'Karost LM <karost@hotmail.com>'
--repository 'https://github.com/karost2790/FiveM
game 'gta5'

[[--
server_scripts {
    'server.lua',
    '@mysql-async/lib/MySQL.lua'
} 
--]]
client_script 'client.lua'
server_script 'server.lua'

lua54 'yes'
