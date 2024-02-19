fx_version 'cerulean'

game { 'gta5' }
author 'Resq#1317'
description 'Rob NPC script made to work with currency system and framework from Andyyy7666'
--Credit for Original version to c0deina - https://github.com/c0deina/esx_robnpc
--Alert function modified from SpikE-Odets's port of c0deina's script. https://github.com/SpikE-Odets/esx_mugging
--Modified by Resq#1317 to work with Andyyy7666's Money Script and/or Framework.
lua54 'yes'

Version '2.00'

server_scripts {
     'server.lua'
}

client_scripts {
    'client.lua'
}

shared_scripts {
    'config.lua',
    --'@ox_lib/init.lua',
    "@ND_Core/init.lua",
}

ox_libs {
    'interface',
}
