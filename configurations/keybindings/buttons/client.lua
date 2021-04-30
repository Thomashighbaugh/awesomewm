-- ******************************************************************************************************************* --
-- TC Header                                                                                                           --
--                                                      ::::::::::::::::::::       :::    ::: :::::::::::  ::::::::    --
--   client.lua                                         ::::::::::::::::::::       :+:    :+:     :+:     :+:    :+:   --
--                                                      ::::::::::::::+++#####+++  +:+    +:+     +:+     +:+          --
--   By: Thomas Leon Highbaugh <thighbaugh@zoho.c       ::+++##############+++     +:+    +:+     +:+     +:+          --
--   https://github.com/Thomashighbaugh             +++##############+++::::       +#+    +:+     +#+     +#+          --
--                                                    +++##+++::::::::::::::       +#+    +:+     +#+     +#+          --
--                                                      ::::::::::::::::::::       +#+    +#+     +#+     +#+          --
--                                                      ::::::::::::::::::::       #+#    #+#     #+#     #+#    #+#   --
--   Update: 2021/04/30 10:43:02 by Thomas Leon Highba  ::::::::::::::::::::        ########      ###      ######## .f --
--                                                                                                                     --
-- ******************************************************************************************************************* --

local gears = require("gears");
local awful = require("awful");
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local default_apps = require("configurations.default-apps")
require('awful.autofocus')

local clientbuttons = {
    gears.table.join(
        awful.button({ }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end),
        awful.button({ modkey }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ modkey }, 3, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end))
}

return clientbuttons