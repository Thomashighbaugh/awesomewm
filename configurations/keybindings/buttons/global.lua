-- ******************************************************************************************************************* --
-- TC Header                                                                                                           --
--                                                      ::::::::::::::::::::       :::    ::: :::::::::::  ::::::::    --
--   global.lua                                         ::::::::::::::::::::       :+:    :+:     :+:     :+:    :+:   --
--                                                      ::::::::::::::+++#####+++  +:+    +:+     +:+     +:+          --
--   By: Thomas Leon Highbaugh <thighbaugh@zoho.c       ::+++##############+++     +:+    +:+     +:+     +:+          --
--   https://github.com/Thomashighbaugh             +++##############+++::::       +#+    +:+     +#+     +#+          --
--                                                    +++##+++::::::::::::::       +#+    +:+     +#+     +#+          --
--                                                      ::::::::::::::::::::       +#+    +#+     +#+     +#+          --
--                                                      ::::::::::::::::::::       #+#    #+#     #+#     #+#    #+#   --
--   Update: 2021/04/30 10:42:57 by Thomas Leon Highba  ::::::::::::::::::::        ########      ###      ######## .f --
--                                                                                                                     --
-- ******************************************************************************************************************* --

local gears = require("gears");
local awful = require("awful");
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local default_apps = require("configurations.default-apps")
require('awful.autofocus')

local globalbuttons = {
gears.table.join(
    awful.button({ }, 3, default_apps.app_menu))
}

return globalbuttons