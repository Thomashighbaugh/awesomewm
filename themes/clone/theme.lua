--  _______ __
-- |_     _|  |--.-----.--------.-----.
--   |   | |     |  -__|        |  -__|
--   |___| |__|__|_____|__|__|__|_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
local awful = require( "awful" )
awful.util = require( "awful.util" )

theme_path = awful.util.getdir( "config" ) .. "/themes/clone/"

-- ===================================================================
-- Theme Configuration
-- ===================================================================
-- default variables

theme = { }
-- call lua code as if it is within the same file, instead of as a
-- separate file like rc.lua runs this

dofile( theme_path .. "elements.lua" )
dofile( theme_path .. "titlebar.lua" )
dofile( theme_path .. "layouts.lua" )

-- include wallpaper and 'special fonts'
theme.wallpaper = theme_path .. "backgrounds/1.jpg"
theme.awesome_icon = theme_path .. "launcher/logo20_arch.png"
theme.awesome_subicon = theme_path .. "launcher/submenu.png"

-- taglist font, if placed elsewhere it won't work
theme.taglist_font = "awesomewm-font 22"

return theme
