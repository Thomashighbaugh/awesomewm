
--  _______ __ __   __         __
-- |_     _|__|  |_|  |.-----.|  |--.---.-.----.
--   |   | |  |   _|  ||  -__||  _  |  _  |   _|
--   |___| |__|____|__||_____||_____|___._|__|

local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')
local naughty = require('naughty')

local dpi = beautiful.xresources.apply_dpi
awful.titlebar.fallback_name = 'Client'

local titlebar_size = beautiful.titlebar_size

-- Helper
local table_has_value = function(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

-- This table will use the beautiful.background color
local bg_beautiful_group = {
    class = {
        'dolphin',
        'firefox',
        'pavucontrol-qt',
        'ark',
        'polkit-kde-authentication-agent-1',
        'partitionmanager',
        'discord',
        'kdesu'
    },
    instance = {
        'transmission-qt',
    }}
    
    -- This table will use the gtk theme background color
    local bg_gtk_group = {
        role = {
            'GtkFileChooserDialog'
        },
        type = {
            'dialog',
            'modal'
        }}
        
        -- This table will use the xresources background color
        local bg_xresources_group = {
            class = {
                'Xterm',
                'UXTerm'
            }}
            
            -- Begin Titlebar Configuration
            
            local double_click_event_handler = function(double_click_event)
                if double_click_timer then
                    double_click_timer:stop()
                    double_click_timer = nil
                    double_click_event()
                    return
                end
                
                double_click_timer = gears.timer.start_new(
                    0.20,
                    function()
                        double_click_timer = nil
                        return false
                    end
                )
            end
            
            client.connect_signal(
                'request::titlebars',
                function(c)
                    -- Buttons for moving/resizing functionality
                    local buttons = gears.table.join(
                        awful.button(
                            {},
                            1,
                            function()
                                double_click_event_handler(function()
                                    if c.floating then
                                        c.floating = false
                                        return
                                    end
                                    
                                    c.maximized = not c.maximized
                                    c:raise()
                                    return
                                end)
                                
                                c:activate {context = 'titlebar', action = 'mouse_move'}
                            end
                        ),
                        awful.button(
                            {},
                            3,
                            function()
                                c:activate {context = 'titlebar', action = 'mouse_resize'}
                            end
                        ))
                        
                        local decorate_titlebar = function(c, pos, bg, size)
                            
                            c.titlebar_position = pos
                            
                            if pos == 'left' or pos == 'right' then
                                
                                -- Creates left or right titlebars
                                awful.titlebar(c, {position = pos, bg = bg, size = size or titlebar_size}) : setup {
                                    {
                                        {
                                            awful.titlebar.widget.closebutton(c),
                                            awful.titlebar.widget.maximizedbutton(c),
                                            awful.titlebar.widget.ontopbutton (c),
                                            
                                            layout = wibox.layout.fixed.vertical
                                        },
                                        margins = dpi(0),
                                        widget = wibox.container.margin
                                    },
                                    {
                                        buttons = buttons,
                                        layout = wibox.layout.flex.vertical
                                    },
                                    {
                                        awful.titlebar.widget.floatingbutton (c),
                                        margins = dpi(0),
                                        widget = wibox.container.margin
                                    },
                                    layout = wibox.layout.align.vertical

                                }
                                
                            elseif pos == 'top' or pos == 'bottom' then
                                
                                awful.titlebar(c, {position = pos, bg = bg, size = size or titlebar_size}) : setup {
                                    {
                                        awful.titlebar.widget.floatingbutton (c),
                                        margins = dpi(0),
                                        widget = wibox.container.margin
                                    },
                                    
                                    {-- Middle
                                        {-- Title
                                            align = 'center',
                                        widget = awful.titlebar.widget.titlewidget(c)},
                                        buttons = buttons,
                                        layout = wibox.layout.flex.horizontal
                                    },
                                    
                                    {
                                        {
                                            awful.titlebar.widget.ontopbutton (c),
                                            awful.titlebar.widget.stickybutton (c),
                                            awful.titlebar.widget.minimizebutton (c),
                                            awful.titlebar.widget.maximizedbutton(c),
                                            awful.titlebar.widget.closebutton(c),
                                            spacing = dpi(2),
                                            layout = wibox.layout.fixed.horizontal
                                        },
                                        margins = dpi(0),
                                        widget = wibox.container.margin
                                    },
                                    layout = wibox.layout.align.horizontal
                                }

                            else
                                
                                --default
                                awful.titlebar(c, {position = pos, bg = bg, size = size or titlebar_size}) : setup {
                                    {
                                        awful.titlebar.widget.floatingbutton (c),
                                        margins = dpi(0),
                                        widget = wibox.container.margin
                                    },
                                    
                                    {-- Middle
                                        {-- Title
                                            align = 'center',
                                        widget = awful.titlebar.widget.titlewidget(c)},
                                        buttons = buttons,
                                        layout = wibox.layout.flex.horizontal
                                    },
                                    
                                    {
                                        {
                                            awful.titlebar.widget.ontopbutton (c),
                                            awful.titlebar.widget.stickybutton (c),
                                            awful.titlebar.widget.minimizebutton (c),
                                            awful.titlebar.widget.maximizedbutton(c),
                                            awful.titlebar.widget.closebutton(c),
                                            spacing = dpi(2),
                                            layout = wibox.layout.fixed.horizontal
                                        },
                                        margins = dpi(0),
                                        widget = wibox.container.margin
                                    },
                                    layout = wibox.layout.align.horizontal
                                }
                            end
                            
                        end
                        
                        -- custom titlebars
                        
                        if table_has_value(bg_beautiful_group.class, c.class)
                            or table_has_value(bg_beautiful_group.instance, c.instance) then
                            
                            if c.type == 'dialog' or c.type == 'modal' then
                                decorate_titlebar(c, 'left', beautiful.background .. '66', titlebar_size)
                            else
                                decorate_titlebar(c, 'top', beautiful.background .. '66', titlebar_size)
                            end
                            
                        elseif table_has_value(bg_gtk_group.role, c.role)
                            or table_has_value(bg_gtk_group.type, c.type) then
                            
                            -- Let's use the gtk theme's bg_color as titlebar's bg then add some transparency
                            -- Let's set the titlebar's position to top
                            -- Isn't it neat? lol
                            decorate_titlebar(c, 'top', beautiful.gtk.get_theme_variables().bg_color:sub(1, 7) .. '66', titlebar_size)

                        elseif table_has_value(bg_xresources_group.class, c.class) then
                            
                            -- Let's use the xresources' background color as the titlebar color for xterm
                            -- awesome is the shit boi!
                            decorate_titlebar(c, 'top', beautiful.xresources.get_current_theme().background .. '66', titlebar_size)

                        elseif c.class == 'kitty' then
                            
                            decorate_titlebar(c, 'top', beautiful.xcolor0 .. '11', titlebar_size)
                            
                        elseif c.class == 'Nemo' then
                            
                            decorate_titlebar(c, 'left', beautiful.xresources.get_current_theme().background .. '66', titlebar_size)
                            
                        else
                            -- Default titlebar
                            decorate_titlebar(c, 'top', beautiful.background .. '66', titlebar_size)
                            
                        end
                        
                    end
                )
                
                -- signals
                
                -- New client detected
                client.connect_signal(
                    'manage',
                    function(c)
                        
                        if not c.max and not c.hide_titlebars then
                            awful.titlebar.show(c, c.titlebar_position or 'top')
                        else
                            awful.titlebar.show(c, c.titlebar_position or 'top')
                        end
                        
                    end
                )
                
                -- Client mode changed detected
                screen.connect_signal(
                    'arrange',
                    function(s)
                        for _, c in pairs(s.clients) do
                            
                            if (#s.tiled_clients > 1 or c.floating) and c.first_tag.layout.name ~= 'max' then
                                
                                if not c.hide_titlebars then
                                    awful.titlebar.show(c, c.titlebar_position or 'top')
                                else
                                    awful.titlebar.hide(c, c.titlebar_position or 'top')
                                end
                                
                                if c.maximized or not c.round_corners or c.fullscreen then
                                    c.shape = function(cr, width, height)
                                        gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
                                    end
                                else
                                    c.shape = function(cr, width, height)
                                        gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
                                    end
                                end
                                
                            elseif (#s.tiled_clients == 1 or c.first_tag.layout.name == 'max') and not c.fullscreen then
                                
                                awful.titlebar.hide(c, c.titlebar_position or 'top')
                                
                                c.shape = function(cr, width, height)
                                    gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
                                end
                            end
                            
                        end
                    end
                )
                
                -- Maximized client detected
                client.connect_signal(
                    'property::maximized',
                    function(c)
                        c.shape = function(cr, width, height)
                            gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
                        end
                        if not c.maximized then
                            c.shape = function(cr, width, height)
                                gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
                            end
                        end
                    end
                )

               