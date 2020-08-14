--       █████╗ ██████╗ ██████╗ ███████╗
--      ██╔══██╗██╔══██╗██╔══██╗██╔════╝
--      ███████║██████╔╝██████╔╝███████╗
--      ██╔══██║██╔═══╝ ██╔═══╝ ╚════██║
--      ██║  ██║██║     ██║     ███████║
--      ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require("awful")
local filesystem = require("gears.filesystem")

local config_dir = filesystem.get_configuration_dir()

-- define module table
local apps = {}

-- ===================================================================
-- App Declarations
-- ===================================================================

-- define default apps
apps.default = {
    terminal = "kitty",
    launcher = 'rofi  -show drun -theme ' .. config_dir .. '/configuration/rofi/appmenu/rofi.rasi',
    lock = "xlock",
    screenshot = "maim -s $HOME/Pictures/Screenshots/$(date +%s).png",
    filebrowser = "thunar"
}

-- List of apps to start once on start-up
local run_on_start_up = {
    'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf',
    'xcape -e "Super_L=Super_L|Control_L|Escape"',
    
    "unclutter"
}

-- ===================================================================
-- Functionality
-- ===================================================================

-- Run all the apps listed in run_on_start_up
function apps.autostart()
    for _, app in ipairs(run_on_start_up) do
        local findme = app
        local firstspace = app:find(" ")
        if firstspace then
            findme = app:sub(0, firstspace - 1)
        end
        awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, app), false)
    end
end

return apps
