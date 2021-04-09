--[[ 
 ________ _______ _____   _____   ______ _______ ______ _______ ______ 
|  |  |  |   _   |     |_|     |_|   __ \   _   |   __ \    ___|   __ \
|  |  |  |       |       |       |    __/       |    __/    ___|      <
|________|___|___|_______|_______|___|  |___|___|___|  |_______|___|__|
       by Thomas Leon Highbaugh
    
--]]
local bling = require("external.lib.bling")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Set Wallpaper

awful.screen.connect_for_each_screen(
    function(s)
        -- Screen padding
        gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. "themes/backgrounds/34.png", s, nil)
    end
)
