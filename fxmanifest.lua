fx_version "cerulean"

game "gta5"

author 'Project X'

description ' by Project X'

version '1.0'

shared_scripts {
    '@ox_lib/init.lua',
    "config.lua",
}

client_scripts {
    "client.lua",
}

server_scripts {
    "server.lua",
}

lua54 "yes"

dependency '/assetpacks'
