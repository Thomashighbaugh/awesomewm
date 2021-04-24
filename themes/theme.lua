-----------------------------------------------------------------
---------------------     Theme Init      -----------------------
-----------------------------------------------------------------

local awful = require("awful")
awful.util = require("awful.util")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
theme_path = awful.util.getdir("config") .. "/themes/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}

dofile(theme_path .. "default.lua")
dofile(theme_path .. "titlebar.lua")
dofile(theme_path .. "layouts.lua")

theme.wallpaper          = "/home/tlh/Vice-Base16/Vice-Kali-Yantra.png"
theme.awesome_icon       = theme_path .. "launcher/awesome.png"
theme.awesome_subicon    = theme_path .. "launcher/awesome.png"

return theme


