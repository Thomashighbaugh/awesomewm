--  _______ __                     __
-- |     __|__|.-----.-----.---.-.|  |.-----.
-- |__     |  ||  _  |     |  _  ||  ||__ --|
-- |_______|__||___  |__|__|___._||__||_____|
--             |_____|
--##################################################
--############ Thomas Leon Highbaugh ###############
--##################################################
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

-- ##################################################
-- Apply Signals to Window Manager
-- ##################################################

_G.client.connect_signal(
    "manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        if not awesome.startup then
            awful.client.setslave(c)
        end

        if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c, {honor_workarea = true})
        end
    end
)

-- ##################################################
-- Focus follows the mouse
-- ##################################################
_G.client.connect_signal(
    "mouse::enter",
    function(c)
        c:emit_signal("request::activate", "mouse_enter", {raise = false})
    end
)

-- ##################################################
-- Rounded Corners
-- ##################################################
if beautiful.border_radius or beautiful.border_radius ~= 0 then
    _G.client.connect_signal(
        "manage",
        function(c, startup)
            if not c.fullscreen then
                c.shape = function(cr, width, height)
                    gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
                end
            end
        end
    )
end
