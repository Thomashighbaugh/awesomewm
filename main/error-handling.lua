--  _______                         _______                 __ __ __
-- |    ___|.----.----.-----.----. |   |   |.---.-.-----.--|  |  |__|.-----.-----.
-- |    ___||   _|   _|  _  |   _| |       ||  _  |     |  _  |  |  ||     |  _  |
-- |_______||__| |__| |_____|__|   |___|___||___._|__|__|_____|__|__||__|__|___  |
--                                                                         |_____|
-- ===================================================================
-- Initialization
-- ===================================================================
local naughty = require("naughty")

-- ===================================================================
-- Display Notifications Upon Errors
-- ===================================================================

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "During Startup, Errors Happened",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Critical Errors Have Occurred!",
            text = tostring(err)
        })
        in_error = false
    end)
end
