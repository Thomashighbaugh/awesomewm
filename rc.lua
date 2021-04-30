---@diagnostic disable: lowercase-global
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
require("module.error-handling")
beautiful.init( gears.filesystem.get_configuration_dir() .. "/themes/vice/theme.lua")

terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
require("configurations.layouts")

-- Wibar
require("configurations.wibar.wibox")
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

