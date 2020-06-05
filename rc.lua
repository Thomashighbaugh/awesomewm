--- Awesome RC
--
--
--- Thomas Leon Highbaugh

-----------------------------------------------------
----------     Imports   --------------
-----------------------------------------------------
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
--local menubar = require("menubar")
--  ========================================
-- 			      Modules
--	        Load all the modules
--  ========================================

require('module.auto-start')
require('module.decorate-client')
-- require('module.backdrop')
require('module.exit-screen')
--require('module.quake-terminal')
require('module.lockscreen')

-----------------------------------------------------
----------     Variable Assignments    --------------
-----------------------------------------------------
RC = {} -- global namespace, on top before require any modules
RC.vars = require("configuration.user-variables")
modkey = RC.vars.modkey
-----------------------------------------------------
---------------     Error Handling    ---------------
-----------------------------------------------------

-- Error handling
require("configuration.error-handling")
-----------------------------------------------------
---------------     Theme       ---------------------
-----------------------------------------------------
-- Themes
require("configuration.theme")

-----------------------------------------------------
---------------     Helpers      --------------------
-----------------------------------------------------
require("configuration.helpers")
-- Calling All Module Libraries

-----------------------------------------------------
---------------   Configurations     ----------------
-----------------------------------------------------
-- Custom Local Library
local configuration = {
  layouts = require("configuration.layouts"),
  tags    = require("configuration.tags"),
  menu    = require("configuration.menu"),
  rules   = require("configuration.rules"),
  helpers = require("configuration.helpers"),
}
-----------------------------------------------------
--------     Keybind Configurations   ---------------
-----------------------------------------------------

-- Custom Local Library: Keys and Mouse Binding
local keys = {
  globalbuttons = require("configuration.keys.globalbuttons"),
  clientbuttons = require("configuration.keys.clientbuttons"),
  globalkeys    = require("configuration.keys.globalkeys"),
  clientkeys    = require("configuration.keys.clientkeys"),
  bindtotags    = require("configuration.keys.bindtotags")
}
-----------------------------------------------------
---------------     Layouts      ------------------
-----------------------------------------------------

-- Layouts
RC.layouts = configuration.layouts()

-----------------------------------------------------
---------------     Tags      ------------------
-----------------------------------------------------

-- Tags
RC.tags = configuration.tags()
-----------------------------------------------------
---------------     Menu      ------------------
-----------------------------------------------------

-- Menu
RC.mainmenu = awful.menu({ items = configuration.menu() }) -- in globalkeys
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)
--menubar.utils.terminal = RC.vars.terminal
-----------------------------------------------------
---------------     Keybindings     ------------------
-----------------------------------------------------
RC.globalkeys = keys.globalkeys()
RC.globalkeys = keys.bindtotags(RC.globalkeys)
-----------------------------------------------------
---------------     Root Keys      ------------------
-----------------------------------------------------

-- Set root
root.buttons(keys.globalbuttons())
root.keys(RC.globalkeys)
-----------------------------------------------------
---------------     Keyboard      ------------------
-----------------------------------------------------

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()
-----------------------------------------------------
---------------     Wibar      ------------------
-----------------------------------------------------

-- Statusbar: Wibar
require("widgets.statusbar")
--require('layout')

-----------------------------------------------------
---------------    Notifications    -----------------
-----------------------------------------------------

require("widgets.notifications")
-----------------------------------------------------
---------------     Rules      ----------------------
-----------------------------------------------------

awful.rules.rules = configuration.rules(
  keys.clientkeys(),
  keys.clientbuttons()
)

-----------------------------------------------------
---------------     Signals      --------------------
-----------------------------------------------------

-- Signals
require("configuration.signals")


-----------------------------------------------------
---------------     Autostart      ------------------
-----------------------------------------------------
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

awful.spawn.with_shell("numlockx on")


-----------------------------------------------------
------------    Garbage Collection   ----------------
-----------------------------------------------------
collectgarbage("setpause", 80)
collectgarbage("setstepmul", 200)
