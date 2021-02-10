local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local icons = require("icons")
icons.init("sheet")

local active_color = {
	type = "linear",
	from = { 0, 0 },
	to = { 200, 50 }, -- replace with w,h later
	stops = {
		{ 0, beautiful.xcolor1 },
		{ 0, beautiful.xcolor1 },
		{ 0.25, beautiful.xcolor6 },
		{ 0.5, beautiful.xcolor1 },
		{ 0.75, beautiful.xcolor6 },
		{ 0.95, beautiful.xcolor1 },
	},
}

local icon = {
	id = "icon",
	image = icons.cpu,
	resize = true,
	widget = wibox.widget.imagebox,
}

local cpu_arc = wibox.widget({
	icon,
	max_value = 100,
	thickness = 5,
	start_angle = 4.71238898, -- 2pi*3/4
	forced_height = 100,
	rounded_edge = true,
	forced_width = 100,
	bg = beautiful.xbackground,
	paddings = 2,
	colors = { active_color },
	widget = wibox.container.arcchart,
})

awesome.connect_signal("ears::cpu", function(value)
	cpu_arc.value = value
end)

return cpu_arc
