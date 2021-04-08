--  _______ __         __           __
-- |     __|  |.-----.|  |--.---.-.|  |
-- |    |  |  ||  _  ||  _  |  _  ||  |
-- |_______|__||_____||_____|___._||__|
--  ______         __   __
-- |   __ \.--.--.|  |_|  |_.-----.-----.-----.
-- |   __ <|  |  ||   _|   _|  _  |     |__ --|
-- |______/|_____||____|____|_____|__|__|_____|
-- ===================================================================
--  Import Libraries and Utilities
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
                              awful.button({}, 3,
                                           function()
            RC.mainmenu:toggle()
        end))

    return globalbuttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
