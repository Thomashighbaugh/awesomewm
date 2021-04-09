--  _______
-- |   |   |.-----.-----.--.--.
-- |       ||  -__|     |  |  |
-- |__|_|__||_____|__|__|_____|
-- ===================================================================
-- Initialization
-- ===================================================================
-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local freedesktop = require("freedesktop")
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {} -- menu
local _M = {} -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "subl3"
local editor_cmd = terminal .. " -e " .. editor

-- ===================================================================
-- SubMenu Item Declaration
-- ===================================================================
M.awesome = {
    {
        "Hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
        "/usr/share/icons/chhinamasta/apps/scalable/keyboard.svg"
    },
    {
        "Edit Config",
        editor_cmd .. " " .. awesome.conffile,
        "/usr/share/icons/chhinamasta/apps/scalable/menu-libre.svg"
    },
    {
        "Terminal",
        terminal,
        "/usr/share/icons/chhinamasta/apps/scalable/utilities-terminal.svg"
    },
    {
        "Shutdown/Logout",
        "oblogout",
        "/usr/share/icons/chhinamasta/actions/system-shutdown.svg"
    },
    {
        "Restart",
        awesome.restart,
        "/usr/share/icons/chhinamasta/actions/system-reboot.svg"
    },
    {
        "Quit",
        function()
            awesome.quit()
        end,
        "/usr/share/icons/chhinamasta/actions/system-log-out.svg"
    }
}

M.favorite = {
    {"Thunar", "thunar", "/usr/share/icons/chhinamasta/apps/thunar.svg"},
    {
        "Firefox",
        "firefox",
        "/usr/share/icons/chhinamasta/apps/scalable/firefox.svg"
    },
    {
        "Chromium",
        "chromium",
        "/usr/share/icons/chhinamasta/apps/scalable/chrome.svg"
    },
    {
        "Thunderbird",
        "thunderbird",
        "/usr/share/icons/chhinamasta/apps/scalable/scalable/thunderbird.svg"
    }
}

M.network_main = {
    {
        "Connection Editor",
        "nm-connection-editor",
        "/usr/share/icons/chhinamasta/apps/scalable/48/network-manager.svg"
    },
    {
        "Network Manager",
        "nmtui",
        "/usr/share/icons/chhinamasta/apps/scalable/network-manager.svg"
    }
}

M.graphics = {
    {"GIMP", "gimp", "/usr/share/icons/chhinamasta/48x48/apps/scalable/gimp.svg"},
    {
        "inkscape",
        "inkscape",
        "/usr/share/icons/chhinamasta/apps/scalable/inkscape.svg"
    }
}
M.dev = {
    {
        "Sublime",
        "subl3",
        "/usr/share/icons/chhinamasta/apps/scalable/sublime.svg"
    },
    {
        "Webstorm",
        "webstorm",
        "/usr/share/icons/chhinamasta/apps/scalable/text-editor.svg"
    }
}
-- ===================================================================
-- Menu Items
-- ===================================================================
function _M.get()
    -- Main Menu
    local menu_items = {
        {"Awesome", M.awesome, beautiful.awesome_subicon},
        {
            "Open Terminal",
            terminal,
            "/usr/share/icons/chhinamasta/apps/scalable/terminal.svg"
        },
        {
            "Network",
            M.network_main,
            "/usr/share/icons/chhinamasta/devices/nm-device-wireless.svg"
        },
        {
            "Favorite",
            M.favorite,
            beautiful.awesome_subicon,
            "/usr/share/icons/chhinamasta/apps/scalable/text-editor.svg"
        },
        {
            "Graphics",
            M.graphics,
            beautiful.awesome_subicon,
            "/usr/share/icons/chhinamasta/apps/scalable/gimp.svg"
        },
        {
            "Development",
            M.dev,
            beautiful.awesome_subicon,
            "/usr/share/icons/chhinamasta/apps/scalable/vim.svg"
        }
    }

    return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
    {},
    {
        __call = function(_, ...)
            return _M.get(...)
        end
    }
)
