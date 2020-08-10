--  ______         __   __                    ______                     __ 
-- |   __ \.-----.|  |_|  |_.-----.--------. |   __ \.---.-.-----.-----.|  |
-- |   __ <|  _  ||   _|   _|  _  |        | |    __/|  _  |     |  -__||  |
-- |______/|_____||____|____|_____|__|__|__| |___|   |___._|__|__|_____||__|
                                                                        

local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local xrdb = xresources.get_current_theme()

local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')

local tag_list = require('widget.taglist')

local bottom_panel = function(s)

	local build_widget = function(widget)
		return wibox.widget {
			{
				widget,
				bg = beautiful.xcolor0,
				shape = function(cr, w, h)
					gears.shape.rounded_rect(cr, w, h, beautiful.groups_radius)
				end,
				widget = wibox.container.background
			},
			widget = wibox.container.margin
		}
	end


  	s.search 				= require('widget.search-apps')()
	s.home 					= build_widget(require('widget.xdg-folders.home')())
	s.documents 			= build_widget(require('widget.xdg-folders.documents')())
	s.downloads 			= build_widget(require('widget.xdg-folders.downloads')())

	local layout_box 		= build_widget(require('widget.layoutbox')(s))
	
	local separator 	=  wibox.widget {
					orientation 	= 'vertical',
					forced_height 	= dpi(1),
					forced_width 	= dpi(1),
					span_ratio 		= 0.55,
					widget 			= wibox.widget.separator
										}
	local bottom_panel_height = dpi(55)
	local bottom_panel_margins = dpi(8)

	
	local panel = awful.popup {
						
								widget = {
										{
											layout = wibox.layout.fixed.horizontal,
											spacing = dpi(8),
											separator,
													s.home, 	
												s.downloads,

											tag_list(s),
											layout_box,
											separator,
										},


										bg = beautiful.background,
										shape = gears.shape.rounded_rect,
										widget = wibox.container.background
			
									},
		
									type = 'normal',
									screen = s,

									ontop = true,
									visible = true,
									height = bottom_panel_height,
									maximum_height = bottom_panel_height,
									placement = awful.placement.bottom,
									shape = gears.shape.rounded_rect,
									bg = beautiful.transparent
								}

	panel:struts
		{
			bottom = bottom_panel_height
		}

	return panel
end


return bottom_panel