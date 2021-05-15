--  ________ __ __               
-- |  |  |  |__|  |--.---.-.----.
-- |  |  |  |  |  _  |  _  |   _|
-- |________|__|_____|___._|__|  
                              
--[[
Author: Thomas Leon Highbaugh (thighbaugh@zoho.com)
wibox.lua
Desc: The bottom bar and its widgets
]]
-- #############################################################################
-- Initialization ##############################################################
-- #############################################################################

-- Create a wibox for each screen and add it
pcall(require, "luarocks.loader")


local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
require("awful.hotkeys_popup.keys")
require("awful.autofocus")


local set_wallpaper = require("configurations.wallpaper")


awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        set_wallpaper(s)

        -- Create the wibox
        s.mywibox = awful.wibar({position = beautiful.wibar_position, screen = s, height = beautiful.wibar_height})

        -- Add widgets to the wibox
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            {
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                require("widgets.panel.menu"),
                require("widgets.panel.taglist")(s),
            },
            require("widgets.panel.tasklist")(s), -- Middle widget
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                require("widgets.panel.systray"),
                require("widgets.panel.layoutbox")(s),
                require("widgets.noti-center"),
                require("widgets.control-center"),
                require("widgets.clock")()
            }
        }
    end
)
---@diagnostic disable-next-line: undefined-global
awesome.connect_signal(
    "panel::show",
    function()
        for s in screen do
            s.mywibox.visible = true
        end
    end
)

awesome.connect_signal(
    "panel::hide",
    function()
        for s in screen do
            s.mywibox.visible = false
        end
    end
)
