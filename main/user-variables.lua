local awful = require("awful")

local _M = {
    theme = "vice",
    screen_width = awful.screen.focused().geometry.width,
    screen_height = awful.screen.focused().geometry.height,
    terminal = "kitty",
    editor = "vim",
    editor_cmd = "kitty -e vim",
    browser = "firefox",
    filemanager = "thunar",
    discord = "discord",
    music = "kitty --class music -e ncspot",
    modkey = "Mod4",
    altkey = "Mod1",
    shift = "Shift",
    ctrl = "Control"

}

return _M
