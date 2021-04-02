local beautiful = require("beautiful")
local awesomebuttons = require("external.lib.awesome-buttons.awesome-buttons")

local endsession_widget = {}

endsession_widget.build = function(args)
  local widget =
    awesomebuttons.with_icon {
    icon = "/home/tlh/.config/awesome/theme/icons/feathericons/power.svg",
    color = beautiful.xcolor9,
    shape = "rounded_rect",
    size = 42,
    onclick = function()
      awesome.emit_signal("module::exit_screen:show")
    end
  }
  return widget
end
return endsession_widget
