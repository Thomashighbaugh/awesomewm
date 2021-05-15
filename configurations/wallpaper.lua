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

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
require("awful.hotkeys_popup.keys")
require("awful.autofocus")

-- #############################################################################
-- Set Wallpaper ###############################################################
-- #############################################################################
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


return set_wallpaper