---@diagnostic disable: lowercase-global

                                                             
-- .---.-.--.--.--.-----.-----.-----.--------.--.--.--.--------.
-- |  _  |  |  |  |  -__|__ --|  _  |        |  |  |  |        |
-- |___._|________|_____|_____|_____|__|__|__|________|__|__|__|                          
-- ########################################################################
-- ########################################################################
-- ########################################################################
--[[
Author: Thomas Leon Highbaugh (thighbaugh@zoho.com)
rc.lua
]]


-- ####################################################################
-- Libraries & External Modules
-- ####################################################################
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
require("awful.autofocus")
-- Awesome Freedesktop
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- ####################################################################
-- Error handling
-- ####################################################################
-- Check if awesome encountered an error during startup
require("module.error-handling")

-- ####################################################################
-- Initialize Theme
-- ####################################################################
beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/vice/theme.lua")

-- ####################################################################
-- Set Global Defaults
-- ####################################################################
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

-- ####################################################################
-- Layouts
-- ####################################################################
require("configurations.layouts")

-- ####################################################################
-- Wibar
-- ####################################################################
require("configurations.wibar.wibox")

-- ####################################################################
-- Mouse bindings
-- ####################################################################
root.buttons = require("configurations.keybindings.buttons.global")
clientbuttons = require("configurations.keybindings.buttons.client")

-- ####################################################################
-- Key bindings
-- ####################################################################
globalkeys = require("configurations.keybindings.global")
clientkeys = require("configurations.keybindings.client")
-- Set keys
root.keys(globalkeys)

-- ####################################################################
-- Rules
-- ####################################################################
require("configurations.rules")
require("module.signals")

-- ####################################################################
-- Exit Screen
-- ####################################################################
require("widgets.exit-screen")

-- ####################################################################
-- Notifications
-- ####################################################################
require("module.notification")

-- ####################################################################
-- Autostarting Applications with WM
-- ####################################################################
require("module.autostart")
