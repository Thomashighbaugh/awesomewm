--  _______                    
-- |   _   |.-----.-----.-----.
-- |       ||  _  |  _  |__ --|
-- |___|___||   __|   __|_____|
--          |__|  |__|         

local filesystem = require('gears.filesystem')

local config_dir = filesystem.get_configuration_dir()
local bin_dir = config_dir .. 'binaries/'

return {

	-- The default applications that we will use in keybindings and widgets
	default = {
-- Defines shortcuts that will be used by widgets and certain keybinds
		terminal 										= 'kitty',																-- Terminal Emulator
		text_editor 									= 'subl3',                      	            						-- GUI Text Editor
		web_browser 									= 'firefox',                        	        						-- Web browser
		file_manager 									= 'thunar',                            	  	 	 					-- GUI File manager
		network_manager 								= 'kitty -e nmtui',												-- Network manager
		bluetooth_manager 								= 'blueman-manager',													-- Bluetooth manager
	--power_manager 									= 'xfce4-power-manager',												-- Power manager
		quake 											= 'kitty --name QuakeTerminal',       			    					-- Quake-like Terminal

		rofiglobal										= 'rofi -dpi ' .. screen.primary.dpi .. 
															' -show "Global Search" -modi "Global Search":' .. config_dir .. 
															'/configuration/rofi/sidebar/rofi-spotlight.sh' .. 
															' -theme ' .. config_dir ..
															'/configuration/rofi/sidebar/rofi.rasi',			 				-- Rofi Web Search
		

		rofiappmenu 									= 'rofi -dpi ' .. screen.primary.dpi ..
															' -show drun -theme ' .. config_dir ..
															'/configuration/rofi/appmenu/rofi.rasi'					  			-- Application Menu

	},
	
	-- List of apps to start after login
	-- auto-start.lua module will start these

	run_on_start_up = {

		'picom -b --experimental-backends --dbus --config ' .. 
		config_dir .. '/configuration/picom.conf',   																			-- Compositor
		'blueman-applet',                                           	      								                    -- Bluetooth tray icon
		--'xfce4-power-manager',                                              	                    					    	-- Power manager		' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', 	          									-- Credential manager	
		'xrdb $HOME/.Xresources',                                                   	                						-- Load X Colors
		'nm-applet',                                                                    	            						-- NetworkManager Applet
		-- [[
		-- xidlehook --not-when-fullscreen --not-when-audio --timer 600 \
		-- "awesome-client 'awesome.emit_signal(\"module::lockscreen_show\")'" ""
		-- ]],																														-- Auto lock timer 
		'xcape -e "Super_L=Super_L|Control_L|Escape"'
	},

	-- List of binaries/shell scripts that will execute a certain task

	bins = {
		full_screenshot = bin_dir .. 'snap full',              					                    							-- Full Screenshot
		area_screenshot = bin_dir .. 'snap area',			                                        							-- Area Selected Screenshot
		update_profile  = bin_dir .. 'profile-image'																			-- Update profile picture
	}
}
