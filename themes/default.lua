-----------------------------------------------------------------
---------------------     Theme Default Settings  ---------------
-----------------------------------------------------------------
local theme_assets = require("beautiful.theme_assets")


local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
-- Inherit default theme
local themes_path = require("gears.filesystem").get_themes_dir()
-- ========================================================================
-- Package Path 
-- ========================================================================
local _, package_path = ...
if not package_path then
    package_path = string.sub(debug.getinfo(1, "S").source, 2)
end
local theme_dir = package_path:match("(.*/)")


theme.icon_theme = "chhinamasta"
-- Load ~/.Xresources colors and set fallback colors
theme.xbackground = xrdb.background
theme.background = xrdb.background
theme.xforeground = xrdb.foreground
theme.foreground = xrdb.foreground
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
theme.xcolor16 = "#555e70"

theme.background = theme.xbackground
theme.bg_normal = theme.xbackground
theme.bg_focus = theme.xbackground
theme.bg_urgent = theme.xbackground
theme.bg_minimize = theme.xbackground
theme.bg_systray = theme.xcolor16

theme.fg_normal = theme.xforeground
theme.fg_focus = theme.xcolor7
theme.fg_urgent = theme.xcolor4
theme.fg_minimize = theme.xforeground


-- ========================================================================
-- Font
-- ========================================================================
theme.font_family = "Realpolitik "
theme.font = theme.font_family .. "Regular "
theme.font_bold = theme.font_family .. "Bold "
theme.font_heavy = theme.font_bold
theme.title_font = theme.font_bold .. " 18"




-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

-- Tasklist
-- tasklist_[bg|fg]_[focus|urgent]
theme.tasklist_font = theme.font .. " 13"
theme.tasklist_bg_focus = theme.xbackground
theme.tasklist_fg_focus = theme.xforeground
theme.tasklist_bg_urgent = theme.xcolor0
theme.tasklist_fg_urgent = theme.xforeground
theme.tasklist_bg_normal = theme.xcolor0
theme.tasklist_fg_normal = theme.xcolor7
theme.tasklist_shape = gears.shape.square
theme.tasklist_shape_border_width = 0
theme.tasklist_align = "left"
theme.tasklist_font_focus = theme.font .. "  15"
theme.tasklist_spacing = 5

-- Titlebars
-- titlebar_[bg|fg]_[normal|focus]
theme.titlebar_bg_focus = theme.xcolor0
theme.titlebar_bg_normal = theme.xbackground
theme.titlebar_fg_focus = theme.xforeground
theme.titlebar_fg_normal = theme.xcolor7
theme.titlebar_font = theme.font .. "  21"

-- Tooltips
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal
theme.tooltip_font = theme.font .. "  14"
theme.tooltip_border_width = dpi(3)
theme.tooltip_border_color = xcolor4

-- Notifications
theme.notification_position = "top_right"
theme.notification_border_width = dpi(1.5)
theme.notification_border_radius = dpi(5)
theme.notification_border_color = theme.xforeground
theme.notification_bg = theme.xcolor0
theme.notification_fg = theme.xforeground
theme.notification_crit_bg = theme.xcolor0
theme.notification_crit_fg = theme.xcolor1
theme.notification_opacity = 0.85
theme.notification_icon_size_normal = dpi(64)
theme.notification_icon_size_selected = dpi(64)
theme.notification_margin = dpi(3)
theme.notification_font = theme.font .. "  18"
theme.notification_padding = dpi(3)

-- Edge snap
theme.snap_bg = theme.xcolor7
theme.snap_shape = gears.shape.rounded_rect

-- Prompts
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
theme.prompt_bg = theme.xcolor8
theme.prompt_fg = theme.xforeground
theme.prompt_fg_cursor = theme.xcolor7
theme.prompt_bg_cursor = theme.xcolor7
theme.prompt_font = theme.font .. ' 13'



-- Hotkeys Popup
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]




-- ========================================================================
-- System tray
-- ========================================================================
theme.bg_systray = theme.background
theme.systray_icon_spacing = dpi(9)

-- ========================================================================
-- Titlebar
-- ========================================================================
theme.titlebar_size = dpi(32)
theme.titlebar_button_margin = dpi(0)
theme.titlebar_button_spacing = dpi(8)
theme.titlebar_pos = "top"
theme.titlebar_button_pos = "right"
theme.titlebar_enabled = true
theme.border_width = dpi(0)
theme.wibar_border_width = dpi(0)
theme.titlebar_radius = dpi(0)
theme.titlebar_bg_focus = theme.xbackground .. "ee"
theme.titlebar_bg_normal = theme.xbackground .. "ee"
theme.titlebar_fg_focus = theme.xforeground .. "ff"
theme.titlebar_fg_normal = theme.xforeground .. "ff"

-- ========================================================================
-- UI Groups
-- ========================================================================
theme.groups_title_bg = theme.xbackground
theme.groups_bg = theme.xcolor6
theme.groups_radius = dpi(4)

-- ========================================================================
-- Client Decorations
-- ========================================================================
theme.border_radius = dpi(9)
theme.client_radius = dpi(9)
theme.useless_gap = dpi(4)
theme.margin_hover_diff = dpi(2)
-- ========================================================================
-- Menu
-- ========================================================================
theme.menu_height = dpi(48)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(0)

theme.menu_bg_normal = theme.xbackground .. "bb"
theme.menu_fg_normal = theme.xforeground
theme.menu_fg_focus = theme.xforeground
theme.menu_bg_focus = theme.xcolor8 .. 'aa'
theme.menu_border_color = theme.xcolor8 .. "66"
-- Menu

theme.menu_fg_normal = theme.xcolor7
theme.menu_submenu_icon = "~/.config/awesome/themes/icons/logo.svg"



theme.menu_font = theme.font .. " 16"
-- ========================================================================
-- Tooltips
-- ========================================================================
theme.tooltip_bg = theme.background
theme.tooltip_border_color = theme.transparent
theme.tooltip_border_width = 0
theme.tooltip_gaps = dpi(5)
theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h)
end

-- ========================================================================
-- Taglist
-- ========================================================================
theme.taglist_spacing = dpi(8)
theme.taglist_bg = theme.transparent
theme.taglist_bg_focus = theme.transparent
theme.taglist_fg_focus = theme.xcolor15

theme.taglist_fg_urgent = theme.xcolor1

theme.taglist_fg_occupied = theme.xforeground

theme.taglist_fg_empty = theme.xcolor0

theme.taglist_fg_volatile = theme.xcolor11
-- Taglist
theme.taglist_font = "awesomewm-font 32"

theme.taglist_shape = gears.shape.rounded_rect
theme.taglist_padding = dpi(9)
theme.taglist_margins = dpi(3)
theme.taglist_spacing = dpi(9)

-- Generate taglist squares:
local taglist_square_size = dpi(3)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)


-- ========================================================================
-- Tasklist
-- ========================================================================
theme.tasklist_font = theme.font .. " 11"
theme.tasklist_fg_minimize = theme.color8
theme.tasklist_bg_normal = theme.xbackground
theme.tasklist_bg_urgent = theme.xbackground

theme.tasklist_fg_focus = theme.xcolor15
theme.tasklist_fg_urgent = theme.xcolor1
theme.tasklist_fg_normal = theme.xforeground

-- ========================================================================
-- Notification
-- ========================================================================
theme.notification_bg1 = theme.xbackground .. "dd"
theme.notification_bg2 = theme.xbackground .. "dd"
theme.notification_position = "top_left"
theme.notification_bg = theme.xbackground .. 'dd'
theme.notification_margin = theme.useless_gap
theme.notification_border_width = dpi(0)
theme.notification_border_color = theme.xbackground .. "bb"
theme.notification_spacing = dpi(0)
theme.notification_icon_resize_strategy = "center"

-- ========================================================================
-- Client Snap Theme
-- ========================================================================
theme.snap_bg = theme.background
theme.snap_shape = gears.shape.rounded_rect
theme.snap_border_width = dpi(15)

-- Hotkey popup

theme.hotkeys_font = theme.font .. " 8"
theme.hotkeys_description_font = theme.font .. " 11"
theme.hotkeys_bg = theme.xbackground .. 'aa'
theme.hotkeys_group_margin = dpi(5)
theme.hotkeys_fg = theme.xcolor7 
theme.hotkeys_border_width = dpi(0)
theme.hotkeys_border_color = theme.xcolor11 .. 'aa'
theme.hotkeys_shape = gears.shape.rounded_rect
theme.hotkeys_opacity = 0.75
theme.hotkeys_modifiers_fg = theme.xcolor01 
theme.hotkeys_label_bg = theme.xcolor0 .. 'cc'
theme.hotkeys_label_fg = theme.xbackground
theme.hotkeys_font = theme.font .. "  14"
theme.hotkeys_description_font = theme.font .. "  11"


-- Main panel
theme.panel_height = 40
theme.panel_width = 560
theme.panel_desktop_width = 560
theme.panel_laptop_width = 560
theme.panel_bg = theme.xbackground .. "dd"
theme.panel_radius = dpi(8)
theme.panel_widget_border_width = dpi(0)
theme.panel_widget_border_color = theme.xbackground .. "dd"
theme.panel_widget_bg_color = theme.transparent
theme.panel_widget_radius = dpi(0)
theme.panel_padding = dpi(2)

theme.awesome_icon = themes_path .. "icons/logo.svg"
-- Popup

-- ===================================================================
-- Bling Specific ---------------------------------------------------
-- ===================================================================
-- window swallowing
theme.dont_swallow_classname_list = {"firefox", "firefox-nightly", "Gimp"} -- list of class names that should not be swallowed
theme.dont_swallow_filter_activated = true -- whether the filter above should be active


-- tabbed
theme.tabbed_spawn_in_tab = true -- whether a new client should spawn into the focused tabbing container

-- tabbar general
theme.tabbar_ontop = true
theme.tabbar_radius = dpi(3) -- border radius of the tabbar
theme.tabbar_style = "default" -- style of the tabbar ("default", "boxes" or "modern")
theme.tabbar_font = theme.font .. " 10" -- font of the tabbar
theme.tabbar_size = 35 -- size of the tabbar
theme.tabbar_position = "top" -- position of the tabbar
theme.tabbar_bg_normal = theme.xbackground .. "bb" -- background color of the focused client on the tabbar
theme.tabbar_fg_normal = theme.xcolor7 .. '44' -- foreground color of the focused client on the tabbar
theme.tabbar_bg_focus = theme.xbackground .. "bb" -- background color of unfocused clients on the tabbar
theme.tabbar_fg_focus = theme.xcolor7 -- foreground color of unfocused clients on the tabbar

-- mstab
theme.mstab_bar_ontop = true -- whether you want to allow the bar to be ontop of clients
theme.mstab_dont_resize_slaves = false -- whether the tabbed stack windows should be smaller than the
theme.mstab_bar_padding = dpi(0) -- how much padding there should be between clients and your tabbar
theme.mstab_border_radius = dpi(3) -- border radius of the tabbar
theme.mstab_bar_height = 35 -- height of the tabbar
theme.mstab_tabbar_position = "top" -- position of the tabbar (mstab currently does not support left,right)


theme.osd_width = dpi(650)
theme.osd_height = dpi(200)

theme.taglist_spacing = dpi(8)
theme.taglist_bg = theme.transparent
theme.taglist_bg_focus = theme.transparent
theme.taglist_fg_focus = theme.xcolor15
theme.taglist_bg_urgent = theme.transparent
theme.taglist_fg_urgent = theme.xcolor1
theme.taglist_bg_occupied = theme.transparent
theme.taglist_fg_occupied = theme.xforeground
theme.taglist_bg_empty = theme.transparent
theme.taglist_fg_empty = theme.xcolor16
theme.taglist_bg_volatile = theme.transparent
theme.taglist_fg_volatile = theme.xcolor11




