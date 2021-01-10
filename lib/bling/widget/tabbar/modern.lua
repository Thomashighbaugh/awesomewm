--  _______         __     __
-- |_     _|.---.-.|  |--.|  |--.---.-.----.
--   |   |  |  _  ||  _  ||  _  |  _  |   _|
--   |___|  |___._||_____||_____|___._|__|

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require(tostring(...):match(".*bling") .. ".module.helpers")

local bg_normal = beautiful.tabbar_bg_normal or beautiful.bg_normal
local fg_normal = beautiful.tabbar_fg_normal or beautiful.fg_normal
local bg_focus = beautiful.tabbar_bg_focus or beautiful.bg_focus
local fg_focus = beautiful.tabbar_fg_focus or beautiful.fg_focus
local font = beautiful.tabbar_font or beautiful.font
local size = beautiful.tabbar_size or dpi(40)
local border_radius =
beautiful.mstab_border_radius or beautiful.border_radius or 16
local position = beautiful.tabbar_orientation or "top"
local close_color = beautiful.tabbar_color_close or beautiful.xcolor1 or
"#f9929b"
local min_color = beautiful.xcolor0
local float_color = beautiful.tabbar_color_float or beautiful.xcolor5 or
"#ccaced"

-- Helper to create buttons
local function create_title_button(c, xcolor0, color_unfocus)
    local tb_color = wibox.widget {
        wibox.widget.textbox(),
        forced_width = dpi(8),
        forced_height = dpi(8),
        bg = beautiful.xcolor0,
        shape = gears.shape.circle,
        widget = wibox.container.background
    }
    
    local tb = wibox.widget {
        tb_color,
        width = dpi(25),
        height = dpi(25),
        strategy = "min",
        layout = wibox.layout.constraint
    }
    
    local function update()
        if client.focus == c then
            tb_color.bg = beautiful.xbackground
        else
            tb_color.bg = beautiful.xbackground
        end
    end
    update()
    c:connect_signal("focus", update)
    c:connect_signal("unfocus", update)
    
    tb:connect_signal("mouse::enter",
    function() tb_color.bg = tbcolor.bg end)
    
    tb:connect_signal("mouse::leave", function() tb_color.bg = tbcolor.bg end)
    
    tb.visible = true
    return tb
end

local function create(c, focused_bool, buttons)
    -- local flexlist = wibox.layout.flex.horizontal()
    local title_temp = c.name or c.class or "-"
    local bg_temp = bg_normal
    local fg_temp = fg_normal
    if focused_bool then
        bg_temp = bg_focus .. 'dd'
        fg_temp = fg_focus
    end
    local text_temp = wibox.widget.textbox()
    text_temp.align = "center"
    text_temp.valign = "center"
    text_temp.font = font
    text_temp.markup = "<span foreground='" .. fg_temp .. "'>" .. title_temp ..
    "</span>"
    c:connect_signal("property::name", function(_)
        local title_temp = c.name or c.class or "-"
        text_temp.markup =
        "<span foreground='" .. fg_temp .. "'>" .. title_temp .. "</span>"
    end)
    
    local tab_content = wibox.widget {
        {
            awful.widget.clienticon(c),
            top = dpi(0),
            left = dpi(5),
            bottom = dpi(0),
            widget = wibox.container.margin
        },
        text_temp,
        nill,
        expand = "none",
        layout = wibox.layout.align.horizontal
    }
    
    if focused_bool then
        tab_content = wibox.widget {
            {
                awful.widget.clienticon(c),
                top = dpi(0),
                left = dpi(5),
                bottom = dpi(0),
                widget = wibox.container.margin
            },
            text_temp,
            {
                
                right = dpi(5),
                bottom = dpi(5),
                widget = wibox.container.margin
            },
            expand = "none",
            layout = wibox.layout.align.horizontal
        }
    end
    
    local wid_temp = wibox.widget({
        {
            {
                {
                    wibox.widget.textbox(),
                    bg = bg_normal,
                    shape = helpers.prrect(border_radius, false, false, true,
                    false),
                    widget = wibox.container.background
                },
                bg = bg_temp,
                shape = gears.rectangle,
                widget = wibox.container.background
            },
            width = border_radius + (border_radius / 2),
            height = size,
            strategy = "exact",
            layout = wibox.layout.constraint
        },
        {
            {
                tab_content,
                bg = bg_temp,
                shape = helpers.prrect(border_radius, true, true, false, false),
                widget = wibox.container.background
            },
            top = dpi(8),
            widget = wibox.container.margin
        },
        {
            {
                {
                    wibox.widget.textbox(),
                    bg = bg_normal,
                    shape = helpers.prrect(border_radius, false, false, false,
                    true),
                    widget = wibox.container.background
                },
                bg = bg_temp,
                shape = gears.rectangle,
                widget = wibox.container.background
            },
            width = border_radius + (border_radius / 2),
            height = size,
            strategy = "exact",
            layout = wibox.layout.constraint
        },
        
        layout = wibox.layout.align.horizontal
    })
    return wid_temp
end

return {
    layout = wibox.layout.flex.horizontal,
    create = create,
    position = "top",
    size = size,
    bg_normal = bg_normal,
    bg_focus = bg_focus
}
