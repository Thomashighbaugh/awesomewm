-- |   __ \.-----.-----.|  |_  |   __ \.--.--.|  |_|  |_.-----.-----.-----.
-- |      <|  _  |  _  ||   _| |   __ <|  |  ||   _|   _|  _  |     |__ --|
-- |___|__||_____|_____||____| |______/|_____||____|____|_____|__|__|_____|


local gears = require('gears')
local awful = require('awful')

local apps = require('configuration.apps')

root.buttons(
	gears.table.join(
		awful.button(
			{},
			1,
		 	function()
		 		if mymainmenu then
					mymainmenu:hide()
				end
		 	end
		),
		awful.button(
			{},
			3,
			function ()
				if mymainmenu then
					mymainmenu:toggle()
				end 
			end
		),
		awful.button(
			{},
			2,
			function ()
				awful.util.spawn(apps.default.rofiappmenu)
			end
		),
		awful.button(
			{'Control'},
			2,
			function ()
				awesome.emit_signal("module::exit_screen_show")
			end
		),
		awful.button(
			{'Shift'},
			2,
			function ()
				
			end
		)
	
	)
)