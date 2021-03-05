--[[
     _______ _______ ______      ______ _______ _______ _______ _____      __              
    |_     _|       |   __ \    |   __ \   _   |    |  |    ___|     |_   |  |.--.--.---.-.
      |   | |   -   |    __/    |    __/       |       |    ___|       |__|  ||  |  |  _  |
      |___| |_______|___|       |___|  |___|___|__|____|_______|_______|__|__||_____|___._|
                                                                                           
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 2:45:50 PM
     Last edited:
       3/4/2021, 2:46:20 PM
     Auto updated?
       Yes
    
     Description:
       the bar at the top of the screen 
--]]



local panel_builder = require('module.panel-builder')
local beautiful = require('beautiful')
local callbacks = require('widget.callbacks')

local status_panel = function(s)
	local args = {
		screen = s,
		orientation = 'horizontal',
		position = 'top',
		blur_type = beautiful.small_panel_blur_type,
		panel_height = beautiful.small_panel_height,
		panel_width = beautiful.small_panel_width,
		panel_bg = beautiful.small_panel_bg,
		fg_normal = beautiful.small_fg_normal,
		panel_radius = beautiful.panel_radius,
		callback = callbacks.background,
		panel_padding = beautiful.small_panel_padding
	}
	local panel =
		panel_builder.build_single_panel(
		args,
		{
			left_widgets = {'app-search-toggler'},
			middle_widgets = {'tasklist'},
			right_widgets = {
				'network-widget',
				'battery-widget',
				'end-session',
				'notification-panel-toggler',
				'clock'
			}
		}
	)
	return panel
end

return status_panel
