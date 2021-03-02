local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local helpers = require('configuration.helpers')
local bling = require('external.lib.bling')
client.connect_signal(
	'manage',
	function(c)
		c.shape = helpers.rrect(8)
	end
)
-- Custom Layouts -------------------------------------------------------------
local mstab = bling.layout.mstab
local centered = bling.layout.centered
local vertical = bling.layout.vertical
local horizontal = bling.layout.horizontal
-- Set the layouts
tag.connect_signal(
	'request::default_layouts',
	function()
		awful.layout.append_default_layouts(
			{
				mstab,
				centered,
				vertical,
				horizontal,
				awful.layout.suit.spiral.dwindle,
				awful.layout.suit.corner.nw
			}
		)
	end
)
-- Layout List Widget ---------------------------------------------------------
local ll =
	awful.widget.layoutlist(
	{
		source = awful.widget.layoutlist.source.default_layouts,
		spacing = dpi(120),
		base_layout = wibox.widget(
			{
				spacing = dpi(120),
				forced_num_cols = 3,
				layout = wibox.layout.grid.vertical
			}
		),
		widget_template = {
			{
				{
					id = 'icon_role',
					forced_height = dpi(120),
					forced_width = dpi(120),
					widget = wibox.widget.imagebox
				},
				margins = dpi(6),
				widget = wibox.container.margin
			},
			id = 'background_role',
			forced_width = dpi(120),
			forced_height = dpi(120),
			widget = wibox.container.background
		}
	}
)
-- Popup
local layout_popup =
	awful.popup(
	{
		widget = wibox.widget(
			{
				ll,
				margins = dpi(15),
				widget = wibox.container.margin
			}
		),
		border_color = beautiful.layoutlist_border_color,
		border_width = beautiful.layoutlist_border_width,
		placement = awful.placement.centered,
		ontop = true,
		visible = false,
		bg = beautiful.xcolor0 .. 'dd'
	}
)
-- Key Bindings for Widget ----------------------------------------------------

function gears.table.iterate_value(t, value, step_size, filter, start_at)
	local k = gears.table.hasitem(t, value, true, start_at)
	if not k then
		return
	end
	step_size = step_size or 1
	local new_key = gears.math.cycle(#t, k + step_size)
	if filter and not filter(t[new_key]) then
		for i = 1, #t do
			local k2 = gears.math.cycle(#t, new_key + i)
			if filter(t[k2]) then
				return t[k2], k2
			end
		end
		return
	end
	return t[new_key], new_key
end

awful.keygrabber(
	{
		start_callback = function()
			layout_popup.visible = true
		end,
		stop_callback = function()
			layout_popup.visible = false
		end,
		export_keybindings = true,
		stop_event = 'release',
		stop_key = {'Escape', 'Super_L', 'Super_R', 'Mod4'},
		keybindings = {
			{
				{modkey, 'Shift'},
				' ',
				function()
					awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, -1), nil)
				end
			},
			{
				{modkey},
				' ',
				function()
					awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, 1), nil)
				end
			}
		}
	}
)
-- EOF ------------------------------------------------------------------------
