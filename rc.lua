--  _______                                             ________ _______
-- |   _   |.--.--.--.-----.-----.-----.--------.-----.|  |  |  |   |   |
-- |       ||  |  |  |  -__|__ --|  _  |        |  -__||  |  |  |       |
-- |___|___||________|_____|_____|_____|__|__|__|_____||________|__|_|__|
--
--                                                  Thomas Leon Highbaugh
-- ========================================================================

-- External Package Manager Call
pcall(require, "luarocks.loader")

-- Standard AwesomeWM Libraries
local gears = require("gears")
local awful = require("awful")
local freedesktop = require("lib.freedesktop")

-- Theme Handling Library
local beautiful = require("beautiful")

-- Miscellanous AwesomeWM Libraries
local menubar = require("menubar")
local lain = require("lain")

-- ===================================================================
-- Calling All Module Libraries
-- ===================================================================

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")
local apps = require("main.apps")
apps.autostart()

modkey = RC.vars.modkey

-- Error handling
require("main.error-handling")

-- Themes
require("main.theme")

-- Custom Local Library
local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    menu = require("main.menu"),
    rules = require("main.rules"),
}
-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- Custom Local Library: Keys and Mouse Binding
local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys = require("binding.globalkeys"),
    clientkeys = require("binding.clientkeys"),
bindtotags = require("binding.bindtotags")}

-- Menu
RC.mainmenu = awful.menu({items = main.menu()}) -- in globalkeys
RC.launcher = awful.widget.launcher(
{image = beautiful.awesome_icon, menu = RC.mainmenu})
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Statusbar: Wibar
require("deco.statusbar")

-- Rules
awful.rules.rules = main.rules(
    binding.clientkeys(),
binding.clientbuttons())
-- Signals
require("main.signals")

-- Garbage collection
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
