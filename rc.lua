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
local bling = require("external.lib.bling")

local revelation = require("external.lib.awesome-revelation")
awful.util.shell = "/bin/zsh"

-- ##################################################
-- Theme
-- ##################################################
beautiful.init(require("theme"))

-- ##################################################
-- External Library Add Ins
-- ##################################################
-- Allows for all windows to be displayed with keypress
revelation.init()
-- window flash with focus change
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
root.keys(require("configuration.keys.global"))
