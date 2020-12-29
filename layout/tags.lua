local bling = require("lib.bling")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

awful.screen.connect_for_each_screen(function(s)
    -- Screen padding
    screen[s].padding = {left = 0, right = 0, top = 0, bottom = 0}
    -- Each screen has its own tag table.
    awful.tag({"A", "W", "E", "S", "O", "M", "E", "W", "M"}, s,
    awful.layout.layouts[1])
    -- Set Wallpaper
    bling.module.tiled_wallpaper("", s, {
        fg = beautiful.xcolor8,
        bg = beautiful.xcolor0,
        offset_y = beautiful.wibar_height + 2,
        offset_x = 0,
        font = "FuraCode Nerd Font Mono Bold",
        font_size = 11,
        padding = 60,
        zickzack = true
    })
    gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() ..
    "images/4.png", s, nil)
end)
