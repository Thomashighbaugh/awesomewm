local awful = require('awful')
local gears = require('gears')
local gfs = gears.filesystem
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local helpers = require('main.helpers')

-- Bling Module
local bling = require('external.lib.bling')

-- Layout Machi
local machi = require('module.layout-machi')
beautiful.layout_machi = machi.get_icon()

-- This is to slave windows' positions in floating layout
-- Not Mine
-- https://github.com/larkery/awesome/blob/master/savefloats.lua
require('layout.window.savefloats')

-- Better mouse resizing on tiled
-- Not mine
-- https://github.com/larkery/awesome/blob/master/better-resize.lua
require('layout.window.better-resize')

require('main.signals')

-- Custom Layouts -------------------------------------------------------------

local mstab = bling.layout.mstab
local centered = bling.layout.centered
local vertical = bling.layout.vertical
local horizontal = bling.layout.horizontal
local equal = bling.layout.equalarea

-- Set the layouts

-- EOF ------------------------------------------------------------------------
