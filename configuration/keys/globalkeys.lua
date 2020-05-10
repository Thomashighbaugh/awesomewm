-----------------------------------------------------------------
---------------------     Global Keys      ----------------------
-----------------------------------------------------------------

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Pop Up Display Key Bindings
local hotkeys_popup = require("awful.hotkeys_popup")
-- Menubar library
local menubar = require("menubar")
local start_screen = require("widgets.start_screen")
-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal
local browser = RC.vars.browser
local file_manager = RC.vars.file_manager
require ("widgets.quake-terminal")
local _M = {}

-- reading @TODO add to wiki
-- https://awesomewm.org/wiki/Global_Keybindings

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalkeys = gears.table.join(

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Tag browsing
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "View Previous", group = "Tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "View Next", group = "Tag"}),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "Focus Next By Index", group = "Client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "Focus Previous By Index", group = "Client"}
    ),
    awful.key({ modkey,           }, "Delete", function () awful.spawn.with_shell("menu_power") end,
              {description = "Display Power Menu", group = "Launcher"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "Swap With Next Client by Index", group = "Client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "Swap with Previous Client by Index", group = "Client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "Focus on Next Screen", group = "Screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "Focus on Previous Screen", group = "Screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "Jump to Urgent Client", group = "Client"}),
    awful.key({ modkey,           }, "Tab", function () awful.client.focus.history.previous() if client.focus then client.focus:raise() end end,
        {description = "go back", group = "Client"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Standard Launchers

      awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "Launch Terminal", group = 'Launcher'}),
    awful.key({ modkey,           }, "b", function () awful.spawn(browser) end,
              {description = "Launch Internet Browser", group = 'Launcher'}),

    awful.key({ modkey,           }, "r", awesome.restart,
              {description = "Reload Awesome", group = 'Launcher'}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "Quit Awesome", group = 'Launcher'}),
  awful.key({ modkey, "Control"}, "Escape", function () awful.spawn("launcher") end,
        {description = "Launch Rofi Application Menu", group = 'Launcher'}),
    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

    -- Custom Launchers
    -- note: these are provided by ~/bin executables
       awful.key({ modkey,           }, "Escape", function () awful.spawn.with_shell("powermenu") end,
                 {description = "Launch System Power Menu", group = 'Launcher'}),
      -- Dropdown application
      awful.key({modkey,        }, '`', function() toggle_quake() end,
          {description = 'Toggle Terminal Dropdown', group = 'Launcher'}),

      awful.key({ modkey,           }, "F1",      hotkeys_popup.show_help,
          {description="Display Keybindings", group='Launcher'}),
    awful.key({ modkey,           }, "F2", function () awful.spawn(file_manager) end,
              {description = "Launch File Manager", group = 'Launcher'}),
       awful.key({ modkey,           }, "F3", function () awful.spawn.with_shell("menu_screenshot") end,
                 {description = "Launch Screenshot Menu", group = 'Launcher'}),
          awful.key({ modkey,           }, "F4", function()    start_screen_show() end,
                 {description = "Display Start Screen", group = 'Launcher'}),
                 awful.key({ modkey,           }, "F5", function()    awful.spawn.with_shell("monitor_layout") end,
                 {description = "Display Brightness Menu", group = 'Launcher'}),
                 awful.key({ modkey,           }, "F7", function()    awful.spawn.with_shell("fa-rofi") end,
                 {description = "Copy Font-Awesome Icons to Clipboard", group = 'Launcher'}),
                      awful.key({ modkey,"Control"           }, "F7", function()    awful.spawn.with_shell("emojipick") end,
                 {description = "Copy Font-Awesome Icons to Clipboard", group = 'Launcher'}),
                 awful.key({ modkey,           }, "F8", function () awful.spawn.with_shell("networkmenu") end,
                 {description = "Launch Network Manager Menu", group = 'Launcher'}),
                 awful.key({ modkey,           }, "F9", function () awful.spawn.with_shell("terminator") end,
                 {description = "View Processes and Terminate As Necessary", group = 'Launcher'}),
                 awful.key({ modkey,           }, "F9", function () awful.spawn.with_shell("menu_network") end,
                 {description = "View Processes and Terminate As Necessary", group = 'Launcher'}),
    -- Layout manipulation
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "Increase Width Factor", group = "Layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "Decrease Width Factor", group = "Layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "Increase the Number of Master Clients", group = "Layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "Decrease the Number of Master Clients", group = "Layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "Increase the Number of Columns", group = "Layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "Decrease the Number of Columns", group = "Layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "Select Next", group = "Layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "Select Previous", group = "Layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "Restore Minimized", group = "Client"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Prompt
    awful.key({ modkey, "Control" },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "Run Prompt", group = 'Launcher'}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Resize
    --awful.key({ modkey, "Control" }, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
    --awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
    awful.key({ modkey, "Control" }, "Down",  
              function () awful.client.moveresize( 0, 0, 0, -20) end),
    awful.key({ modkey, "Control" }, "Up",    
              function () awful.client.moveresize( 0, 0, 0,  20) end),
    awful.key({ modkey, "Control" }, "Left",  
              function () awful.client.moveresize( 0, 0, -20, 0) end),
    awful.key({ modkey, "Control" }, "Right", 
              function () awful.client.moveresize( 0, 0,  20, 0) end),

    -- Move
    awful.key({ modkey, "Shift"   }, "Down",  
              function () awful.client.moveresize(  0,  20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Up",    
              function () awful.client.moveresize(  0, -20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Left",  
              function () awful.client.moveresize(-20,   0,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Right", 
              function () awful.client.moveresize( 20,   0,   0,   0) end),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "Show the Menubar", group = 'Launcher'})

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { 
  __call = function(_, ...) return _M.get(...) end 
})
