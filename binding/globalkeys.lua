--  _______ __         __           __   __  __
-- |     __|  |.-----.|  |--.---.-.|  | |  |/  |.-----.--.--.-----.
-- |    |  |  ||  _  ||  _  |  _  ||  | |     < |  -__|  |  |__ --|
-- |_______|__||_____||_____|___._||__| |__|\__||_____|___  |_____|
--                                                    |_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ==================================== ===============================
-- Standard awesome library
local gears = require('gears')
local awful = require('awful')
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require('awful.hotkeys_popup')
-- Menubar library
local menubar = require('menubar')

local beautiful = require('beautiful')

-- libs for window management
local revelation = require('external.lib.revelation')
local switcher = require('external.lib.awesome-switcher')
require('widgets.quake')
require('layout.exit')
local machi = require('external.lib.layout-machi')
require('beautiful').layout_machi = machi.get_icon()
-- lib variables  and init
revelation.init()

local _M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- ===================================================================
--  Bind functions to Keys
-- ===================================================================

function _M.get()
    local globalkeys =
        gears.table.join(
        awful.key(
            {modkey},
            'Insert',
            hotkeys_popup.show_help,
            {
                description = 'show help',
                group = 'awesome'
            }
        ),
        awful.key(
            {modkey},
            '.',
            function()
                machi.default_editor.start_interactive()
            end,
            {
                description = 'edit the current layout if it is a machi layout',
                group = 'layout'
            }
        ),
        -- ===================================================================
        awful.key(
            {modkey},
            '/',
            function()
                machi.switcher.start(client.focus)
            end,
            {
                description = 'switch between windows for a machi layout',
                group = 'layout'
            }
        ),
        awful.key(
            {'Mod1'},
            'Tab',
            function()
                switcher.switch(1, 'Mod1', 'Alt_L', 'Shift', 'Tab')
            end
        ),
            -- ===================================================================

        awful.key(
            {'Mod1', 'Shift'},
            'Tab',
            function()
                switcher.switch(-1, 'Mod1', 'Alt_L', 'Shift', 'Tab')
            end
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'Escape',
            function()
                exit_screen_show()
            end,
            {
                description = 'quit awesome',
                group = 'awesome'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            '`',
            function()
                toggle_quake()
            end,
            {
                description = 'Quake Terminal',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'e',
            revelation,
            {
                description = 'show all windows',
                group = 'awesome'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'Print',
            function()
                awful.spawn('/home/tlh/.config/awesome/external/screenshots area')
            end,
            {
                description = 'Take a Selection Screenshot',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'a',
            function()
                awful.spawn('rofi-todo -f /home/tlh/dotfiles/todos.json')
            end,
            {
                description = 'Take a Selection Screenshot',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Control'},
            'Escape',
            function()
                awful.spawn('rofi -modi drun -show drun -theme ~/.config/awesome/external/rofi/appmenu/rofi.rasi')
            end,
            {
                description = 'Application Launcher',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'F2',
            function()
                awful.spawn(browser)
            end,
            {
                description = 'Launch Firefox',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Control'},
            'F2',
            function()
                awful.spawn('chrome')
            end,
            {
                description = 'Launch Chrome',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'F3',
            function()
                awful.spawn('thunar')
            end,
            {
                description = 'Launch File Manager',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Control'},
            'F3',
            function()
                awful.spawn('gksu thunar')
            end,
            {
                description = 'Launch Terminal File Manager',
                group = 'Launcher'
            }
        ), -- ===================================================================
        awful.key(
            {modkey},
            'F4',
            function()
                awful.spawn.easy_async_with_shell('~/.config/awesome/external/rofi/fontawesome_menu/fontawesome-menu')
            end,
            {
                description = 'Copy Font - Awesome Icons to Clipboard',
                group = 'Launcher'
            }
        ), -- ===================================================================
        awful.key(
            {modkey, 'Control'},
            'F4',
            function()
                awful.spawn.easy_async_with_shell('emojipick')
            end,
            {
                description = 'Copy Emojis to Clipboard',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'F5',
            function()
                awful.spawn.with_shell("sudo picom - b && notify -send 'Compton Activated'")
            end,
            {
                description = 'Turn on Picom',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Control'},
            'F5',
            function()
                awful.spawn.with_shell("sudo pkill picom && notify -send 'Compton Deactivated'")
            end,
            {
                description = 'Turn off Picom',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Control'},
            'Delete',
            function()
                awful.spawn('kitty -e htop')
            end,
            {
                description = 'open system monitor',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'w',
            function()
                RC.mainmenu:show()
            end,
            {
                description = 'show main menu',
                group = 'awesome'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'j',
            function()
                awful.screen.focus_relative(1)
            end,
            {
                description = 'focus the next screen',
                group = 'screen'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'k',
            function()
                awful.screen.focus_relative(-1)
            end,
            {
                description = 'focus the previous screen',
                group = 'screen'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'u',
            awful.client.urgent.jumpto,
            {
                description = 'jump to urgent client',
                group = 'client'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'Tab',
            function()
                awful.client.focus.history.previous()
                if client.focus then
                    client.focus:raise()
                end
            end,
            {
                description = 'go back',
                group = 'client'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'Return',
            function()
                awful.spawn(terminal)
            end,
            {
                description = 'open a terminal',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'r',
            awesome.restart,
            {
                description = 'reload awesome',
                group = 'awesome'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Shift'},
            'q',
            awesome.quit,
            {
                description = 'quit awesome',
                group = 'awesome'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'h',
            function()
                awful.tag.incmwfact(0.05)
            end,
            {
                description = 'increase master width factor',
                group = 'layout'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey},
            'l',
            function()
                awful.tag.incmwfact(-0.05)
            end,
            {
                description = 'decrease master width factor',
                group = 'layout'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Shift'},
            'h',
            function()
                awful.tag.incnmaster(1, nil, true)
            end,
            {
                description = 'increase the number of master clients',
                group = 'layout'
            }
        ), -- ===================================================================
        awful.key(
            {modkey, 'Shift'},
            'l',
            function()
                awful.tag.incnmaster(-1, nil, true)
            end,
            {
                description = 'decrease the number of master clients',
                group = 'layout'
            }
        ), -- ===================================================================
        awful.key(
            {modkey, 'Control'},
            'h',
            function()
                awful.tag.incncol(1, nil, true)
            end,
            {
                description = 'increase the number of columns',
                group = 'layout'
            }
        ), -- ===================================================================
        awful.key(
            {modkey, 'Control'},
            'l',
            function()
                awful.tag.incncol(-1, nil, true)
            end,
            {
                description = 'decrease the number of columns',
                group = 'layout'
            }
        ), -- ===================================================================
        awful.key(
            {modkey},
            'space',
            function()
                awful.layout.inc(1)
            end,
            {
                description = 'select next',
                group = 'layout'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Control'},
            'n',
            function()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                    c:emit_signal(
                        'request::activate',
                        'key.unminimize',
                        {
                            raise = true
                        }
                    )
                end
            end,
            {
                description = 'restore minimized',
                group = 'client'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Shift'},
            'r',
            function()
                awful.screen.focused().mypromptbox:run()
            end,
            {
                description = 'run prompt',
                group = 'Launcher'
            }
        ),
            -- ===================================================================

        awful.key(
            {modkey, 'Shift'},
            'p',
            function()
                menubar.show()
            end,
            {
                description = 'show the menubar',
                group = 'Launcher'
            }
        )
    )

    return globalkeys
end

-- ===================================================================
-- Add key bindings to Table
-- ===================================================================
return setmetatable(
    {},
    {
        __call = function(_, ...)
            return _M.get(...)
        end
    }
)
