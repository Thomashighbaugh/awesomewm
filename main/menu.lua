-----------------------------------------------------------------
---------------------     Menu      -----------------------------
-----------------------------------------------------------------

-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon
local freedesktop = require("external.lib.awesome-freedesktop")
local menubar = require("menubar")
local M = {}  -- menu
local _M = {} -- module
local dpi = require('beautiful').xresources.apply_dpi
-- Article about Menus in Awesome Window Manager
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html
local home = os.getenv("HOME")
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
    end, home .. "/.config/awesome/themes/icons/feathericons/home.svg"  },
  { "Terminal", terminal,  home .. "/.config/awesome/themes/icons/feathericons/terminal.svg"  },
  { "Shutdown/Logout", home .. "/bin/powermenu",  home .. "/.config/awesome/themes/icons/feathericons/power.svg"  },
  { "Reload Awesome", awesome.restart, home .. "/.config/awesome/themes/icons/feathericons/awesome-icon.png"  },


}
-- Sub-Menu that can launch various commonly used programs quickly without needing to use Launcher Menu
M.favorite = {
  { "Caja", "caja",  home .. "/.config/awesome/themes/icons/feathericons/folder.svg" },
  { "Kitty", "kitty -e tmux new",  home .. "/.config/awesome/themes/icons/feathericons/terminal.svg"  },
  { "Firefox", "firefox", home .. "/.config/awesome/themes/icons/feathericons/chrome.svg" },
  { "Gimp", "gimp",  home .. "/.config/awesome/themes/icons/feathericons/image.svg" },
  { "Inkscape", "inkscape",  home .. "/.config/awesome/themes/icons/feathericons/image.svg" },
  {"Pencilsheep", "pencilsheep", home .. "/.config/awesome/themes/icons/feathericons/image.svg"}
}
-- SubMenu for Network Related Tasks 
M.network_main = {
  { "Network Manager", "networkmanager_dmenu",  home .. "/.config/awesome/themes/icons/feathericons/network.svg" }
}
mymainmenu = freedesktop.menu.build({
    icon_size = 32,
    before = {
        { "Terminal", terminal, home .. "/.config/awesome/themes/icons/feathericons/terminal.svg" },
        { "Browser", browser,  home .. "/.config/awesome/themes/icons/feathericons/chrome.svg" },
        { "File Manager", filemanager, home .. "/.config/awesome/themes/icons/feathericons/file.svg" },
  	{ "Spacemacs", "emacs",  home .. "/.config/awesome/themes/icons/feathericons/codepen.svg" },
        -- other triads can be put here
    },
    after = {
        { "Awesome", myawesomemenu, "/usr/share/awesome/themes/icons/awesome.png" },
        { "Exit", myexitmenu, home .. "/.config/awesome/themes/icons/feathericons/power.svg" },
        -- other triads can be put here
    }
})
mylauncher = awful.widget.launcher({image = home .. "/.config/awesome/themes/dhumavati/icons/menu.svg", size = dpi(48),
                                     menu = mymainmenu })


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome,  home .. "/.config/awesome/themes/icons/feathericons/awesome-icon.png" },
    { "open terminal", terminal, home .. "/.config/awesome/themes/icons/feathericons/terminal-alt2.svg" },
    { "network", M.network_main, home .. "/.config/awesome/themes/icons/feathericons/network.svg" },
    { "favorite", M.favorite,  home .. "/.config/awesome/themes/icons/feathericons/menu.svg"  }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
