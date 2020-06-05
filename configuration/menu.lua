-----------------------------------------------------------------
---------------------     Menu      -----------------------------
-----------------------------------------------------------------

-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon
local freedesktop = require("freedesktop")
local menubar = require("menubar")
local M = {}  -- menu
local _M = {} -- module
local dpi = require('beautiful').xresources.apply_dpi
local clickable_container = require('widgets.clickable-container')
-- Article about Menus in Awesome Window Manager
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html
local home = os.getenv("HOME")
local icon = require("theme.icons.init")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = "nvim"
local editor_cmd = terminal .. " -e " .. editor
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Default Menu Called When Right Clicking on the Desktop
M.awesome = {
  { "Hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end, icon.d_keyboard  },
  { "Terminal", terminal,  icon.d_terminal  },
  { "Shutdown/Logout", home .. "/bin/powermenu",  icon.power  },
  { "Reload Awesome", awesome.restart, icon.restart },


}
-- Sub-Menu that can launch various commonly used programs quickly without needing to use Launcher Menu
M.favorite = {
--  { "PCManFM", "pcmanfm", icon.file_manager },
--  { "Spacemacs", "emacs",  beautiful.icons },
--  { "Webstorm", "webstorm",  home .. beautiful.icons },
--  { "Kitty", "kitty -e tmux new",  beautiful.icons },
--  { "Firefox", "firefox", beautiful.icons },
--  { "Chromium", "chromium", home .. beautiful.icons },
--  { "Firefox Developer Edition", beautiful.icons },
--  { "Gimp", "gimp", icon.ship },
--  { "Inkscape", "inkscape",  icon.effects },
--  {"Pencilsheep", "pencilsheep", icon.chart }
}
-- SubMenu for Network Related Tasks
M.network_main = {
  { "Network Manager", "networkmanager_dmenu",  icon.menu }
}
mymainmenu = freedesktop.menu.build({
    icon_size = 32,
    before = {
        { "Terminal", terminal, icon.terminal },
        { "Browser", browser,  home .. icon.web_browser },
        { "File Manager", filemanager, icon.file_manager },
        -- other triads can be put here
    },
    after = {
        { "Awesome", myawesomemenu, icon.awesome },
        { "Exit", myexitmenu, icon.close },
        -- other triads can be put here
    }
})
mylauncher = awful.widget.launcher({image = icon.awesome , size = dpi(36),
                                     menu = mymainmenu })


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome,  icon.awesome  },
    { "open terminal", terminal, icon.terminal },
    { "network", M.network_main, icon.web_browser },
    { "favorite", M.favorite, icon.plus }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
