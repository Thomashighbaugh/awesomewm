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
local clickable_container = require('widgets.material.clickable-container')
-- Article about Menus in Awesome Window Manager
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html
local home = os.getenv("HOME")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
local terminal = "kitty"
-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = "vim"
local editor_cmd = terminal .. " -e " .. editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Default Menu Called When Right Clicking on the Desktop 
M.awesome = {
  { "Hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end, home .. "~/.config/awesome/themes/icons/chhinamasta/keyboard-alt1.png"  },
  { "Terminal", terminal,  home .. "~/.config/awesome/themes/icons/chhinamasta/terminal.png"  },
  { "Shutdown/Logout", home .. "/bin/powermenu",  home .. "~/.config/awesome/themes/icons/chhinamasta/power.png"  },
  { "Reload Awesome", awesome.restart, home .. "~/.config/awesome/themes/icons/chhinamasta/awesome-icon.png"  },


}
-- Sub-Menu that can launch various commonly used programs quickly without needing to use Launcher Menu
M.favorite = {
  { "File Manager", "caja",  home .. "~/.config/awesome/theme/icons/package-normal.png" },
  { "Kitty", "kitty ",  home .. "~/.config/awesome/themes/icons/chhinamasta/terminal.png"  },
  { "Firefox", "firefox-nightly",  home .. "~/.config/awesome/themes/icons/chhinamasta/firefox-mozilla.png"  },
  { "Chromium", "chromium", home .. "~/.config/awesome/themes/icons/chhinamasta/chromium-browser.png" },
  { "Firefox Developer Edition", "firefox-developer-edition", home .. "~/.config/awesome/themes/icons/chhinamasta/firefox-mozilla.png" },
  { "Gimp", "gimp",  home .. "~/.config/awesome/themes/icons/chhinamasta/gimp.png" },
  { "Inkscape", "inkscape",  home .. "~/.config/awesome/themes/icons/chhinamasta/inkscape.png" },
}
-- SubMenu for Network Related Tasks 
M.network_main = {
  { "Network Manager", "nmtui",  home .. "~/.config/awesome/themes/icons/chhinamasta/network-wired.png" }
}
mainmenu = freedesktop.menu.build({
    icon_size = 32,
    before = {
        { "Terminal", terminal, home .. "~/.config/awesome/themes/icons/chhinamasta/terminal.png" },
        { "Browser", "firefox-nightly",  home .. "~/.config/awesome/themes/icons/chhinamasta/firefox-nightly.png" },
        { "File Manager", filemanager, home .. "~/.config/awesome/themes/icons/chhinamasta/file-manager.png" },
        -- other triads can be put here
    },
    after = {
        { "Awesome", myawesomemenu, "~/.config/awesome/theme/icons/awesome.png" },
        { "Exit", myexitmenu, home .. "~/.config/awesome/themes/icons/chhinamasta/system-shutdown.png" },
        -- other triads can be put here
    }
})
mylauncher = awful.widget.launcher({image = home .. "/.config/awesome/themes/icons/chhinamasta/icons/preferences-system-windows.png", size = dpi(48),
                                     menu = mymainmenu })


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome,  home .. "~/.config/awesome/themes/icons/awesome.png" },
    { "open terminal", terminal, home .. "~/.config/awesome/themes/icons/chhinamasta/terminal.png" },
    { "network", M.network_main, home .. "~/.config/awesome/themes/icons/chhinamasta/network-wired.png" },
    { "favorite", M.favorite,  home .. "~/.config/awesome/themes/icons/chhinamasta/preferences-system-windows.png"  }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
