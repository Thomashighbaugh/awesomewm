local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local dpi = beautiful.xresources.apply_dpi

local create_xdg_widgets = function()
	local build_widget = function(widget)
		return wibox.widget {
			{
				widget,
				bg = beautiful.xcolor0,
				shape = function(cr, w, h)
					gears.shape.rounded_rect(cr, w, h, dpi(6))
				end,
				widget = wibox.container.margin
			},
			spacing = dpi(5),
			widget = wibox.container.margin
		}
	end


local home 			= 			build_widget(require('widget.xdg-folders.home')())
local documents 	= 			build_widget(require('widget.xdg-folders.documents')())
local downloads 	= 			build_widget(require('widget.xdg-folders.downloads')())
--local pictures 		= 			build_widget(require('widget.xdg-flders.pictures')())
--local videos 		= 			build_widget(require('widget.xdg-folders.videos')())
--local trash 		=			build_widget(require('widget.xdg-folders.trash')())
	return wibox.widget {
		layout = wibox.layout.align.horizontal,
	  	{
			home,
			documents,
			downloads,
		--	pictures,
		--	videos,
		--	separator,
		--	trash,
		
			layout = wibox.layout.fixed.horizontal
	  	},
	}
end

return create_xdg_widgets
