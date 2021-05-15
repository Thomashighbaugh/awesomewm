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
-- Article about Menus in Awesome Window Manager
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html
local home = os.getenv("HOME")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = "kitty"

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Default Menu Called When Right Clicking on the Desktop 
M.awesome = {
  { "Hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end, home .. "/.config/awesome/themes/vice/icons/keyboard-alt1.svg"  },
  { "Terminal", terminal,  home .. "/.config/awesome/themes/vice/icons/terminal-alt2.svg"  },
  { "Shutdown/Logout", home .. "/bin/powermenu",  home .. "/.config/awesome/themes/vice/icons/power.svg"  },
  { "Reload Awesome", awesome.restart, home .. "/.config/awesome/themes/vice/icons/logo.png"  },


}
-- Sub-Menu that can launch various commonly used programs quickly without needing to use Launcher Menu
M.favorite = {
  { "PCManFM", "pcmanfm",  home .. "/.config/awesome/themes/vice/icons/file-manager.svg" },
  { "Spacemacs", "emacs",  home .. "/.config/awesome/themes/vice/icons/spacemacs.svg" },
  { "Webstorm", "webstorm",  home .. "/.config/awesome/themes/vice/icons/webstorm.svg"  },
  { "Kitty", "kitty -e tmux new",  home .. "/.config/awesome/themes/vice/icons/terminal-alt4.svg"  },
  { "Firefox", "firefox",  home .. "/.config/awesome/themes/vice/icons/firefox-mozilla.svg"  },
  { "Chromium", "chromium", home .. "/.config/awesome/themes/vice/icons/chromium-browser.svg" },
  { "Firefox Developer Edition", "firefox-developer-edition", home .. "/.config/awesome/themes/vice/icons/firefox-mozilla.svg" },
  { "Gimp", "gimp",  home .. "/.config/awesome/themes/vice/icons/gimp.svg" },
  { "Inkscape", "inkscape",  home .. "/.config/awesome/themes/vice/icons/inkscape.svg" },
  {"Pencilsheep", "pencilsheep", home .. "/.config/awesome/themes/vice/icons/pencil2d.svg"}
}
-- SubMenu for Network Related Tasks 
M.network_main = {
  { "Network Manager", "networkmanager_dmenu",  home .. "/.config/awesome/themes/vice/icons/network.svg" }
}
mymainmenu = freedesktop.menu.build({
    icon_size = 32,
    before = {
        { "Terminal", terminal, home .. "/.config/awesome/themes/vice/icons/terminal-alt2.svg" },
        { "Browser", firefox, home .. "/.config/awesome/themes/vice/icons/browser.svg" },
        { "File Manager", filemanager, home .. "/.config/awesome/themes/vice/icons/file-manager.svg" },
  	{ "Spacemacs", "emacs",  home .. "/.config/awesome/themes/vice/icons/spacemacs.svg" },
        -- other triads can be put here
    },
    after = {
        { "Awesome", myawesomemenu, "/usr/share/awesome/icons/awesome32.png" },
        { "Exit", myexitmenu, home .. "/.config/awesome/themes/vice/icons/power.svg" },
        -- other triads can be put here
    }
})
mylauncher = awful.widget.launcher({image = home .. "/.config/awesome/themes/vice/icons/menu.svg", size = dpi(48),
                                     menu = mymainmenu })


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome,  home .. "/.config/awesome/themes/vice/icons/logo.svg" },
    { "open terminal", terminal, home .. "/.config/awesome/themes/vice/icons/utilities-terminal.svg" },
    { "network", M.network_main, home .. "/.config/awesome/themes/vice/icons/network-wired-activated.svg" },
    { "favorite", M.favorite,  home .. "/.config/awesome/themes/vice/icons/menu.svg"  }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
