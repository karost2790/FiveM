fx_version 'cerulean'
version '1.0.0'
description 'Basic FiveM programming practice'

author 'Karost LM <karost@hotmail.com>'
game 'gta5'

client_scripts {'client.lua','@help/help-c.lua'}

server_scripts {
    'server.lua',
    '@mysql-async/lib/MySQL.lua'
} 

lua54 'yes'
