local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")

local bg_normal = beautiful.bg_normal
local fg_normal = beautiful.fg_normal
local bg_focus = beautiful.bg_focus
local fg_focus = beautiful.fg_focus
local font = beautiful.tabbar_font or beautiful.font
local size = beautiful.tabbar_size or 20
local position = beautiful.tabbar_orientation or "top"

local function create(c, focused_bool, buttons)
    local flexlist = wibox.layout.flex.horizontal()
    local title_temp = c.name or c.class or "-"
    local bg_temp = bg_normal
    local fg_temp = fg_normal
    if focused_bool then
        bg_temp = bg_focus
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
    local wid_temp = wibox.widget({
        text_temp,
        bg = bg_temp,
    widget = wibox.container.background()})
    return wid_temp
end

return {
    layout = wibox.layout.align.horizontal,
    create = create,
    position = "top",
    size = size,
    bg_normal = bg_normal,
    bg_focus = bg_focus
}
