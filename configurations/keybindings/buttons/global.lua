--[[
Author: Thomas Leon Highbaugh (thighbaugh@zoho.com)
global.lua
Desc: Mouse buttons in general as opposed to specific to the client 
]]
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local default_apps = require("configurations.default-apps")
require("awful.autofocus")
local menu = require("module.menu")

local buttons = {
    gears.table.join(awful.button({}, 3, menu))
}

return buttons
