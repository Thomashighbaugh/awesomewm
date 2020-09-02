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
local awful = require( "awful" )
local home = os.getenv( "HOME" )
local config_dir = home .. '.config/awesome'
local _M = {
    -- terminal
    terminal = "kitty",
    -- Application Menu (with xcape means just hit the windows key and BAM! system menu)
    launcher = 'rofi  -show drun -theme ~/.config/awesome/configuration/rofi/appmenu/rofi.rasi',
    -- Screensaver
    lock = "xscreensaver",
    -- Take screenshots
    screenshot = "$HOME/.config/awesome/configuration/screenshots area",
    -- File Manager, since XFCE components are used throughout, I am using Thunar for now as a GUI file manager.
    filebrowser = "thunar",
    -- browser of choice
    browser = "firefox",
    -- aka the Windows Key, its not like saying Windows is the same as Voldemort, come on people
    modkey = "Mod4",
}

-- List of apps to start once on start-up
local run_on_start_up = {
    'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf & ',
    'xcape -e "Super_L=Super_L|Control_L|Escape" & ',
    'xfsettingsd & ',
    'sh dropbox-dist/dropboxd & ',
    -- the next one will be dependent on your set up, configure with arandr and then save, open that file and copy over the below
    'xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 4480x0 --rotate normal --output DP-0 --off --output DP-1 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-5 --off'
}

-- ===================================================================
-- Functionality
-- ===================================================================

-- Run all the apps listed in run_on_start_up
function RC.autostart( )
    for _, app in ipairs( run_on_start_up ) do
        local findme = app
        local firstspace = app:find( " " )
        if firstspace then
            findme = app:sub( 0, firstspace - 1 )
        end
        awful.spawn.with_shell( string.format( "pgrep -u $USER -x %s > /dev/null || (%s)", findme, app ), false )
    end
end

return _M

