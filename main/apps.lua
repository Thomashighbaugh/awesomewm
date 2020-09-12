--  _______               __ __              __   __
-- |   _   |.-----.-----.|  |__|.----.---.-.|  |_|__|.-----.-----.-----.
-- |       ||  _  |  _  ||  |  ||  __|  _  ||   _|  ||  _  |     |__ --|
-- |___|___||   __|   __||__|__||____|___._||____|__||_____|__|__|_____|
--          |__|  |__|

-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require( "awful" )
local filesystem = require( "gears.filesystem" )

local config_dir = filesystem.get_configuration_dir( )

-- define module table
local apps = { }

-- ===================================================================
--
-- ===================================================================

-- define default apps
apps.default = {
    terminal = "kitty",
    launcher = 'rofi  -show drun -theme ~/.config/awesome/configuration/rofi/appmenu/rofi.rasi',
    lock = "xlock",
    screenshot = "$HOME/.config/awesome/configuration/screenshots",
    filebrowser = "thunar",
}

-- List of apps to start once on start-up
local run_on_start_up = {
    'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf & ',
    'xcape -e "Super_L=Super_L|Control_L|Escape" & ',
    'xfsettingsd & ',
    'sh dropbox-dist/dropboxd & ',
    -- the next one will be dependent on your set up, configure with arandr and then save, open that file and copy over the below
    'xrandr --output DVI-D-1 --off --output DP-1 --primary --mode 2560x1440 --pos 3840x0 --rotate normal --output DP-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --off --output DP-3 --mode 1920x1080 --pos 0x0 --rotate normal'
}

-- ===================================================================
-- Functionality
-- ===================================================================

-- Run all the apps listed in run_on_start_up
function apps.autostart( )
    for _, app in ipairs( run_on_start_up ) do
        local findme = app
        local firstspace = app:find( " " )
        if firstspace then
            findme = app:sub( 0, firstspace - 1 )
        end
        awful.spawn.with_shell( string.format( "pgrep -u $USER -x %s > /dev/null || (%s)", findme, app ), false )
    end
end

return apps
