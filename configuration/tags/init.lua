--  _______                    
-- |_     _|.---.-.-----.-----.
--   |   |  |  _  |  _  |__ --|
--   |___|  |___._|___  |_____|
--                |_____|      
--##################################################
--############ Thomas Leon Highbaugh ###############
--##################################################

local awful = require("awful")
local beautiful = require("beautiful")
local apps = require("configuration.apps")
local bling = require("external.lib.bling")
local icons = require("theme.icons")
local mstab = bling.layout.mstab
local centered = bling.layout.centered
local vertical = bling.layout.vertical
local horizontal = bling.layout.horizontal
local lain = require("external.lib.lain")
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

_G.tag.connect_signal(
    "request::default_layouts",
    function()
        awful.layout.append_default_layouts(
            {
                bling.layout.mstab,
                bling.layout.centered,
                bling.layout.vertical,
                bling.layout.equalarea,
                awful.layout.suit.spiral.dwindle,
                awful.layout.suit.tile,
                awful.layout.suit.max,
                lain.layout.cascade,
                lain.layout.centerwork,
                lain.layout.termfair,
                -- bling.layout.horizontal,
                -- awful.layout.suit.tile.left,
                -- awful.layout.suit.tile.bottom,
                -- awful.layout.suit.tile.top,
                -- awful.layout.suit.fair,
                -- awful.layout.suit.fair.horizontal,
                -- awful.layout.suit.corner.nw,
                -- awful.layout.suit.max.fullscreen,
                -- awful.layout.suit.magnifier,
                -- awful.layout.suit.corner.nw,
                -- awful.layout.suit.corner.ne,
                -- awful.layout.suit.corner.sw,
                -- awful.layout.suit.corner.se,
                -- awful.layout.suit.spiral.dwindle,
            }
        )
    end
)

screen.connect_signal(
    "request::desktop_decoration",
    function(s)
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

