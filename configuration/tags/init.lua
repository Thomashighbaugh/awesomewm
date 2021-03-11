--[[ 
_______ _______ _______ _______    __________ _______ _______ _______  __              
|_     _|   _   |     __|     __|  /  /_     _|    |  |_     _|_     _||  |.--.--.---.-.
  |   | |       |    |  |__     |,' ,' _|   |_|       |_|   |_  |   |__|  ||  |  |  _  |
  |___| |___|___|_______|_______/__/  |_______|__|____|_______| |___|__|__||_____|___._|
                                                                                        
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 3:23:21 PM
     Last edited:
       3/6/2021, 3:28:48 PM
     Auto updated?
       Yes
    
     Description:
       This pain in my you know what, provides the tags and assigns them
       the letter they are displayed as such below
--]]
local awful = require("awful")
local beautiful = require("beautiful")
local apps = require("configuration.apps")
local bling = require("external.lib.bling")
local icons = require("theme.icons")
local mstab = bling.layout.mstab
local centered = bling.layout.centered
local vertical = bling.layout.vertical
local horizontal = bling.layout.horizontal

local tagnum = {"a", "w", "e", "s", "o", "m", "e", "w", "m"}
local tags = {
    {
        icon = icons.tag1,
        screen = 1
    },
    {
        icon = icons.tag2,
        screen = 1
    },
    {
        icon = icons.tag3,
        screen = 1
    },
    {
        icon = icons.tag4,
        screen = 1
    },
    {
        icon = icons.tag5,
        screen = 1
    },
    {
        icon = icons.tag6,
        screen = 1
    },
    {
        icon = icons.tag7,
        screen = 1
    },
    {
        icon = icons.tag8,
        screen = 1
    },
    {
        icon = icons.tag9,
        screen = 1
    }
}

tag.connect_signal(
    "request::default_layouts",
    function()
        awful.layout.append_default_layouts(
            {
                bling.layout.mstab,
                bling.layout.centered,
                bling.layout.vertical,
                bling.layout.horizontal,
                awful.layout.suit.spiral.dwindle,
                --         awful.layout.suit.corner.nw,
                awful.layout.suit.tile,
                -- awful.layout.suit.tile.left,
                -- awful.layout.suit.tile.bottom,
                -- awful.layout.suit.tile.top,
                -- awful.layout.suit.fair,
                awful.layout.suit.fair.horizontal,
                awful.layout.suit.spiral.dwindle,
                awful.layout.suit.max
                -- awful.layout.suit.max.fullscreen,
                --awful.layout.suit.magnifier,
                ----awful.layout.suit.corner.nw,
                -- awful.layout.suit.corner.ne,
                -- awful.layout.suit.corner.sw,
                -- awful.layout.suit.corner.se,
                -- awful.layout.suit.spiral.dwindle,
                -- awful.layout.suit.tile,
                -- awful.layout.suit.max
            }
        )
    end
)

screen.connect_signal(
    "request::desktop_decoration",
    function(s)
        local fullscreen = awful.layout.suit.max
        local std_tiled = awful.layout.suit.tile
        local floating = awful.layout.suit.floating
        local layouts = {
            mstab,
            mstab,
            mstab,
            mstab,
            mstab,
            mstab,
            mstab,
            mstab,
            mstab
        }
        for i, tag in pairs(tags) do
            awful.tag.add(
                "(tagnum[i])",
                {
                    name = tagnum[i],
                    icon = tag.icon,
                    icon_only = false,
                    layout = layouts[i],
                    gap_single_client = true,
                    gap = beautiful.useless_gap,
                    screen = s,
                    default_app = tag.default_app,
                    selected = i == 1
                }
            )
        end
    end
)

tag.connect_signal(
    "property::layout",
    function(t)
        local currentLayout = awful.tag.getproperty(t, "layout")
        -- if (currentLayout == awful.layout.suit.max) then
        -- 	t.gap = 0
        -- else
        t.gap = beautiful.useless_gap
        -- end
    end
)
