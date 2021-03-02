local awful = require('awful')
local beautiful = require('beautiful')
local apps = require('configuration.apps')
local bling = require('external.lib.bling')

local icons = require('theme.icons')
local mstab = bling.layout.mstab
local centered = bling.layout.centered
local vertical = bling.layout.vertical
local horizontal = bling.layout.horizontal

tag.connect_signal(
	'request::default_layouts',
	function()
		awful.layout.append_default_layouts(
			{
				mstab,
				centered,
				vertical,
				horizontal,
				--	awful.layout.suit.tile,
				-- awful.layout.suit.tile.left,
				-- awful.layout.suit.tile.bottom,
				-- awful.layout.suit.tile.top,
				-- awful.layout.suit.fair,
				awful.layout.suit.fair.horizontal,
				awful.layout.suit.spiral.dwindle,
				awful.layout.suit.max,
				awful.layout.suit.floating
				-- awful.layout.suit.max.fullscreen,
				--awful.layout.suit.magnifier,
				----awful.layout.suit.corner.nw,
				-- awful.layout.suit.corner.ne,
				-- awful.layout.suit.corner.sw,
				-- awful.layout.suit.corner.se,
				-- awful.layout.suit.spiral.dwindle,
				-- awful.layout.suit.tile,
				-- awful.layout.suit.max
			}
		)
	end
)

screen.connect_signal(
	'request::desktop_decoration',
	function(s)
		local fullscreen = awful.layout.suit.max
		local std_tiled = awful.layout.suit.tile
		local floating = awful.layout.suit.floating

		for i, tag in pairs(tags) do
			awful.tag.add(
				i,
				{
					gap_single_client = true,
					gap = beautiful.useless_gap,
					screen = s
				}
			)
		end
	end
)

tag.connect_signal(
	'property::layout',
	function(t)
		local currentLayout = awful.tag.getproperty(t, 'layout')
		-- if (currentLayout == awful.layout.suit.max) then
		-- 	t.gap = 0
		-- else
		t.gap = beautiful.useless_gap
		-- end
	end
)
awful.screen.connect_for_each_screen(
	function(s)
		-- Screen padding
		screen[s].padding = {left = 1, right = 1, top = 5, bottom = 5}
		-- Each screen has its own tag table.
		awful.tag({'a', 'w', 'e', 's', 'o', 'm', 'e', 'w', 'm'}, s, awful.layout.layouts[i])
	end
)
