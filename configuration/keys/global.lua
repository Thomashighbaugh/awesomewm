
--  _______ __         __           __   __  __                    
-- |     __|  |.-----.|  |--.---.-.|  | |  |/  |.-----.--.--.-----.
-- |    |  |  ||  _  ||  _  |  _  ||  | |     < |  -__|  |  |__ --|
-- |_______|__||_____||_____|___._||__| |__|\__||_____|___  |_____|
--                                                    |_____|      





local awful = require('awful')
local beautiful = require('beautiful')

require('awful.autofocus')
    local switcher = require("widget.awesome-switcher")


local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')

-- Key bindings
local globalKeys = awful.util.table.join(

-------------------------------------------------------------------
-- External Functions
    -- Layout manipulation
    --Vendor
        awful.key({ altkey,           }, "Tab",
      function ()
          switcher.switch( 1, altkey, "Alt_L", "Shift", "Tab")
      end),
    
    awful.key({ altkey, "Shift"   }, "Tab",
      function ()
          switcher.switch(-1, altkey, "Alt_L", "Shift", "Tab")
      end),
--------------------------------------------------------------
    -- Hotkeys
    awful.key(
        {modkey}, 
        'Insert', 
        hotkeys_popup.show_help, 
        {description = 'show help', group = 'awesome'}
    ),
    -- Reload Awesome
    awful.key({modkey,}, 
        'r', 
        awesome.restart, 
        {description = 'reload awesome', group = 'awesome'}
    ),
    -- Quit Awesome    
    awful.key({modkey, 'Control'}, 
        'q', 
        awesome.quit, 
        {description = 'quit awesome', group = 'awesome'}
    ),
    awful.key(
        {modkey,},
        'Up',
        function()
            awful.tag.incmwfact(0.05)
        end,
        {description = 'increase master width factor', group = 'layout'}
    ),
    awful.key(
        {modkey,},
        'Down',
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {description = 'decrease master width factor', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'h',
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = 'increase the number of master clients', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'l',
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = 'decrease the number of master clients', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Control'},
        'h',
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = 'increase the number of columns', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Control'},
        'l',
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = 'decrease the number of columns', group = 'layout'}
    ),
    awful.key(
        {modkey},
        'space',
        function()
            awful.layout.inc(1)
        end,
        {description = 'select next layout', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'space',
        function()
            awful.layout.inc(-1)
        end,
        {description = 'select previous layout', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Shift'}, 
        "1",  
        function() 
            awful.screen.focus_relative(-1) 
        end,
        { description = "focus the previous screen", group = "screen"}
    ),
    awful.key(
        {modkey, 'Shift'}, 
        "2", 
        function()
            awful.screen.focus_relative(1)
        end,
        { description = "focus the next screen", group = "screen"}
    ),
    awful.key(
        {modkey, 'Control'},
        'n',
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        {description = 'restore minimized', group = 'screen'}
    ),
    -- awful.key(
    --     {},
    --     'XF86MonBrightnessUp',
    --     function()
    --         awful.spawn('light -A 10', false)
    --         awesome.emit_signal('widget::brightness')
    --         awesome.emit_signal('module::brightness_osd:show', true)
    --     end,
    --     {description = 'increase brightness by 10%', group = 'hotkeys'}
    -- ),
    -- awful.key(
    --     {},
    --     'XF86MonBrightnessDown',
    --     function()
    --         awful.spawn('light -U 10', false)
    --         awesome.emit_signal('widget::brightness')
    --         awesome.emit_signal('module::brightness_osd:show', true)
    --     end,
    --     {description = 'decrease brightness by 10%', group = 'hotkeys'}
    -- ),
    -- -- ALSA volume control
    -- awful.key(
    --     {},
    --     'XF86AudioRaiseVolume',
    --     function()
    --         awful.spawn('amixer -D pulse sset Master 5%+', false)
    --         awesome.emit_signal('widget::volume')
    --         awesome.emit_signal('module::volume_osd:show', true)
    --     end,
    --     {description = 'increase volume up by 5%', group = 'hotkeys'}
    -- ),
    -- awful.key(
    --     {},
    --     'XF86AudioLowerVolume',
    --     function()
    --         awful.spawn('amixer -D pulse sset Master 5%-', false)
    --         awesome.emit_signal('widget::volume')
    --         awesome.emit_signal('module::volume_osd:show', true)
    --     end,
    --     {description = 'decrease volume up by 5%', group = 'hotkeys'}
    -- ),
    -- awful.key(
    --     {},
    --     'XF86AudioMute',
    --     function()
    --         awful.spawn('amixer -D pulse set Master 1+ toggle', false)
    --     end,
    --     {description = 'toggle mute', group = 'hotkeys'}
    -- ),
    -- awful.key(
    --     {},
    --     'XF86AudioMicMute',
    --     function()
    --         awful.spawn('amixer set Capture toggle', false)
    --     end,
    --     {description = 'mute microphone', group = 'hotkeys'}
    -- ),
    -- awful.key(
    --     {},
    --     'XF86PowerDown',
    --     function()
    --         awesome.emit_signal("module::exit_screen_show")        
    --     end,
    --     {description = 'shutdown', group = 'hotkeys'}
    -- ),
    -- awful.key(
    --     {},
    --     'XF86PowerOff',
    --     function()
    --         awesome.emit_signal("module::exit_screen_show")
    --     end,
    --     {description = 'toggle exit screen', group = 'hotkeys'}
    -- ),
    -- awful.key(
    --     {},
    --     'XF86Display',
    --     function()
    --         awful.spawn.single_instance('arandr', false)
    --     end,
    --     {description = 'arandr', group = 'hotkeys'}
    -- ),
    ---------------------------------------------------------
    awful.key(
        {modkey},
        '`',
        function()
            toggle_quake()
        end,
        {description = 'Dropdown Terminal', group = 'launcher'}
    ),
    awful.key(
        { }, 
        "Print",
        function ()
            awful.spawn.easy_async_with_shell(apps.bins.full_screenshot,function() end)
        end,
        {description = "fullscreen screenshot", group = 'Utility'}
    ),
    awful.key(
        {modkey}, 
        'Print',
        function ()
            awful.spawn.easy_async_with_shell(apps.bins.area_screenshot,function() end)
        end,
        {description = "area/selected screenshot", group = 'Utility'}
    ),
    awful.key(
        {modkey, "Shift"},
        ']',
        function()
            awesome.emit_signal("widget::blur:toggle")
        end,
        {description = "toggle blur effects", group = 'Utility'}
    ),
    awful.key(
        {modkey},
        ']',
        function()
            awesome.emit_signal("widget::blur:increase")
        end,
        {description = "increase blur effect by 10%", group = 'Utility'}
    ),
    awful.key(
        {modkey},
        '[',
        function()
            awesome.emit_signal("widget::blur:decrease")
        end,
        {description = "decrease blur effect by 10%", group = 'Utility'}
    ),
  awful.key(
    { modkey, "Control"},
     "Escape", 
     function () awful.spawn(apps.default.rofiappmenu) end,
        {description = "Launch Rofi Application Menu", group = 'Launcher'}),
     awful.key(
        {modkey}, 
        'Return',
        function()
            awful.spawn(apps.default.terminal)
        end,
        {description = "open default terminal", group = 'launcher'}
    ),
    -- Power Menu
        awful.key({ modkey,           }, "Delete", function ()  awesome.emit_signal("module::exit_screen_show") end,
              {description = "Display Power Menu", group = "Launcher"}),
  --Browser Launch
    awful.key(
        { modkey,           }, 
        "F2", 
        function () 
            awful.spawn(apps.default.web_browser) 
        end,
        {description = "Launch Internet Browser", group = 'Launcher'}),

--Alternative Browser Launch
    awful.key(
        { modkey, "Shift" }, 
        "F2", 
        function () awful.spawn("chromium") 
        end,
        {description = "Launch Alternative Internet Browser", group = 'Launcher'}),

--File Manager
    awful.key(
        { modkey,}, 
        "F3", 
        function ()
         awful.spawn(file_manager) 
        end,
        {description = "Launch File Manager", group = 'Launcher'}),
-- Terminal File Manager
    awful.key(
        { modkey, "Shift" },
         "F3", 
         function () 
            awful.spawn("gksu ranger") 
        end,
        {description = "Launch Terminal File Manager", group = 'Launcher'}),

-- Font Awesome Clipboard
                 awful.key(
                    { modkey,}, 
                    "F4", 
                    function()
                     awful.spawn.easy_async_with_shell("fa-rofi") 
                    end,
                    {description = "Copy Font-Awesome Icons to Clipboard", group = 'Launcher'}),

                      awful.key(
                        { modkey,"Shift" }, 
                        "F4", 
                        function()    
                            awful.easy_async_with_shell("emojipick") 
                        end,
                       {description = "Copy Emojis to Clipboard", group = 'Launcher'}),

-- Picom
                 awful.key(
                    { modkey,}, 
                    "F5", 
                    function()    
                        awful.spawn.with_shell("sudo picom -b && notify-send 'Compton Activated'") 
                    end,
                    {description = "Turn on Picom", group = 'Launcher'}),
  -- Picom OFF
                 awful.key(
                    { modkey, "Shift" }, 
                    "F5", 
                    function()    
                        awful.spawn.with_shell("sudo pkill picom  && notify-send 'Compton Deactivated'") 
                    end,
                   {description = "Turn off Picom", group = 'Launcher'}),
                 awful.key(
                    { modkey,}, 
                    "F6", 
                    function () 
                        awful.spawn.with_shell("menu_network") 
                    end,
                    {description = "Launch Network Manager Menu", group = 'Launcher'}),


    awful.key(
        {altkey, modkey}, 
        'Delete',
        function()
            awful.spawn(apps.default.terminal .. ' ' .. 'htop')
        end,
        {description = "open system monitor", group = 'launcher'}
    ),
  
    awful.key(
        {modkey},
        'Home',
        function()
            awful.spawn(apps.default.rofiglobal, false)
        end,
        {description = 'global search', group = 'launcher'}
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
        descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
    end
    globalKeys =
        awful.util.table.join(
        globalKeys,
        -- View tag only.
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
        -- Move client to tag.
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
        )
    )

end

return globalKeys
