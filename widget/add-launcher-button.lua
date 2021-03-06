--[[ ADD LAUNCHER BUTTON.lua
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 3:53:50 PM
     Last edited:
       3/5/2021, 4:41:17 PM
     Auto updated?
       Yes
    
     Description:
       adds button to lauch program
--]]



local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi
local clickable_image = require('widget.clickable-image')

local apps = require('configuration.apps')
local icons = require('theme.icons')


local add_button_widget = {}

add_button_widget.build = function(args)
  local widget_button = clickable_image(
    args, icons.widget.plus, function()
      awful.spawn(
        awful.screen.focused().selected_tag.default_app, {
          tag = mouse.screen.selected_tag,
          placement = awful.placement.bottom_right
        })

  awful.tooltip {
    objects = {widget_button},
    mode = 'outside',
    delay_show = 1,
    preferred_positions = {'right', 'left', 'top', 'bottom'},
    preferred_alignments = {'middle'},
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8),
    timer_function = function()
      return 'Launch ' .. awful.screen.focused().selected_tag.default_app
    end
  }

  return widget_button
end

return add_button