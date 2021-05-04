-- ******************************************************************************************************************* --
-- TC Header                                                                                                           --
--                                                      ::::::::::::::::::::       :::    ::: :::::::::::  ::::::::    --
--   default-apps.lua                                   ::::::::::::::::::::       :+:    :+:     :+:     :+:    :+:   --
--                                                      ::::::::::::::+++#####+++  +:+    +:+     +:+     +:+          --
--   By: Thomas Leon Highbaugh <thighbaugh@zoho.c       ::+++##############+++     +:+    +:+     +:+     +:+          --
--   https://github.com/Thomashighbaugh             +++##############+++::::       +#+    +:+     +#+     +#+          --
--                                                    +++##+++::::::::::::::       +#+    +:+     +#+     +#+          --
--                                                      ::::::::::::::::::::       +#+    +#+     +#+     +#+          --
--                                                      ::::::::::::::::::::       #+#    #+#     #+#     #+#    #+#   --
--   Update: 2021/04/30 10:43:24 by Thomas Leon Highba  ::::::::::::::::::::        ########      ###      ######## .f --
--                                                                                                                     --
-- ******************************************************************************************************************* --

local filesystem = require("gears.filesystem")
local beautiful = require("beautiful")
local config_dir = filesystem.get_configuration_dir()
local default_apps = {}

default_apps.screeh_shot = "spectacle"
default_apps.lock_screen = "$HOME/.config/awesome/external/i3lock/blur.sh"
default_apps.power_manager = "xfce4-power-manager"
default_apps.software_updater = "kitty --title 'System upgrade' -e sudo pacman -Syu"
default_apps.bluetooth_manager = "kitty -e bluetoothctl"
default_apps.network_manager = "kitty -e nmtui"
default_apps.app_menu =
	"rofi -dpi " ..
	screen.primary.dpi ..
		" -show drun -theme " .. config_dir .. "external/rofi/rofi.rasi -icon-theme " .. beautiful.icon_theme

return default_apps
