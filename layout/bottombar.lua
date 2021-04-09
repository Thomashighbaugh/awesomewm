--  ________ __ __
-- |  |  |  |__|  |--.---.-.----.
-- |  |  |  |  |  _  |  _  |   _|
-- |________|__|_____|___._|__|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")

local dpi = xresources.apply_dpi

local layout = {
    wallpaper = require("layout.wallpaper"),
    taglist = require("layout.taglist"),
    tasklist = require("layout.tasklist")
}

local taglist_buttons = layout.taglist()
local _M = {}
local W = {}
local F = {} -- Format

-- ===================================================================
-- Widgets
-- ===================================================================

awful.screen.connect_for_each_screen(
    function(s)
        -- ===================================================================

        -- Separator
        local separator =
            wibox.widget {
            orientation = "vertical",
            forced_height = dpi(5),
            forced_width = dpi(20),
            span_ratio = 0.5,
            color = beautiful.xcolor7 .. "bb",
            widget = wibox.widget.separator
        }
        -- ===================================================================

        --    -- ===================================================================

        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(
            gears.table.join(
                awful.button(
                    {},
                    1,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {},
                    3,
                    function()
                        awful.layout.inc(-1)
                    end
                )
            )
        )
        -- ===================================================================

        -- Create a taglist widget
        s.mytaglist =
            awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            style = {shape = gears.shape.rounded_rect},
            layout = {
                spacing = 6,
                spacing_widget = {
                    color = beautiful.xcolor0 .. "00",
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
                    margins = dpi(0),
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

        -- ===================================================================
        -- Wiboxes
        -- ===================================================================
        -- ===================================================================

        -- Create the bottom wibox
        s.bottomwibox =
            awful.wibar(
            {
                shape = gears.shape.rounded_rect,
                position = "bottom",
                screen = s,
                bg = "#0e121abb",
                height = 64,
                width = 640,
                border_radius = 12
            }
        )

        -- Add widgets to the wibox
        s.bottomwibox:setup {
            layout = wibox.layout.align.horizontal,
            {
                RC.launcher,
                -- Left widgets
                layout = wibox.layout.align.horizontal,
                separator,
                s.mypromptbox,
                separator
            },
            -- Middle widget
            s.mytaglist,
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                separator,
                s.mylayoutbox
            }
        }

        -- ===================================================================
    end
)

-- }}}
