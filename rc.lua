--       █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗
--      ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝
--      ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗
--      ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝
--      ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗
--      ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================
pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Import theme
local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_configuration_dir() .. "/theme/theme.lua")
-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
naughty.config.defaults['icon_size'] = 100

local lain = require("lain")
local freedesktop = require("freedesktop")
-- Import Keybinds
local keys = require("configuration.keys")
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

-- Import rules
local create_rules = require("configuration.rules").create
awful.rules.rules = create_rules(keys.clientkeys, keys.clientbuttons)

-- Import notification appearance
require("components.notifications")
awful.layout.layouts = require("configuration.layouts")
-- Import components
require("components.wallpaper")
require("components.exit-screen")
require("components.volume-adjust")
require("configuration")
-- Autostart specified apps
local apps = require("configuration.apps")
apps.autostart()

-- ===================================================================
-- Set Up Screen & Connect Signals
-- ===================================================================

-- Import panels
local bottom_panel = require("components.bottom-panel")
local top_panel = require("components.top-panel")

-- Set up each screen (add tags & panels)
awful.screen.connect_for_each_screen(function(s)
    top_panel.create(s)
    bottom_panel.create(s)
end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the window as a slave (put it at the end of others instead of setting it as master)
    if not awesome.startup then
        awful.client.setslave(c)
    end
    
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
        awful.placement.center(c)
    end
end)
-- ===================================================================
-- Client Focusing
-- ===================================================================

signals = require('configuration.signals')
-- ===================================================================
-- Garbage collection (allows for lower memory consumption)
-- ===================================================================

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
