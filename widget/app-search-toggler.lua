local awful = require("awful")

local dpi = require("beautiful").xresources.apply_dpi
local awesomebuttons = require("external.lib.awesome-buttons.awesome-buttons")
local beautiful = require("beautiful")
local apps = require("configuration.apps")

--- This is the returned type - a table with a build function to create the widget.
--- it may contain more widget

local search_widget = {}

search_widget.build = function(args)
  local widget =
    awesomebuttons.with_icon {
    icon = "/home/tlh/.config/awesome/theme/icons/feathericons/home.svg",
    color = beautiful.xcolor13,
    shape = "rounded_rect",
    icon_size = 28,
    background = beautiful.xcolor4,
    margins = 8,
    onclick = function()
      awful.spawn(apps.default.rofiappmenu)
    end
  }

  awful.tooltip {
    objects = {widget},
    mode = "outside",
    delay_show = 1,
    preferred_positions = {"right", "left", "top", "bottom"},
    preferred_alignments = {"middle"},
    margin_leftright = dpi(2),
    margin_topbottom = dpi(2),
    timer_function = function()
      return "Launch App Search"
    end
  }

  return widget
end

return search_widget
