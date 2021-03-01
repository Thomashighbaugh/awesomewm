local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local icons = require('icons')
icons.init('sheet')

local active_color = {
	type = 'linear',
	from = {0, 0},
	to = {200, 50}, -- replace with w,h later
	stops = {
		{0, beautiful.xcolor1},
		{0, beautiful.xcolor1},
		{0.25, beautiful.xcolor6},
		{0.5, beautiful.xcolor1},
		{0.75, beautiful.xcolor6},
		{0.95, beautiful.xcolor1}
	}
}

local icon = {
	id = 'icon',
	image = icons.battery,
	resize = true,
	widget = wibox.widget.imagebox
}

local battery_arc =
	wibox.widget(
	{
		icon,
		max_value = 100,
		thickness = 5,
		start_angle = 4.71238898, -- 2pi*3/4
		forced_height = 100,
		rounded_edge = true,
		forced_width = 100,
		bg = beautiful.xbackground,
		paddings = 1,
		colors = {active_color},
		widget = wibox.container.arcchart
	}
)

local q = 0
local g =
	gears.timer(
	{
		timeout = 0.3,
		call_now = false,
		autostart = false,
		callback = function()
			if q >= 100 then
				q = 0
			end
			q = q + 1
			battery_bar.value = q
		end
	}
)
awesome.connect_signal(
	'configuration.event-listeners::battery',
	function(value)
		if plugged then
			g:start()
		else
			g:stop()
			battery_arc.value = value
		end
	end
)
awesome.connect_signal(
	'configuration.event-listeners::charger',
	function(value)
		if plugged then
			battery_arc.icon.image = icons.battery
		else
			g:stop()
			battery_arc.icon.image = icons.battery_charging
		end
	end
)
return battery_arc
