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



local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- ===================================================================
-- SubMenu Item Declaration
-- ===================================================================

-- If one desires, adding a third element with the path to an icon will cause one to render in the menu. I have refrained as it is fickle in its rendering of said icon and not entirely necessary for my purposes when rofi has icons and this is intended as a quick menu backup for when it decides to not work

M.awesome = {
    {
        "Hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,

    },
    {
        "Edit Config",
        editor_cmd .. " " .. awesome.conffile,

    },
    {
        "Terminal",
        terminal,

    },
    {
        "Shutdown/Logout",
        "oblogout",

    },
    {
        "Restart",
        awesome.restart,

    },
    {
        "Quit",
        function()
            awesome.quit()
        end,
    }
}

M.favorite = {
    {"File Manager", "caja", },
    {
        "Firefox",
        "firefox",

    },
    {
        "Chromium",
        "chromium",
    },
    {
        "Thunderbird",
        "thunderbird",
    }
}

M.network_main = {
    {
        "Connection Editor",
        "nm-connection-editor",
    },
    {
        "Network Manager",
        "nmtui",
    }
}

M.graphics = {
    {"GIMP",
    "gimp"},
    {
        "inkscape",
        "inkscape",
    }
}
M.dev = {
    {
        "VSCode",
        "code",

    },
    {
        "Vim",
        "kitty -e nvim",
    }
}
-- ===================================================================
-- Menu Items
-- ===================================================================
function _M.get()
    -- Main Menu
    local menu_items = {
        {"Awesome", M.awesome,},
        {
            "Open Terminal",
            terminal,

        },
        {
            "Network",
            M.network_main,

        },
        {
            "Favorite",
            M.favorite,
            beautiful.awesome_subicon,

        },
        {
            "Graphics",
            M.graphics,
            beautiful.awesome_subicon,

        },
        {
            "Development",
            M.dev,
            beautiful.awesome_subicon,

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
