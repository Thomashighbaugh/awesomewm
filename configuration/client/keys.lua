local awful = require('awful')
local gears = require('gears')

require('awful.autofocus')

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local dpi = require('beautiful').xresources.apply_dpi
local beautiful = require('beautiful')

local clientKeys =
	awful.util.table.join(
	awful.key(
		{modkey},
		'm',
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = 'toggle fullscreen', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey},
		'x',
		function(c)
			c:kill()
		end,
		{description = 'close', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Control'},
		'space',
		awful.client.floating.toggle,
		{description = 'toggle floating', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Control'},
		'Return',
		function(c)
			c:swap(awful.client.getmaster())
		end,
		{description = 'move to master', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Shift'},
		'p',
		function(c)
			c:move_to_screen(-1)
		end,
		{description = 'move to screen', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Shift'},
		'o',
		function(c)
			c:move_to_screen(1)
		end,
		{description = 'move to screen', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey},
		'w',
		function(c)
			c.ontop = not c.ontop
		end,
		{description = 'toggle keep on top', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey},
		'n',
		function(c)
			c.minimized = not c.minimized
		end,
		{description = 'Minimize focused client', group = 'client'}
	),

	awful.key(
		{modkey},
		'-',
		function(c)
			if c.floating then
				c:relative_move(0, dpi(-10), 0, 0)
			end
		end,
		{description = 'move floating client up by 10 px', group = 'client'}
	),
	awful.key(
		{modkey},
		'Down',
		function(c)
			if c.floating then
				c:relative_move(0, dpi(10), 0, 0)
			end
		end,
		{description = 'move floating client down by 10 px', group = 'client'}
	),
	awful.key(
		{modkey},
		'Left',
		function(c)
			if c.floating then
				c:relative_move(dpi(-10), 0, 0, 0)
			end
		end,
		{description = 'move floating client to the left by 10 px', group = 'client'}
	),
	awful.key(
		{modkey},
		'Right',
		function(c)
			if c.floating then
				c:relative_move(dpi(10), 0, 0, 0)
			end
		end,
		{description = 'move floating client to the right by 10 px', group = 'client'}
	),

	-- Increasing floating client size
	awful.key(
		{modkey, 'Shift'},
		'Up',
		function(c)
			if c.floating then
				c:relative_move(0, dpi(-10), 0, dpi(10))
			end
		end,
		{description = 'increase floating client size vertically by 10 px up', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'Down',
		function(c)
			if c.floating then
				c:relative_move(0, 0, 0, dpi(10))
			end
		end,
		{description = 'increase floating client size vertically by 10 px down', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'Left',
		function(c)
			if c.floating then
				c:relative_move(dpi(-10), 0, dpi(10), 0)
			end
		end,
		{description = 'increase floating client size horizontally by 10 px left', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'Right',
		function(c)
			if c.floating then
				c:relative_move(0, 0, dpi(10), 0)
			end
		end,
		{description = 'increase floating client size horizontally by 10 px right', group = 'client'}
	),

	-- Decreasing floating client size
	awful.key(
		{modkey, 'Control'},
		'Up',
		function(c)
			if c.floating and c.height > 10 then
				c:relative_move(0, 0, 0, dpi(-10))
			end
		end,
		{description = 'decrease floating client size vertically by 10 px up', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Down',
		function(c)
			if c.floating then
				local c_height = c.height
				c:relative_move(0, 0, 0, dpi(-10))
				if c.height ~= c_height and c.height > 10 then
					c:relative_move(0, dpi(10), 0, 0)
				end
			end
		end,
		{description = 'decrease floating client size vertically by 10 px down', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Left',
		function(c)
			if c.floating and c.width > 10 then
				c:relative_move(0, 0, dpi(-10), 0)
			end
		end,
		{description = 'decrease floating client size horizontally by 10 px left', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Right',
		function(c)
			if c.floating then
				local c_width = c.width
				c:relative_move(0, 0, dpi(-10), 0)
				if c.width ~= c_width and c.width > 10 then
					c:relative_move(dpi(10), 0 , 0, 0)
				end
			end
		end,
		{description = 'decrease floating client size horizontally by 10 px right', group = 'client'}
	)
)

return clientKeys
