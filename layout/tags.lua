local bling = require("lib.bling")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

awful.screen.connect_for_each_screen(function(s)
    -- Screen padding
    screen[s].padding = {left = 1, right = 1, top = 5, bottom = 5}
    -- Each screen has its own tag table.
    awful.tag({"a", "w", "e", "s", "o", "m", "e", "w", "m"}, s,
    awful.layout.layouts[1])
    -- Set Wallpaper
    
    gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() ..
        
    "images/4.png", s, nil)
end)

