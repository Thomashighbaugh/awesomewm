--      ████████╗ ██████╗ ██████╗     ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--         ██║   ██║   ██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--         ██║   ██║   ██║██╔═══╝     ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--         ██║   ╚██████╔╝██║         ██║     ██║  ██║██║ ╚████║███████╗███████╗
--         ╚═╝    ╚═════╝ ╚═╝         ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require( "awful" )
local beautiful = require( "beautiful" )
local wibox = require( "wibox" )
local gears = require( "gears" )
local dpi = beautiful.xresources.apply_dpi
local theme = beautiful
-- import widgets
local task_list = require( "widgets.task-list" )

-- define module table
local top_panel = { }

-- ===================================================================
-- Bar Creation
-- ===================================================================


top_panel.create = function( s )


    local separator = wibox.widget {
        orientation = 'vertical',
        forced_height = dpi(1),
        forced_width = dpi(5),
        span_ratio = 0.005,
        widget = wibox.widget.separator
    }

    local panel = awful.wibar({
        screen = s,
        position = "top",
        ontop = true,
        height = beautiful.top_panel_height,
        width = s.geometry.width,
        bg = theme.xcolor0
    })
    
    panel:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
                   -- require( "widgets.battery" ),
                   separator,


        {
            layout = wibox.layout.fixed.horizontal,
        task_list.create( s ),

            
        },
        {
        layout = wibox.layout.align.horizontal,
            wibox.layout.margin( wibox.widget.systray( ), 0, 0, 0, 0 ),
                        require( "widgets.calendar" ),

        }
    }
 
end

return top_panel
