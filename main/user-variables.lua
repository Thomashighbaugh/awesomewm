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
local config_dir = home .. '.config/awesome/external'
local _M = {
    -- terminal
    terminal = "kitty",
    -- Application Menu (with xcape means just hit the windows key and BAM! system menu)
    launcher = 'rofi  -show drun -theme ~/.config/awesome/external/rofi/appmenu/rofi.rasi',
    -- Screensaver, I prefer using 'Unknown Pleasures' which emulates that Joy Division album cover hipsters love to have on t shirts
    lock = "xscreensaver",
    -- Take screenshots using script stored within this repo, for simplicity's sake 
    screenshot = "$HOME/.config/awesome/configuration/screenshots area",
    -- File Manager, since XFCE components are used throughout, I am using Thunar for now as a GUI file manager.
    filebrowser = "thunar",
    -- browser of choice
    browser = "firefox",
    -- aka the [Voldemort/Windows] Key, Apple hardware users may need to adjust
    modkey = "Mod4",
}

-- ===================================================================
-- Run commands and create start up function
-- ===================================================================
-- List of apps to start once on start-up
local run_on_start_up = {
    ' picom -b --experimental-backends --dbus --config ' .. config_dir ..
        '/picom.conf & ',
        -- I like when I press the Windows key, a menu to come up
    ' xcape -e "Super_L=Super_L|Control_L|Escape" & ', 
   
    
    
     
}

-- Run all the apps listed in run_on_start_up
function RC.autostart()
    for _, app in ipairs(run_on_start_up) do
        local findme = app
        local firstspace = app:find(" ")
        if firstspace then findme = app:sub(0, firstspace - 1) end
        awful.spawn.with_shell(string.format(
                                   "pgrep -u $USER -x %s > /dev/null || (%s)",
                                   findme, app), false)
    end
end

return _M

