--  _______ __
-- |_     _|  |--.-----.--------.-----.
--   |   | |     |  -__|        |  -__|
--   |___| |__|__|_____|__|__|__|_____|

local awful = require( "awful" )
awful.util = require( "awful.util" )

theme_path = awful.util.getdir( "config" ) .. "/themes/clone/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = { }

dofile( theme_path .. "elements.lua" )
dofile( theme_path .. "titlebar.lua" )
dofile( theme_path .. "layouts.lua" )

theme.wallpaper = theme_path .. "background.jpg"
theme.awesome_icon = theme_path .. "launcher/logo20_arch.png"
theme.awesome_subicon = theme_path .. "launcher/submenu.png"
theme.taglist_font = "awesomewm-font 18"

return theme
