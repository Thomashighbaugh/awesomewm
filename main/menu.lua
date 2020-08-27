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

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

M.awesome = {
    { "hotkeys", function( )
        hotkeys_popup.show_help( nil, awful.screen.focused( ))
    end, "/usr/share/icons/Flatery-Dark/apps/48/accessories-character-map.svg" },
    { "manual", terminal .. " -e man awesome", "/usr/share/icons/Flatery-Dark/apps/48/accessories-notes.svg" },
    { "edit config", editor_cmd .. " " .. awesome.conffile, "/usr/share/icons/Flatery-Dark/apps/48/vim.svg" },
    { "Terminal", terminal, "/usr/share/icons/Flatery-Dark/apps/48/kitty.svg" },
    { "Shutdown/Logout", "oblogout", "/usr/share/icons/Flatery-Dark/actions/24/system-log-out.svg" },
    { "restart", awesome.restart, "/usr/share/icons/Flatery-Dark/actions/24/system-reboot.svg" },
{ "quit", function( ) awesome.quit( ) end, "/usr/share/icons/Flatery-Dark/apps/48/preferences-system-power.svg" }}

M.favorite = {
    { "thunar", "thunar", "/usr/share/icons/Flatery-Dark/apps/48/thunar.svg" },
    { "firefox", "firefox", "/usr/share/icons/Flatery-Dark/apps/48/firefox.svg" },
    { "chromium", "chromium", "/usr/share/icons/Flatery-Dark/apps/48/chromium.svg" },
    { "&thunderbird", "thunderbird", "/usr/share/icons/Flatery-Dark/apps/48/thunderbird.svg" },
    { "gimp", "gimp", "/usr/share/icons/Flatery-Dark/apps/48/gimp.svg" },
{ "inkscape", "inkscape", "/usr/share/icons/Flatery-Dark/apps/48/inkscape.svg" }}

M.network_main = {
    { "Connection Editor", "nm-connection-editor", "/usr/share/icons/Flatery-Dark/apps/48/network-manager.svg" },
{ "Network Manager", "nmtui", "/usr/share/icons/Flatery-Dark/apps/48/network-manager.svg" }}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get( )
    
    -- Main Menu
    local menu_items = {
        { "awesome", M.awesome, beautiful.awesome_subicon },
        { "open terminal", terminal, "/usr/share/icons/Flatery-Dark/apps/48/kitty.svg" },
        { "network", M.network_main, "/usr/share/icons/Flatery-Dark/apps/48/network-manager.svg" },
    { "favorite", M.favorite, beautiful.awesome_subicon }}
    
    return menu_items
    
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({ }, { __call = function( _, ... ) return _M.get( ... ) end })
