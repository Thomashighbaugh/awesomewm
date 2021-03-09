--  _____  _______ ______ _______ ______ _______ _______ _______      ______ _____   _______ _______ _______ _______ 
-- |     \|    ___|      |       |   __ \   _   |_     _|    ___|    |      |     |_|_     _|    ___|    |  |_     _|
-- |  --  |    ___|   ---|   -   |      <       | |   | |    ___|    |   ---|       |_|   |_|    ___|       | |   |  
-- |_____/|_______|______|_______|___|__|___|___| |___| |_______|    |______|_______|_______|_______|__|____| |___|  
-- =======================================
-- ======== THOMAS LEON HIGHBAUGH ========
-- =======================================


local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local screen = _G.screen
local client = _G.client
local tag = _G.tag

client.connect_signal(
  'property::fullscreen', function(c)
    if c.fullscreen then
      gears.timer.delayed_call(
        function()
          gears.surface.apply_shape_bounding(c, gears.shape.rounded_rect, 0)
        end)
    else
      gears.timer.delayed_call(
        function()
          gears.surface.apply_shape_bounding(
            c, gears.shape.rounded_rect, beautiful.client_radius)
        end)
    end
  end)

client.connect_signal(
  'property::geometry', function(c)
    gears.timer.delayed_call(
      function()
        gears.surface.apply_shape_bounding(
          c, gears.shape.rounded_rect, beautiful.client_radius)
      end)
  end)
