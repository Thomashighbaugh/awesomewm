local beautiful = require("beautiful")
local awesomebuttons = require("external.lib.awesome-buttons.awesome-buttons")
--- This is the returned type - a table with a build function to create the widget.
--- it may contain more widget

local endsession_widget = {}

endsession_widget.build = function(args)
  local widget =
    awesomebuttons.with_icon {
    icon = "/home/tlh/.config/awesome/theme/icons/feathericons/log-out.svg",
    color = beautiful.xcolor8,
    shape = "rounded_rect",
    icon_size = 32,
    onclick = function()
      awesome.emit_signal("module::exit_screen:show")
    end
  }
  return widget
end

return endsession_widget
