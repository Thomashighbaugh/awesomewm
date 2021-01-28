local naughty = require("naughty")
local gears = require("gears")
local awful = require("awful")

awesome.register_xproperty("WM_NAME", "string")
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "OMG, there were errors during startup!",
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
            title = "Danger WIll Robinson, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
