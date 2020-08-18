--  _____                            __
-- |     |_.---.-.--.--.-----.--.--.|  |_.-----.
-- |       |  _  |  |  |  _  |  |  ||   _|__ --|
-- |_______|___._|___  |_____|_____||____|_____|
--               |_____|

-- Standard awesome library
local awful = require("awful")

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("lain")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
    awful.layout.suit.max,
    lain.layout.centerwork,
    lain.layout.termfair.center,
    awful.layout.suit.floating,
    lain.layout.cascade.tile,
    awful.layout.suit.spiral.dwindle
    
    --awful.layout.suit.spiral,
    --awful.layout.suit.fair,
    --lain.layout.cascade,
    --awful.layout.suit.tile,
    --awful.layout.suit.corner.sw,
    --lain.layout.termfair,
    --awful.layout.suit.corner.nw,
    --lain.layout.centerwork.horizontal,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.se,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
}

lain.layout.termfair.ncol = 3
lain.layout.termfair.nmaster = 2
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.nmaster = 8

layouts.buttons = awful.util.table.join(
    awful.button({}, 1, function() awful.layout.inc(layouts, 1) end),
awful.button({}, 3, function() awful.layout.inc(layouts, -1) end))

return layouts
