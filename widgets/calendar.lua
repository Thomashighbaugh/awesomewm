--  ______         __                 __
-- |      |.---.-.|  |.-----.-----.--|  |.---.-.----.
-- |   ---||  _  ||  ||  -__|     |  _  ||  _  |   _|
-- |______||___._||__||_____|__|__|_____||___._|__|

-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- ===================================================================
-- Create Widget
-- ===================================================================

-- Clock / Calendar 12h format
-- Get Time/Date format using `man strftime`
local clock_widget = wibox.widget.textclock("<span font='" .. beautiful.title_font .. "'>%H:%M</span>", 1)

awful.tooltip({
    objects = {clock_widget},
    mode = "outside",
    align = "right",
    timer_function = function()
        return os.date("%A %B %d, %Y")
    end,
    preferred_positions = {"right", "left", "top", "bottom"},
    margin_leftright = dpi(15),
margin_topbottom = dpi(15)})

local cal_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 18)
end

-- Calendar Widget
local month_calendar = awful.widget.calendar_popup.month({
    start_sunday = false,
    spacing = 10,
    font = beautiful.title_font,
    long_weekdays = true,
    margin = 10, -- 10
    style_month = {border_width = 1, padding = 12, shape = cal_shape, padding = 25},
    style_header = {border_width = 1, bg_color = "#13111a"},
    style_weekday = {border_width = 1, bg_color = "#13111a"},
    style_normal = {border_width = 1, bg_color = "#13111a"},
    style_focus = {border_width = 1, bg_color = "#0badff"},
    
})

-- Attach calentar to clock_widget
month_calendar:attach(clock_widget, "tc", {on_pressed = true, on_hover = false})

return clock_widget
