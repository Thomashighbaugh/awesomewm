--  _____                            __
-- |     |_.---.-.--.--.-----.--.--.|  |_.-----.
-- |       |  _  |  |  |  _  |  |  ||   _|__ --|
-- |_______|___._|___  |_____|_____||____|_____|
--               |_____|
--[[
Author: Thomas Leon Highbaugh (thighbaugh@zoho.com)
layouts.lua
Desc: stores the default layouts available and their ordering when changed.
]]


-- #############################################################################
-- Initialization ##############################################################
-- #############################################################################
-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local bling = require("external.lib.bling")
local mstab = bling.layout.mstab
-- Layout Machi
local machi = require("external.lib.layout-machi")
beautiful.layout_machi = machi.get_icon()

-- #############################################################################
-- Layout Definitions ##########################################################
-- #############################################################################

awful.layout.layouts = {
    bling.layout.mstab,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    bling.layout.centered,
    bling.layout.equalarea,
    machi.default_layout
    -- awful.layout.suit.tile,
    -- lain.layout.centerwork
    -- bling.layout.vertical,
    --awful.layout.suit.spiral.dwindle
    --  awful.layout.suit.tile,
    --  lain.layout.cascade,
    -- lain.layout.termfair,
    --lain.layout.centerwork.horizontal
    -- awful.layout.suit.spiral.dwindle
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

return awful.layout.layouts
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
