--            _ _
--   _____  _(_) |_ ___  ___ _ __ ___  ___ _ __
--  / _ \ \/ / | __/ __|/ __| '__/ _ \/ _ \ '_ \
-- |  __/>  <| | |_\__ \ (__| | |  __/  __/ | | |
--  \___/_/\_\_|\__|___/\___|_|  \___|\___|_| |_|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- local naughty = require("naughty")
local helpers = require("main.helpers")
local pad = helpers.pad
-- ===================================================================
--  Set related variables
-- ===================================================================
-- Appearance
local icon_font = "Font Awesome Regular 64"
local poweroff_text_icon = ""
local reboot_text_icon = ""
local suspend_text_icon = ""
local exit_text_icon = ""
local lock_text_icon = ""
local exitscreen_bg = beautiful.background .. "cc"
local button_bg = beautiful.background .. 'aa'
local button_size = dpi(120)
-- ===================================================================
--  Set up exit screen
-- ===================================================================
-- Commands
local poweroff_command =
    function() awful.spawn.with_shell("systemctl poweroff") end
local reboot_command = function() awful.spawn.with_shell("systemctl reboot") end
local suspend_command = function()
    lock_screen_show()
    awful.spawn.with_shell("systemctl suspend")
end
local exit_command = function() awesome.quit() end
local lock_command = function() awful.spawn.with_shell("xscreensaver") end
-- Helper function that generates the clickable buttons
local create_button = function(symbol, hover_color, text, command)
    local icon = wibox.widget {
        forced_height = button_size,
        forced_width = button_size,
        align = "center",
        valign = "center",
        font = icon_font,
        text = symbol,
        widget = wibox.widget.textbox()
    }

    local button = wibox.widget {
        {nil, icon, expand = "none", layout = wibox.layout.align.horizontal},
        forced_height = button_size,
        forced_width = button_size,
        border_width = dpi(3),
        border_color = beautiful.xcolor7 .. 'aa',
        shape = helpers.rrect(15),
        bg = beautiful.background .. 'aa',
        widget = wibox.container.background,
        color = beautiful.xcolor7 .. 'aa'
    }

    -- Bind left click to run the command
    button:buttons(gears.table.join(
                       awful.button({}, 1, function() command() end)))

    -- Change color on hover
    button:connect_signal("mouse::enter", function()
        icon.markup =
            helpers.colorize_text(icon.text, beautiful.xcolor3 .. 'aa')
        button.border_color = beautiful.xcolor3 .. 'aa'
    end)
    button:connect_signal("mouse::leave", function()
        icon.markup =
            helpers.colorize_text(icon.text, beautiful.xcolor7 .. 'aa')
        button.border_color = beautiful.xcolor7 .. 'aa'
    end)

    -- Use helper function to change the cursor on hover
    helpers.add_hover_cursor(button, "hand1")

    return button
end
-- Create the buttons
local poweroff = create_button(poweroff_text_icon, beautiful.xcolor7 .. 'aa',
                               "Poweroff", poweroff_command)
local reboot = create_button(reboot_text_icon, beautiful.xcolor7 .. 'aa',
                             "Reboot", reboot_command)
local suspend = create_button(suspend_text_icon, beautiful.xcolor7 .. 'aa',
                              "Suspend", suspend_command)
local exit = create_button(exit_text_icon, beautiful.xcolor7 .. 'aa', "Exit",
                           exit_command)
local lock = create_button(lock_text_icon, beautiful.xcolor7 .. 'aa', "Lock",
                           lock_command)
-- Create the exit screen wibox
exit_screen = wibox({visible = false, ontop = true, type = "dock"})
awful.placement.maximize(exit_screen)
exit_screen.bg = beautiful.exit_screen_bg or exitscreen_bg or
                     beautiful.background .. '66'
exit_screen.fg = beautiful.exit_screen_fg or beautiful.wibar_fg or
                     beautiful.foreground .. '66'
local exit_screen_grabber
function exit_screen_hide()
    awful.keygrabber.stop(exit_screen_grabber)
    exit_screen.visible = false
end
function exit_screen_show()
    exit_screen_grabber = awful.keygrabber.run(
                              function(_, key, event)
            -- Ignore case
            key = key:lower()

            if event == "release" then return end

            if key == 's' then
                suspend_command()
                exit_screen_hide()
                -- 'e' for exit
            elseif key == 'e' then
                exit_command()
            elseif key == 'l' then
                exit_screen_hide()
                lock_command()
            elseif key == 'p' then
                poweroff_command()
            elseif key == 'r' then
                reboot_command()
            elseif key == 'escape' or key == 'q' or key == 'x' then
                exit_screen_hide()
            end
        end)
    exit_screen.visible = true
end
-- ===================================================================
--  add controls
-- ===================================================================
exit_screen:buttons(gears.table.join( -- Left click - Hide exit_screen
awful.button({}, 1, function() exit_screen_hide() end),
-- Middle click - Hide exit_screen
awful.button({}, 2, function() exit_screen_hide() end),
-- Right click - Hide exit_screen
awful.button({}, 3, function() exit_screen_hide() end)))

-- Item placement
exit_screen:setup{
    nil,
    {
        nil,
        {
            poweroff,
            reboot,
            suspend,
            exit,
            lock,
            spacing = dpi(75),
            layout = wibox.layout.fixed.horizontal
        },
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    expand = "none",
    layout = wibox.layout.align.vertical
}
