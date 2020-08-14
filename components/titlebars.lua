
-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require("awful")
local gears = require("gears")

-- ===================================================================
-- Create Widget
-- ===================================================================

-- Create a titlebar for the client.
-- By default, awful.rules will create one, but all it does is to call this
-- function.
local top_titlebar = awful.titlebar(c, {
    height = 20,
    bg_normal = '#13111a',
})
-- buttons for the titlebar
local buttons = gears.table.join(
    awful.button({}, 1, function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end))
    top_titlebar : setup {
        {-- Left
            buttons = buttons,
            awful.titlebar.widget.floatingbutton (c),
            
            layout = wibox.layout.fixed.horizontal
        },
        {-- Middle
            {-- Title
                align = 'center',
                awful.titlebar.widget.iconwidget(c),
                
            widget = awful.titlebar.widget.titlewidget(c)},
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        {-- Right
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton (c),
            awful.titlebar.widget.ontopbutton (c),
            awful.titlebar.widget.closebutton (c),
        layout = wibox.layout.fixed.horizontal()},
        layout = wibox.layout.align.horizontal
    }
    
    -- Add a titlebar if titlebars_enabled is set to true in the rules.
    client.connect_signal(
        "request::titlebars",
        function(c)
            if c.titlebars_enabled == false then
                return
            end
            local title_widget = awful.titlebar.widget.titlewidget(c)
            title_widget.font = beautiful.titlebar_font
            local top_titlebar =
            awful.titlebar(
                c,
                {
                    size = 5,
                    position = "top"
                })
                local bottom_titlebar =
                awful.titlebar(
                    c,
                    {
                        size = 5,
                        position = "bottom"
                    })
                    local left_titlebar =
                    awful.titlebar(
                        c,
                        {
                            size = 5,
                            position = "left"
                        })
                        local right_titlebar =
                        awful.titlebar(
                            c,
                            {
                                size = 5,
                                position = "right"
                            })
                            
                            c:connect_signal(
                                "focus",
                                function(c)
                                    top_titlebar:set_bg(beautiful.titlebar_bg_focus)
                                    bottom_titlebar:set_bg(beautiful.titlebar_bg_focus)
                                    left_titlebar:set_bg(beautiful.titlebar_bg_focus)
                                    right_titlebar:set_bg(beautiful.titlebar_bg_focus)
                                end
                            )
                            c:connect_signal(
                                "unfocus",
                                function(c)
                                    top_titlebar:set_bg(beautiful.titlebar_bg_normal)
                                    bottom_titlebar:set_bg(beautiful.titlebar_bg_normal)
                                    left_titlebar:set_bg(beautiful.titlebar_bg_normal)
                                    right_titlebar:set_bg(beautiful.titlebar_bg_normal)
                                end
                            )
                        end
                    )

                   