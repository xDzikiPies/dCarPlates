fx_version 'adamant'

game 'gta5'

author 'DzikiPies'

description 'Fivem Plate changing script for ESX, using OX LIB and OX Inventory'

lua54  'yes'

version '1.0.0'

shared_scripts {'@es_extended/imports.lua', '@ox_lib/init.lua', 'config.lua'}



client_scripts {
    'client.lua'
}

server_scripts {
'server.lua',
'@mysql-async/lib/MySQL.lua',
}