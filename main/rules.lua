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
local ruled = require("ruled")
local gears = require('gears')
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
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.under_mouse + awful.placement.no_overlap + awful.placement.no_offscreen,
                callback = awful.client.setslave,
                maximized_vertical = false,
                maximized_horizontal = false,
                titlebars_enabled = true,
                raise = true
            }
        }, -- Floating clients.
    -- All clients will match this rule.
	ruled.client.append_rule {
		id         = "global",
		rule       = { },
		properties = {
			titlebars_enabled = beautiful.titlebars_enabled,
			focus     = awful.client.focus.filter,
			raise     = true,
			floating = false,
			maximized = false,
			above = false,
			below = false,
			ontop = false,
			sticky = false,
			maximized_horizontal = false,
			maximized_vertical = false,
			round_corners = true,
			keys = client_keys,
			buttons = client_buttons,
			screen    = awful.screen.preferred,
			placement = awful.placement.centered
		}
	},

	-- Dialogs
	ruled.client.append_rule {
		id         = "dialog",
		rule_any   = { 
			type = { "dialog" },
			class = { "Wicd-client.py", "calendar.google.com" },
		},
		properties = { 
			titlebars_enabled = false,-- beautiful.titlebars_enabled,
			floating = true,
      on_top = true,
			draw_backdrop = true,
			skip_decoration = true,
			shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end,
			placement = awful.placement.centered
		}
	},

	-- Modals
	ruled.client.append_rule {
		id         = "dialog",
		rule_any   = { 
			type = { "modal" },
      class = {"matplotlib"},
		},
		properties = { 
			titlebars_enabled = false, -- beautiful.titlebars_enabled,
			floating = true,
      on_top = true,
			draw_backdrop = true,
			skip_decoration = true,
			shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end,
			placement = awful.placement.centered
		}
	}
    }

    return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
    {},
    {
        __call = function(_, ...)
            return _M.get(...)
        end
    }
)
