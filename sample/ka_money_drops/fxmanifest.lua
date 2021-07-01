-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

version '1.0.0'
description 'An example money system client.'
author 'Cfx.re <root@cfx.re>'
repository 'https://github.com/citizenfx/cfx-server-data'

fx_version 'bodacious'
game 'gta5'


client_scripts {'client.lua','@help/help-c.lua'}
server_scripts {'server.lua','@help/help-c.lua'}

lua54 'yes'
