--[[ TASKLIST.lua
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 4:54:27 PM
     Last edited:
       3/4/2021, 4:54:27 PM
     Auto updated?
       Yes
    
     Description:
       Getting this to work cost me several gray hair and probably
       shortened my life a few weeks but it works charmingly well now and
       is still geared for if you prefer occupied tags to display an icon
       instead of the letter!
--]]



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
				--if not minimized the client should by default be visible, but this is lua after all.
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
					id = 'zoom_margin',
					margins = margins,
					widget = wibox.container.margin
				},
				id = 'background_role',
				widget = wibox.container.background
			},
			widget = wibox.container.background,
			create_callback = args.callback
		},
		buttons = tasklist.buttons,
		layout = wibox.layout.fixed[args.orientation]()
	}
end

return tasklist
