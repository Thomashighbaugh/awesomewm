local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi

local ll =
	awful.widget.layoutlist(
	{
		source = awful.widget.layoutlist.source.default_layouts, -- DOC_HIDE
		spacing = dpi(72),
		base_layout = wibox.widget(
			{
				spacing = dpi(72),
				forced_num_cols = 3,
				layout = wibox.layout.grid.vertical
			}
		),
		widget_template = {
			{
				{
					id = 'icon_role',
					forced_height = dpi(96),
					forced_width = dpi(96),
					widget = wibox.widget.imagebox
				},
				margins = dpi(5),
				widget = wibox.container.margin
			},
			id = 'background_role',
			forced_width = dpi(96),
			forced_height = dpi(96),
			widget = wibox.container.background
		}
	}
)

local layout_popup =
	awful.popup(
	{
		widget = wibox.widget(
			{
				ll,
				margins = dpi(36),
				widget = wibox.container.margin
			}
		),
		border_color = beautiful.layoutlist_border_color,
		border_width = beautiful.layoutlist_border_width,
		placement = awful.placement.centered,
		ontop = true,
		visible = false,
		bg = beautiful.bg_normal
	}
)
