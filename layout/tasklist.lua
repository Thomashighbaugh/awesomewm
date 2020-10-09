--  _______               __     _____   __         __
-- |_     _|.---.-.-----.|  |--.|     |_|__|.-----.|  |_
--   |   |  |  _  |__ --||    < |       |  ||__ --||   _|
--   |___|  |___._|_____||__|__||_______|__||_____||____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Required libraries
local gears = require("gears")
local awful = require("awful")

-- Global Namespace
local _M = {}

-- ===================================================================
--  Tasklist Buttons
-- ===================================================================
function _M.get()
    local tasklist_buttons = gears.table.join(
                                 awful.button({}, 1, function(c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal("request::activate", "tasklist", {raise = true})
            end
        end), awful.button({}, 3, function()
            awful.menu.client_list({theme = {maximum_width = 150}})
        end))

    return tasklist_buttons
end

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})

