--[[ 
_______ _______ _______ __  __ _____   _______ _______ _______  __              
|_     _|   _   |     __|  |/  |     |_|_     _|     __|_     _||  |.--.--.---.-.
  |   | |       |__     |     <|       |_|   |_|__     | |   |__|  ||  |  |  _  |
  |___| |___|___|_______|__|\__|_______|_______|_______| |___|__|__||_____|___._|
by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 4:54:27 PM
     Last edited:
       3/5/2021, 4:40:49 PM
     Auto updated?
       Yes
    
     Description: Provides the information and icons at the top bar indicating the window being shown and others open in that tag--]]
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
