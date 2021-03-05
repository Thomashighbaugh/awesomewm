--[[ 
	 ______ _____   _______ _______ _______ _______  _________ _______ _______ _______ _______ _______ _______    __              
|      |     |_|_     _|    ___|    |  |_     _|/  /   __ \   |   |_     _|_     _|       |    |  |     __|  |  |.--.--.---.-.
|   ---|       |_|   |_|    ___|       | |   |,' ,'|   __ <   |   | |   |   |   | |   -   |       |__     |__|  ||  |  |  _  |
|______|_______|_______|_______|__|____| |___/__/  |______/_______| |___|   |___| |_______|__|____|_______|__|__||_____|___._|
                                                                                                                              
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 2:49:30 PM
     Last edited:
       3/4/2021, 2:49:46 PM
     Auto updated?
       Yes
    
     Description:
       client buttons specific to interacting with client windows using
       the mouse
--]]



local awful = require('awful')

local modkey = require('configuration.keys.mod').modKey

return awful.util.table.join(
	awful.button(
		{},
		1,
		function(c)
			_G.client.focus = c
			c:raise()
		end
	),
	awful.button({modkey}, 1, awful.mouse.client.move),
	awful.button({modkey}, 3, awful.mouse.client.resize),
	awful.button(
		{modkey},
		4,
		function()
      awful.client.focus.byidx(1)
		end
	),
	awful.button(
		{modkey},
		5,
		function()
      awful.client.focus.byidx(-1)
		end
	)
)
