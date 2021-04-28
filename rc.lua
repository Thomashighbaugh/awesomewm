-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.hotkeys_popup.keys")
require('awful.autofocus')
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ 
		preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors 
	})
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

beautiful.init( gears.filesystem.get_configuration_dir() .. "/themes/vice/theme.lua")

terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
require("configurations.layouts")

-- Wibar
-- Create a wibox for each screen and add it

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

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)


    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()


    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, height = beautiful.wibar_height })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            require("widgets.panel.menu"),
            require("widgets.panel.taglist")(s),
            s.mypromptbox,
        },
        require("widgets.panel.tasklist")(s), -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            require("widgets.panel.systray"),
            require("widgets.panel.layoutbox")(s),
			require("widgets.clock")(),
			require("widgets.noti-center"),
			require("widgets.control-center"),
        },
    }
end)
---@diagnostic disable-next-line: undefined-global
awesome.connect_signal(
	"panel::show",
	function ()
		for s in screen do
			s.mywibox.visible = true
		end
	end
)

awesome.connect_signal(
	"panel::hide",
	function ()
		for s in screen do
			s.mywibox.visible = false
		end
	end
)

-- Mouse bindings
root.buttons = require("configurations.keybindings.buttons.global")
clientbuttons = require("configurations.keybindings.buttons.client")

-- Key bindings
globalkeys = require("configurations.keybindings.global")
clientkeys = require("configurations.keybindings.client")

-- Set keys
root.keys(globalkeys)

-- Rules
require("configurations.rules")
require("module.signals")
require("widgets.exit-screen")
require("module.notification")
require("module.autostart")

