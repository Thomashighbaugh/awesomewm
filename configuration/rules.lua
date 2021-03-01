-- |   __ \.--.--.|  |.-----.-----.
-- |      <|  |  ||  ||  -__|__ --|
-- |___|__||_____||__||_____|_____|

-- ===================================================================
-- Libraries
-- ===================================================================

local awful = require('awful')
local beautiful = require('beautiful')

-- ===================================================================
-- Rules
-- ===================================================================
awful.rules.rules = {
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			size_hints_honor = false,
			titlebars_enabled = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	},
	{rule = {}, properties = {}, callback = awful.client.setslave},
	{
		rule_any = {
			instance = {'DTA', 'copyq', 'pinentry'},
			class = {
				'Arandr',
				'Blueman-manager',
				'Gpick',
				'Kruler',
				'MessageWin',
				'Sxiv',
				'fzfmenu',
				'Tor Browser',
				'Wpa_gui',
				'veromix',
				'xtightvncviewer',
				'Steam'
			},
			name = {'Event Tester'},
			role = {'AlarmWindow', 'ConfigManager', 'pop-up'}
		},
		properties = {floating = true, titlebars_enabled = true}
	},
	{
		rule_any = {type = {'normal', 'dialog'}},
		properties = {titlebars_enabled = true}
	},
	{
		rule_any = {class = {'Steam'}},
		properties = {titlebars_enabled = true, ontop = true}
	},
	{
		rule_any = {
			instance = {'scratch'},
			class = {'scratch'},
			icon_name = {'scratchpad_urxvt'}
		},
		properties = {
			skip_taskbar = false,
			floating = true,
			ontop = false,
			minimized = true,
			sticky = false
		},
		callback = function(c)
			awful.placement.centered(
				c,
				{
					honor_padding = false,
					honor_workarea = false,
					titlebars_enabled = true
				}
			)
		end
	}
}
