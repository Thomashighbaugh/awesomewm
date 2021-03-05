--[[ 
  
 _____  _______ ______ _______ ______ _______ _______ _______      ______ _____   _______ _______ _______ _______  __              
|     \|    ___|      |       |   __ \   _   |_     _|    ___|    |      |     |_|_     _|    ___|    |  |_     _||  |.--.--.---.-.
|  --  |    ___|   ---|   -   |      <       | |   | |    ___|    |   ---|       |_|   |_|    ___|       | |   |__|  ||  |  |  _  |
|_____/|_______|______|_______|___|__|___|___| |___| |_______|    |______|_______|_______|_______|__|____| |___|__|__||_____|___._|
                                                                                                                                   
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 2:39:55 PM
     Last edited:
       3/4/2021, 2:40:09 PM
     Auto updated?
       Yes
    
     Description:
       provides some of the styling to the windows, such as the rounded
       shape, is also handling some of the 'rules'
--]]



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
