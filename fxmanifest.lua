fx_version 'bodacious'
game 'gta5'

ui_page {
    'html/ui.html',
}


shared_scripts {
    'config.lua',
}


client_scripts {
    'client/client.lua',
}


server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
    'server/server.lua',
	'config.lua'
}


files {
	'html/ui.html',
	'html/assets/*.png',
	'html/css/*.css',
	'html/js/*.js',

}