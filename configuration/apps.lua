local filesystem = require('gears.filesystem')

local config_dir = filesystem.get_configuration_dir()
local bin_dir = config_dir .. 'binaries/'


return {

	-- The default applications in keybindings and widgets
	default = {
		terminal 												= 'kitty',                                  							-- Terminal Emulator
		text_editor 											= 'gedit',                                  						-- GUI Text Editor
		web_browser 										= 'firefox-developer-edition',                                						-- Web browser
		file_manager 										= 'pcmanfm',                              	 	 					-- GUI File manager
		network_manager 								= 'nm-connection-editor',								-- Network manager
		bluetooth_manager 								= 'blueman-manager',										-- Bluetooth manager
		--lock 														= 'awesome-client "_G.show_lockscreen()"',  	-- Lockscreen
		quake 													= 'kitty --name QuakeTerminal',       			    -- Quake-like Terminal

		rofiglobal												= 'rofi -dpi ' .. screen.primary.dpi .. 
																	    ' -show "Global Search" -modi "Global Search":' .. config_dir .. 
																	    '/configuration/rofi/sidebar/rofi-spotlight.sh' .. 
																	    ' -theme ' .. config_dir ..
																	    '/configuration/rofi/sidebar/rofi.rasi', 			-- Rofi Web Search
		

		rofiappmenu 										= 'rofi -dpi  -show drun -theme ' .. config_dir ..
																	    '/configuration/rofi/appmenu/rofi.rasi'  ,		-- Application Menu
		screenshot = "sh " .. config_dir .. "/configuration/rofi/screenshot/screenshot.sh"

		-- You can add more default applications here
	},
	
	-- List of apps to start once on start-up

	run_on_start_up = {

		'picom -b --experimental-backends --dbus --config ' .. 
		config_dir .. '/configuration/picom.conf',   																	-- Compositor

		'blueman-applet',                                                 								                        -- Bluetooth tray icon
		'/usr/lib/polkit-kde-authentication-agent-1 &' ..
		' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',           -- Credential manager
		
		'xrdb $HOME/.Xresources',                                                                   						-- Load X Colors
		'nm-applet',                                                                                									-- NetworkManager Applet
		'pulseeffects --gapplication-service',                                                      						-- Sound Equalizer
		'xcape -e "Super_L=Super_L|Control_L|Escape"',
		'xidlehook --not-when-fullscreen --not-when-audio --timer 300 '..
		' "awesome-client \'_G.show_lockscreen()\'" ""'  															-- Auto lock timer
		-- You can add more start-up applications here
	},

	-- List of binaries that will execute a certain task

	bins = {
		full_screenshot = bin_dir .. 'snap full',              					                    					-- Full Screenshot
		area_screenshot = bin_dir .. 'snap area',			                                        					-- Area Selected Screenshot
		update_profile  = bin_dir .. 'profile-image'
	}
}
