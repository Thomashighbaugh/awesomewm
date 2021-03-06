--[[ 
	
 __  __ _______ ___ ___ _______    __________ _____   _______ ______ _______ _____      __              
|  |/  |    ___|   |   |     __|  /  /     __|     |_|       |   __ \   _   |     |_   |  |.--.--.---.-.
|     <|    ___|\     /|__     |,' ,'|    |  |       |   -   |   __ <       |       |__|  ||  |  |  _  |
|__|\__|_______| |___| |_______/__/  |_______|_______|_______|______/___|___|_______|__|__||_____|___._|
                                                                                                        
by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 2:57:06 PM
     Last edited:
       3/5/2021, 4:54:15 PM
     Auto updated?
       Yes
    
     Description:
       global keybindings that have effect across windows or lack there
       of
--]]
local awful = require('awful')
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi

require('awful.autofocus')

local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
local awesome = _G.awesome
local client = _G.client
local drop = require('module.dropdown')

-- Key bindings
local globalKeys =
    awful.util.table.join(
    -- Awesome
    --#############################################################################
    awful.key({modkey}, 'r', awesome.restart, {description = 'reload awesome', group = 'awesome'}),
    --#############################################################################
    awful.key({modkey, 'Shift', 'Control'}, 'q', awesome.quit, {description = 'quit awesome', group = 'awesome'}),
    --#############################################################################
    -- Tag
    awful.key({modkey}, 'Left', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
    --#############################################################################
    awful.key({modkey}, 'Right', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
    --#############################################################################
    awful.key({modkey}, 'i', awful.tag.history.restore, {description = 'go back', group = 'tag'}),
    --#############################################################################
    awful.key(
        {modkey},
        'p',
        function()
            awful.screen.focus_relative(-1)
        end,
        {description = 'focus the next screen', group = 'screen'}
    ),
    awful.key(
        {modkey},
        'o',
        function()
            awful.screen.focus_relative(1)
        end,
        {description = 'focus the previous screen', group = 'screen'}
    ),
    --#############################################################################
    -- Client
    awful.key(
        {modkey},
        'l',
        function()
            awful.tag.incmwfact(0.05)
        end,
        {description = 'increase master width factor', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'h',
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {description = 'decrease master width factor', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Shift'},
        'h',
        function()
            awful.client.incwfact(0.05)
        end,
        {description = 'increase the clients width', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Shift'},
        'l',
        function()
            awful.client.incwfact(-0.05)
        end,
        {description = 'decrease the clients width', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'h',
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = 'increase the number of columns', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'l',
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = 'decrease the number of columns', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'space',
        function()
            awful.layout.inc(1)
        end,
        {description = 'select next', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Shift'},
        'space',
        function()
            awful.layout.inc(-1)
        end,
        {description = 'select previous', group = 'layout'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'j',
        function()
            awful.client.focus.byidx(1)
        end,
        {description = 'focus next by index', group = 'client'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'k',
        function()
            awful.client.focus.byidx(-1)
        end,
        {description = 'focus previous by index', group = 'client'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Shift'},
        'j',
        function()
            awful.client.swap.byidx(1)
        end,
        {description = 'swap with next client by index', group = 'client'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Shift'},
        'k',
        function()
            awful.client.swap.byidx(-1)
        end,
        {description = 'swap with previous client by index', group = 'client'}
    ),
    --#############################################################################
    awful.key({modkey}, 'u', awful.client.urgent.jumpto, {description = 'jump to urgent client', group = 'client'}),
    --#############################################################################
    --#############################################################################
    awful.key(
        {modkey},
        'Tab',
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = 'go back', group = 'client'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'b',
        function()
            beautiful.titlebar_enabled = not beautiful.titlebar_enabled
            if not beautiful.titlebar_enabled then
                beautiful.border_focus = '#666666' .. '30'
                beautiful.border_width = dpi(0)
            else
                beautiful.border_focus = beautiful.xbackground
                beautiful.border_width = dpi(0)
            end
            awful.layout.inc(1)
            awful.layout.inc(-1)
        end,
        {description = 'toggle title bar', group = 'client'}
    ),
    --#############################################################################
    -- My Progamm launchers
    awful.key(
        {modkey},
        'Return',
        function()
            awful.spawn(apps.default.terminal)
        end,
        {description = 'open default terminal', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {'Control', 'Shift'},
        'Escape',
        function()
            awful.spawn(apps.default.terminal .. ' ' .. 'bashtop')
        end,
        {description = 'open system monitor', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'Escape',
        function()
            awful.util.spawn(apps.default.rofiappmenu)
        end,
        {description = 'open application drawer', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'y',
        function()
            drop(apps.default.terminal, {width = 0.5, minwidth = 720, height = 0.5, vert = 'center'})
        end,
        {description = 'toggle dropdown terminal', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        't',
        function()
            drop(
                apps.default.terminal .. ' -e pulsemixer',
                {width = 0.5, minwidth = 720, height = 0.5, vert = 'center'}
            )
        end,
        {description = 'toggle dropdown pulsemixer', group = 'launcher'}
    ),
    --#############################################################################
    awful.key({modkey}, 'F1', hotkeys_popup.show_help, {description = 'show help', group = 'awesome'}),
    --#############################################################################

    awful.key(
        {modkey, 'Shift'},
        'F1',
        function()
            awesome.emit_signal('widget::notif_osd:toggle')
        end,
        {description = 'Toggle notification popup', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'F1',
        function()
            awesome.emit_signal('widget::calendar_osd:toggle')
        end,
        {description = 'Toggle calendar popup', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'F2',
        function()
            awful.spawn(apps.default.web_browser)
        end,
        {description = 'open firefox', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'F2',
        function()
            awful.spawn(apps.default.alt_web_browser)
        end,
        {description = 'open firefox alternative', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'F3',
        function()
            awful.spawn(apps.default.gui_file_manager)
        end,
        {description = 'open file browser', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'F4',
        function()
            awful.spawn(apps.default.gui_ide)
        end,
        {description = 'open Code', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'F5',
        function()
            awful.spawn(apps.default.password_manager)
        end,
        {description = 'open Keepass XC', group = 'launcher'}
    ),
    --#############################################################################

    awful.key(
        {modkey},
        'F6',
        function()
            awful.spawn('telegram-desktop')
        end,
        {description = 'open Telegram', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Control'},
        'F6',
        function()
            awful.spawn('android-messages-desktop')
        end,
        {description = 'open SMS messenger', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'F7',
        function()
            awful.spawn('arandr')
        end,
        {description = 'open display selection', group = 'function'}
    ),
    --#############################################################################

    awful.key(
        {modkey},
        'F8',
        function()
            awful.spawn('thunderbird')
        end,
        {description = 'open the mail client', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'F12',
        function()
            awful.spawn('spotify')
        end,
        {description = 'open Spotify music player', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Shift'},
        'F12',
        function()
            awful.spawn('audacious')
        end,
        {description = 'open Spotify music player', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86MonBrightnessUp',
        function()
            awesome.emit_signal('widget::brightness:change', 10)
        end,
        {description = 'increase brightness by 10%', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86MonBrightnessDown',
        function()
            awesome.emit_signal('widget::brightness:change', -10)
        end,
        {description = 'decrease brightness by 10%', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86AudioRaiseVolume',
        function()
            awesome.emit_signal('widget::volume:change', 5)
        end,
        {description = 'increase volume up by 5%', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86AudioLowerVolume',
        function()
            awesome.emit_signal('widget::volume:change', -5)
        end,
        {description = 'decrease volume up by 5%', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86AudioMute',
        function()
            awesome.emit_signal('widget::volume:toggle_mute')
        end,
        {description = 'toggle mute', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86AudioNext',
        function()
            awful.spawn('playerctl next', false)
        end,
        {description = 'next music', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86AudioPrev',
        function()
            awful.spawn('playerctl prev', false)
        end,
        {description = 'previous music', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86AudioPlay',
        function()
            awful.spawn('playerctl play-pause', false)
        end,
        {description = 'play/pause music', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {},
        'XF86AudioMicMute',
        function()
            awful.spawn('amixer set Capture toggle', false)
        end,
        {description = 'mute microphone', group = 'hotkeys'}
    ),
    --#############################################################################
    awful.key(
        {modkey, altkey},
        'm',
        function()
            for _, c in ipairs(client.get()) do
                -- do something
                c:raise()
                c.fullscreen = false
                c.maximized = false
                c.minimized = false
            end
        end,
        {
            description = 'Raise all minimized windows of current screen',
            group = 'Clients'
        }
    ),
    --#############################################################################
    awful.key(
        {modkey},
        '.',
        function()
            -- tag_view_nonempty(-1)
            local focused = awful.screen.focused()
            for i = 1, #focused.tags do
                awful.tag.viewidx(-1, focused)
                if #focused.clients > 0 then
                    return
                end
            end
        end,
        {description = 'view previous non-empty tag', group = 'tag'}
    ),
    --#############################################################################
    awful.key(
        {modkey, 'Shift'},
        '.',
        function()
            -- tag_view_nonempty(1)
            local focused = awful.screen.focused()
            for i = 1, #focused.tags do
                awful.tag.viewidx(1, focused)
                if #focused.clients > 0 then
                    return
                end
            end
        end,
        {description = 'view next non-empty tag', group = 'tag'}
    ),
    --#############################################################################
    awful.key(
        {},
        'Print',
        function()
            awful.spawn.with_shell('~/.config/awesome/configuration/screenshots full')
        end,
        {description = 'fullscreen screenshot', group = 'Utility'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'Print',
        function()
            awful.spawn.with_shell('~/.config/awesome/configuration/screenshots area')
        end
    ),
    --#############################################################################
    awful.key(
        {modkey, altkey},
        'Escape',
        function()
            -- awful.spawn(apps.default.lock, false)
            awesome.emit_signal('module::lock_screen:show')
        end,
        {description = 'lock the screen', group = 'Utility'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'Escape',
        function()
            awesome.emit_signal('module::exit_screen:show')
        end,
        {description = 'show exit screen', group = 'function'}
    ),
    --#############################################################################
    awful.key(
        {modkey},
        'F10',
        function()
            awesome.emit_signal('module::sidebar::toggle')
        end,
        {description = 'open sidebar and global search', group = 'launcher'}
    ),
    --#############################################################################
    awful.key(
        {modkey, altkey},
        'F10',
        function()
            awesome.emit_signal('module::dashboard_screen:show')
        end,
        {description = 'open today pane', group = 'launcher'}
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = 'view tag #', group = 'tag'}
        descr_toggle = {description = 'toggle tag #', group = 'tag'}
        descr_move = {description = 'move focused client to tag #', group = 'tag'}
        descr_toggle_focus = {
            description = 'toggle focused client on tag #',
            group = 'tag'
        }
    end
    globalKeys =
        awful.util.table.join(
        globalKeys, -- View tag only.
        awful.key(
            {modkey},
            '#' .. i + 9,
            function()
                local focused = awful.screen.focused()
                local tag = focused.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            descr_view
        ),
        --#############################################################################
        --Toggle tag display.
        awful.key(
            {modkey, 'Control'},
            '#' .. i + 9,
            function()
                local focused = awful.screen.focused()
                local tag = focused.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            descr_toggle
        ),
        --#############################################################################
        --Move client to tag.
        awful.key(
            {modkey, 'Shift'},
            '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            descr_move
        ),
        --#############################################################################
        --Toggle tag on focused client.
        awful.key(
            {modkey, 'Control', 'Shift'},
            '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            descr_toggle_focus
        )
    )
end

return globalKeys
