-- |   |   |.-----.-----.----.
-- |   |   ||__ --|  -__|   _|
-- |_______||_____|_____|__|
--  ___ ___              __         __     __
-- |   |   |.---.-.----.|__|.---.-.|  |--.|  |.-----.-----.
-- |   |   ||  _  |   _||  ||  _  ||  _  ||  ||  -__|__ --|
--  \_____/ |___._|__|  |__||___._||_____||__||_____|_____|
-- ===================================================================
-- Variable Definition
-- ===================================================================
local awful = require("awful")
local home = os.getenv("HOME")
local config_dir = home .. ".config/awesome/external"
local _M = {
    terminal = "kitty",
    launcher = "rofi  -show drun -theme ~/.config/awesome/external/rofi/appmenu/rofi.rasi",
    lock = "xscreensaver",
    screenshot = "$HOME/.config/awesome/configuration/screenshots area",
    filebrowser = "caja",
    browser = "firefox",
    modkey = "Mod4"
}

-- ===================================================================
-- Run commands and create start up function
    -- ===================================================================
    -- List of apps to start once on start-up
    local run_on_start_up = {
        ' picom -b --experimental-backends --dbus --config ' .. config_dir .. '/picom.conf & ',
        -- I like when I press the Windows key, a menu to come up
        ' xcape -e "Super_L=Super_L|Control_L|Escape" & '
    }

    -- Run all the apps listed in run_on_start_up
    function RC.autostart()
        for _, app in ipairs(run_on_start_up) do
            local findme = app
            local firstspace = app:find(" ")
            if firstspace then
                findme = app:sub(0, firstspace - 1)
            end
            awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, app), false)
        end
    end

    return _M
