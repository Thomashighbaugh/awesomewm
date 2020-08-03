--              __              
-- .----.--.--.|  |.-----.-----.
-- |   _|  |  ||  ||  -__|__ --|
-- |__| |_____||__||_____|_____|
--
-- configuration of various types of windows based on functionality


-- reading: https://awesomewm.org/apidoc/declarative_rules/ruled.client.html#awful.rules                             
                     


local awful = require('awful')

local gears = require('gears')
local ruled = require("ruled")
local beautiful = require('beautiful')

local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

ruled.client.connect_signal(
	"request::rules",
	function()

		-- All clients will match this rule.
		ruled.client.append_rule {
			id         = "global",
			rule       = { },
			properties = {
				focus     = awful.client.focus.filter,
				raise     = true,
				floating = false,
				maximized = false,
				above = false,
				below = false,
				ontop = false,
				sticky = false,
				titlebar_position = 'top',
				maximized_horizontal = false,
				maximized_vertical = false,
			    border_width = beautiful.border_width,
       			border_color = beautiful.border_normal,
       			shape = function(width, height, cr)
							gears.shape.rounded_rect(width, height, beautiful.client_radius)
						end,
				round_corners = true,
				keys = client_keys,
				buttons = client_buttons,
				screen    = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}

		-- Dialogs
		ruled.client.append_rule {
			id         = "dialog",
			rule_any   = { 
				type  = { "dialog" },
				class = { "Wicd-client.py", "calendar.google.com" }
			},
			properties = { 
				titlebars_enabled = true,
				floating = true,
				above = true,
				draw_backdrop = true,
				skip_decoration = true,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}

		-- Modals
		ruled.client.append_rule {
			id         = "dialog",
			rule_any   = { 
				type = { "modal" }
			},
			properties = { 
				titlebars_enabled = true,
				floating = true,
				above = true,
				draw_backdrop = true,
				skip_decoration = true,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}

		-- Utilities
		ruled.client.append_rule {
			id         = "utility",
			rule_any   = { 
				type = { "utility" }
			},
			properties = { 
				titlebars_enabled = true,
				floating = true,
				hide_titlebars = true,
				draw_backdrop = false,
				skip_decoration = true,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}

		-- Splash
		ruled.client.append_rule {
			id         = "splash",
			rule_any   = { 
				type = { "splash" }
			},
			properties = { 
				titlebars_enabled = true,
				floating = true,
				above = true,
				hide_titlebars = true,
				draw_backdrop = false,
				skip_decoration = true,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}

		-- terminal emulators
		ruled.client.append_rule {
			id         = "terminals",
			rule_any   = { 
				class = { 
					"URxvt",
					"XTerm",
					"UXTerm",
					"kitty",
					"K3rmit"
				}
			},
			except_any = {
				instance = { "QuakeTerminal" }
			},
			properties = {
				switchtotag = true,
				draw_backdrop = false,
				size_hints_honor = true,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered

			}
		}

		-- Browsers
		ruled.client.append_rule {
			id         = "web_browsers",
			rule_any   = { 
				class = {
					"firefox",
					"Tor Browser",
					"discord",
					"Chromium",
					"Google-chrome"
				}
			},
		}

		-- text editors
		ruled.client.append_rule {
			id         = "text_editors",
			rule_any   = {  
				class = {
					"Geany",
					"Atom",
					"Subl3",
					"code-oss"
				},
				name  = {
					"LibreOffice",
					"libreoffice"
				}
			},
		}

		-- File managers
		ruled.client.append_rule {
			id         = "file_managers",
			rule_any   = {  
				class = {
					"dolphin",
					"ark",
					"Nemo",
					"File-roller",
					"thunar"
				}
			},
			properties = { 
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
			}
		}

		-- Multimedia
		ruled.client.append_rule {
			id         = "multimedia",
			rule_any   = {  
				class = {
					"vlc",
					"Spotify"
				}
			},
			properties = {
				draw_backdrop = false,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
			}
		}

		
		-- Graphics Editing
		ruled.client.append_rule {
			id         = "graphics_editors",
			rule_any   = {  
				class = {
					"Gimp-2.10",
					"Inkscape",
					"Flowblade"
				}
			},
			properties = {
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
			}
		}

		-- Sandboxes and VMs
		ruled.client.append_rule {
			id         = "sandbox",
			rule_any   = {  
				class = {
					"VirtualBox Manage",
					"VirtualBox Machine"
				}
			},
						properties = { 
				skip_decoration = true,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
			}
		}

		-- IDEs and Tools
		ruled.client.append_rule {
			id         = "ide",
			rule_any   = {  
				class = {
					"Oomox",
					"Unity",
					"UnityHub",
					"jetbrains-studio"
				}
			},
			properties = { 
				skip_decoration = true,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
			}
		}

		-- Image viewers with splash-like behaviour
		ruled.client.append_rule {
			id        = "splash_like",
			rule_any  = {
				class    = {
					"feh",
					"Pqiv",
					"Sxiv"
				},
				name = {"Discord Updater"}
			},
			properties = { 
				skip_decoration = true,
				hide_titlebars = true,
				floating = true,
				ontop = true,
				raise = true,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}

		-- Splash-like but with titlebars enabled
		ruled.client.append_rule {
			id       = "instances",
			rule_any = {
				instance    = {
					"file_progress",
					"Popup",
					"nm-connection-editor",
				},
				class = { 
					"scrcpy" ,
					"Mugshot",
					"Pulseeffects"
				}
			},
				properties = { 
				skip_decoration = true,
				round_corners = true,
				ontop = true,
				floating = true,
				draw_backdrop = false,
				focus = awful.client.focus.filter,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
				raise = true,
				keys = client_keys,
				buttons = client_buttons,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}
		
		-- Fullsreen
		ruled.client.append_rule {
			id       = "fullscreen",
			rule_any = {
			},
			properties = { 
				skip_decoration = false,
				round_corners = false,
				ontop = true,
				floating = false,
				fullscreen = true,
				draw_backdrop = false,
				raise = true,
				keys = client_keys,
				buttons = client_buttons,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered
			}
		}

	end
)


