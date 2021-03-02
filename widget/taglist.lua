local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')
local callbacks = require('widget.callbacks')
local icons = require('theme.icons')
local modkey = require('configuration.keys.mod').modKey
--- This is the returned type - a table with a build function to create the widget.
--- it may contain more widget
local taglist = {}

taglist.build = function(args)
	return awful.widget.taglist {
		screen = args.screen,
		filter = awful.widget.taglist.filter.all,
		style = {shape = gears.shape.rectangle},
		layout = {spacing = 0, layout = wibox.layout.flex.horizontal},
		widget_template = {
			{
				{
					{id = 'text_role', widget = wibox.widget.textbox},
					layout = wibox.layout.align.horizontal,
					align = 'center',
					valign = 'center'
				},
				top = 0,
				widget = wibox.container.margin,
				align = 'center'
			},
			id = 'background_role',
			widget = wibox.container.background
		},
		buttons = awful.util.table.join(
			awful.button(
				{},
				1,
				function(t)
					t:view_only()
				end
			),
			awful.button(
				{modkey},
				1,
				function(t)
					if _G.client.focus then
						_G.client.focus:move_to_tag(t)
						t:view_only()
					end
				end
			),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button(
				{modkey},
				3,
				function(t)
					if _G.client.focus then
						_G.client.focus:toggle_tag(t)
					end
				end
			)
		)
	}
end

return taglist
