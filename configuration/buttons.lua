-- |   __ \.--.--.|  |_|  |_.-----.-----.-----.
-- |   __ <|  |  ||   _|   _|  _  |     |__ --|
-- |______/|_____||____|____|_____|__|__|_____|
-- ===================================================================
--  External LIbraries
-- ===================================================================
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local _M = {}

-- ===================================================================
--  Bind Buttons to Functions
-- ===================================================================
function _M.get()
	local globalbuttons = gears.table.join(
		awful.button({}, 3, function()
			RC.mainmenu:toggle()
		end),

		-- Side buttons - Minimize and restore minimized client
		awful.button({}, 8, function()
			if client.focus ~= nil then
				client.focus.minimized = true
			end
		end),
		awful.button({}, 9, function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				client.focus = c
			end
		end)
	)

	return globalbuttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...)
	return _M.get(...)
end })
