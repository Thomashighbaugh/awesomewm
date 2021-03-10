--  ______ __ __               __        ______         __   __               
-- |      |  |__|.-----.-----.|  |_     |   __ \.--.--.|  |_|  |_.-----.-----.
-- |   ---|  |  ||  -__|     ||   _|    |   __ <|  |  ||   _|   _|  _  |     |
-- |______|__|__||_____|__|__||____|    |______/|_____||____|____|_____|__|__|
                                                                           
-- #######################################
-- ######## Thomas Leon Highbaugh ########
-- #######################################

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
	awful.button({modkey}, 3, awful.mouse.client.resize)
)
