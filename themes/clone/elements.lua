
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

theme.font = 'Share Tech Medium 13'
theme.font_bold = 'Share Tech Bold 13'

-- Foreground

theme.fg_normal = xrdb.color15
theme.fg_focus = xrdb.color7
theme.fg_urgent = xrdb.color15

theme.bat_fg_critical = xrdb.color8

theme.bg_normal = xrdb.background
theme.bg_focus = xrdb.color8
theme.bg_urgent = xrdb.color0

-- Colorscheme
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
theme.systray_icon_spacing = dpi(16)

theme.bg_normal = theme.xcolor0 .. "cc"
theme.bg_focus = theme.xcolor0 .. "cc"
theme.bg_urgent = theme.xcolor0 .. "cc"
theme.bg_minimize = theme.xcolor0 .. "cc"
theme.bg_systray = theme.xcolor0 .. "cc"

theme.fg_normal = theme.xcolor7
theme.fg_focus = theme.xcolor7
theme.fg_urgent = theme.xcolor7
theme.fg_minimize = theme.xcolor7

theme.useless_gap = dpi(6)
theme.border_width = dpi(3)

theme.border_normal = theme.xcolor0 .. "55"
theme.border_focus = theme.xcolor8 .. "55"
theme.border_marked = theme.xcolor1 .. "55"
theme.border_radius = dpi(25)
theme.client_radius = dpi(18)
theme.groups_radius = dpi(18)

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:

theme.taglist_bg_focus = theme.xcolor0 .. '22'
theme.taglist_bg_normal = theme.xcolor0 .. '22'
theme.taglist_fg_focus = theme.xcolor7 .. 'bb'
theme.taglist_bg_urgent = theme.xcolor0 .. '22'
theme.taglist_fg_urgent = theme.xcolor5 .. '55'
theme.taglist_bg_occupied = theme.xcolor0 .. '22'
theme.taglist_fg_occupied = theme.xcolor12 .. 'bb'
theme.taglist_bg_empty = theme.xcolor0 .. '22'
theme.taglist_fg_empty = theme.xcolor7 .. 'bb'
theme.taglist_shape_border_color_focus = theme.xcolor5
theme.taglist_shape_border_color = theme.xcolor0
theme.taglist_shape_border_color_urgent = theme.xcolor0
theme.taglist_spacing = dpi(3)
theme.tasklist_bg_normal = theme.xcolor0 .. "55"
theme.tasklist_bg_focus = theme.xcolor0 .. "88"
theme.tasklist_fg_focus = theme.xcolor7 .. 'cc'

theme.titlebar_bg_normal = theme.xcolor0 .. "55"
theme.titlebar_bg_focus = theme.xcolor0 .. "55"
theme.titlebar_fg_focus = theme.xcolor7 .. "55"
theme.titlebar_size = dpi(20)
theme.titlebar_bg_focus = theme.background .. 'bb'
theme.titlebar_bg_normal = theme.background .. 'bb'
theme.titlebar_fg_focus = theme.xcolor15 .. 'bb'
theme.titlebar_fg_normal = theme.xcolor15 .. 'bb'

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme_path .. "misc/default/submenu.png"

theme.menu_height = 20 -- dpi(15)
theme.menu_width = 180 -- dpi(100)
--theme.menu_context_height = 20

theme.menu_bg_normal = theme.xcolor0 .. "cc"
theme.menu_bg_focus = theme.xcolor12 .. "cc"
theme.menu_fg_focus = theme.xcolor7

theme.menu_border_color = theme.xcolor12 .. "00"
theme.menu_border_width = 1

theme.hotkeys_font = 'Share Tech Bold 11'
theme.hotkeys_description_font = 'Share Tech Medium 10'
theme.hotkeys_bg = theme.background .. 'cc'
theme.hotkeys_group_margin = dpi(2)
theme.hotkeys_label_fg = theme.xcolor7
theme.hotkeys_modifiers_fg = theme.xcolor1 .. 'cc'
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
