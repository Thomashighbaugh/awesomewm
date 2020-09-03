--         __                              __
-- .-----.|  |.-----.--------.-----.-----.|  |_.-----.
-- |  -__||  ||  -__|        |  -__|     ||   _|__ --|
-- |_____||__||_____|__|__|__|_____|__|__||____|_____|

-- ===================================================================
--  External Libraries
-- ===================================================================
local theme_assets = require( "beautiful.theme_assets" )
local xresources = require( "beautiful.xresources" )
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme( )

-- ===================================================================
--  Theme Fonts
-- ===================================================================

theme.font = 'Iceland Bold 13'
theme.font_bold = 'Iceland Bold 13'

-- ===================================================================
-- Theme Colors
-- ===================================================================

theme.fg_normal = xrdb.color15
theme.fg_focus = xrdb.color7
theme.fg_urgent = xrdb.color15

--Battery Critical
theme.bat_fg_critical = xrdb.color8

-- Colorscheme
-- here we import the Xresources colors, if they exist on your system. This provides ease of themeing for me and makes this theme adaptable to different contexts than its present one.
theme.background = xrdb.background
theme.foreground = xrdb.foreground
-- blacks
theme.xcolor0 = xrdb.color0
theme.xcolor8 = xrdb.color8
--reds
theme.xcolor1 = xrdb.color1
theme.xcolor9 = xrdb.color9
-- green
theme.xcolor2 = xrdb.color2
theme.xcolor10 = xrdb.color10
-- yellow
theme.xcolor3 = xrdb.color3
theme.xcolor11 = xrdb.color11
-- blue
theme.xcolor4 = xrdb.color4
theme.xcolor12 = xrdb.color12
-- magenta
theme.xcolor5 = xrdb.color5
theme.xcolor13 = xrdb.color13
--cyan
theme.xcolor6 = xrdb.color6
theme.xcolor14 = xrdb.color11
-- white
theme.xcolor7 = xrdb.color7
theme.xcolor15 = xrdb.color15

-- System tray
theme.bg_systray = theme.background
theme.systray_icon_spacing = dpi( 16 )

-- Background
theme.bg_normal = theme.xcolor0 .. "22"
theme.bg_focus = theme.xcolor0 .. "cc"
theme.bg_urgent = theme.xcolor0 .. "22"
theme.bg_minimize = theme.xcolor0 .. "22"
theme.bg_systray = theme.xcolor0 .. "22"

-- Foreground
theme.fg_normal = theme.xcolor7
theme.fg_focus = theme.xcolor15
theme.fg_urgent = theme.xcolor7
theme.fg_minimize = theme.xcolor7

-- ===================================================================
-- Theme Component Options
-- ===================================================================

-- Window Border
theme.border_normal = theme.xcolor0 .. "55"
theme.border_focus = theme.xcolor8 .. "11"
theme.border_marked = theme.xcolor1 .. "55"
theme.border_radius = dpi( 25 )
theme.client_radius = dpi( 18 )
theme.groups_radius = dpi( 18 )
-- ===================================================================

-- Window Gaps
theme.useless_gap = dpi( 6 )
theme.border_width = dpi( 1 )
-- ===================================================================

--Taglist
theme.taglist_bg_focus = theme.xcolor0 .. 'cc'
theme.taglist_bg_normal = theme.xcolor0 .. 'cc'
theme.taglist_fg_focus = theme.xcolor4.. 'bb'
theme.taglist_bg_urgent = theme.xcolor0 .. '22'
theme.taglist_fg_urgent = theme.xcolor1 .. '55'
theme.taglist_bg_occupied = theme.xcolor0 .. 'cc'
theme.taglist_fg_occupied = theme.xcolor9 .. 'bb'
theme.taglist_bg_empty = theme.xcolor0 .. 'cc'
theme.taglist_fg_empty = theme.xcolor15 .. '33'
theme.taglist_shape_border_color_focus = theme.xcolor4
theme.taglist_shape_border_color = theme.xcolor0
theme.taglist_shape_border_width = 0
theme.taglist_shape_border_color_occupied = theme.xcolor7
theme.taglist_shape_border_color_urgent = theme.xcolor0
-- ===================================================================

-- Tasklist
theme.tasklist_bg_normal = theme.xcolor0 .. "55"
theme.tasklist_bg_focus = theme.xcolor0 .. "88"
theme.tasklist_fg_focus = theme.xcolor7 .. 'cc'
-- ===================================================================

-- Titlebar
theme.titlebar_bg_normal = theme.xcolor0 .. "aa"
theme.titlebar_bg_focus = theme.xcolor0 .. "ee"
theme.titlebar_fg_focus = theme.xcolor7 .. "ff"
theme.titlebar_size = dpi( 20 )
theme.titlebar_fg_normal = theme.xcolor15 .. 'ff'
-- ===================================================================

-- Menu
theme.menu_submenu_icon = theme_path .. "misc/default/submenu.png"
theme.menu_height = 20 -- dpi(15)
theme.menu_width = 180 -- dpi(100)
theme.menu_bg_normal = theme.xcolor0 .. "cc"
theme.menu_bg_focus = theme.xcolor12 .. "cc"
theme.menu_fg_focus = theme.xcolor7
theme.menu_border_color = theme.xcolor12 .. "00"
theme.menu_border_width = 1
-- ===================================================================

--  Hotkeys Pop Up
theme.hotkeys_font = 'Share Tech Bold 12'
theme.hotkeys_description_font = 'Iceland Bold 12'
theme.hotkeys_bg = theme.background .. 'cc'
theme.hotkeys_group_margin = dpi( 2 )
theme.hotkeys_label_fg = theme.xcolor0
theme.hotkeys_modifiers_fg = theme.xcolor4 .. 'cc'
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

