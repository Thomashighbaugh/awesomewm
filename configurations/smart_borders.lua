--[[
Author: Thomas Leon Highbaugh (thighbaugh@zoho.com)
smart_borders.lua
Desc: description
]]
local awful = require("awful")
require("external.lib.smart_borders") {
    show_button_tooltips = true,

    button_positions = {"top"},
    buttons = {"floating", "minimize", "maximize", "close"},

    layout = "fixed",
    align_horizontal = "right",
    button_size = 80,
    border_width = 8,
    color_normal = "#22262d",
    color_focus = "#17191e",
    color_close_normal = {
        type = "linear",
        from = {0, 0},
        to = {40, 0},
        stops = {{0, "#ff3d81"}, {1, "#555e70"}}
    },
    color_close_focus = {
        type = "linear",
        from = {0, 0},
        to = {40, 0},
        stops = {{0, "#ff3d81"}, {1, "#17191d"}}
    },
    color_close_hover = {
        type = "linear",
        from = {0, 0},
        to = {40, 0},
        stops = {{0, "#FF3d81"}, {1, "#ff29a8"}}
    },
    color_floating_normal = {
        type = "linear",
        from = {0, 0},
        to = {40, 0},
        stops = {{0, "#555e70"}, {1, "#8265ff"}}
    },
    color_floating_focus = {
        type = "linear",
        from = {0, 0},
        to = {40, 0},
        stops = {{0, "#8b9cbe"}, {1, "#8265ff"}}
    },
    color_floating_hover = {
        type = "linear",
        from = {0, 0},
        to = {40, 0},
        stops = {{0, "#8b9cbe"}, {1, "#8265ff"}}
    },

    snapping = true,
    snapping_center_mouse = true,

    -- custom control example:
    button_back = function(c)
        -- set client as master
        c:swap(awful.client.getmaster())
    end,

    -- hot_corners
    hot_corners_color = "#Ff3d81",
    hot_corners_width = 10,
    hot_corners_height = 10,
    hot_corners = {
        ["top_left"] = {
            left_click = function()
                -- unfullscreen the focused client with left click
                local c = client.focus
                if c and c.fullscreen then
                    c.fullscreen = false
                end
            end,
            middle_click = function()
                awesome.restart()
            end,
            right_click = function()

            end
        }
    },
}
