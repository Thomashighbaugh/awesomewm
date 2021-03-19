
local awesomebuttons = require("external.lib.awesome-buttons.awesome-buttons")
local beautiful = require("beautiful")
local notification_toggler_widget = {}
notification_toggler_widget.build = function(args)
  local widget =
    awesomebuttons.with_icon {
    icon = "/home/tlh/.config/awesome/theme/icons/feathericons/inbox.svg",
    color = beautiful.xcolor8,
    shape = "rounded_rect",
    icon_size = 18,
    onclick = function()
      args.screen:emit_signal("sidebar::show_mode", "notif")
      awesome.emit_signal("widget::notif_osd:show", true)
    end
  }

  return widget
end

return notification_toggler_widget
