--  _____                            __
-- |     |_.---.-.--.--.-----.--.--.|  |_
-- |       |  _  |  |  |  _  |  |  ||   _|
-- |_______|___._|___  |_____|_____||____|
--               |_____|

-- Standard awesome library
local awful = require("awful")
local lain = require("lain")
local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
    -- Table of layouts to cover with awful.layout.inc, order matters.
    awful.layout.layouts = {
        awful.layout.suit.spiral, --1
        awful.layout.suit.max, -- 2
        lain.layout.centerwork, --3
        lain.layout.cascade, --4
        lain.layout.termfair, -- 5
        awful.layout.suit.floating, --6
        lain.layout.cascade.tile, --7
        lain.layout.centerwork.horizontal, --8
        awful.layout.suit.spiral.dwindle --9
        --awful.layout.suit.fair,
        
        --awful.layout.suit.tile,
        --awful.layout.suit.corner.sw,
        --   lain.layout.termfair.center,
        --awful.layout.suit.corner.nw,
        
        --awful.layout.suit.tile.top,
        --awful.layout.suit.corner.ne,
        --awful.layout.suit.corner.se,
        -- awful.layout.suit.fair.horizontal,
        --awful.layout.suit.tile.left,
        --awful.layout.suit.tile.bottom,
        --awful.layout.suit.max.fullscreen,
        --awful.layout.suit.magnifier,
    }
    
    return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
    {},
{__call = function(_, ...) return _M.get(...) end})
