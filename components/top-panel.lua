--      ████████╗ ██████╗ ██████╗     ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--         ██║   ██║   ██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--         ██║   ██║   ██║██╔═══╝     ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--         ██║   ╚██████╔╝██║         ██║     ██║  ██║██║ ╚████║███████╗███████╗
--         ╚═╝    ╚═════╝ ╚═╝         ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local theme = beautiful
local folder = require("widgets.folder")
local home_dir = os.getenv("HOME")
local vicious = require("vicious")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")

-- import widgets
local task_list = require("components.task-list")

-- define module table
local top_panel = {}

-- ===================================================================
-- Bar Creation
-- ===================================================================

top_panel.create = function(s)
    memwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.mem)
    vicious.register(memwidget, vicious.widgets.mem, " <span font='" .. beautiful.title_font .. "'><span color='#556'>Memory:</span> <span color='#00caff'>  $1%</span></span>", 3)
    cpuwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.cpu)
    vicious.register(cpuwidget, vicious.widgets.cpu, "<span font='" .. beautiful.title_font .. "'> <span color='#556'>CPU:</span> <span color='#00caff'>  $1% </span></span>", 3)
    
    local separator = wibox.widget {
        orientation = 'vertical',
        forced_height = dpi(1),
        forced_width = dpi(45),
        span_ratio = 0.5,
        color = beautiful.xcolor7,
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
            
            require("widgets.calendar"),
            
        },
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.layout.margin(wibox.widget.systray(), 0, 0, 0, 0),
            cpuwidget,
            cpu_widget,
            separator,
            
            memwidget,
            ram_widget,
            separator,
        }}
        
    end
    
    return top_panel
    
