local panel_builder = require('module.panel-builder')
local beautiful = require('beautiful')
local layout = require 'widget.layout'
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
		callback = callbacks.zoom,
		layout = wibox.layout.align.horizontal
	}
	local sep = 'separator'
	local panel =
		panel_builder.build_single_panel(
		args,
		{
			left_widgets = {nil},
			middle_widgets = {
				sep,
				'taglist',
				sep,
				'network-widget',
				'battery-widget',
				'clock',
				sep,
				'notification-panel-toggler',
				'layout',
				'end-session',
				sep
			},
			right_widgets = {nil}
		}
	)
	return panel
end

return status_panel
