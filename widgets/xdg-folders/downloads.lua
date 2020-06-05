local wibox = require('wibox')
local awful = require('awful')
local naughty = require('naughty')
local gears = require('gears')

local clickable_container = require('widgets.clickable-container')
local dpi = require('beautiful').xresources.apply_dpi

local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. 'widgets/xdg-folders/icons/'

local dl_widget = wibox.widget {
	{
		image = widget_icon_dir .. 'folder-download' .. '.svg',
		resize = true,
		widget = wibox.widget.imagebox
	},
	layout = wibox.layout.align.horizontal
}

local downloads_button = wibox.widget {
	{
		dl_widget,
		margins = dpi(1),
		widget = wibox.container.margin
	},
	widget = clickable_container
}

downloads_button:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			nil,
			function()
				awful.spawn.with_shell('xdg-open $(xdg-user-dir DOWNLOAD)')
			end
		)
	)
)

awful.tooltip(
	{
		objects = {downloads_button},
		mode = 'outside',
		align = 'right',
		text = 'Downloads',
		margin_leftright = dpi(8),
		margin_topbottom = dpi(8),
		preferred_positions = {'right', 'left', 'top', 'bottom'}
	}
)


return downloads_button
