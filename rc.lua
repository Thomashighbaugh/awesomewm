-- _______ ________ _______ _______ _______ _______ _______ ________ _______
-- |   _   |  |  |  |    ___|     __|       |   |   |    ___|  |  |  |   |   |
-- |       |  |  |  |    ___|__     |   -   |       |    ___|  |  |  |       |
-- |___|___|________|_______|_______|_______|__|_|__|_______|________|__|_|__|
-- ###########################################
-- ########## Thomas Leon Highbaugh ##########
-- ###########################################

local awful = require("awful")
local beautiful = require("beautiful")
local root = _G.root
local client = _G.client
local revelation = require("external.lib.awesome-revelation")
awful.util.shell = "/bin/bash"

-- ###########################################
-- Theme
-- ###########################################
beautiful.init(require("theme"))

-- ###########################################
-- External Library Add Ins
-- ###########################################
-- Allows for all windows to be displayed with keypress
revelation.init()
-- window flash with focus change
local bling = require("external.lib.bling")
bling.module.flash_focus.enable()

-- ###########################################
-- Layouts
-- ###########################################
require("layout")

-- ###########################################
-- Modules
-- ###########################################
require("module.notifications")
require("module.auto-start")
require("module.decorate-client")
require("module.exit-screen")
require("module.lockscreen")
require("module.titlebar")

-- ###########################################
-- Configuration
-- ###########################################
require("configuration.client")
require("configuration.tags")
root.keys(require("configuration.keys.global"))

-- require("configuration.signals")

client.connect_signal(
    "manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        if not _G.awesome.startup then
            awful.client.setslave(c)
        end
        if _G.awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end
    end
)
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
    "mouse::enter",
    function(c)
        c:emit_signal("request::activate", "mouse_enter", {raise = true})
    end
)
