fx_version "bodacious"
game "gta5"
lua54 "yes"

author "Node. Network"
description "Sistema de Portas Completo"
version "1.0.0"

ui_page "nui/index.html"

-- SHARED
shared_scripts {
	"@vrp/config/Item.lua",
	"@vrp/config/Vehicle.lua",
	"@vrp/config/Global.lua",
	"shared-side/config.lua"
}

-- CLIENT
client_scripts {
	"@vrp/config/Global.lua",
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	"client-side/*"
}

-- SERVER
server_scripts {
	"@vrp/lib/Utils.lua",
	"server-side/*",
	"sql/doors.sql"
}

-- NUI
files {
	"nui/index.html",
	"nui/style.css",
	"nui/script.js"
}

