local awful = require("awful")

local dpi = require("beautiful").xresources.apply_dpi
local awesomebuttons = require("external.lib.awesome-buttons.awesome-buttons")
local beautiful = require("beautiful")
local apps = require("configuration.apps")

local search_widget = {}

search_widget.build = function(args)
  local widget =
    awesomebuttons.with_icon {
    icon = "/home/tlh/.config/awesome/theme/icons/feathericons/home.svg",
    color = beautiful.xcolor13,
    shape = "rounded_rect",
    size = 20,
    background = beautiful.xcolor4,
    margins = 0,
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
    margin_leftright = dpi(1),
    margin_topbottom = dpi(1),
    timer_function = function()
      return "Launch App Search"
    end
  }

  return widget
end

return search_widget
