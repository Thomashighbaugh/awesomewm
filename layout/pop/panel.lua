-- .-----.-----.-----. .--.--.-----.
-- |  _  |  _  |  _  | |  |  |  _  |
-- |   __|_____|   __| |_____|   __|
-- |__|        |__|          |__|
--                           __
-- .-----.---.-.-----.-----.|  |
-- |  _  |  _  |     |  -__||  |
-- |   __|___._|__|__|_____||__|
-- |__|
-- ========================================================================
local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local helpers = require('configuration.helpers')
local icon_theme = 'sheet'
local icons = require('themes.icons')
local popupLib = require('utils.popupLib')
local cpu_widget = require('external.lib.awesome-wm-widgets.cpu-widget/cpu-widget')
local ram_widget = require('external.lib.awesome-wm-widgets.ram-widget/ram-widget')
local vicious = require('vicious')

icons.init(icon_theme)

local box_radius = beautiful.client_radius
local box_gap = dpi(3)

-- ========================================================================
local function create_boxed_widget(widget_to_be_boxed, width, height, bg_color)
	local box_container = wibox.container.background()
	box_container.bg = bg_color
	box_container.forced_height = height
	box_container.forced_width = width
	box_container.shape = helpers.rrect(beautiful.client_radius)

	local boxed_widget =
		wibox.widget(
		{
			{
				{
					nil,
					{
						nil,
						widget_to_be_boxed,
						layout = wibox.layout.align.vertical,
						expand = 'none'
					},
					layout = wibox.layout.align.horizontal
				},
				widget = box_container
			},
			margins = box_gap,
			color = beautiful.xcolor0,
			widget = wibox.container.margin
		}
	)
	return boxed_widget
end

-- ========================================================================
-- Helper function that changes the appearance of progress bars and their icons
-- Create horizontal rounded bars
local function format_progress_bar(bar, markup)
	local text =
		wibox.widget(
		{
			markup = markup,
			align = 'center',
			valign = 'center',
			font = 'Hack Nerd Font Mono Bold 18',
			widget = wibox.widget.textbox,
			expand = true
		}
	)
	text.forced_height = dpi(36)
	text.forced_width = dpi(36)
	bar.padding = dpi(5)
	text.resize = true
	bar.forced_width = dpi(225)
	bar.shape = gears.shape.rounded_bar
	bar.bar_shape = gears.shape.rounded_bar

	local w =
		wibox.widget(
		{
			nil,
			{text, bar, spacing = dpi(10), layout = wibox.layout.fixed.horizontal},
			expand = true,
			layout = wibox.layout.fixed.horizontal
		}
	)
	return w
end
-- ========================================================================
-- Memory Widget
memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, ' RAM: $1% ', 2)
-- ===================================================================

-- CPU Widget
cpuwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.cpu)
vicious.register(cpuwidget, vicious.widgets.cpu, ' CPU: $1% ', 2)
-- ===================================================================
mybattery = wibox.widget.textbox()
vicious.cache(vicious.widgets.bat)
vicious.register(mybattery, vicious.widgets.bat, 'Batt: $2%', 17, 'BAT0')
-- ========================================================================
--Ram Widget
-- local ram = require("widgets.ram_arc")

local ram_icon = wibox.widget.imagebox(icons.ram)
ram_icon.forced_width = 50
ram_icon.forced_height = 10
local ram_bar = require('widgets.ram_bar')
local ram = format_progress_bar(ram_bar, "<span foreground='" .. beautiful.xcolor6 .. "'><b></b></span>")

-- ========================================================================
--Cpu Widget

-- local cpu = require("widgets.cpu_arc")

local cpu_icon = wibox.widget.imagebox(icons.cpu)
cpu_icon.forced_width = 50
cpu_icon.forced_height = 10
local cpu_bar = require('widgets.cpu_bar')
local cpu = format_progress_bar(cpu_bar, "<span foreground='" .. beautiful.xcolor1 .. "'> <b></b> </span>")

-- ========================================================================

local bat_icon = wibox.widget.imagebox(icons.battery)
bat_icon.forced_width = 50
bat_icon.forced_height = 10
local battery_bar = require('widgets.battery_bar')
local bat = format_progress_bar(battery_bar, "<span foreground='" .. beautiful.xcolor4 .. "'><b></b></span>")

-- ======================================================================== Clock

local fancy_time_widget = wibox.widget.textclock('%H%M')
fancy_time_widget.markup =
	fancy_time_widget.text:sub(1, 2) ..
	"<span foreground='" .. beautiful.xcolor12 .. "'>" .. fancy_time_widget.text:sub(3, 4) .. '</span>'
fancy_time_widget:connect_signal(
	'widget::redraw_needed',
	function()
		fancy_time_widget.markup =
			fancy_time_widget.text:sub(1, 2) ..
			"<span foreground='" .. beautiful.xcolor12 .. "'>" .. fancy_time_widget.text:sub(3, 4) .. '</span>'
	end
)
fancy_time_widget.align = 'center'
fancy_time_widget.valign = 'center'
fancy_time_widget.font = 'Hack Nerd Font Mono Bold 55'

local fancy_time = {fancy_time_widget, layout = wibox.layout.fixed.vertical}

local fancy_date_widget = wibox.widget.textclock('%/%d/%Y')
fancy_date_widget.markup =
	fancy_date_widget.text:sub(1, 10) ..
	"<span foreground='" ..
		beautiful.xcolor12 .. "'>" .. '</span>' .. "<span foreground='" .. beautiful.xcolor6 .. "'>" .. '</span>'
fancy_date_widget:connect_signal(
	'widget::redraw_needed',
	function()
		fancy_date_widget.markup =
			fancy_date_widget.text:sub(1, 3) ..
			"<span foreground='" ..
				beautiful.xcolor6 ..
					"'>" ..
						fancy_date_widget.text:sub(4, 6) ..
							'</span>' .. "<span foreground='" .. beautiful.xcolor6 .. "'>" .. fancy_date_widget.text:sub(7, 10) .. '</span>'
	end
)
fancy_date_widget.align = 'center'
fancy_date_widget.valign = 'center'
fancy_date_widget.font = 'Hack Nerd Font Mono Bold 15'

local fancy_date = {fancy_date_widget, layout = wibox.layout.flex.vertical}

-- ========================================================================

local cpuset =
	wibox.widget(
	{
		cpu_icon,
		cpuwidget,
		expand = true,
		cpu,
		layout = wibox.layout.align.horizontal,
		top = dpi(0),
		left = dpi(20),
		right = dpi(50),
		bottom = dpi(0)
	}
)
-- ========================================================================
local ramset =
	wibox.widget(
	{
		ram_icon,
		memwidget,
		expand = true,
		ram,
		layout = wibox.layout.align.horizontal,
		top = dpi(0),
		left = dpi(20),
		right = dpi(50),
		bottom = dpi(0)
	}
)
-- ========================================================================
local batset = {
	bat_icon,
	mybattery,
	expand = true,
	bat,
	layout = wibox.layout.align.horizontal,
	top = dpi(0),
	left = dpi(20),
	right = dpi(40),
	bottom = dpi(0)
}
-- ========================================================================
local sys =
	wibox.widget(
	{
		cpuset,
		ramset,
		batset,
		layout = wibox.layout.fixed.vertical
	}
)
local sys_box = create_boxed_widget(sys, 700, 159, beautiful.xcolor0 .. '00')
-- ========================================================================
local time =
	wibox.widget(
	{
		{fancy_time, fancy_date, layout = wibox.layout.fixed.vertical},
		top = dpi(10),
		left = dpi(20),
		right = dpi(20),
		bottom = dpi(10),
		widget = wibox.container.margin
	}
)

local time_box = create_boxed_widget(time, 700, 159, beautiful.xcolor0 .. '00')
-- ========================================================================
local panelWidget =
	wibox.widget(
	{
		time_box,
		{sys_box, layout = wibox.layout.align.vertical},
		layout = wibox.layout.align.vertical
	}
)

local width = 700
local margin = 5

local panelPop = popupLib.create(margin, beautiful.wibar_height + margin, nil, width, panelWidget)

panelPop:set_xproperty('WM_NAME', 'panel')

return panelPop

-- ========================================================================
-- EOF
