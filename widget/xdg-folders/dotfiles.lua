local wibox = require('wibox')
local awful = require('awful')
local naughty = require('naughty')
local gears = require('gears')

local clickable_container = require('widget.clickable-container')
local dpi = require('beautiful').xresources.apply_dpi

local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. 'widget/xdg-folders/icons/'

local dotfiles_widget =	wibox.widget {
	{
		image = widget_icon_dir .. 'folder-videos.svg',
		resize = true,
		widget = wibox.widget.imagebox,
	},
	layout = wibox.layout.align.horizontal
}

local dotfiles_button = wibox.widget {
	{
		dotfiles_widget,
		margins = dpi(10),
		widget = wibox.container.margin
	},
	widget = clickable_container
}
dotfiles_button:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			nil,
			function()
				awful.spawn.with_shell('xdg-open /home/tlh/dotfiles')
			end
		)
	)
)

awful.tooltip(
	{
		objects = {dotfiles_button},
		mode = 'outside',
		align = 'right',
		text = 'dotfiles',
		margin_leftright = dpi(8),
		margin_topbottom = dpi(8),    
		preferred_positions = {'right', 'left', 'top', 'bottom'}
	}
)


return dotfiles_button
