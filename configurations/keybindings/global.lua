local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local default_apps = require("configurations.default-apps")
local revelation = require("external.lib.revelation")
local switcher = require("external.lib.awesome-switcher")
local menubar = require("menubar")
local machi = require("external.lib.layout-machi")
require("beautiful").layout_machi = machi.get_icon()
revelation.init()
require("awful.autofocus")

local globalkeys =
	gears.table.join(
	-- ===================================================================
	awful.key({modkey}, "F1", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
	-- ===================================================================

	awful.key(
		{modkey},
		"F2",
		function()
			awful.spawn("firefox")
		end,
		{
			description = "Launch Firefox",
			group = "Launcher"
		}
	),
	-- ===================================================================

	awful.key(
		{modkey, "Control"},
		"F2",
		function()
			awful.spawn("chrome")
		end,
		{
			description = "Launch Chrome",
			group = "Launcher"
		}
	),
	-- ===================================================================

	awful.key(
		{modkey},
		"F3",
		function()
			awful.spawn("caja")
		end,
		{
			description = "Launch File Manager",
			group = "Launcher"
		}
	),
	-- ===================================================================

	awful.key(
		{modkey, "Control"},
		"F3",
		function()
			awful.spawn("gksu thunar")
		end,
		{
			description = "Launch Terminal File Manager",
			group = "Launcher"
		}
	), -- ===================================================================
	awful.key(
		{modkey},
		"F4",
		function()
			awful.spawn.easy_async_with_shell("~/.config/awesome/external/rofi/fontawesome_menu/fontawesome-menu")
		end,
		{
			description = "Copy Font - Awesome Icons to Clipboard",
			group = "Launcher"
		}
	), -- ===================================================================
	awful.key(
		{modkey, "Control"},
		"F4",
		function()
			awful.spawn.easy_async_with_shell("emojipick")
		end,
		{
			description = "Copy Emojis to Clipboard",
			group = "Launcher"
		}
	),
	-- ===================================================================
	-- ===================================================================
	awful.key({modkey}, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),
	-- ===================================================================

	awful.key(
		{modkey},
		"e",
		revelation,
		{
			description = "show all windows",
			group = "awesome"
		}
	),
	-- ===================================================================
	awful.key(
		{modkey},
		"/",
		function()
			machi.switcher.start(client.focus)
		end,
		{
			description = "switch between windows for a machi layout",
			group = "layout"
		}
	),
	-- ===================================================================
	awful.key(
		{modkey},
		"/",
		function()
			machi.switcher.start(client.focus)
		end,
		{
			description = "switch between windows for a machi layout",
			group = "layout"
		}
	),
	awful.key(
		{"Mod1"},
		"Tab",
		function()
			switcher.switch(1, "Mod1", "Alt_L", "Shift", "Tab")
		end
	),
	-- ===================================================================
	awful.key(
		{modkey},
		"Print",
		function()
			awful.spawn("/home/tlh/.config/awesome/external/bin/screenshots area")
		end,
		{
			description = "Take a Selection Screenshot",
			group = "Launcher"
		}
	),
	-- ===================================================================
	awful.key(
		{"Mod1", "Shift"},
		"Tab",
		function()
			switcher.switch(-1, "Mod1", "Alt_L", "Shift", "Tab")
		end
	),
	-- ===================================================================
	-- Layout manipulation
	-- Swap client
	awful.key(
		{modkey, "Shift"},
		"j",
		function()
			awful.client.swap.byidx(1)
		end,
		{description = "swap with next client by index", group = "client"}
	),
	-- ===================================================================
	awful.key(
		{modkey, "Shift"},
		"k",
		function()
			awful.client.swap.byidx(-1)
		end,
		{description = "swap with previous client by index", group = "client"}
	),
	-- ===================================================================
	-- Focus client
	awful.key(
		{modkey},
		"j",
		function()
			awful.client.focus.byidx(1)
		end,
		{description = "focus next by index", group = "client"}
	),
	-- ===================================================================
	awful.key(
		{modkey},
		"k",
		function()
			awful.client.focus.byidx(-1)
		end,
		{description = "focus previous by index", group = "client"}
	),
	-- ===================================================================
	-- Relative focus
	awful.key(
		{modkey, "Control"},
		"j",
		function()
			awful.screen.focus_relative(1)
		end,
		{description = "focus the next screen", group = "screen"}
	),
	-- ===================================================================
	awful.key(
		{modkey, "Control"},
		"k",
		function()
			awful.screen.focus_relative(-1)
		end,
		{description = "focus the previous screen", group = "screen"}
	),
	-- ===================================================================

	awful.key(
		{modkey},
		"h",
		function()
			awful.tag.incmwfact(0.05)
		end,
		{
			description = "increase master width factor",
			group = "layout"
		}
	),
	-- ===================================================================

	awful.key(
		{modkey},
		"l",
		function()
			awful.tag.incmwfact(-0.05)
		end,
		{
			description = "decrease master width factor",
			group = "layout"
		}
	),
	-- ===================================================================

	awful.key(
		{modkey, "Shift"},
		"h",
		function()
			awful.tag.incnmaster(1, nil, true)
		end,
		{
			description = "increase the number of master clients",
			group = "layout"
		}
	), -- ===================================================================
	awful.key(
		{modkey, "Shift"},
		"l",
		function()
			awful.tag.incnmaster(-1, nil, true)
		end,
		{
			description = "decrease the number of master clients",
			group = "layout"
		}
	), -- ===================================================================
	awful.key(
		{modkey, "Control"},
		"h",
		function()
			awful.tag.incncol(1, nil, true)
		end,
		{
			description = "increase the number of columns",
			group = "layout"
		}
	), -- ===================================================================
	awful.key(
		{modkey, "Control"},
		"l",
		function()
			awful.tag.incncol(-1, nil, true)
		end,
		{
			description = "decrease the number of columns",
			group = "layout"
		}
	), -- ===================================================================
	-- Focus previous
	awful.key(
		{modkey},
		"Tab",
		function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = "go back", group = "client"}
	),
	-- ===================================================================
	awful.key({modkey}, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
	-- ===================================================================

	-- Standard program
	awful.key(
		{modkey},
		"Return",
		function()
			awful.spawn(terminal)
		end,
		{description = "open a terminal", group = "launcher"}
	),
	-- ===================================================================
	awful.key({modkey}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
	-- ===================================================================
	awful.key(
		{modkey},
		"Escape",
		function()
			awesome.emit_signal("module::exit_screen:show")
		end,
		{description = "Launch exit screen", group = "launcher"}
	),
	-- ===================================================================
	-- Client resize master
	awful.key(
		{modkey, "Control"},
		"Right",
		function()
			awful.tag.incmwfact(0.05)
		end,
		{description = "increase master width factor", group = "layout"}
	),
	-- ===================================================================
	awful.key(
		{modkey, "Control"},
		"Left",
		function()
			awful.tag.incmwfact(-0.05)
		end,
		{description = "decrease master width factor", group = "layout"}
	),

	-- ===================================================================
	-- Increase/Decrease numbers of master
	awful.key(
		{modkey, "Shift"},
		"h",
		function()
			awful.tag.incnmaster(1, nil, true)
		end,
		{description = "increase the number of master clients", group = "layout"}
	),
	-- ===================================================================
	awful.key(
		{modkey, "Shift"},
		"l",
		function()
			awful.tag.incnmaster(-1, nil, true)
		end,
		{description = "decrease the number of master clients", group = "layout"}
	),
	-- ===================================================================

	-- Increase/Decrease numbers of columns
	awful.key(
		{modkey, "Control"},
		"+",
		function()
			awful.tag.incncol(1, nil, true)
		end,
		{description = "increase the number of columns", group = "layout"}
	),
	-- ===================================================================
	awful.key(
		{modkey, "Control"},
		"-",
		function()
			awful.tag.incncol(-1, nil, true)
		end,
		{description = "decrease the number of columns", group = "layout"}
	),
	-- ===================================================================

	-- Next layout
	awful.key(
		{modkey},
		"space",
		function()
			awful.layout.inc(1)
		end,
		{description = "select next", group = "layout"}
	),
	-- ===================================================================

	-- Previous layout
	awful.key(
		{modkey, "Control"},
		"space",
		function()
			awful.layout.inc(-1)
		end,
		{description = "select previous", group = "layout"}
	),
	-- ===================================================================

	awful.key(
		{modkey, "Control"},
		"n",
		function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", {raise = true})
			end
		end,
		{description = "restore minimized", group = "client"}
	),
	-- ===================================================================
	-- My keybindings
	awful.key(
		{modkey, "Control"},
		"Escape",
		--function() awful.spawn("rofi -show drun -columns 2 -theme codeDark -no-show-icons") end
		function()
			awful.spawn(default_apps.app_menu, false)
		end,
		{description = "Application launcher", group = "launcher"}
	),
	-- ===================================================================

	awful.key(
		{},
		"XF86AudioRaiseVolume",
		function()
			awful.spawn("amixer -D pulse sset Master 5%+", false)
		end,
		{description = "increase volume up by 5%", group = "hotkeys"}
	),
	-- ===================================================================
	awful.key(
		{},
		"XF86AudioLowerVolume",
		function()
			awful.spawn("amixer -D pulse sset Master 5%-", false)
		end,
		{description = "decrease volume up by 5%", group = "hotkeys"}
	),
	-- ===================================================================
	awful.key(
		{},
		"XF86AudioMute",
		function()
			awful.spawn("amixer -D pulse set Master 1+ toggle", false)
		end,
		{description = "toggle mute", group = "hotkeys"}
	),
	-- ===================================================================
	awful.key(
		{},
		"XF86MonBrightnessUp",
		function()
			awful.spawn("xbacklight -inc 10", false)
		end,
		{description = "increase brightness by 10%", group = "hotkeys"}
	),
	-- ===================================================================
	awful.key(
		{},
		"XF86MonBrightnessDown",
		function()
			awful.spawn("xbacklight -dec 10", false)
		end,
		{description = "decrease brightness by 10%", group = "hotkeys"}
	),
	-- ===================================================================
	awful.key(
		{},
		"XF86Display",
		function()
			awful.spawn.single_instance("kcmshell5 kcm_kscreen", false)
		end,
		{description = "Display configuration", group = "hotkeys"}
	)
)

for i = 1, 9 do
	globalkeys =
		gears.table.join(
		globalkeys,
		-- View tag only.

		awful.key(
			{modkey},
			"#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{description = "view tag #" .. i, group = "tag"}
		),
		-- ===================================================================
		-- Toggle tag display.
		awful.key(
			{modkey, "Control"},
			"#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{description = "toggle tag #" .. i, group = "tag"}
		),
		-- ===================================================================
		-- Move client to tag.
		awful.key(
			{modkey, "Shift"},
			"#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{description = "move focused client to tag #" .. i, group = "tag"}
		),
		-- ===================================================================
		-- Toggle tag on focused client.
		awful.key(
			{modkey, "Control", "Shift"},
			"#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{description = "toggle focused client on tag #" .. i, group = "tag"}
		),
		       -- ===================================================================

			   awful.key(
				{modkey, 'Shift'},
				'p',
				function()
					menubar.show()
				end,
				{
					description = 'show the menubar',
					group = 'Launcher'
				}
			)
	)
end

return globalkeys
