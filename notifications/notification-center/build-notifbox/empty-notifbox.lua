-- This returns the "Wow, such empty." message.
local beautiful = require("beautiful")
local wibox = require('wibox')

local dpi = require('beautiful').xresources.apply_dpi

local empty_notifbox = wibox.widget {
    {
        layout = wibox.layout.fixed.vertical,
        spacing = dpi(1),
        {
            expand = 'none',
            layout = wibox.layout.align.horizontal,
            nil,
            {
                image = beautiful.notification_none_icon,
                resize = true,
                forced_height = dpi(72),
                forced_width = dpi(72),
                widget = wibox.widget.imagebox
            },
            nil
        },
        {
            markup = '<span strikethrough="true">You have no notifications!</span>',
            font = 'FuraCode Nerd Font Mono 12',
            align = 'center',
            valign = 'center',
            widget = wibox.widget.textbox
        }
    },
    margins = dpi(1),
    widget = wibox.container.margin

}

-- Make empty_notifbox center
local centered_empty_notifbox = wibox.widget {
    layout = wibox.layout.fixed.vertical,
    expand = 'none',
    empty_notifbox
}

return centered_empty_notifbox

