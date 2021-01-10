local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")

local bg_normal = beautiful.tabbar_bg_normal or beautiful.bg_normal
local fg_normal = beautiful.tabbar_fg_normal or beautiful.fg_normal
local bg_focus = beautiful.tabbar_bg_focus or beautiful.bg_focus
local fg_focus = beautiful.tabbar_fg_focus or beautiful.fg_focus
local font = beautiful.tabbar_font or beautiful.font
local size = beautiful.tabbar_size or 20
local position = beautiful.tabbar_position or "top"

local function create(c, focused_bool, buttons)
    local bg_temp = bg_normal
    local fg_temp = fg_normal
    if focused_bool then
        bg_temp = bg_focus
        fg_temp = fg_focus
    end
    local wid_temp = wibox.widget({
        {
            {
                awful.widget.clienticon(c),
                left = 0,
                right = 0,
                bottom = 0,
                top = 0,
            widget = wibox.container.margin()},
        widget = wibox.container.place()},
        bg = bg_temp,
    widget = wibox.container.background()})
    return wid_temp
end

local layout = wibox.layout.align.horizontal
if position == "left" or position == "right" then
    layout = wibox.layout.align.vertical
end

return {
    layout = layout,
    create = create,
    position = position,
    size = size,
    bg_normal = bg_normal,
    bg_focus = bg_normal
}

