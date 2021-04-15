local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi   = require("beautiful").xresources.apply_dpi
local beautiful = require("beautiful")
local helpers = require("main.helpers")

---{{{ battery widget, stolen from https://github.com/JavaCafe01/
local battery_bar = wibox.widget {
    max_value = 100,
    value = 70,
    forced_width = dpi(200),
    shape = helpers.rrect(beautiful.border_radius - 3),
    bar_shape = helpers.rrect(beautiful.border_radius - 3),
    color = {
        type = 'linear',
        from = {0, 0},
        to = {55, 20},
        stops = {
            {1 + (80) / 100, beautiful.xcolor6},
            {0.75 - (80 / 100), beautiful.xcolor3},
            {1 - (80) / 100, beautiful.xcolor6}
        }
    },
    background_color = beautiful.xbg,
    border_width = dpi(0),
    border_color = beautiful.border_color,
    widget = wibox.widget.progressbar,
}

local battery_tooltip = awful.tooltip {}
battery_tooltip.shape = helpers.prrect(beautiful.border_radius - 3, false, true, true, false)
battery_tooltip.preferred_alignments = {"middle", "front", "back"}
battery_tooltip.mode = "outside"
battery_tooltip:add_to_object(battery_bar)
battery_tooltip.text = 'Not Updated'

local battery = format_entry({
        battery_bar,
        forced_height = dpi(70),
        direction = "east",
        widget = wibox.container.rotate
                             }, 9)

if beautiful.is_on_pc then
    battery.visible = false
end

awesome.connect_signal("signal::battery", function(value)
                           battery.visible = true
                           battery_bar.value = value
    battery_bar.color = {
        type = 'linear',
        from = {0, 0},
        to = {75 - (100 - value), 20},
        stops = {
            {1 + (value) / 100, beautiful.xcolor10},
            {0.75 - (value / 100), beautiful.xcolor9},
            {1 - (value) / 100, beautiful.xcolor10}
        }
    }

    local bat_icon = ' '

    if value >= 90 and value <= 100 then
        bat_icon = ' '
    elseif value >= 70 and value < 90 then
        bat_icon = ' '
    elseif value >= 60 and value < 70 then
        bat_icon = ' '
    elseif value >= 50 and value < 60 then
        bat_icon = ' '
    elseif value >= 30 and value < 50 then
        bat_icon = ' '
    elseif value >= 15 and value < 30 then
        bat_icon = ' '
    else
        bat_icon = ' '
    end

    battery_tooltip.markup =
        " " .. "<span foreground='" .. beautiful.xcolor12 .. "'>" .. bat_icon ..
            "</span>" .. value .. '% '
end)
