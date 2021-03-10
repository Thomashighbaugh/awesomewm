--  _______ ______ ______ _______ 
-- |   _   |   __ \   __ \     __|
-- |       |    __/    __/__     |
-- |___|___|___|  |___|  |_______|
-- #######################################
-- ######## Thomas Leon Highbaugh ########
-- #######################################

local filesystem = require('gears.filesystem')

return {
	-- The default applications in keybindings and widgets
	default = {
		terminal = 'kitty', -- Terminal Emulator
		text_editor = 'vim', -- GUI Text Editor
		web_browser = 'firefox-nightly', -- Web browser
		alt_web_browser = 'chromium', -- Web browser
		mail_client = 'thunderbird', -- Mail client
		gui_file_manager = 'caja', -- GUI File manager
		file_manager = 'ranger', -- File manager
		password_manager = 'keepassxc', -- Password manager
		gui_ide = 'code',
		default_player = 'spotify',
		network_manager = 'nm-connection-editor', -- Network manager
		bluetooth_manager = 'blueman-manager', -- Bluetooth manager
		power_manager = 'xfce4-power-manager-settings', -- Power manager
		lock = 'screenlock', --'awesome-client "_G.show_lockscreen()"',  -- Lockscreen
		rofiappmenu = 'rofi -show drun -theme ~/.config/awesome/external/rofi/appmenu/rofi.rasi',
		-- for network applety thing
		wifi_interface = 'wlan0',
		-- You can add more default applications here
	},
	-- List of apps to start once on start-up
	run_on_start_up = {os.getenv('HOME') .. '/.config/awesome/autostart.sh'}
}
