--  _______ __
-- |_     _|  |--.-----.--------.-----.
--   |   | |     |  -__|        |  -__|
--   |___| |__|__|_____|__|__|__|_____|
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local home = os.getenv("HOME")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(home .. "/.config/awesome/themes/vice/theme.lua")

if (RC.vars.wallpaper) then
    local wallpaper = RC.vars.wallpaper
    if awful.util.file_readable(wallpaper) then
        beautiful.wallpaper = wallpaper
    end
end

-- Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
