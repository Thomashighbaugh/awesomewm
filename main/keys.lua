--  __  __
-- |  |/  |.-----.--.--.-----.
-- |     < |  -__|  |  |__ --|
-- |__|\__||_____|___  |_____|
--               |_____|

-- ========================================================================
--  External Libraries
-- ========================================================================

local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local helpers = require("main.helpers")
-- Custom modules
local notifPop = require("layout.pop.notif")
local panelPop = require("layout.pop.panel")
local calPop = require("layout.pop.cal")
local bling = require("lib.bling")
local switcher = require("lib.awesome-switcher")
local xresources = require("beautiful.xresources")

local dpi = xresources.apply_dpi

-- ========================================================================
--  Global Keys
-- ========================================================================

globalkeys = gears.table.join(
    -- ===================================================================
    awful.key({modkey}, "F1", hotkeys_popup.show_help,
    {description = "Show Help", group = "awesome"}),
    -- ===================================================================
    awful.key({modkey}, "F2", function() awful.spawn("firefox") end,
    {description = "Open Firefox", group = "launcher"}),
    -- ===================================================================
    awful.key({modkey, "Control"}, "F2", function() awful.spawn("epiphany") end,
    {description = "Open Epiphany Browser", group = "launcher"}),
    -- ===================================================================
    awful.key({modkey}, "F3",
        function() awful.spawn("kitty -e ranger") end,
    {description = "Open File Manager", group = "launcher"}),
    -- ===================================================================
    awful.key({modkey, "Control"}, "F3",
        function() awful.spawn("sudo kitty -e ranger") end,
    {description = "Open File Manager as Root", group = "launcher"}),
    -- ===================================================================
    awful.key({modkey, "Shift"}, "F3",
        function() awful.spawn("nemo") end,
    {description = "Open Nemo", group = "launcher"}),
    -- ===================================================================
    -- Font Awesome Clipboard
    awful.key({modkey}, "F9", function()
        awful.spawn.easy_async_with_shell(
        "~/.config/awesome/external/rofi/fontawesome_menu/fontawesome-menu")
    end, {description = "Copy Font - Awesome Icons to Clipboard", group = 'Launcher'}),
    -- ===================================================================
    awful.key({modkey}, "F4",
        function() awful.spawn.with_shell("subl") end,
    {description = "open Sublime Text 3", group = "launcher"}),
    -- ===================================================================
    
    awful.key({"Mod1", }, "Tab",
    function () switcher.switch(1, "Mod1", "Alt_L", "Shift", "Tab") end),
    
    awful.key({"Mod1", "Shift"}, "Tab",
    function () switcher.switch(-1, "Mod1", "Alt_L", "Shift", "Tab") end),
    -- ===================================================================
    awful.key({"Mod1"}, "a",
        function() bling.module.tabbed.pick() end,
    {description = "pick a client to add to tabbing group", group = "Tabs"}),
    -- ===================================================================
    awful.key({"Mod1"}, "s", function() bling.module.tabbed.iter() end,
    {description = "iterate through tabbing group", group = "Tabs"}),
    -- ===================================================================
    awful.key({"Mod1"}, "d",
        function() bling.module.tabbed.pop() end,
    {description = "remove focused client from tabbing group", group = "Tabs"}),
    -- ===================================================================
    awful.key({modkey}, "Escape", awful.tag.history.restore,
    {description = "go back", group = "tag"}),
    
    -- ===================================================================
    awful.key({modkey}, "j",
        function() awful.client.focus.byidx(1) end,
    {description = "focus next by index", group = "client"}),
    -- ===================================================================
    awful.key({modkey}, "Tab", function() awful.client.focus.byidx(-1) end,
    {description = "focus previous by index", group = "client"}),
    -- ===================================================================
    awful.key({modkey}, "w", function()
        notifPop.visible = not notifPop.visible
    end, {description = "show notifs", group = "awesome"}),
    -- ===================================================================
    awful.key({modkey}, "d", function()
        panelPop.visible = not panelPop.visible
        calPop.visible = not calPop.visible
    end, {description = "show panel", group = "awesome"}),
    
    -- ===================================================================
    awful.key({modkey, "Control"}, "j",
        function() awful.screen.focus_relative(1) end,
    {description = "focus the next screen", group = "screen"}),
    -- ===================================================================
    awful.key({modkey}, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),
    -- ===================================================================
    awful.key({modkey}, "Escape",
        function() exit_screen_show() end,
    {description = "show exit screen", group = "awesome"}),
    -- ===================================================================
    -- launch rofi app menu *Note* this is bound to just mod4 thanks to xcape
    awful.key({modkey, "Control"}, "Escape", function()
        awful.spawn(
        "rofi  -show drun -theme ~/.config/awesome/external/rofi/appmenu/rofi.rasi")
    end, {description = "Application Launcher", group = "Launcher"}),
    
    -- ===================================================================
    awful.key({}, "XF86AudioRaiseVolume",
    function() awful.spawn("amixer -D pulse sset Master 5%+") end),
    -- ===================================================================
    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn("amixer -D pulse sset Master 5%-")
    end),
    -- ===================================================================
    awful.key({}, "XF86AudioMute", function()
        awful.spawn("amixer -D pulse set Master 1+ toggle")
    end),
    -- ===================================================================
    awful.key({modkey}, "Print", function()
        awful.spawn.with_shell("~/.config/awesome/external/screenshots area")
    end),
    -- ===================================================================
    awful.key({modkey, "Shift"}, "Print", function()
        awful.spawn.with_shell("~/.config/awesome/external/screenshots full")
    end),
    -- ===================================================================
    awful.key({}, "XF86MonBrightnessUp",
    function() awful.spawn("light -A 10") end),
    -- ===================================================================
    awful.key({}, "XF86MonBrightnessDown",
    function() awful.spawn("light -U 10") end),
    -- ===================================================================
    awful.key({modkey}, "Return",
        function() awful.spawn(terminal) end,
    {description = "open a terminal", group = "launcher"}),
    
    -- ===================================================================
    awful.key({modkey}, "r", awesome.restart,
    {description = "reload awesome", group = "awesome"}),
    
    -- ===================================================================
    awful.key({modkey}, "l",
        function() awful.tag.incmwfact(0.05) end,
    {description = "increase master width factor", group = "layout"}),
    -- ===================================================================
    awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.05) end,
    {description = "decrease master width factor", group = "layout"}),
    
    -- ===================================================================
    awful.key({modkey, "Shift"}, "h",
        function() awful.tag.incnmaster(1, nil, true) end,
    {description = "increase the number of master clients", group = "layout"}),
    -- ===================================================================
    awful.key({modkey, "Shift"}, "l",
        function() awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}),
    -- ===================================================================
    awful.key({modkey, "Control"}, "h",
        function() awful.tag.incncol(1, nil, true) end,
    {description = "increase the number of columns", group = "layout"}),
    
    -- ===================================================================
    awful.key({modkey, "Control"}, "l",
        function() awful.tag.incncol(-1, nil, true) end,
    {description = "decrease the number of columns", group = "layout"}),
    -- ===================================================================
    awful.key({modkey, "Control"}, "Down", function (c)
        helpers.resize_dwim(client.focus, "down")
    end),
    -- ===================================================================
    awful.key({modkey, "Control"}, "Up", function (c)
        helpers.resize_dwim(client.focus, "up")
    end),
    -- ===================================================================
    awful.key({modkey, "Control"}, "Left", function (c)
        helpers.resize_dwim(client.focus, "left")
    end),
    -- ===================================================================
    awful.key({modkey, "Control"}, "Right", function (c)
        helpers.resize_dwim(client.focus, "right")
    end),
    -- ===================================================================
    awful.key({modkey}, "space",
        function() awful.layout.inc(1) end,
    {description = "select next", group = "layout"}),
    -- ===================================================================
    awful.key({modkey, "Shift"}, "space",
        function() awful.layout.inc(-1) end,
    {description = "select previous", group = "layout"}),
    -- ===================================================================
    awful.key({modkey, "Control"}, "n", function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:emit_signal("request::activate", "key.unminimize", {raise = true})
        end
    end, {description = "restore minimized", group = "client"}))
    
    -- ========================================================================
    --  Client Keys
    -- ========================================================================
    
    clientkeys = gears.table.join(
        -- ===================================================================
        awful.key({modkey, "Shift"}, "f", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {description = "toggle fullscreen", group = "client"}),
        
        -- ===================================================================
        awful.key({modkey}, "x", function(c) c:kill() end,
        {description = "close", group = "client"}),
        -- ===================================================================
        awful.key({modkey, "Control"}, "space", awful.client.floating.toggle,
        {description = "toggle floating", group = "client"}),
        awful.key({modkey, "Control"}, "Return",
            function(c)
            c:swap(awful.client.getmaster())end,
        {description = "move to master", group = "client"}),
        -- ===================================================================
        
        awful.key({modkey}, "o",
            function(c) c:move_to_screen() end,
        {description = "move to screen", group = "client"}),
        -- ===================================================================
        awful.key({modkey, shift}, "f", function(c)
            c.floating = not c.floating
            c.width = 400
            c.height = 200
            awful.placement.bottom_right(c)
            c.sticky = not c.sticky
        end, {description = "toggle keep on top", group = "client"}),
        -- ===================================================================
        awful.key({modkey}, "n", function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end, {description = "minimize", group = "client"}),
        -- ===================================================================
        awful.key({modkey}, "m", function(c)
            c.maximized = not c.maximized
            c:raise()
        end, {description = "(un)maximize", group = "client"}),
        -- ===================================================================
        awful.key({modkey, "Control"}, "m", function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end, {description = "(un)maximize vertically", group = "client"}),
        -- ===================================================================
        awful.key({modkey, "Shift"}, "m", function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end, {description = "(un)maximize horizontally", group = "client"}),
        -- ===================================================================
        awful.key({modkey}, "=",
        function() helpers.resize_gaps(5) end),
        -- ===================================================================
        awful.key({modkey}, "-",
        function() helpers.resize_gaps(-5) end),
        -- ===================================================================
        awful.key({modkey}, "c", function(c)
            awful.placement.centered(c, {honor_workarea = true, honor_padding = true})
            helpers.single_double_tap(nil, function()
                helpers.float_and_resize(c, screen_width * 0.25, screen_height * 0.28)
            end)
        end),
        -- ===================================================================
        
        awful.key({modkey}, 'Up',
            function(c)
                c:relative_move(0, dpi(-10), 0, 0)
            end, {description = 'move floating client up by 10 px', group = 'client'}),
            -- ===================================================================
            
            awful.key({modkey}, 'Down', function(c)
                c:relative_move(0, dpi(10), 0, 0)
            end,
        {description = 'move floating client down by 10 px', group = 'client'}),
        -- ===================================================================
        awful.key(
            {modkey},
            'Left',
            function(c)
                c:relative_move(dpi(-10), 0, 0, 0)
            end,
        {description = 'move floating client to the left by 10 px', group = 'client'}),
        -- ===================================================================
        awful.key(
            {modkey},
            'Right',
            function(c)
                c:relative_move(dpi(10), 0, 0, 0)
            end,
        {description = 'move floating client to the right by 10 px', group = 'client'}),
        -- ===================================================================
        awful.key(
            {modkey, 'Shift'},
            'Up',
            function(c)
                c:relative_move(0, dpi(-10), 0, dpi(10))
            end,
        {description = 'increase floating client size vertically by 10 px up', group = 'client'}),
        -- ===================================================================
        
        awful.key(
            {modkey, 'Shift'},
            'Down',
            function(c)
                c:relative_move(0, 0, 0, dpi(10))
            end,
        {description = 'increase floating client size vertically by 10 px down', group = 'client'}),
        -- ===================================================================
        
        awful.key(
            {modkey, 'Shift'},
            'Left',
            function(c)
                c:relative_move(dpi(-10), 0, dpi(10), 0)
            end,
        {description = 'increase floating client size horizontally by 10 px left', group = 'client'}),
        -- ===================================================================
        awful.key(
            {modkey, 'Shift'},
            'Right',
            function(c)
                c:relative_move(0, 0, dpi(10), 0)
            end,
        {description = 'increase floating client size horizontally by 10 px right', group = 'client'}),
        -- ===================================================================
        
        awful.key(
            {modkey, 'Control'},
            'Up',
            function(c)
                if c.height > 10 then
                    c:relative_move(0, 0, 0, dpi(-10))
                end
            end,
        {description = 'decrease floating client size vertically by 10 px up', group = 'client'}),
        awful.key(
            {modkey, 'Control'},
            'Down',
            function(c)
                local c_height = c.height
                c:relative_move(0, 0, 0, dpi(-10))
                if c.height ~= c_height and c.height > 10 then
                    c:relative_move(0, dpi(10), 0, 0)
                end
            end,
        {description = 'decrease floating client size vertically by 10 px down', group = 'client'}),
        awful.key(
            {modkey, 'Control'},
            'Left',
            function(c)
                if c.width > 10 then
                    c:relative_move(0, 0, dpi(-10), 0)
                end
            end,
        {description = 'decrease floating client size horizontally by 10 px left', group = 'client'}),
        awful.key(
            {modkey, 'Control'},
            'Right',
            function(c)
                local c_width = c.width
                c:relative_move(0, 0, dpi(-10), 0)
                if c.width ~= c_width and c.width > 10 then
                    c:relative_move(dpi(10), 0, 0, 0)
                end
            end,
        {description = 'decrease floating client size horizontally by 10 px right', group = 'client'})
        
    )
    
    -- ========================================================================
    --  Tag Bindings
    -- ========================================================================
    
    for i = 1, 9 do
        -- View tag only.
        globalkeys = gears.table.join(globalkeys,
            -- ===================================================================
            awful.key({modkey}, "#" .. i + 9,
                function()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                if tag then tag:view_only() end end,
            {description = "view tag #" .. i, group = "tag"}),
            -- ===================================================================
            awful.key({modkey, "Control"}, "#" .. i + 9,
                function()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                if tag then awful.tag.viewtoggle(tag) end end,
            {description = "toggle tag #" .. i, group = "tag"}),
            -- ===================================================================
            awful.key({modkey, "Shift"}, "#" .. i + 9,
                function() if client.focus then
                    local tag = client.focus.screen.tags[i]
                if tag then client.focus:move_to_tag(tag) end end end,
            {description = "move focused client to tag #" .. i, group = "tag"}),
            -- ===================================================================
            awful.key({modkey, "Control", "Shift"}, "#" .. i + 9, function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                if tag then client.focus:toggle_tag(tag) end end end,
            {description = "toggle focused client on tag #" .. i, group = "tag"})) end
            -- ===================================================================
            
            clientbuttons = gears.table.join(
                awful.button({}, 1, function(c)
                c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
                -- ===================================================================
                
                awful.button({modkey}, 1, function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    if c.maximized == true then c.maximized = false end
                    
                    -- ===================================================================
                    
                awful.mouse.client.move(c) end),
                awful.button({modkey}, 3, function(c)
                c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.resize(c) end)
                
            )
            
            -- ===================================================================
            
            -- Set keys
            root.keys(globalkeys)
            -- EOF ------------------------------------------------------------------------
            
