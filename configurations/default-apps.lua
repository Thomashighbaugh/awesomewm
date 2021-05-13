--  _____         ___               __ __       
-- |     \.-----.'  _|.---.-.--.--.|  |  |_     
-- |  --  |  -__|   _||  _  |  |  ||  |   _|    
-- |_____/|_____|__|  |___._|_____||__|____|    
                                             
--  _______                                     
-- |   _   |.-----.-----.-----.                 
-- |       ||  _  |  _  |__ --|                 
-- |___|___||   __|   __|_____|                 
--          |__|  |__|                          
--[[
Author: Thomas Leon Highbaugh (thighbaugh@zoho.com)
default-apps.lua
Desc: default applications called elsewhere in the configuration
]]
-- ########################################################################
-- ########################################################################
-- ########################################################################

-- #############################################################################
-- Initialization ##############################################################
-- #############################################################################
local filesystem = require("gears.filesystem")
local beautiful = require("beautiful")
local config_dir = filesystem.get_configuration_dir()
local default_apps = {}

-- ########################################################################
-- Default Applications ###################################################
-- ########################################################################
default_apps.screeh_shot = "/home/tlh/.config/awesome/external/bin/screenshots desktop"
default_apps.lock_screen = "$HOME/.config/awesome/external/i3lock/blur.sh"
default_apps.power_manager = "xfce4-power-manager"
default_apps.software_updater = "kitty --title 'System upgrade' -e sudo pacman -Syu"
default_apps.bluetooth_manager = "kitty -e bluetoothctl"
default_apps.network_manager = "kitty -e nmtui"
default_apps.app_menu =
	"rofi -dpi  -show drun -theme " .. config_dir .. "external/rofi/rofi.rasi -icon-theme " .. beautiful.icon_theme

return default_apps
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --