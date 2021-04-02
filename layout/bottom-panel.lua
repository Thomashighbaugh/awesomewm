--  ______         __   __                       ______                     __
-- |   __ \.-----.|  |_|  |_.-----.--------.    |   __ \.---.-.-----.-----.|  |
-- |   __ <|  _  ||   _|   _|  _  |        |    |    __/|  _  |     |  -__||  |
-- |______/|_____||____|____|_____|__|__|__|    |___|   |___._|__|__|_____||__|
--##################################################
--############ Thomas Leon Highbaugh ###############
--##################################################

local panel_builder = require("module.panel-builder")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local callbacks = require("widget.callbacks")
local wibox = require("wibox")
local taglist = require("widget.taglist")
taglist.show_current_client = true

local status_panel = function(s)
  local args = {
    screen = s,
    orientation = "horizontal",
    position = "bottom",
    callback = callbacks.zoom,
    spacing = 5
  }
  local sep = "separator"
  local panel =
    panel_builder.build_single_panel(
    args,
    {
      left_widgets = {"layout"},
      middle_widgets = {
        sep,
        "taglist",
        sep
      },
      right_widgets = {
        "end-session"
      }
    }
  )
  return panel
end

return status_panel
