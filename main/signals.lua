--  _______ __                     __
-- |     __|__|.-----.-----.---.-.|  |.-----.
-- |__     |  ||  _  |     |  _  ||  ||__ --|
-- |_______|__||___  |__|__|___._||__||_____|
--             |_____|
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Custom Local Library: Common Functional Decoration
require("layout.titlebar")

-- reading
-- https://awesomewm.org/wiki/Signals

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set window shape
    c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 12) end
    if awesome.startup and not c.size_hints.user_position and
        not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    else
        -- set window at slave
        awful.client.setslave(c)
        -- Insure window is on the same screen
        awful.screen.focused(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
-- border indicators of the focused window
client.connect_signal("focus",
                      function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus",
                      function(c) c.border_color = beautiful.border_normal end)
-- }}}
