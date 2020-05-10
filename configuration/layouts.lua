-----------------------------------------------------------------
---------------------     Layouts      --------------------------
-----------------------------------------------------------------

-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  -- Table of layouts to cover with awful.layout.inc, order matters.
  local layouts = {
    awful.layout.suit.tile,               -- 1:
    awful.layout.suit.fair,               -- 2:
    awful.layout.suit.spiral,             -- 3:
    awful.layout.suit.max,                -- 4:

   -- awful.layout.suit.tile.top,           -- 5:

 --   awful.layout.suit.corner.nw,          -- 6:

--    awful.layout.suit.fair.horizontal,    -- 7:
--    awful.layout.suit.tile.left,          -- 8:
--    awful.layout.suit.spiral.dwindle,     -- 9:
--    awful.layout.suit.tile.bottom,        -- 10:

 --   awful.layout.suit.max.fullscreen,     -- 11:
 --   awful.layout.suit.magnifier,          -- 12:

    awful.layout.suit.floating,           -- 13:
 --   awful.layout.suit.corner.ne,          -- 14
--    awful.layout.suit.corner.sw,          -- 15
 --   awful.layout.suit.corner.se,          -- 16
  }

  return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {}, 
  { __call = function(_, ...) return _M.get(...) end }
)
