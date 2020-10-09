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
local vicious = require("vicious")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")

local dpi = xresources.apply_dpi

-- Custom Local Library: Common Functional Decoration
local cpu_widget = require("lib.awesome-wm-widgets.cpu-widget/cpu-widget")
local ram_widget = require("lib.awesome-wm-widgets.ram-widget/ram-widget")

local layout = {
    wallpaper = require("layout.wallpaper"),
    taglist = require("layout.taglist"),
    tasklist = require("layout.tasklist")
}

local taglist_buttons = layout.taglist()
local tasklist_buttons = layout.tasklist()
local _M = {}
local W = {}
local F = {} -- Format

-- ===================================================================
-- Widgets
-- ===================================================================

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    -- ===================================================================

    -- Separator
    local separator = wibox.widget {
        orientation = 'vertical',
        forced_height = dpi(1),
        forced_width = dpi(20),
        span_ratio = 0.5,
        color = beautiful.xcolor7 .. 'bb',
        widget = wibox.widget.separator
    }
    -- ===================================================================

    -- Wallpaper
    set_wallpaper(s)
    -- ===================================================================

    -- Memory Widget
    memwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.mem)
    vicious.register(memwidget, vicious.widgets.mem, " RAM: $1%", 3)
    -- ===================================================================

    -- CPU Widget
    cpuwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.cpu)
    vicious.register(cpuwidget, vicious.widgets.cpu, " CPU: $1% ", 3)
    -- ===================================================================

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- ===================================================================

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                              awful.button({}, 1,
                                           function() awful.layout.inc(1) end),
                              awful.button({}, 3,
                                           function()
            awful.layout.inc(-1)
        end)))
    -- ===================================================================

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {shape = gears.shape.rounded_rect},
        layout = {
            spacing = 5,
            spacing_widget = {
                color = beautiful.xcolor0 .. 'cc',
                shape = gears.shape.rounded_rect,
                widget = wibox.widget.separator
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox,
                        shape = gears.shape.rounded_rect
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                margins = dpi(3),
                left = 2,
                right = 2,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
            -- Add support for hover colors and an index label

        },
        buttons = taglist_buttons
    }
    -- ===================================================================

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- ===================================================================
    -- Wiboxes
    -- ===================================================================
    -- @TODO split into two files
    -- ===================================================================

    -- Create the bottom wibox
    s.bottomwibox = awful.wibar({
        position = "bottom",
        screen = s,
        bg = "#0e121abb",
        height = 42
    })

    -- Add widgets to the wibox
    s.bottomwibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            separator,
            s.mytaglist,
            s.mypromptbox,
            separator
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            separator,
            s.mylayoutbox
        }
    }

    -- ===================================================================
    -- Create the wibox
    s.topwibox = awful.wibar({
        position = "top",
        screen = s,
        bg = "#0e121abb",
        height = 20
    })

    -- Add widgets to the wibox
    s.topwibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.align.horizontal,
            RC.launcher,
            wibox.widget.systray(),

            align = "left"
        },
        mytextclock, -- Middle widget
        expand = "none",
        align = "center",

        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            align = "right",
            separator,
            cpuwidget,
            cpu_widget,
            memwidget,
            ram_widget
        }
    }
end)

-- }}}

