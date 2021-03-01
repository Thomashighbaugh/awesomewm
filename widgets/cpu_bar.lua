local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

-- Set colors
local active_color = {
	type = 'linear',
	from = {0, 0},
	to = {100, 50}, -- replace with w,h later
	stops = {
		{0, beautiful.xcolor1},
		{0.25, beautiful.xcolor6},
		{0.5, beautiful.xcolor1},
		{0.75, beautiful.xcolor6},
		{0.95, beautiful.xcolor1}
	}
}

local background_color = beautiful.xcolor7 .. '11'

local cpu_bar =
	wibox.widget(
	{
		max_value = 100,
		value = 50,
		forced_height = dpi(10),
		margins = {top = dpi(8), bottom = dpi(8)},
		forced_width = 50,
		width = 50,
		shape = gears.shape.rounded_bar,
		bar_shape = gears.shape.rounded_bar,
		color = active_color,
		background_color = background_color,
		border_width = 0,
		border_color = beautiful.border_color,
		widget = wibox.widget.progressbar
	}
)

awesome.connect_signal(
	'configuration.event-listeners::cpu',
	function(value)
		-- Use this if you want to display usage percentage
		cpu_bar.value = value
		-- Use this if you want to display idle percentage
		-- cpu_bar.value = tonumber(100 - value)
	end
)

return cpu_bar
