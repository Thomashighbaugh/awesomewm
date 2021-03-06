--[[ TASKLIST.lua
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 4:54:27 PM
     Last edited:
       3/6/2021, 2:53:47 PM
     Auto updated?
       Yes
    
     Description:
    This critical piece of the modern OS too often excluded 
	even by big DEs, like gnome, is critical to my workflow. 
	Not as icons alone, I need some context about the content
	 to be most effective even if I alt tab through most things anyway, 
	I have opted for leaving myself a wide swath of means
	 and methodology to interact with my windows absent 
	 in other tiling window managers as it strealines their use in 
	 moments of frantic importance and prevents the temptation of 
	 returning to some awful DE --]]
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
                --unminimize, the result of many, many annoying swaps to urgent clients
                -- where I didn't at first think to check if the urgent client waa minimized
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
