-- wibar.lua
-- Wibar (top bar)
local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local helpers = require('configuration.helpers')
local icon_theme = 'sheet'
local icons = require('icons')

-- Custom Local Library: Common Functional Decoration
local cpu_widget = require('lib.awesome-wm-widgets.cpu-widget/cpu-widget')
local ram_widget = require('lib.awesome-wm-widgets.ram-widget/ram-widget')
local vicious = require('vicious')

local systray_margin = (beautiful.wibar_height - beautiful.systray_icon_size) / 2

-- Helper function that changes the appearance of progress bars and their icons
-- Create horizontal rounded bars
local function format_progress_bar(bar)
	bar.forced_width = dpi(50)
	bar.shape = gears.shape.rounded_bar
	bar.bar_shape = gears.shape.rounded_bar
	bar.background_color = beautiful.xcolor0 .. 'ff'

	return bar
end

-- Awesome Panel -----------------------------------------------------------

local panelPop = require('layout.pop.panel')
local calPop = require('layout.pop.cal')
local awesome_icon =
	wibox.widget(
	{
		{widget = wibox.widget.imagebox, image = icons.awesome, resize = true},
		margins = 2,
		layout = wibox.container.margin
	}
)

-- Notifs Panel ---------------------------------------------------------------
local fancy_time_widget = wibox.widget.textclock()

fancy_time_widget.align = 'center'
fancy_time_widget.valign = 'center'
fancy_time_widget.font = 'FuraCode Nerd Font Mono Bold 15'

local fancy_time = {fancy_time_widget, layout = wibox.layout.flex.vertical}

-- Battery Bar Widget ---------------------------------------------------------

local battery_bar = require('widgets.battery_arc')
-- local battery = format_progress_bar(battery_bar)

mybattery = wibox.widget.textbox()
vicious.register(mybattery, vicious.widgets.bat, 'Battery: $2%', 17, 'BAT0')

local bat_container = {
	left = 0,
	right = 0,
	widget = wibox.container.margin,
	mybattery,
	margins = 2
}
membar = require('widgets.ram_arc')
memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, 'RAM: $1%', 13)

local mem_container = {
	memwidget,
	left = 0,
	right = 0,
	widget = wibox.container.margin,
	margins = dpi(5)
}

cpuwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.cpu)
vicious.register(cpuwidget, vicious.widgets.cpu, 'CPU: $1%', 13)

local cpu_container = {
	cpu_widget,
	left = 0,
	right = 0,
	widget = wibox.container.margin,
	margins = dpi(5)
}

cpubar = require('widgets.cpu_arc')
-- Systray Widget -------------------------------------------------------------

local mysystray = wibox.widget.systray()
mysystray:set_base_size(beautiful.systray_icon_size)

local mysystray_container = {
	mysystray,
	left = dpi(1),
	right = dpi(1),
	screen = 1,
	widget = wibox.container.margin
}

-- Create the Wibar -----------------------------------------------------------

awful.screen.connect_for_each_screen(
	function(s)
		-- Create a promptbox for each screen
		s.mypromptbox = awful.widget.prompt()

		-- ===================================================================

		-- Separator
		local separator =
			wibox.widget(
			{
				orientation = 'vertical',
				forced_height = dpi(1),
				forced_width = dpi(10),
				span_ratio = 0.5,
				color = beautiful.xcolor7 .. 'bb',
				widget = wibox.widget.separator
			}
		)

		-- Create the wibox
		s.mywibox =
			awful.wibar(
			{
				position = 'top',
				screen = s,
				ontop = true,
				bg = beautiful.xbackground
			}
		)
		s.mywibox:set_xproperty('WM_NAME', 'panel')

		-- Remove wibar on full screen
		local function remove_wibar(c)
			if c.fullscreen or c.maximized then
				s.mywibox.visible = false
			else
				s.mywibox.visible = true
			end
		end

		client.connect_signal('property::fullscreen', remove_wibar)

		-- Add widgets to the wibox
		s.mywibox:setup(
			{
				layout = wibox.layout.align.horizontal,
				expand = 'true',
				{
					layout = wibox.layout.fixed.horizontal,
					{
						{
							battery_bar,
							shape = helpers.rrect(beautiful.border_radius),
							border_width = beautiful.widget_border_width,
							border_color = beautiful.widget_border_color,
							widget = wibox.container.background
						},
						top = 0,
						right = 0,
						left = 0,
						widget = wibox.container.margin
					},
					--   s.mypromptbox
					separator
				},
				{
					{
						{
							cpubar,
							shape = helpers.rrect(beautiful.border_radius),
							border_width = beautiful.widget_border_width,
							border_color = beautiful.widget_border_color,
							widget = wibox.container.background
						},
						widget = wibox.container.margin,
						separator
					},
					membar,
					separator,
					top = 0,
					-- without this the bar is wonky and pushes widgets off screen or is always too short.
					layout = wibox.layout.fixed.horizontal,
					widget = wibox.container.margin
				},
				{
					helpers.horizontal_pad(0),
					{
						{
							{
								mysystray_container,
								top = dpi(6),
								bottom = dpi(6),
								layout = wibox.container.margin
							},
							shape = helpers.rrect(beautiful.border_radius),
							bg = beautiful.xbackground,
							border_width = beautiful.widget_border_width,
							border_color = beautiful.widget_border_color,
							widget = wibox.container.background
						},
						top = 0,
						right = 5,
						left = 5,
						widget = wibox.container.margin
					},
					helpers.horizontal_pad(1),
					{
						{
							{
								fancy_time,
								margins = dpi(0),
								widget = wibox.container.margin
							},
							shape = helpers.rrect(beautiful.border_radius),
							bg = beautiful.xbackground,
							border_width = beautiful.widget_border_width,
							border_color = beautiful.widget_border_color,
							widget = wibox.container.background
						},
						top = 0,
						right = 2,
						left = 2,
						widget = wibox.container.margin
					},
					layout = wibox.layout.fixed.horizontal
				}
			}
		)
	end
)

-- EOF ------------------------------------------------------------------------
