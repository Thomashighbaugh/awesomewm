local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi

local clickable_container = require('widgets.clickable-container')
local task_list = require('widgets.tasklist')



local TopPanel = function(s)

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(28),
		width = s.geometry.width,
		x = s.geometry.x,
		y = s.geometry.y,
		stretch = false,

	}
	

	panel:struts
	{
		top = dpi(28)
	}


	panel:connect_signal(
		'mouse::enter',
		function() 
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end

	)


	s.add_button = wibox.widget {
		{
			{
				{
					{
						image = icons.plus,
						resize = true,
						widget = wibox.widget.imagebox
					},
					margins = dpi(4),
					widget = wibox.container.margin
				},
				widget = clickable_container
			},
			bg = beautiful.transparent,
			shape = gears.shape.circle,
			widget = wibox.container.background
		},
		margins = dpi(4),
		widget = wibox.container.margin
	}

	s.add_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(
						awful.screen.focused().selected_tag.default_app,
						{
							tag = mouse.screen.selected_tag,
							placement = awful.placement.bottom_right
						}
					)
				end
			)
		)
	)

	s.screen_rec 	= require('widgets.screen-recorder')()
	s.globalsearch  = require('widgets.globalsearch')()
	s.end_session	= require('widgets.end-session')()


	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = "none",
		{
			layout = wibox.layout.fixed.horizontal,
			task_list(s),
			s.add_button
		}, 
		-- s.clock_widget,
		s.float_panel ,
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(5),
			s.screen_rec,
			s.globalsearch,
			s.end_session
		}
	}

	return panel
end


return TopPanel
