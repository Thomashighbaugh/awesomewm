local bling = require('external.lib.bling')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')

-- Set Wallpaper

awful.screen.connect_for_each_screen(
	function(s)
		-- Screen padding
		gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. 'images/7.jpg', s, nil)
	end
)
