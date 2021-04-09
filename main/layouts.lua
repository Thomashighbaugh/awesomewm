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
local bling = require("external.lib.bling")
local icons = require("themes.icons")
local mstab = bling.layout.mstab
local centered = bling.layout.centered
local vertical = bling.layout.vertical
local horizontal = bling.layout.horizontal
local _M = {}

-- ===================================================================
-- Define layouts using general table (value store easily called across the system)
-- ===================================================================

function _M.get()
  -- Table of layouts to cover with awful.layout.inc, order matters.
  awful.layout.layouts = {
    -- awful.layout.suit.tile, -- 2
    -- lain.layout.centerwork, -- 4
    bling.layout.mstab,
    awful.layout.suit.max, -- 1
    bling.layout.centered,
    -- bling.layout.vertical,
    bling.layout.equalarea
    --awful.layout.suit.spiral.dwindle
    --  awful.layout.suit.tile,
    --  lain.layout.cascade, -- 5
    -- lain.layout.termfair, -- 6
    --lain.layout.centerwork.horizontal -- 7
    -- awful.layout.suit.spiral.dwindle -- 8
    -- Left these here as its easier to comment them out than find them later
    -- lain.layout.cascade.tile,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.tile.top,
    --awful.layout.suit.corner.nw
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

return setmetatable(
  {},
  {
    __call = function(_, ...)
      return _M.get(...)
    end
  }
)
