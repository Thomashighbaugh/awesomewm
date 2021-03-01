-- |  |--.---.-.|  |_|  |_.-----.----.--.--.
-- |  _  |  _  ||   _|   _|  -__|   _|  |  |
-- |_____|___._||____|____|_____|__| |___  |
--                                   |_____|
-- __
-- |  |--.---.-.----.
-- |  _  |  _  |   _|
-- |_____|___._|__|
-- ===================================================================
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local helpers = require('configuration.helpers')
-- ===================================================================

-- ===================================================================
-- Initialize Bar ----------------------------------------------------
-- ===================================================================
local active_color = {
	type = 'linear',
	from = {0, 0},
	to = {75, 20}, -- replace with w,h later
	stops = {
		{0, beautiful.xcolor1},
		{0.25, beautiful.xcolor6},
		{0.5, beautiful.xcolor1},
		{0.75, beautiful.xcolor6},
		{0.95, beautiful.xcolor1}
	}
}

local background_color = beautiful.xcolor7 .. '22'

local battery_bar =
	wibox.widget(
	{
		max_value = 100,
		value = 50,
		forced_height = dpi(10),
		margins = {top = dpi(10), bottom = dpi(10)},
		forced_width = dpi(100),
		shape = helpers.rrect(beautiful.border_radius),
		bar_shape = helpers.rrect(beautiful.border_radius),
		color = active_color,
		background_color = background_color,
		border_width = 0,
		border_color = beautiful.border_color,
		widget = wibox.widget.progressbar
	}
)

local battery_tooltip = awful.tooltip({})
battery_tooltip:add_to_object(battery_bar)
battery_tooltip.text = 'Not Updated'

awesome.connect_signal(
	'ears::battery',
	function(value)
		battery_bar:connect_signal(
			'mouse::enter',
			function()
				battery_tooltip.text = value .. '%'
			end
		)
	end
)

local q = 0
local g =
	gears.timer(
	{
		timeout = 0.03,
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
	'ears::battery',
	function(value)
		if plugged then
			g:start()
		else
			g:stop()
			battery_bar.value = value
		end
	end
)

-- end)

return battery_bar
