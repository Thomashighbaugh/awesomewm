--  .--.--.|__|.----.-----.
--  |  |  ||  ||  __|  -__|
--   \___/ |__||____|_____|
-- |  |_|  |--.-----.--------.-----.
-- |   _|     |  -__|        |  -__|
-- |____|__|__|_____|__|__|__|_____|
-- ========================================================================
--  External Libraries
-- ========================================================================
local awful = require("awful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local helpers = require("main.helpers")

-- ========================================================================
-- Inherit default theme
-- ========================================================================
local theme = dofile(themes_path .. "default/theme.lua")

-- ========================================================================
-- Icon path
-- ========================================================================
local icon_path = gears.filesystem.get_configuration_dir() .. "icons/"
local titlebar_icon_path = icon_path .. "titlebar/"

-- ========================================================================
--  Xresources Color Import
-- ========================================================================
theme.xbackground = xrdb.background
theme.xforeground = xrdb.foreground
theme.xcolor0 = xrdb.color0
theme.xcolor1 = xrdb.color1
theme.xcolor2 = xrdb.color2
theme.xcolor3 = xrdb.color3
theme.xcolor4 = xrdb.color4
theme.xcolor5 = xrdb.color5
theme.xcolor6 = xrdb.color6
theme.xcolor7 = xrdb.color7
theme.xcolor8 = xrdb.color8
theme.xcolor9 = xrdb.color9
theme.xcolor10 = xrdb.color10
theme.xcolor11 = xrdb.color11
theme.xcolor12 = xrdb.color12
theme.xcolor13 = xrdb.color13
theme.xcolor14 = xrdb.color14
theme.xcolor15 = xrdb.color15

-- ===================================================================
-- Fonts
-- ===================================================================
theme.font = "FuraCode Nerd Font Mono Bold 11"
theme.icon_font = "FuraCode Nerd Font Mono Bold 18"
theme.font_taglist = "FuraCode Nerd Font Mono Bold 13"
theme.max_font = "FuraCode Nerd Font Nerd Mono Bold 10"

-- ========================================================================
-- Background Colors
-- ========================================================================

theme.bg_dark = theme.xcolor0 .. 'dd'
theme.bg_normal = theme.xbackground .. 'cc'
theme.bg_focus = theme.xcolor0 .. 'dd'
theme.bg_urgent = theme.xcolor0 .. 'dd'
theme.bg_minimize = theme.xcolor0 .. 'cc'

-- ========================================================================
-- Foreground Colors
-- ========================================================================
theme.fg_normal = theme.xcolor7
theme.fg_focus = theme.xcolor4
theme.fg_urgent = theme.xcolor3
theme.fg_minimize = theme.xcolor8

theme.button_close = theme.xcolor1

-- ========================================================================
-- Borders
-- ========================================================================
theme.border_width = dpi(2)
theme.border_normal = theme.xcolor0
theme.border_focus = theme.xcolor0
theme.border_radius = dpi(6)
--theme.client_radius = dpi(10)
theme.widget_border_width = dpi(2)
theme.widget_border_color = theme.xcolor0

-- ========================================================================
-- Taglist
-- ========================================================================

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
taglist_square_size, theme.fg_normal)
theme.taglist_font = theme.font_taglist
theme.taglist_bg = transparent
theme.taglist_bg_focus = transparent
theme.taglist_fg_focus = theme.xcolor4
theme.taglist_bg_urgent = transparent
theme.taglist_fg_urgent = theme.xcolor5
theme.taglist_bg_occupied = transparent
theme.taglist_fg_occupied = theme.xcolor1
theme.taglist_bg_empty = transparent
theme.taglist_fg_empty = theme.xcolor8
theme.taglist_bg_volatile = transparent
theme.taglist_fg_volatile = theme.xcolor11
theme.taglist_disable_icon = true

-- ========================================================================
-- Tasklist
-- ========================================================================
theme.tasklist_font = theme.font
theme.tasklist_bg_focus = theme.xcolor0 .. 'dd'
theme.tasklist_fg_focus = theme.xcolor4
theme.tasklist_bg_minimize = theme.xcolor0 .. '00'
theme.tasklist_fg_minimize = theme.xforeground .. "aa"
theme.tasklist_bg_normal = theme.xcolor0 .. '00'
theme.tasklist_fg_normal = theme.xforeground
theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = false
theme.tasklist_bg_urgent = theme.xcolor0 .. '00'
theme.tasklist_fg_urgent = theme.xcolor1
theme.tasklist_spacing = dpi(1)
theme.tasklist_align = "center"

-- ========================================================================
-- Titlebars
-- ========================================================================

theme.titlebar_size = dpi(25)
theme.titlebar_bg_focus = theme.xcolor0 .. 'dd'
theme.titlebar_bg_normal = theme.xcolor0 .. 'cc'
theme.titlebar_fg_focus = theme.xcolor15
theme.titlebar_fg_normal = theme.xcolor7

-- ========================================================================
-- Edge snap
-- ========================================================================
theme.snap_bg = theme.xcolor6
theme.snap_shape = helpers.rrect(theme.border_radius)

-- ========================================================================
-- Prompts
-- ========================================================================
theme.prompt_bg = transparent
theme.prompt_fg = theme.xforeground

-- ========================================================================
-- Tooltips
-- ========================================================================
theme.tooltip_bg = theme.xcolor0 .. 'dd'
theme.tooltip_fg = theme.xforeground
theme.tooltip_font = theme.font
theme.tooltip_border_width = theme.border_width
theme.tooltip_border_color = theme.xcolor0
theme.tooltip_opacity = 0.80
theme.tooltip_align = "left"

-- ========================================================================
-- Menu
-- ========================================================================
theme.menu_font = theme.font
theme.menu_bg_focus = theme.xcolor4
theme.menu_fg_focus = theme.xcolor15
theme.menu_bg_normal = theme.xcolor0 .. 'dd'
theme.menu_fg_normal = theme.xcolor7
theme.menu_submenu_icon = gears.filesystem.get_configuration_dir() ..
"theme/icons/submenu.png"
theme.menu_height = dpi(70)
theme.menu_width = dpi(230)
theme.menu_border_color = theme.xcolor7
theme.menu_border_width = theme.border_width

-- ========================================================================
-- Hotkeys Pop Up
-- ========================================================================
theme.hotkeys_font = theme.font
theme.hotkeys_border_color = theme.xcolor0

-- ========================================================================
-- Layout List
-- ========================================================================
theme.layoutlist_border_color = theme.xcolor8
theme.layoutlist_border_width = theme.border_width
-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.xforeground)

-- ========================================================================
-- Gaps
-- ========================================================================
theme.useless_gap = dpi(3)

-- ========================================================================
-- Exit Screen
-- ========================================================================
theme.exit_screen_fg = theme.xforeground

-- ========================================================================
-- Systray
-- ========================================================================
theme.systray_icon_spacing = dpi(4)
theme.bg_systray = theme.xcolor0 .. '00'
theme.systray_icon_size = dpi(30)

-- ========================================================================
-- Wibar
-- ========================================================================
theme.wibar_height = dpi(35)
theme.wibar_margin = dpi(5)
theme.wibar_spacing = dpi(5)
theme.wibar_bg = theme.xcolor0 .. 'dd'

-- ===================================================================
-- Bling ---------------------------------------------------------
-- ===================================================================
-- window swallowing
theme.dont_swallow_classname_list = {"firefox", "Gimp"} -- list of class names that should not be swallowed
theme.dont_swallow_filter_activated = true -- whether the filter above should be active

-- flash focus
theme.flash_focus_start_opacity = 0.6 -- the starting opacity
theme.flash_focus_step = 0.01 -- the step of animation

-- tabbed
theme.tabbed_spawn_in_tab = true -- whether a new client should spawn into the focused tabbing container

-- tabbar general
theme.tabbar_ontop = false
theme.tabbar_radius = dpi(6) -- border radius of the tabbar
theme.tabbar_style = "default" -- style of the tabbar ("default", "boxes" or "modern")
theme.tabbar_font = "FuraCode Nerd Font Mono Bold 12" -- font of the tabbar
theme.tabbar_size = 25 -- size of the tabbar
theme.tabbar_position = "top" -- position of the tabbar
theme.tabbar_bg_normal = "#1f2032cc" -- background color of the focused client on the tabbar
theme.tabbar_fg_normal = "#e9efff" -- foreground color of the focused client on the tabbar
theme.tabbar_bg_focus = "#1f203200" -- background color of unfocused clients on the tabbar
theme.tabbar_fg_focus = theme.xcolor6 -- foreground color of unfocused clients on the tabbar

-- mstab
theme.mstab_bar_ontop = false -- whether you want to allow the bar to be ontop of clients
theme.mstab_dont_resize_flaves = false -- whether the tabbed stack windows should be smaller than the
-- currently focused stack window (set it to true if you use
-- transparent terminals. False if you use shadows on solid ones
theme.mstab_bar_padding = dpi(0) -- how much padding there should be between clients and your tabbar
-- by default it will adjust based on your useless gaps.
-- If you want a custom value. Set it to the number of pixels (int)
theme.mstab_border_radius = dpi(6) -- border radius of the tabbar
theme.mstab_bar_height = 25 -- height of the tabbar
theme.mstab_tabbar_position = "top" -- position of the tabbar (mstab currently does not support left,right)
theme.mstab_tabbar_style = "default" -- style of the tabbar ("default", "boxes" or "modern")
-- defaults to the tabbar_style so only change if you want a
-- different style for mstab and tabbed

-- the following variables are currently only for the "modern" tabbar style
theme.tabbar_color_close = "#ff29a800" -- chnges the color of the close button
theme.tabbar_color_min = "#f0ee6e00" -- chnges the color of the minimize button
theme.tabbar_color_float = "#6c71c400" -- chnges the color of the float button

-- ========================================================================
-- Icons for Notif Center
-- ========================================================================

theme.clear_icon = icon_path .. "notif-center/clear.png"
theme.clear_grey_icon = icon_path .. "notif-center/clear_grey.png"
theme.notification_icon = icon_path .. "notif-center/notification.png"
theme.delete_icon = icon_path .. "notif-center/delete.png"
theme.delete_grey_icon = icon_path .. "notif-center/delete_grey.png"

-- ========================================================================
-- Icons for Titlebar
-- ========================================================================

theme.titlebar_close_button_normal = titlebar_icon_path .. "close_normal.svg"
theme.titlebar_close_button_focus = titlebar_icon_path .. "close_focus.svg"

theme.titlebar_minimize_button_normal = titlebar_icon_path ..
"minimize_normal.svg"
theme.titlebar_minimize_button_focus = titlebar_icon_path ..
"minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive =
titlebar_icon_path .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive =
titlebar_icon_path .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active =
titlebar_icon_path .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active =
titlebar_icon_path .. "ontop_focus_active.svg"

theme.titlebar_sticky_button_normal_inactive =
titlebar_icon_path .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive =
titlebar_icon_path .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active =
titlebar_icon_path .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active =
titlebar_icon_path .. "sticky_focus_active.svg"

theme.titlebar_floating_button_normal_inactive =
titlebar_icon_path .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive =
titlebar_icon_path .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active =
titlebar_icon_path .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active =
titlebar_icon_path .. "floating_focus_active.svg"

theme.titlebar_maximized_button_normal_inactive =
titlebar_icon_path .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive =
titlebar_icon_path .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active =
titlebar_icon_path .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active =
titlebar_icon_path .. "maximized_focus_active.svg"

theme.taglist_font = "awesomewm-font 22"

return theme
