--                  _  _
-- __      __ __ _ | || | _ __    __ _  _ __    ___  _ __
-- \ \ /\ / // _` || || || '_ \  / _` || '_ \  / _ \| '__|
--  \ V  V /| (_| || || || |_) || (_| || |_) ||  __/| |
--   \_/\_/  \__,_||_||_|| .__/  \__,_|| .__/  \___||_|
--                       |_|           |_|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard awesome library
local gears = require("gears")
local beautiful = require("beautiful")
-- ===================================================================
-- Wallpaper setting function (picture set in themes)
-- ===================================================================
function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
