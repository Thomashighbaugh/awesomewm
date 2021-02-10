--  _______                                             ________ _______
-- |   _   |.--.--.--.-----.-----.-----.--------.-----.|  |  |  |   |   |
-- |       ||  |  |  |  -__|__ --|  _  |        |  -__||  |  |  |       |
-- |___|___||________|_____|_____|_____|__|__|__|_____||________|__|_|__|
--
--                                                  Thomas Leon Highbaugh
-- ========================================================================
-- Warning the following configuration contains so much spaghetti code, it
-- may soon transcend into the Flying Spaghetti Monster.
-- ========================================================================
-- ========================================================================
--  External Libraries
-- ========================================================================
-- External Package Manager Call ------------------------------------------
pcall(require, "luarocks.loader")

-- Libraries --------------------------------------------------------------
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local lain = require("lain")
local vicious = require("vicious")
--require("lib.collision")()

-- Theme Handling Library
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

require("awful.hotkeys_popup.keys")

-- ===================================================================
-- My Configuration
-- ===================================================================
-- The below are the portions of the configuration that are either mine
-- or have been borrowed from other configurations (thanks everyone). Thus
-- can be relatively easily modified by whomever so dares to fiddle with it.

local helpers = require("main.helpers")

local autostart = require("main.autostart")

require("notifications.errors")

-- ===================================================================
-- Variables ---------------------------------------------------------
-- ===================================================================

-- Global Namespace ----------------------------------------------------
RC = {}

RC.vars = require("main.user-variables")

-- Not the most elegant solution, but enables using the
-- variables name directly, saving typing and keeps the
-- variables values elsewhere, thus reducing some of the
-- confusing visual clutter in this file
theme = RC.vars.theme
screen_width = RC.vars.screen_width
screen_height = RC.vars.screen_height
terminal = RC.vars.terminal
editor = RC.vars.editor
editor_cmd = RC.vars.editor_cmd
browser = RC.vars.browser
filemanager = RC.vars.filemanager
discord = RC.vars.discord
music = RC.vars.music
modkey = RC.vars.modkey
altkey = RC.vars.altkey
shift = RC.vars.shift
ctrl = RC.vars.crtl

-- ===================================================================
-- Set Theme (tests variable assignments) ----------------------------
-- ===================================================================
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/" .. theme .. "/theme.lua")

-- ===================================================================
-- Window Decorations and Layout -------------------------------------
-- ===================================================================

require("main.windows")

-- ===================================================================
-- Icons ----------------------------------------------------------------
-- ===================================================================
local icons = require("icons")

-- Icon theme -----------------------------------------------------------
icons.init("sheet")

-- ===================================================================
-- Menu -----------------------------------------------------------------
-- ===================================================================
mymainmenu = require("layout.menu")
RC.mainmenu = awful.menu({ items = mymainmenu() }) -- in globalkeys
RC.launcher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = RC.mainmenu,
})

-- ===================================================================
-- Tags + Wallpaper -----------------------------------------------------------
-- ===================================================================
require("layout.tags")
-- ===================================================================
-- Key bindings ------------------------------------------------------
-- ===================================================================
require("main.keys")
buttons = require("main.buttons")

root.buttons(buttons())
-- ===================================================================
-- Rules -------------------------------------------------------------
-- ===================================================================
require("main.rules")
-- ===================================================================
-- Signals ----------------------------------------------------------
-- ===================================================================
require("main.signals")
-- ===================================================================
-- Daemons ---------------------------------------------------------
-- ===================================================================
require("event-listeners")

-- ===================================================================
-- Notifications -----------------------------------------------------
-- ===================================================================
require("notifications")

-- ===================================================================
-- Layout ------------------------------------------------------------
-- ===================================================================
require("layout")

-- ===================================================================
-- Garbage Collection
-- ===================================================================
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)

-- ===================================================================
-- EOF ---------------------------------------------------------------
-- ===================================================================
