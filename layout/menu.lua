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
        function() hotkeys_popup.show_help(nil, awful.screen.focused()) end,
        "/usr/share/icons/chhinamasta/512x512/apps/accessories-character-map.png"
    }, {
        "Edit Config", editor_cmd .. " " .. awesome.conffile,
        "/usr/share/icons/chhinamasta/512x512/apps/text-editor.png"
    }, {
        "Terminal", terminal,
        "/usr/share/icons/chhinamasta/512x512/apps/utilities-terminal-alt.png"
    }, {
        "Shutdown/Logout", "oblogout",
        "/usr/share/icons/chhinamasta/512x512/actions/system-shutdown.png"
    }, {
        "Restart", awesome.restart,
        "/usr/share/icons/chhinamasta/512x512/actions/system-reboot.png"
    }, {
        "Quit", function() awesome.quit() end,
        "/usr/share/icons/chhinamasta/512x512/actions/system-log-out.png"
    }
}

M.favorite = {
    {"Thunar", "thunar", "/usr/share/icons/chhinamasta/512x512/apps/thunar.png"},
    {
        "Firefox", "firefox",
        "/usr/share/icons/chhinamasta/512x512/apps/firefox.png"
    }, {
        "Chromium", "chromium",
        "/usr/share/icons/chhinamasta/512x512/apps/chromium.png"
    }, {
        "Thunderbird", "thunderbird",
        "/usr/share/icons/chhinamasta/512x512/apps/thunderbird.png"
    }
}

M.network_main = {
    {
        "Connection Editor", "nm-connection-editor",
        "/usr/share/icons/chhinamasta/apps/48/network-manager.png"
    }, {
        "Network Manager", "nmtui",
        "/usr/share/icons/chhinamasta/512x512/apps/network-manager.png"
    }
}

M.graphics = {
    {"GIMP", "gimp", "/usr/share/icons/chhinamasta/48x48/apps/gimp.png"}, {
        "inkscape", "inkscape",
        "/usr/share/icons/chhinamasta/512x512/apps/inkscape.png"
    }
}
M.dev = {
    {
        "Sublime", "subl3",
        "/usr/share/icons/chhinamasta/512x512/apps/sublime.png"
    }, {
        "Webstorm", "webstorm",
        "/usr/share/icons/chhinamasta/512x512/apps/text-editor.png"
    }
}
-- ===================================================================
-- Menu Items
-- ===================================================================
function _M.get()

    -- Main Menu
    local menu_items = {
        {"Awesome", M.awesome, beautiful.awesome_subicon}, {
            "Open Terminal", terminal,
            "/usr/share/icons/chhinamasta/512x512/apps/terminal.png"
        }, {
            "Network", M.network_main,
            "/usr/share/icons/chhinamasta/512x512/devices/nm-device-wireless.png"
        }, {
            "Favorite", M.favorite, beautiful.awesome_subicon,
            "/usr/share/icons/chhinamasta/512x512/apps/text-editor.png"
        }, {
            "Graphics", M.graphics, beautiful.awesome_subicon,
            "/usr/share/icons/chhinamasta/512x512/apps/gimp.png"
        }, {
            "Development", M.dev, beautiful.awesome_subicon,
            "/usr/share/icons/chhinamasta/512x512/apps/vim.png"
        }
    }

    return menu_items

end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
