local awful = require("awful")
local gears = require("gears")
local ruled = require("ruled")
local beautiful = require("beautiful")

local client_keys = require("configuration.client.keys")
local client_buttons = require("configuration.client.buttons")

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal(
	"request::rules",
	function()
		-- All clients will match this rule.
		ruled.client.append_rule {
			id = "global",
			rule = {},
			properties = {
				titlebars_enabled = beautiful.titlebars_enabled,
				focus = awful.client.focus.filter,
				raise = true,
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
				screen = awful.screen.preferred,
				placement = awful.placement.centered
			}
		}

		-- Dialogs
		ruled.client.append_rule {
			id = "dialog",
			rule_any = {
				type = {"dialog", "modal"},
				class = {"Wicd-client.py", "calendar.google.com"},
				instance = {
					"file_progress",
					"Popup",
					"nm-connection-editor",
					"pavucontrol-qt"
				}
			},
			properties = {
				round_corners = true,
				ontop = true,
				focus = awful.client.focus.filter,
				raise = true,
				keys = client_keys,
				buttons = client_buttons,
				titlebars_enabled = true,
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
	end
)
