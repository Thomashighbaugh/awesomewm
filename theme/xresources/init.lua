local filesystem = require('gears.filesystem')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local theme = {}

theme.icons = theme_dir .. '/icons/'
theme.font = 'Play Bold 10'
theme.font_bold = 'Play Bold 10'


-- Colorscheme
theme.xcolor0 =  xrdb.color0
theme.xcolor8 =  xrdb.color8

theme.xcolor1 =  xrdb.color1
theme.xcolor9 =  xrdb.color9

theme.xcolor2  =  xrdb.color2
theme.xcolor10 =  xrdb.color10

theme.xcolor3 =  xrdb.color3
theme.xcolor11 =  xrdb.color11

theme.xcolor4 =  xrdb.color4
theme.xcolor12 =  xrdb.color12

theme.xcolor5 =  xrdb.color5
theme.xcolor13 =  xrdb.color13

theme.xcolor6 =  xrdb.color6
theme.xcolor14 =  xrdb.color14

theme.xcolor7 =  xrdb.color7
theme.xcolor15 =  xrdb.color15


-- Accent color
theme.accent = theme.xcolor7

-- Background color
theme.background =  xrdb.background .. 'ff'
-- Transparent
theme.transparent = '#00000000'

-- Awesome icon
theme.awesome_icon = theme.icons .. 'awesome.svg'

local awesome_overrides = function(theme) end

return {
	theme = theme,
 	awesome_overrides = awesome_overrides
}
