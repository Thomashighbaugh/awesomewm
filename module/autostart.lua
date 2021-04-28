local awful = require("awful")
local filesystem = require("gears.filesystem")
local naughty = require("naughty")
local config_dir = filesystem.get_configuration_dir()

local startup_apps = {
    "picom -b --experimental-backends --config " .. config_dir .. "external/picom/picom.conf",
    -- Keyring
    "eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)",
    "xsetroot -cursor_name left_ptr",
    'xcape -e "Super_L=Super_L|Control_L|Escape"'
}

local spawn_once = function(cmd)
    local findme = cmd
    local firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.easy_async_with_shell(
        string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd),
        function(_, stderr)
            if not stderr or stderr == "" then
                return
            end
            naughty.notification(
                {
                    app_name = "Startup Applications",
                    title = "Error starting application",
                    message = "Error while starting " .. cmd,
                    timeout = 15,
                    icon = config_dir .. "themes/codedark/icons/error.svg"
                }
            )
        end
    )
end

for _, app in ipairs(startup_apps) do
    spawn_once(app)
end
