
local nice = require( "lib.nice" )
local beautiful = require( "beautiful" )
nice {
    
    -- Swap the designated buttons for resizing, and opening the context menu
    mb_resize = nice.MB_MIDDLE,
    mb_contextmenu = nice.MB_RIGHT,
    sticky_color = beautiful.xcolor5,
    ontop_color = beautiful.xcolor4,
    floating_color = beautiful.xcolor6,
    maximize_color = beautiful.xcolor2,
    minimize_color = beautiful.xcolor3,
    close_color = beautiful.xcolor9,
    titlebar_font = "agave Nerd Font Bold 12",
    button_size = 15,
    titlebar_height = 32,
    titlebar_items = {
        left = { "floating", },
        middle = "title",
        right = { "minimize", "maximize",  "close", },
    },
    
    context_menu_theme = {
        bg_focus = beautiful.background,
        bg_normal = beautiful.xcolor0,
        border_color = beautiful.xcolor0,
        border_width = 0,
        fg_focus = beautiful.xcolor7,
        fg_normal = beautiful.xcolor15,
        font = "agave Nerd Font Bold 11",
        height = 27.5,
        width = 250,
    },
    tooltip_messages = {
        close = "close",
        minimize = "minimize",
        maximize_active = "unmaximize",
        maximize_inactive = "maximize",
        floating_active = "enable tiling mode",
        floating_inactive = "enable floating mode",
        ontop_active = "don't keep above other windows",
        ontop_inactive = "keep above other windows",
        sticky_active = "disable sticky mode",
        sticky_inactive = "enable sticky mode",
    }
    
}
return nice
