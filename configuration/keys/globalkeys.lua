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
-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal
local browser = RC.vars.browser
local file_manager = RC.vars.file_manager
local helpers = require("configuration.helpers")
require ("widgets.quake-terminal")
local apps = require("configuration.apps")
local _M = {}
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

    awful.key({ modkey,           }, "r", awesome.restart,
              {description = "Reload Awesome", group = 'Launcher'}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "Quit Awesome", group = 'Launcher'}),
  awful.key({ modkey, "Control"}, "Escape", function () awful.spawn(apps.default.rofiappmenu) end,
        {description = "Launch Rofi Application Menu", group = 'Launcher'}),
    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

    -- Custom Launchers
    -- note: these are provided by ~/bin executables

-- Print Screen
       awful.key({ modkey,           }, "Print", function () awful.spawn(apps.default.screenshot) end,
                 {description = "Launch Screenshot Menu", group = 'Launcher'}),
-- Power Menu
        awful.key({ modkey,           }, "Delete", function () 	awesome.emit_signal("module::exit_screen_show") end,
              {description = "Display Power Menu", group = "Launcher"}),

-- Dropdown application
	--Note: this is internal to Rofi and is configured in Lua
      awful.key({modkey,        }, '`', function() toggle_quake() end,
          {description = 'Toggle Terminal Dropdown', group = 'Launcher'}),

-- Builtin Keybinding Help Dialog 
      awful.key({ modkey,           }, "Insert",      hotkeys_popup.show_help,
          {description="Display Keybindings", group='Launcher'}),

-- Start Screen 
          awful.key({ modkey,           }, "F1", function()    start_screen_show() end,
                 {description = "Display Start Screen", group = 'Launcher'}),

-- Start Screen 
          awful.key({ modkey, "Control"           }, "F1", function()  awful.spawn.with_shell("menu_apps") end,
                 {description = "Display Start Screen", group = 'Launcher'}),
                 
--Browser Launch                 
    awful.key({ modkey,           }, "F2", function () awful.spawn(browser) end,
              {description = "Launch Internet Browser", group = 'Launcher'}),

--Alternative Browser Launch                 
    awful.key({ modkey, "Shift" }, "F2", function () awful.spawn("basilisk") end,
              {description = "Launch Alternative Internet Browser", group = 'Launcher'}),

--File Manager
    awful.key({ modkey,           }, "F3", function () awful.spawn(file_manager) end,
              {description = "Launch File Manager", group = 'Launcher'}),
-- Terminal File Manager
    awful.key({ modkey, "Control" }, "F3", function () awful.spawn("ranger") end,
              {description = "Launch Terminal File Manager", group = 'Launcher'}),

-- Font Awesome Clipboard
                 awful.key({ modkey,           }, "F4", function()    awful.spawn.with_shell("fa-rofi") end,
                 {description = "Copy Font-Awesome Icons to Clipboard", group = 'Launcher'}),

                      awful.key({ modkey,"Control"           }, "F4", function()    awful.spawn.with_shell("emojipick") end,
                 {description = "Copy Emojis to Clipboard", group = 'Launcher'}),


                 awful.key({ modkey,           }, "F5", function()    awful.spawn.with_shell("sudo picom -b && notify-send 'Compton Activated'") end,
                 {description = "Turn on Picom", group = 'Launcher'}),


                 awful.key({ modkey, "Control"           }, "F5", function()    awful.spawn.with_shell("sudo pkill picom  && notify-send 'Compton Deactivated'") end,
                 {description = "Turn off Picom", group = 'Launcher'}),


                 awful.key({ modkey,           }, "F8", function () awful.spawn.with_shell("menu_network") end,
                 {description = "Launch Network Manager Menu", group = 'Launcher'}),


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
-- Minimize Windows 
    awful.key({ modkey,          }, "n",
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

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Resize
    --awful.key({ modkey, "Control" }, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
    --awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
    awful.key({ modkey, "Control"	 }, "Down", function (c)
        helpers.resize_dwim(client.focus, "down")
    end),
    awful.key({ modkey, "Control" }, "Up", function (c)
        helpers.resize_dwim(client.focus, "up")
    end),
    awful.key({ modkey, "Control" }, "Left", function (c)
        helpers.resize_dwim(client.focus, "left")
    end),
    awful.key({ modkey, "Control" }, "Right", function (c)
        helpers.resize_dwim(client.focus, "right")
    end)
    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { 
  __call = function(_, ...) return _M.get(...) end 
})
