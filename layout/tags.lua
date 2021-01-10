local bling = require("lib.bling")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

awful.screen.connect_for_each_screen(function(s)
    -- Screen padding
    screen[s].padding = {left = 25, right = 25, top = 25, bottom = 25}
    -- Each screen has its own tag table.
    awful.tag({"A", "W", "E", "S", "O", "M", "E", "W", "M"}, s,
    awful.layout.layouts[1])
    -- Set Wallpaper
    bling.module.tiled_wallpaper("", s, {
        fg = beautiful.xcolor8,
        bg = beautiful.xcolor0,
        offset_y = beautiful.wibar_height + 2,
        offset_x = 0,
        font = "FuraCode Nerd Font Mono Bold 18",
        font_size = 18,
        padding = 60,
        zickzack = true
    })
    gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() ..
    "images/1.jpg", s, nil)
end)
