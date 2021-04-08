local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local _M = {}

function _M.get()
    local taglist_buttons =
        gears.table.join(
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
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end
        ),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button(
            {modkey},
            3,
            function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end
        )
    )

    local taglist =
        awful.widget.taglist {
        filter = awful.widget.taglist.filter.all,
        style = {shape = gears.shape.rounded_rect},
        layout = {
            spacing = 6,
            spacing_widget = {
                color = beautiful.xcolor0 .. "cc",
                shape = gears.shape.rounded_rect,
                widget = wibox.widget.separator
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                        shape = gears.shape.rounded_rect
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                margins = 0,
                left = 2,
                right = 2,
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background
            -- Add support for hover colors and an index label
        },
        buttons = taglist_buttons
    }

    return taglist
end
return setmetatable(
    {},
    {
        __call = function(_, ...)
            return _M.get(...)
        end
    }
)
