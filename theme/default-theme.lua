
--  _____         ___               __ __     _______ __
-- |     \.-----.'  _|.---.-.--.--.|  |  |_  |_     _|  |--.-----.--------.-----.
-- |  --  |  -__|   _||  _  |  |  ||  |   _|   |   | |     |  -__|        |  -__|
-- |_____/|_____|__|  |___._|_____||__|____|   |___| |__|__|_____|__|__|__|_____|

local gears = require('gears')
local beautiful = require('beautiful')

local filesystem = require('gears.filesystem')
local dpi = require('beautiful').xresources.apply_dpi

local theme_dir = filesystem.get_configuration_dir() .. '/theme'

local titlebar_icon_path = theme_dir .. "/icons/titlebar/"
local tip = titlebar_icon_path

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local theme = {}
theme.icons = theme_dir .. '/icons/'

-- Font
theme.font = 'Inter Black 11'
theme.font_bold = 'Inter Black 13'
theme.taglist_font = "awesomewm-font 28"
theme.title_font = 'Inter Black 14'

-- Menu icon theme
theme.icon_theme = 'Flatery-Sky-Dark'

local awesome_overrides = function(theme)
    
    theme.dir = theme_dir
    theme.transparent = '#00000000'
    theme.icons = theme.dir .. '/icons/'
    
    -- Wallpaper
    
    theme.wallpaper = theme.dir .. '/wallpapers/Vice-Kali-Yantra-maze-row.png'
    
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
    theme.xcolor11 = xrdb.color11
    -- white
    theme.xcolor7 = xrdb.color7
    theme.xcolor15 = xrdb.color15
    -- System tray
    
    theme.bg_systray = theme.background
    theme.systray_icon_spacing = dpi(16)
    
    -- Titlebar

    theme.titlebar_size = dpi(30)
    theme.titlebar_bg_focus = theme.background
    theme.titlebar_bg_normal = theme.background
    theme.titlebar_fg_focus = theme.xcolor15
    theme.titlebar_fg_normal = theme.xcolor15
    
    -- Close Button
    theme.titlebar_close_button_normal = tip .. "close_normal.svg"
    theme.titlebar_close_button_focus = tip .. "close_focus.svg"
    
    -- Minimize Button
    theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
    theme.titlebar_minimize_button_focus = tip .. "minimize_focus.svg"
    
    -- Ontop Button
    theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
    theme.titlebar_ontop_button_focus_inactive = tip .. "ontop_focus_inactive.svg"
    theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
    theme.titlebar_ontop_button_focus_active = tip .. "ontop_focus_active.svg"
    
    -- Sticky Button
    theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
    theme.titlebar_sticky_button_focus_inactive = tip .. "sticky_focus_inactive.svg"
    theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
    theme.titlebar_sticky_button_focus_active = tip .. "sticky_focus_active.svg"
    
    -- Floating Button
    theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
    theme.titlebar_floating_button_focus_inactive = tip .. "floating_focus_inactive.svg"
    theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
    theme.titlebar_floating_button_focus_active = tip .. "floating_focus_active.svg"
    
    -- Maximized Button
    theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
    theme.titlebar_maximized_button_focus_inactive = tip .. "maximized_focus_inactive.svg"
    theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
    theme.titlebar_maximized_button_focus_active = tip .. "maximized_focus_active.svg"
    
    -- Hovered Close Button
    theme.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
    theme.titlebar_close_button_focus_hover = tip .. "close_focus_hover.svg"
    
    -- Hovered Minimize Buttin
    theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
    theme.titlebar_minimize_button_focus_hover = tip .. "minimize_focus_hover.svg"
    
    -- Hovered Ontop Button
    theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
    theme.titlebar_ontop_button_focus_inactive_hover = tip .. "ontop_focus_inactive_hover.svg"
    theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
    theme.titlebar_ontop_button_focus_active_hover = tip .. "ontop_focus_active_hover.svg"
    
    -- Hovered Sticky Button
    theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
    theme.titlebar_sticky_button_focus_inactive_hover = tip .. "sticky_focus_inactive_hover.svg"
    theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
    theme.titlebar_sticky_button_focus_active_hover = tip .. "sticky_focus_active_hover.svg"
    
    -- Hovered Floating Button
    theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
    theme.titlebar_floating_button_focus_inactive_hover = tip .. "floating_focus_inactive_hover.svg"
    theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
    theme.titlebar_floating_button_focus_active_hover = tip .. "floating_focus_active_hover.svg"
    
    -- Hovered Maximized Button
    theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
    theme.titlebar_maximized_button_focus_inactive_hover = tip .. "maximized_focus_inactive_hover.svg"
    theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
    theme.titlebar_maximized_button_focus_active_hover = tip .. "maximized_focus_active_hover.svg"
    
    -- UI Groups
    
    theme.groups_title_bg = xrdb.color0
    theme.groups_bg = xrdb.color8
    theme.groups_radius = dpi(18)
    
    -- Client Decorations
    
    -- Borders
    theme.border_focus = theme.xcolor5
    theme.border_normal = theme.background
    theme.border_marked = theme.xcolor1
    theme.border_width = dpi(2)
    theme.border_radius = dpi(15)
    
    -- Decorations
    theme.client_radius = dpi(18)
    theme.useless_gap = dpi(6)
    
    -- Menu
    theme.menu_font = "Inter Black 16"
    theme.menu_submenu = '➤' -- ➤
    
    theme.menu_height = dpi(34)
    theme.menu_width = dpi(300)
    theme.menu_border_width = dpi(2)
    theme.menu_bg_focus = theme.background .. 'ee'
    
    theme.menu_bg_normal = theme.background:sub(1, 7) .. '33'
    theme.menu_fg_normal = xrdb.color15
    theme.menu_fg_focus = xrdb.color15
    theme.menu_border_color = theme.background:sub(1, 7) .. ''
    
    -- Tooltips
    
    theme.tooltip_bg = theme.background
    theme.tooltip_border_color = theme.transparent
    theme.tooltip_border_width = 0
    theme.tooltip_gaps = dpi(5)
    theme.tooltip_shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, dpi(6))
    end
    
    -- Separators
    
    theme.separator_color = theme.xcolor15
    
    -- Layoutbox icons
    
    theme.layout_max = theme.icons .. 'layouts/max.svg'
    theme.layout_tile = theme.icons .. 'layouts/tile.svg'
    theme.layout_dwindle = theme.icons .. 'layouts/dwindle.svg'
    theme.layout_floating = theme.icons .. 'layouts/floating.svg'
    theme.layout_fair = theme.icons .. 'layouts/fair.svg'
    theme.layout_cornersw = theme.icons .. 'layouts/cornersw.svg'
    theme.layout_spiral = theme.icons .. 'layouts/spiral.svg'
    theme.layout_termfair = theme.icons .. 'layouts/termfair.svg'
    theme.layout_tileright = theme.icons .. 'layouts/tileright.svg'
    theme.layout_tilebottom = theme.icons .. 'layouts/tilebottom.svg'
    theme.layout_tileleft = theme.icons .. 'layouts/tileleft.svg'
    theme.layout_tiletop = theme.icons .. 'layouts/tiletop.svg'
    theme.layout_max = theme.icons .. 'layouts/max.svg'
    theme.layout_magnifier = theme.icons .. 'layouts/magnifier.svg'
    theme.layout_fullscreen = theme.icons .. 'layouts/fullscreen.svg'
    theme.layout_cornerse = theme.icons .. 'layouts/cornerse.svg'
    theme.layout_cornernw = theme.icons .. 'layouts/cornernw.svg'
    theme.layout_cornerne = theme.icons .. 'layouts/cornerne.svg'
    theme.layout_cornersw = theme.icons .. 'layouts/cornersw.svg'
    theme.layout_fairv = theme.icons .. 'layouts/fair.svg'
    theme.layout_termfair = theme.icons .. "layouts/termfair.png"
    theme.layout_centerfair = theme.icons .. "layouts/centerfair.png" -- termfair.center
    theme.layout_cascade = theme.icons .. "layouts/cascade.svg"
    theme.layout_cascadetile = theme.icons .. "layouts/cascadetile.png" -- cascade.tile
    theme.layout_centerwork = theme.icons .. "layouts/centerwork.png"
    theme.layout_centerworkh = theme.icons .. "layouts/centerworkh.png" -- centerwork.horizontal
    -- Tasklist
    
    theme.tasklist_font = 'Inter Black 11'
    theme.tasklist_bg_normal = theme.background .. '99'
    theme.tasklist_bg_focus = theme.background
    theme.tasklist_bg_urgent = theme.xcolor1 .. '99'
    theme.tasklist_fg_focus = theme.fg_focus
    theme.tasklist_fg_urgent = theme.fg_normal
    theme.tasklist_fg_normal = theme.fg_normal
    
    -- Notification
    
    theme.notification_position = 'top_right'
    theme.notification_bg = theme.transparent
    theme.notification_margin = dpi(2)
    theme.notification_border_width = dpi(2)
    theme.notification_border_color = theme.transparent
    theme.notification_spacing = dpi(0)
    theme.notification_icon_resize_strategy = 'center'
    theme.notification_icon_size = dpi(32)

    -- Client Snap Theme
    
    theme.snap_bg = theme.background
    theme.snap_shape = gears.shape.rectangle
    theme.snap_border_width = dpi(15)
    
    -- Hotkey popup
    
    theme.hotkeys_font = 'Future Forces Bold 18'
    theme.hotkeys_description_font = 'Inter Black Regular 16'
    theme.hotkeys_bg = theme.background
    theme.hotkeys_group_margin = dpi(2)
    
    -- Tag Lists
    theme.taglist_shape = gears.shape.rounded_rect
    theme.taglist_bg_focus = theme.xcolor0
    theme.taglist_fg_focus = theme.xcolor9
    theme.taglist_bg_urgent = theme.xcolor0
    theme.taglist_fg_urgent = theme.xcolor5
    theme.taglist_bg_occupied = theme.xcolor0
    theme.taglist_fg_occupied = theme.xcolor4
    theme.taglist_bg_empty = theme.xcolor0
    theme.taglist_fg_empty = theme.xcolor7
    theme.taglist_shape_border_color_empty = theme.xcolor0
    theme.taglist_shape_border_width = dpi(1)
    theme.taglist_shape_border_color_focus = theme.xcolor9
    theme.taglist_shape_border_color = theme.xcolor0
    theme.taglist_shape_border_color_urgent = theme.xcolor0
    
    theme.taglist_bg_volatile = theme.xcolor1
    theme.taglist_spacing = dpi(5)
    theme.taglist_fg_volatile = theme.xcolor6
    
    theme.widget_main_color = "#74aeab"
    theme.widget_red = theme.xcolor1
    theme.widget_yelow = theme.xcolor3
    theme.widget_green = theme.xcolor2
    theme.widget_black = theme.xcolor0
    theme.widget_transparent = theme.xcolor0 .. '00'
    
end

return {
    theme = theme,
    awesome_overrides = awesome_overrides
}
