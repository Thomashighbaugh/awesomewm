
local nice = require( "lib.nice" )
nice {
    titlebar_color = "#0e121a11",
    
    -- Swap the designated buttons for resizing, and opening the context menu
    mb_resize = nice.MB_MIDDLE,
    mb_contextmenu = nice.MB_RIGHT,
    
    titlebar_items = {
        left = { "floating", },
        middle = "title",
        right = { "sticky", "ontop", "maximize", "minimize", "close", },
    },
    
    context_menu_theme = {
        bg_focus = "#0e121a11",
        bg_normal = "#292d3511",
        border_color = "#00000000",
        border_width = 0,
        fg_focus = "#edeeff",
        fg_normal = "#fafafa",
        font = "Sans 11",
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
