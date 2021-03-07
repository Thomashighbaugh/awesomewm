--[[ 
	 ______ _______ _______ _______ _______ _______      ______ _______ _______ _______ _____      __              
|   __ \       |_     _|_     _|       |   |   |    |   __ \   _   |    |  |    ___|     |_   |  |.--.--.---.-.
|   __ <   -   | |   |   |   | |   -   |       |    |    __/       |       |    ___|       |__|  ||  |  |  _  |
|______/_______| |___|   |___| |_______|__|_|__|    |___|  |___|___|__|____|_______|_______|__|__||_____|___._|
                                                                                                               
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 2:48:26 PM
     Last edited:
       3/4/2021, 2:48:37 PM
     Auto updated?
       Yes
    
     Description:
       the bottom panel, which I am especially happy with the look and
       functionality of.
--]]
local panel_builder = require('module.panel-builder')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local callbacks = require('widget.callbacks')
local wibox = require('wibox')

local taglist = require('widget.taglist')
taglist.show_current_client = true

local status_panel = function(s)
    local args = {
        screen = s,
        orientation = 'horizontal',
        position = 'bottom',
        callback = callbacks.zoom
    }
    local sep = 'separator'
    local panel =
        panel_builder.build_single_panel(
        args,
        {
            left_widgets = {nil},
            middle_widgets = {
                'taglist',
                sep,
                'network-widget',
                'battery-widget',
                'clock',
                sep,
                'notification-panel-toggler',
                'layout',
                sep,
                'end-session'
            },
            right_widgets = {nil}
        }
    )
    return panel
end

return status_panel
