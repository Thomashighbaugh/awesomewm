-- ******************************************************************************************************************* --
-- TC Header                                                                                                           --
--                                                      ::::::::::::::::::::       :::    ::: :::::::::::  ::::::::    --
--   wibox.lua                                          ::::::::::::::::::::       :+:    :+:     :+:     :+:    :+:   --
--                                                      ::::::::::::::+++#####+++  +:+    +:+     +:+     +:+          --
--   By: Thomas Leon Highbaugh <thighbaugh@zoho.c       ::+++##############+++     +:+    +:+     +:+     +:+          --
--   https://github.com/Thomashighbaugh             +++##############+++::::       +#+    +:+     +#+     +#+          --
--                                                    +++##+++::::::::::::::       +#+    +:+     +#+     +#+          --
--                                                      ::::::::::::::::::::       +#+    +#+     +#+     +#+          --
--                                                      ::::::::::::::::::::       #+#    #+#     #+#     #+#    #+#   --
--   Update: 2021/04/30 10:43:11 by Thomas Leon Highba  ::::::::::::::::::::        ########      ###      ######## .f --
--                                                                                                                     --
-- ******************************************************************************************************************* --

-- Create a wibox for each screen and add it
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.hotkeys_popup.keys")
require("awful.autofocus")
local has_fdo, freedesktop = pcall(require, "freedesktop")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        set_wallpaper(s)

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

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
                s.mypromptbox
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
