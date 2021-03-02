local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local callbacks = require('widget.callbacks')

local tasklist = {}

tasklist.buttons =
	awful.util.table.join(
	awful.button(
		{},
		1,
		function(c)
			if c == _G.client.focus then
				c.minimized = true
			else
				-- Without this, the following
				-- :isvisible() makes no sense
				c.minimized = false
				if not c:isvisible() and c.first_tag then
					c.first_tag:view_only()
				end
				-- This will also un-minimize
				-- the client, if needed
				_G.client.focus = c
				c:raise()
			end
		end
	),
	awful.button(
		{},
		2,
		function(c)
			c:kill()
		end
	)
)

tasklist.build = function(args)
	local margins = 0
	if args.callback ~= callbacks.background then
		margins = args.margins or beautiful.margin_size
	end
	return awful.widget.tasklist {
		screen = args.screen,
		filter = awful.widget.tasklist.filter.currenttags,
		widget_template = {
			{
				{
					{
						id = 'clienticon',
						widget = awful.widget.clienticon
					},
					{
						id = 'text_role',
						widget = wibox.widget.textbox,
						align = 'left'
					},
					margins = margins,
					widget = wibox.container.margin,
					layout = wibox.layout.fixed.horizontal
				},
				id = 'background_role',
				widget = wibox.container.background,
				bg = '#00000000'
			},
			widget = wibox.container.background,
			left = 15,
			right = 15,
			create_callback = args.callback
		},
		buttons = tasklist.buttons,
		left = 15,
		right = 15,
		layout = wibox.layout.fixed[args.orientation]()
	}
end

return tasklist
