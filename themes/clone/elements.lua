--         __                              __
-- .-----.|  |.-----.--------.-----.-----.|  |_.-----.
-- |  -__||  ||  -__|        |  -__|     ||   _|__ --|
-- |_____||__||_____|__|__|__|_____|__|__||____|_____|
-- NOTE: Essentially called by the theme file, enables using of
-- different themes or configurations in a modular sense.
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
theme.font = 'agave Nerd Font Bold 12'
theme.font_bold = 'agave Nerd Font Bold 12'
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
theme.bg_systray = theme.background .. 'cc'
theme.systray_icon_spacing = dpi( 16 )
-- Foreground
theme.fg_normal = theme.xcolor7
theme.fg_focus = theme.xcolor15
theme.fg_urgent = theme.xcolor7
theme.fg_minimize = theme.xcolor7
-- ===================================================================
-- Theme Component Options
-- ===================================================================
-- Window Border
theme.border_normal = theme.xcolor8 .. "cc"
theme.border_focus = theme.xcolor7 .. "cc"
theme.border_marked = theme.xcolor1 .. "cc"
theme.border_radius = dpi( 8 )
theme.client_radius = dpi( 8 )
theme.groups_radius = dpi( 8 )
theme.border_width = dpi( 1 )
-- ===================================================================
-- Window Gaps
theme.useless_gap = dpi( 5 )
-- ===================================================================
--Taglist
theme.taglist_fg_focus = theme.xcolor15 .. 'cc'
theme.taglist_fg_urgent = theme.xcolor3 .. 'cc'
theme.taglist_fg_occupied = theme.xcolor9 .. 'cc'
theme.taglist_fg_empty = theme.xcolor12 .. 'cc'
theme.taglist_bg_focus = xrdb.background ..'cc'
theme.taglist_bg_empty = xrdb.background ..'cc'
theme.taglist_bg_occupied = xrdb.background ..'cc'
theme.taglist_bg_urgent = xrdb.background .. 'cc'
theme.taglist_bg_normal = xrdb.background .. 'cc'
-- ===================================================================
-- Tasklist
theme.tasklist_bg_normal = xrdb.background .. "00"
theme.tasklist_bg_focus = xrdb.background .. "00"
theme.tasklist_fg_focus = theme.xcolor7 .. '00'
-- ===================================================================
-- Titlebar
theme.titlebar_bg_normal = xrdb.background .. "bb"
theme.titlebar_bg_focus = xrdb.background .. "dd"
theme.titlebar_fg_focus = theme.xcolor7 .. "cc"
theme.titlebar_size = dpi( 25 )
theme.titlebar_fg_normal = theme.xcolor15 .. '66'
-- ===================================================================
-- Menu
theme.menu_submenu_icon = theme_path .. "misc/default/submenu.png"
theme.menu_height = dpi( 25 )
theme.menu_width = dpi( 200 )
theme.menu_bg_normal = xrdb.background .. "cc"
theme.menu_bg_focus = theme.xcolor12 .. "cc"
theme.menu_fg_focus = theme.xcolor7 .. "cc"
theme.menu_border_color = theme.xcolor12 .. "00"
theme.menu_border_width = 1
-- ===================================================================
--  Hotkeys Pop Up
theme.hotkeys_font = 'agave Nerd Font Bold 14'
theme.hotkeys_description_font = 'agave Nerd Font Bold 13'
theme.hotkeys_bg = theme.background .. 'dd'
theme.hotkeys_group_margin = dpi( 12 )
theme.hotkeys_label_fg = xrdb.background
theme.hotkeys_modifiers_fg = theme.xcolor4 .. 'cc'