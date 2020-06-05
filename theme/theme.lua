-----------------------------------------------------------------
---------------------     Theme Init      -----------------------
-----------------------------------------------------------------

local awful = require("awful")
awful.util = require("awful.util")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
theme_path = awful.util.getdir("config") .. "theme/"
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local xrdb = xresources.get_current_theme()
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}


dofile(theme_path .. "default.lua")
dofile(theme_path .. "titlebar.lua")
dofile(theme_path .. "layouts.lua")

theme.wallpaper          = theme_path .. "Vice-Kali-Yantra.png"
theme.awesome_icon       = theme_path .. "launcher/awesome.png"
theme.awesome_subicon    = theme_path .. "launcher/awesome.png"

return theme


