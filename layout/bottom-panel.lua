--[[ 
	 ______ _______ _______ _______ _______ _______      ______ _______ _______ _______ _____      __              
|   __ \       |_     _|_     _|       |   |   |    |   __ \   _   |    |  |    ___|     |_   |  |.--.--.---.-.
|   __ <   -   | |   |   |   | |   -   |       |    |    __/       |       |    ___|       |__|  ||  |  |  _  |
|______/_______| |___|   |___| |_______|__|_|__|    |___|  |___|___|__|____|_______|_______|__|__||_____|___._|
                                                                                                               
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 2:48:26 PM
     Last edited:
       3/6/2021, 9:59:40 PM
     Auto updated?
       Yes
    
     Description:
       the bottom panel, which I am especially happy with the look and
       functionality of.
--]]
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
