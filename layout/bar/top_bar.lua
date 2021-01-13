-- wibar.lua
-- Wibar (top bar)
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("main.helpers")
local icon_theme = "sheet"
local icons = require("icons")

-- Custom Local Library: Common Functional Decoration
local cpu_widget = require("lib.awesome-wm-widgets.cpu-widget/cpu-widget")
local ram_widget = require("lib.awesome-wm-widgets.ram-widget/ram-widget")
local vicious = require("vicious")

local systray_margin = (beautiful.wibar_height - beautiful.systray_icon_size) /
2

-- Helper function that changes the appearance of progress bars and their icons
-- Create horizontal rounded bars
local function format_progress_bar(bar)
    bar.forced_width = dpi(50)
    bar.shape = gears.shape.rounded_bar
    bar.bar_shape = gears.shape.rounded_bar
    bar.background_color = beautiful.xcolor0 .. 'ff'
    
    return bar
end

-- Awesome Panel -----------------------------------------------------------

local panelPop = require('layout.pop.panel')
local calPop = require('layout.pop.cal')
local awesome_icon = wibox.widget {
    {widget = wibox.widget.imagebox, image = icons.awesome, resize = true},
    margins = 2,
    layout = wibox.container.margin
}

-- Notifs Panel ---------------------------------------------------------------
local fancy_time_widget = wibox.widget.textclock()

fancy_time_widget.align = "center"
fancy_time_widget.valign = "center"
fancy_time_widget.font = "FuraCode Nerd Font Mono Bold 15"

local fancy_time = {fancy_time_widget, layout = wibox.layout.flex.vertical}

-- Battery Bar Widget ---------------------------------------------------------

local battery_bar = require("widgets.battery_arc")
--local battery = format_progress_bar(battery_bar)

mybattery = wibox.widget.textbox()
vicious.register(mybattery, vicious.widgets.bat, "Battery: $2%", 17, "BAT0")

local bat_container = {
    left = 0,
    right = 0,
    widget = wibox.container.margin,
    mybattery,
    margins = 2,
    
}
membar = require("widgets.ram_arc")
memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "RAM: $1%", 13)

local mem_container = {
    memwidget,
    left = 0,
    right = 0,
    widget = wibox.container.margin,
    margins = 2,
}

cpuwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.cpu)
vicious.register(cpuwidget, vicious.widgets.cpu, "CPU: $1%", 13)

local cpu_container = {
    cpuwidget,
    cpu_widget,
    left = 0,
    right = 0,
    widget = wibox.container.margin,
    margins = 2,
}

cpubar = require("widgets.cpu_arc")
-- Systray Widget -------------------------------------------------------------

local mysystray = wibox.widget.systray()
mysystray:set_base_size(beautiful.systray_icon_size)

local mysystray_container = {
    mysystray,
    left = dpi(1),
    right = dpi(1),
    screen = 1,
    widget = wibox.container.margin
}

-- Create the Wibar -----------------------------------------------------------

awful.screen.connect_for_each_screen(function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    
    -- ===================================================================
    
    -- Separator
    local separator = wibox.widget {
        orientation = 'vertical',
        forced_height = dpi(1),
        forced_width = dpi(20),
        span_ratio = 0.5,
        color = beautiful.xcolor7 .. 'bb',
        widget = wibox.widget.separator
    }
    
    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        ontop = true,
        bg = beautiful.xcolor0 .. 'dd'
    })
    s.mywibox:set_xproperty("WM_NAME", "panel")
    
    -- Remove wibar on full screen
    local function remove_wibar(c)
        if c.fullscreen or c.maximized then
            s.mywibox.visible = false
        else
            s.mywibox.visible = true
        end
    end
    
    client.connect_signal("property::fullscreen", remove_wibar)
    
    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        expand = "true",
        {
            layout = wibox.layout.fixed.horizontal,
            {
                
                top = 5,
                right = 0,
                left = 0,
                widget = wibox.container.margin,
                bat_container,
                
            },
            {
                {
                    battery_bar,
                    
                    shape = helpers.rrect(beautiful.border_radius),
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 0,
                right = 0,
                left = 0,
                widget = wibox.container.margin
            },
            --   s.mypromptbox
            separator,
            
        },
        {
            
            {
                
                top = 5,
                right = 0,
                left = 0,
                widget = wibox.container.margin,
                cpu_container,
                
            },
            {
                {
                    cpubar,
                    
                    shape = helpers.rrect(beautiful.border_radius),
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                widget = wibox.container.margin,
                separator,
                
            },
            {
                
                top = 5,
                widget = wibox.container.margin,
                mem_container,
                
            },
            membar,
            separator,
            
            top = 0,
            -- without this the bar is whocky and pushes widgets off screen or is always too short.
            layout = wibox.layout.fixed.horizontal,
            widget = wibox.container.margin
        },
        {
            
            helpers.horizontal_pad(0),
            {
                {
                    {
                        mysystray_container,
                        top = dpi(6),
                        layout = wibox.container.margin
                    },
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    
                    widget = wibox.container.background
                },
                top = 0,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },
            helpers.horizontal_pad(1),
            
            {
                {
                    {
                        fancy_time,
                        margins = dpi(0),
                        widget = wibox.container.margin
                    },
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 0,
                right = 2,
                left = 25,
                widget = wibox.container.margin
            },
            
            layout = wibox.layout.fixed.horizontal
        }}
    end)
    
    -- EOF ------------------------------------------------------------------------
    
    -- -- Calendar widget
    -- mytextcalendar = awful.widget.textclock(white .. space .. "%A %d %B<span font='Tamsyn 5'> </span>" .. coldef)
    -- calendar_icon = wibox.widget.imagebox()
    -- calendar_icon:set_image(beautiful.calendar)
    -- calendarwidget = wibox.widget.background()
    -- calendarwidget:set_widget(mytextcalendar)
    -- calendarwidget:set_bgimage(beautiful.widget_bg)
    
    -- -----------------------------------------------------------------------------------------
    -- -- Memory status
    -- memtxt = wibox.widget.textbox()
    -- vicious.register(memtxt, vicious.widgets.mem, blue .. "  MEM : " .. coldef .. white .. "$2 " ..coldef  .. blue .. "mb   " .. coldef, 5)
    
    -- -- Memory graph
    
    -- memwidget = awful.widget.progressbar()
    -- memwidget:set_width(12)
    -- memwidget:set_height(10)
    -- memwidget:set_vertical(true)
    -- memwidget:set_background_color("#393939")
    -- memwidget:set_border_color(nil)
    -- memwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#4CB7DB"}, {0.5, "#4CB7DB"},
    --           {1, "#4CB7DB"}}})
    -- vicious.register(memwidget, vicious.widgets.mem, "$1", 1)
    
    -- -----------------------------------------------------------------------------------------
    -- -- Volume
    
    -- -- vltxt = wibox.widget.textbox()
    -- -- vicious.register(vltxt,vicious.widgets.mem,blue .. "VOL: " .. coldef,5)
    
    -- -- vltxt1 = wibox.widget.textbox()
    -- -- vicious.register(vltxt1,vicious.widgets.mem,blue .. " %" .. coldef,5)
    
    -- voltxt = wibox.widget.textbox()
    -- vicious.register(voltxt, vicious.widgets.mem, blue .. "  VOL : " .. coldef, 5)
    
    -- volume = lain.widgets.alsabar({ ticks = true })
    -- volmargin = wibox.layout.margin(volume.bar, 5, 8, 80)
    -- volmargin:set_top(7)
    -- volmargin:set_bottom(7)
    -- volumewidget = wibox.widget.background(volmargin)
    
    -- -----------------------------------------------------------------------------------------
    
    -- -- CPU widget
    -- cpu_widget = wibox.widget.textbox()
    -- -- vicious.register(cpu_widget, vicious.widgets.cpu, blue .. space .. " CPU $1%<span font='Tamsyn 5'> </span>" .. coldef, 3)
    -- vicious.register(cpu_widget, vicious.widgets.cpu, blue .. " CPU : " .. coldef .. white .. "$1" .. coldef .. blue .. " % " .. coldef, 3)
    -- cpuwidget = wibox.widget.background()
    -- cpuwidget:set_widget(cpu_widget)
    -- -- cpuwidget:set_bgimage(beautiful.widget_bg)
    -- cpu_icon = wibox.widget.imagebox()
    -- cpu_icon:set_image(beautiful.cpu)
    
    -- -- Initialize widget
    -- cpuwidget_graph = awful.widget.graph()
    -- --Graph properties
    -- cpuwidget_graph:set_width(50)
    -- cpuwidget_graph:set_background_color("#393939")
    -- cpuwidget_graph:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#4CB7DB"}, {0.5, "#4CB7DB"},
    --           {1, "#4CB7DB" }}})
    -- -- Register widget
    -- vicious.register(cpuwidget_graph, vicious.widgets.cpu, "$1", 1)
    
