-----------------------------------------------------------------
---------------------     Theme Default Settings  ---------------
-----------------------------------------------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local beautiful = require("beautiful")

-- Inherit default theme
local themes_path = require("gears.filesystem").get_themes_dir()


-- font
theme.font          = "SF Mono Bold 12"


-- Load ~/.Xresources colors and set fallback colors
theme.xbackground   =         xrdb.background
theme.xforeground   =         xrdb.foreground
theme.xcolor0       =         xrdb.color0-- dark gray
theme.xcolor1       =         xrdb.color1 -- red
theme.xcolor2       =         xrdb.color2 -- green
theme.xcolor3       =         xrdb.color3 -- light orange
theme.xcolor4       =         xrdb.color4 -- purple
theme.xcolor5       =         xrdb.color5 -- purple (primary)
theme.xcolor6       =         xrdb.color6 -- light blue
theme.xcolor7       =         xrdb.color7 -- white
theme.xcolor8       =         xrdb.color8-- gray (medium-lighter side)
theme.xcolor9       =         xrdb.color9 -- red
theme.xcolor10      =         xrdb.color10-- green
theme.xcolor11      =         xrdb.color11 --orange
theme.xcolor12      =         xrdb.color12-- blue
theme.xcolor13      =         xrdb.color13 --light purple
theme.xcolor14      =         xrdb.color14 --light blue
theme.xcolor15      =         xrdb.color15 --white
theme.xcolor16      =         xrdb.color16 -- gray (medium)

theme.bg_normal     =         theme.xbackground
theme.bg_focus      =         theme.xbackground
theme.bg_urgent     =         theme.xbackground
theme.bg_minimize   =         theme.xbackground
theme.bg_systray    =         theme.xcolor16
-- #4E515B
theme.fg_normal     =         theme.xforeground
theme.fg_focus      =         theme.xcolor7
theme.fg_urgent     =         theme.xcolor4
theme.fg_minimize   =         theme.xforeground

theme.useless_gap   =         dpi(6)
theme.border_width  =         dpi(4)

theme.border_normal =         theme.xbackground
theme.border_focus  =         theme.xcolor5
theme.border_marked =         theme.xcolor5

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
theme.tasklist_font                 =       "SF Mono Bold 17"
theme.tasklist_bg_focus             =       theme.xbackground
theme.tasklist_fg_focus             =       theme.xforeground
theme.tasklist_bg_urgent            =       theme.xcolor0
theme.tasklist_fg_urgent            =       theme.xforeground
theme.tasklist_bg_normal            =       theme.xcolor0
theme.tasklist_fg_normal            =       theme.xcolor7
theme.tasklist_shape                =       gears.shape.square
theme.tasklist_shape_border_width   =       0
theme.tasklist_align                =       "left"
theme.tasklist_font_focus           =       "SF Mono Bold 17"
theme.tasklist_spacing              =       5

-- Titlebars
-- titlebar_[bg|fg]_[normal|focus]
theme.titlebar_bg_focus             =       theme.xcolor0
theme.titlebar_bg_normal            =       theme.xbackground
theme.titlebar_fg_focus             =       theme.xforeground
theme.titlebar_fg_normal            =       theme.xcolor7
theme.titlebar_font                 =       "SF Mono Bold 21"


-- Tooltips
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
theme.tooltip_fg                    =       theme.fg_normal
theme.tooltip_bg                    =       theme.bg_normal
theme.tooltip_font                  =       "SF Mono Bold 14"
theme.tooltip_border_width          =       dpi(3)
theme.tooltip_border_color          =       theme.xcolor4

-- Notifications
theme.notification_position             =       "top_right"
theme.notification_border_width         =       dpi(1.5)
theme.notification_border_radius        =       dpi(5)
theme.notification_border_color         =       theme.xforeground
theme.notification_bg                   =       theme.xcolor0
theme.notification_fg                   =       theme.xforeground
theme.notification_crit_bg              =       theme.xcolor0
theme.notification_crit_fg              =       theme.xcolor1
theme.notification_opacity              =       0.85
theme.notification_icon_size_normal     =       dpi(64)
theme.notification_icon_size_selected   =       dpi(64)
theme.notification_margin               =       dpi(3)
theme.notification_font                 =       "SF Mono Bold 18"
theme.notification_padding              =       dpi(3)

-- Edge snap
theme.snap_bg                           =       theme.xcolor7
theme.snap_shape                        =       gears.shape.rounded_rect

-- Prompts
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
theme.prompt_bg                         =       theme.xcolor8
theme.prompt_fg                         =       theme.xforeground
theme.prompt_fg_cursor                  =       theme.xcolor7
theme.prompt_bg_cursor                  =       theme.xcolor7
theme.prompt_font                       =       "SF Mono Bold 13"


-- Menu
theme.menu_bg_focus                     =       theme.xcolor0
theme.menu_fg_focus                     =       theme.xcolor4
theme.menu_bg_normal                    =       theme.xbackground
theme.menu_fg_normal                    =       theme.xcolor7
theme.menu_submenu_icon                 =       ">"
theme.menu_height                       =       dpi(50)
theme.menu_width                        =       dpi(280)
theme.menu_border_color                 =       theme.xcolor5
theme.menu_border_width                 =       dpi (3)
theme.menu_font                         =       "SF Mono Bold 16"


-- Hotkeys Popup
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
theme.hotkeys_bg                        =       theme.xbackground
theme.hotkeys_fg                        =       theme.xcolor7
theme.hotkeys_border_width              =       dpi(3)
theme.hotkeys_border_color              =       theme.xcolor11
theme.hotkeys_shape                     =       gears.shape.rounded_rect
theme.hotkeys_opacity                   =       0.75
theme.hotkeys_modifiers_fg              =       theme.xcolor01
theme.hotkeys_label_bg                  =       theme.xcolor16
theme.hotkeys_label_fg                  =       theme.xbackground
theme.hotkeys_font = "SF Mono Bold 14"
theme.hotkeys_description_font = "SF Mono Bold 11"

-- Taglist
theme.taglist_font = "awesomewm-font 32"
theme.taglist_bg = theme.xcolor0
theme.taglist_shape = gears.shape.rounded_rect
theme.taglist_bg_focus = theme.xcolor4
theme.taglist_fg_focus = theme.xbackground
theme.taglist_bg_urgent = theme.xcolor1
theme.taglist_fg_urgent = theme.xcolor0
theme.taglist_bg_occupied = theme.xbackground
theme.taglist_fg_occupied = theme.xcolor9
theme.taglist_bg_empty = theme.xbackground
theme.taglist_fg_empty = theme.xcolor4
theme.taglist_bg_volatile = theme.xcolor1
theme.taglist_padding = dpi(1)
theme.taglist_margins = dpi(1)
theme.taglist_spacing = dpi(1)
theme.taglist_fg_volatile = theme.xcolor0






-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

--Icon Theme 
theme.icon_theme = "/usr/share/icons/Suru++"
 --theme.icon_theme = home .. "/.icons/Suru++"

