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
theme.font = "FuraCode Nerd Font Mono Bold 10"
theme.icon_font = "FuraCode Nerd Font Mono Bold 18"
theme.font_taglist = "FuraCode Nerd Font Mono Bold 13"
theme.max_font = "FuraCode Nerd Font Nerd Mono Bold 10"

-- ========================================================================
-- Background Colors
-- ========================================================================

theme.bg_dark = theme.xcolor0
theme.bg_normal = theme.xbackground
theme.bg_focus = theme.xcolor8
theme.bg_urgent = theme.xcolor8
theme.bg_minimize = theme.xcolor8

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
theme.client_radius = dpi(10)
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
theme.taglist_bg = theme.xbackground
theme.taglist_bg_focus = theme.xbackground
theme.taglist_fg_focus = theme.xcolor4
theme.taglist_bg_urgent = theme.xbackground
theme.taglist_fg_urgent = theme.xcolor5
theme.taglist_bg_occupied = theme.xbackground
theme.taglist_fg_occupied = theme.xcolor1
theme.taglist_bg_empty = theme.xbackground
theme.taglist_fg_empty = theme.xcolor8
theme.taglist_bg_volatile = transparent
theme.taglist_fg_volatile = theme.xcolor11
theme.taglist_disable_icon = true

-- ========================================================================
-- Tasklist
-- ========================================================================
theme.tasklist_font = theme.font
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = theme.xbackground
theme.tasklist_fg_focus = theme.xcolor6
theme.tasklist_bg_minimize = theme.xbackground .. "cc"
theme.tasklist_fg_minimize = theme.xforeground .. "cc"
theme.tasklist_bg_normal = theme.xbackground
theme.tasklist_fg_normal = theme.xforeground
theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = false
theme.tasklist_bg_urgent = theme.xbackground
theme.tasklist_fg_urgent = theme.xcolor1
theme.tasklist_spacing = dpi(1)
theme.tasklist_align = "center"

-- ========================================================================
-- Titlebars
-- ========================================================================

theme.titlebar_size = dpi(40)
theme.titlebar_bg_focus = theme.xbackground
theme.titlebar_bg_normal = theme.xcolor8 .. 'dd'
theme.titlebar_fg_focus = theme.xcolor15
theme.titlebar_fg_normal = theme.xcolor7

-- ========================================================================
-- Edge snap
-- ========================================================================
theme.snap_bg = theme.xcolor4
theme.snap_shape = helpers.rrect(theme.border_radius)

-- ========================================================================
-- Prompts
-- ========================================================================
theme.prompt_bg = transparent
theme.prompt_fg = theme.xforeground

-- ========================================================================
-- Tooltips
-- ========================================================================
theme.tooltip_bg = theme.xbackground
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
theme.menu_fg_focus = theme.xcolor7
theme.menu_bg_normal = theme.xbackground
theme.menu_fg_normal = theme.xcolor7
theme.menu_submenu_icon = gears.filesystem.get_configuration_dir() ..
                              "theme/icons/submenu.png"
theme.menu_height = dpi(70)
theme.menu_width = dpi(230)
theme.menu_border_color = theme.xcolor0
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
theme.useless_gap = dpi(2)

-- ========================================================================
-- Exit Screen
-- ========================================================================
theme.exit_screen_fg = theme.xforeground

-- ========================================================================
-- Systray
-- ========================================================================
theme.systray_icon_spacing = dpi(2)
theme.bg_systray = theme.xbackground .. '66'
theme.systray_icon_size = dpi(30)

-- ========================================================================
-- Wibar
-- ========================================================================
theme.wibar_height = dpi(45)
theme.wibar_margin = dpi(15)
theme.wibar_spacing = dpi(5)
theme.wibar_bg = theme.xbackground

-- ===================================================================
-- Collision ---------------------------------------------------------
-- ===================================================================
theme.collision_focus_bg = theme.xcolor8
theme.collision_focus_fg = theme.xcolor6
theme.collision_focus_shape = helpers.rrect(theme.border_radius)
theme.collision_focus_border_width = theme.border_width
theme.collision_focus_border_color = theme.border_normal

theme.collision_focus_bg_center = theme.xcolor8
theme.collision_shape_width = dpi(100)
theme.collision_shape_height = dpi(100)
theme.collision_focus_shape_center = gears.shape.circle

theme.collision_max_bg = theme.xbackground
theme.collision_max_fg = theme.xcolor8
theme.collision_max_shape = helpers.rrect(theme.border_radius)
theme.bg_urgent = theme.xcolor1

theme.collision_resize_width = dpi(20)
theme.collision_resize_shape = theme.collision_focus_shape
theme.collision_resize_border_width = theme.collision_focus_border_width
theme.collision_resize_border_color = theme.collision_focus_border_color
theme.collision_resize_padding = dpi(5)
theme.collision_resize_bg = theme.collision_focus_bg
theme.collision_resize_fg = theme.collision_focus_fg

theme.collision_screen_shape = theme.collision_focus_shape
theme.collision_screen_border_width = theme.collision_focus_border_width
theme.collision_screen_border_color = theme.collision_focus_border_color
theme.collision_screen_padding = dpi(5)
theme.collision_screen_bg = theme.xbackground
theme.collision_screen_fg = theme.xcolor4
theme.collision_screen_bg_focus = theme.xcolor8
theme.collision_screen_fg_focus = theme.xcolor4

-- Tabs

theme.mstab_bar_height = dpi(40)
theme.mstab_bar_padding = dpi(0)
theme.mstab_tabbar_orientation = "top"
theme.mstab_border_radius = dpi(6)
theme.tabbar_style = "modern"
theme.tabbar_bg_focus = theme.xbackground
theme.tabbar_bg_normal = theme.xcolor0
theme.mstab_bar_ontop = true

theme.taglist_font = "awesomewm-font 28"
return theme
