local separators = require "external.lib.lain.util.separators"
-- _______ ________ _______ _______ _______ _______ _______ ________ _______
-- |   _   |  |  |  |    ___|     __|       |   |   |    ___|  |  |  |   |   |
-- |       |  |  |  |    ___|__     |   -   |       |    ___|  |  |  |       |
-- |___|___|________|_______|_______|_______|__|_|__|_______|________|__|_|__|
-- ##################################################
-- ############# Thomas Leon Highbaugh ##############
-- ##################################################

local awful = require("awful")
local beautiful = require("beautiful")
local root = _G.root
local client = _G.client
local gears = require("gears")
awful.util.shell = "/bin/zsh"

-- ##################################################
-- Theme
-- ##################################################
beautiful.init(require("theme"))

-- ##################################################
-- External Library Add Ins
-- ##################################################
-- Allows for all windows to be displayed with keypress
local revelation = require("external.lib.awesome-revelation")
revelation.init()
-- window flash with focus change
local bling = require("external.lib.bling")
bling.module.flash_focus.enable()

-- ##################################################
-- Layouts
-- ##################################################
require("layout")

-- ##################################################
-- Modules
-- ##################################################
require("module.notifications")
require("module.auto-start")
require("module.decorate-client")
require("module.exit-screen")
require("module.lockscreen")
require("module.titlebar")

-- ##################################################
-- Configuration
-- ##################################################
require("configuration.client")
require("configuration.tags")
require("configuration.signals")

root.keys(require("configuration.keys.global"))

setmetatable(
  {},
  {
    __gc = function()
      print("gc")
    end
  }
)
collectgarbage("collect")
gears.timer.start_new(
  60,
  function()
    collectgarbage("step", 42)
    return true
  end
)
