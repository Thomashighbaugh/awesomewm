--  ______         __
-- |   __ \.--.--.|  |.-----.-----.
-- |      <|  |  ||  ||  -__|__ --|
-- |___|__||_____||__||_____|_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard awesome library
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")
-- Global namespace call
local _M = {}
-- ===================================================================
--  Rule Declaration
-- ===================================================================
function _M.get(clientkeys, clientbuttons)
    local rules = {

        -- All clients will match this rule.
        {
            rule = {},
            properties = {
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.under_mouse +
                awful.placement.no_overlap + awful.placement.no_offscreen +
                awful.placement.centered,
                callback = awful.client.setslave,

                titlebars_enabled = true
            }
        }, -- Floating clients.
        {
            rule_any = {
                instance = {
                    "copyq", -- Includes session name in class.
                    "pinentry",

                    "gimp-2.10", "Gimp-2.10",
                },

                class = {
                    "Arandr", "Blueman-manager", "Gpick", "Kruler","feh",
                    "MessageWin", -- kalarm.
                    "Sxiv", "Tor Browser",
                    "Wpa_gui", "veromix", "xtightvncviewer"
                },

                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name = {
                    "Event Tester", -- xev
                    "GIMP Message"
                },
                role = {
                    "AlarmWindow", -- Thunderbird's calendar.
                    "ConfigManager", -- Thunderbird's about:config.
                    "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
                }
            },
            properties = {floating = true,   raise = true,ontop = true }
        }, -- Add titlebars to normal clients and dialogs

    }

    return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})

