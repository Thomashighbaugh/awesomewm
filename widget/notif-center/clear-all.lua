local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local awesomebuttons = require("external.lib.awesome-buttons.awesome-buttons")

local dpi = require("beautiful").xresources.apply_dpi
local clickable_container = require("widget.clickable-container")
local notification_icons = require("theme.icons").widget.notification

-- Delete button imagebox
local delete_imagebox =
  wibox.widget {
  {
    image = notification_icons.clear_all,
    resize = true,
    forced_height = dpi(5),
    forced_width = dpi(5),
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.fixed.horizontal
}

local delete_button =
  awesomebuttons.with_icon {
  icon = "/home/tlh/.config/awesome/theme/icons/feathericons/slash.svg",
  color = beautiful.xcolor9,
  shape = "rounded_rect",
  icon_size = 32
}

delete_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        awesome.emit_signal("notifications::clear")
      end
    )
  )
)

local delete_button_wrapped =
  wibox.widget {
  nil,
  {
    delete_button,
    bg = beautiful.groups_bg,
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background
  },
  nil,
  expand = "none",
  layout = wibox.layout.align.vertical
}

return delete_button_wrapped
