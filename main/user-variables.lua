-- {{{ Global Variable Definitions
-- moved here in module as local variable
-- }}}

local home = os.getenv( "HOME" )

local _M = {
    -- terminal
    terminal = "kitty",
    -- Application Menu (with xcape means just hit the windows key and BAM! system menu)
    launcher = 'rofi  -show drun -theme ~/.config/awesome/configuration/rofi/appmenu/rofi.rasi',
    -- Screensaver
    lock = "xscreensaver",
    -- Take screenshots
    screenshot = "maim -s $HOME/Pictures/Screenshots/$(date +%s).png",
    -- File Manager, since XFCE components are used throughout, I am using Thunar for now as a GUI file manager.
    filebrowser = "thunar",
    -- browser of choice
    browser = "firefox",
    -- aka the Windows Key, its not like saying Windows is the same as Voldemort, come on people
    modkey = "Mod4",
}

return _M

