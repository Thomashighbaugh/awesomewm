-- {{{ Required libraries
local gears = require("gears")
local awful = require("awful")
-- }}}

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
    -- Create a wibox for each screen and add it
    local taglist_buttons = gears.table.join(
        awful.button({}, 1, function(t) t:view_only() end),
        awful.button({modkey}, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({modkey}, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end))
        
        return taglist_buttons
    end
    
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    
    return setmetatable({}, {
        __call = function(_, ...) return _M.get(...) end
    })
    