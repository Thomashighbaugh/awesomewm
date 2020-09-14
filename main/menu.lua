--  _______
-- |   |   |.-----.-----.--.--.
-- |       ||  -__|     |  |  |
-- |__|_|__||_____|__|__|_____|

-- ===================================================================
-- Initialization
-- ===================================================================
-- Standard awesome library
local awful = require( "awful" )
local hotkeys_popup = require( "awful.hotkeys_popup" ).widget
local freedesktop = require( "freedesktop" )
-- Theme handling library
local beautiful = require( "beautiful" ) -- for awesome.icon

local M = { } -- menu
local _M = { } -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv( "EDITOR" ) or "subl3"
local editor_cmd = terminal .. " -e " .. editor

-- ===================================================================
-- SubMenu Item Declaration
-- ===================================================================
M.awesome = {
    { "Hotkeys", function( )
        hotkeys_popup.show_help( nil, awful.screen.focused( ))
    end, "/usr/share/icons/Suru++/apps/48/accessories-character-map.svg" },
    { "Manual", terminal .. " -e man awesome", "/usr/share/icons/Suru++/apps/48/accessories-notes.svg" },
    { "Edit Config", editor_cmd .. " " .. awesome.conffile, "/usr/share/icons/Suru++/apps/48/vim.svg" },
    { "Terminal", terminal, "/usr/share/icons/Suru++/apps/48/kitty.svg" },
    { "Shutdown/Logout", "oblogout", "/usr/share/icons/Suru++/actions/24/system-log-out.svg" },
    { "Restart", awesome.restart, "/usr/share/icons/Suru++/actions/24/system-reboot.svg" },
{ "Quit", function( ) awesome.quit( ) end, "/usr/share/icons/Suru++/apps/48/preferences-system-power.svg" }}

M.favorite = {
    { "Thunar", "thunar", "/usr/share/icons/Suru++/apps/48/thunar.svg" },
    { "Firefox", "firefox", "/usr/share/icons/Suru++/apps/48/firefox-mozilla.svg" },
    { "Chromium", "chromium", "/usr/share/icons/Suru++/apps/48/chromium.svg" },
{ "Thunderbird", "thunderbird", "/usr/share/icons/Suru++/apps/48/thunderbird.svg" }, }

M.network_main = {
    { "Connection Editor", "nm-connection-editor", "/usr/share/icons/Suru++/apps/48/network-manager.svg" },
{ "Network Manager", "nmtui", "/usr/share/icons/Suru++/apps/48/network-manager.svg" }}

M.graphics = {
    { "GIMP", "gimp", "/usr/share/icons/Suru++/apps/48/gimp.svg" },
    { "inkscape", "inkscape", "/usr/share/icons/Suru++/apps/48/inkscape.svg" }
}
M.dev = {
    { "Sublime", "subl3", "/usr/share/icons/Suru++/apps/scalable/sublime-text-alt1.svg" },
    { "Webstorm", "webstorm", "/usr/share/icons/Suru++/apps/scalable/webstorm.svg" }
}
-- ===================================================================
-- Menu Items
-- ===================================================================
function _M.get( )
    
    -- Main Menu
    local menu_items = {
        { "Awesome", M.awesome, beautiful.awesome_subicon },
        { "Open Terminal", terminal, "/usr/share/icons/Suru++/apps/48/kitty.svg" },
        { "Network", M.network_main, "/usr/share/icons/Suru++/apps/48/network-manager.svg" },
        { "Favorite", M.favorite, beautiful.awesome_subicon, "/usr/share/icons/Suru++/apps/48/vim.svg" },
        { "Graphics", M.graphics, beautiful.awesome_subicon, "/usr/share/icons/Suru++/apps/48/gimp.svg" },
        { "Development", M.dev, beautiful.awesome_subicon, "/usr/share/icons/Suru++/apps/48/vim.svg" },
    }
    
    return menu_items
    
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({ }, { __call = function( _, ... ) return _M.get( ... ) end })
