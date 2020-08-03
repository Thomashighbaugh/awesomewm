--  _______                    
-- |_     _|.---.-.-----.-----.
--   |   |  |  _  |  _  |__ --|
--   |___|  |___._|___  |_____|
--                |_____|      

                              

local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local icons = require('theme.icons')

local tags = {}


  local tagpairs = {
    names  = {
      "A", "W", "E",
      "S", "O",
      "M", "E", "W", "M" },

    layout=awful.layout.layouts
  }

  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
   tags [s] = {
      shape  = gears.shape.rounded_rect,
   }
  end)

  return tags