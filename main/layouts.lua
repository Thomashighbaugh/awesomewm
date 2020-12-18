--  _____                            __
-- |     |_.---.-.--.--.-----.--.--.|  |_.-----.
-- |       |  _  |  |  |  _  |  |  ||   _|__ --|
-- |_______|___._|___  |_____|_____||____|_____|
--               |_____|
-- ===================================================================
-- Initialization
-- ===================================================================
-- Standard awesome library
local awful = require("awful")
local lain = require("lain")
local _M = {}

-- ===================================================================
-- Define layouts using general table (value store easily called across the system)
-- ===================================================================

function _M.get()
    -- Table of layouts to cover with awful.layout.inc, order matters.
    awful.layout.layouts = {
        awful.layout.suit.max, -- 1
        awful.layout.suit.tile, -- 2
        awful.layout.suit.spiral, -- 3
        -- lain.layout.centerwork, -- 4
      --  lain.layout.cascade, -- 5
        lain.layout.termfair, -- 6
      --  lain.layout.centerwork.horizontal, -- 7
       -- awful.layout.suit.spiral.dwindle -- 8
        -- Left these here as its easier to comment them out than find them later
        -- lain.layout.cascade.tile,
        -- awful.layout.suit.tile.bottom,
        -- awful.layout.suit.corner.sw,
        -- awful.layout.suit.tile.top,
         awful.layout.suit.corner.nw,
        -- awful.layout.suit.floating,
        -- awful.layout.suit.tile.left,
        -- awful.layout.suit.corner.ne,
        -- awful.layout.suit.corner.se,
        -- lain.layout.termfair.center,
        -- awful.layout.suit.fair,
        -- awful.layout.suit.fair.horizontal,
        -- awful.layout.suit.max.fullscreen,
        -- awful.layout.suit.magnifier,
    }

    return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
