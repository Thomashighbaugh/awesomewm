 -- _______ __                     __        
-- |     __|__|.-----.-----.---.-.|  |.-----.
-- |__     |  ||  _  |     |  _  ||  ||__ --|
-- |_______|__||___  |__|__|___._||__||_____|
--             |_____|                       

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Custom Local Library: Common Functional Decoration
require("module.titlebar")




screen.connect_signal("request::wallpaper", function(s)

	-- If wallpaper is a function, call it with the screen
	if beautiful.wallpaper then
		if type(beautiful.wallpaper) == "string" then
			if beautiful.wallpaper:sub(1, #"#") == "#" then
					gears.wallpaper.set(beautiful.wallpaper)
			elseif beautiful.wallpaper:sub(1, #"/") == "/" then
					gears.wallpaper.maximized(beautiful.wallpaper, s)
			end
		else
			beautiful.wallpaper(s)
		end
	end

end)

-- Signal function to execute when a new client appears.
client.connect_signal(
	'manage',
	function(c)
		-- Set the windows at the slave,
		-- i.e. put it at the end of others instead of setting it master.
		if not awesome.startup then
			awful.client.setslave(c)
			awful.placement.under_mouse(c)
			awful.placement.no_offscreen(c)


		end

		if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
			-- Prevent clients from being unreachable after screen count changes.
			awful.placement.no_offscreen(c)
		end
		if awesome.startup then 
			awful.placement.under_mouse(c)
		end
	end
)
-- Make rofi able to unminimize minimized clients
client.connect_signal("request::activate", function(c, context, hints)
    if not awesome.startup then
        if c.minimized then
            c.minimized = false
        end
        awful.ewmh.activate(c, context, hints)

    end
end)



-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
	'mouse::enter',
	function(c)
		c:emit_signal('request::activate', 'mouse_enter', {raise = false})
	end
)

client.connect_signal(
	'focus',
	function(c)
		c.border_color = beautiful.border_focus
	end
)

client.connect_signal(
	'unfocus',
	function(c)
		c.border_color = beautiful.border_normal
	end
)

