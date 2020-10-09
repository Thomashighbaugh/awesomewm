--  ______ __ __               __     ______         __   __
-- |      |  |__|.-----.-----.|  |_  |   __ \.--.--.|  |_|  |_.-----.-----.-----.
-- |   ---|  |  ||  -__|     ||   _| |   __ <|  |  ||   _|   _|  _  |     |__ --|
-- |______|__|__||_____|__|__||____| |______/|_____||____|____|_____|__|__|_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- ===================================================================
--  Bind Client Control Functions to Buttons
-- ===================================================================
local _M = {}
local modkey = RC.vars.modkey

-- ===================================================================

function _M.get()
    local clientbuttons = gears.table.join(
                              awful.button({}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end), awful.button({modkey}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end), awful.button({modkey}, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end))

    return clientbuttons
end

-- ===================================================================

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
