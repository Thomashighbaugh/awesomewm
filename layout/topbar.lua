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
local cpu_widget = require("external.lib.awesome-wm-widgets.cpu-widget/cpu-widget")
local ram_widget = require("external.lib.awesome-wm-widgets.ram-widget/ram-widget")

local layout = {
    wallpaper = require("layout.wallpaper"),
    taglist = require("layout.taglist"),
    tasklist = require("layout.tasklist")
}

local tasklist_buttons = layout.tasklist()
local _M = {}
local W = {}
local F = {} -- Format

-- ===================================================================
-- Widgets
-- ===================================================================

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(
    function(s)
        -- ===================================================================

        -- Separator
        local separator =
            wibox.widget {
            orientation = "vertical",
            forced_height = dpi(1),
            forced_width = dpi(20),
            span_ratio = 0.5,
            color = beautiful.xcolor7 .. "bb",
            widget = wibox.widget.separator
        }
        -- ===================================================================


        -- ===================================================================

        -- Memory Widget
        memwidget = wibox.widget.textbox()
        vicious.cache(vicious.widgets.mem)
        vicious.register(memwidget, vicious.widgets.mem, " RAM: $1%", 1)
        -- ===================================================================

        -- CPU Widget
        cpuwidget = wibox.widget.textbox()
        vicious.cache(vicious.widgets.cpu)
        vicious.register(cpuwidget, vicious.widgets.cpu, " CPU: $1% ", 1)
        -- ===================================================================

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

        -- ===================================================================

        -- Create a tasklist widget
        s.mytasklist =
            awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = tasklist_buttons
        }
        -- Create a textclock widget
        local mytextclock = wibox.widget.textclock()
        -- ===================================================================
        -- Create the wibox
        s.topwibox =
            awful.wibar(
            {
                position = "top",
                screen = s,
                bg = "#0e121abb",
                height = 20
            }
        )

        -- Add widgets to the wibox
        s.topwibox:setup {
            layout = wibox.layout.align.horizontal,
            {
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                cpuwidget,
                cpu_widget,
                memwidget,
                ram_widget,
                align = "left"
            },
            s.mytasklist, -- Middle widget
            expand = "none",
            align = "center",
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                align = "right",
                separator,
                mytextclock
            }
        }
    end
)

-- }}}
