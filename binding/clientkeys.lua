--  ______ __ __               __     __  __
-- |      |  |__|.-----.-----.|  |_  |  |/  |.-----.--.--.-----.
-- |   ---|  |  ||  -__|     ||   _| |     < |  -__|  |  |__ --|
-- |______|__|__||_____|__|__||____| |__|\__||_____|___  |_____|
--                                                 |_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard Awesome library
local gears = require( "gears" )
local awful = require( "awful" )

local _M = { }
local modkey = RC.vars.modkey

-- ===================================================================
--  Bind Client Control Functions to Keys
-- ===================================================================
function _M.get( )
    local clientkeys = gears.table.join(
        
        -- ===================================================================
        -- Toggle Fullscreen
        awful.key({ modkey, }, "f",
            function ( c )
                c.fullscreen = not c.fullscreen
                c:raise( )
            end,
        { description = "Toggle fullscreen", group = "Client" }),
        
        -- ===================================================================
        -- close client
        awful.key({ modkey }, "x",
            function( c )
                c:kill( )
            end,
        { description = "close", group = "Client" }),
        
        -- ===================================================================
        -- Toggle Floating
        awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
        { description = "toggle floating", group = "Client" }),
        
        -- ===================================================================
        -- Move to Master
        awful.key({ modkey, "Control" }, "Return", function ( c ) c:swap( awful.client.getmaster( )) end,
        { description = "move to master", group = "Client" }),
        
        -- ===================================================================
        -- Move to Screen
        awful.key({ modkey, }, "o", function ( c ) c:move_to_screen( ) end,
        { description = "move to screen", group = "Client" }),
        
        -- ===================================================================
        -- Keep On Top
        awful.key({ modkey, }, "t", function ( c ) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "Client" }),
        
        -- ===================================================================
        -- Minimize
        awful.key({ modkey, }, "n",
            function ( c )
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end,
        { description = "minimize", group = "Client" }),
        
        -- ===================================================================
        -- Size Controls
        awful.key({ modkey, "Shift", "Control" }, "Up",
            function ( c )
                c.floating = not c.floating
                c.width = 1200
                c.x = ( c.screen.geometry.width - c.width ) * 0.5
                c.height = 1200
                c.y = ( c.screen.geometry.height - c.height ) * 0.5
            end,
        { description = "1200px * 1200px", group = "Client" }),
        
        awful.key({ modkey, "Shift", "Control" }, "Down",
            function ( c )
                c.floating = not c.floating
                c.width = c.screen.geometry.width * 0.25
                c.x = ( c.screen.geometry.width - c.width ) * 0.5
                c.height = c.screen.geometry.height * 0.25
                c.y = ( c.screen.geometry.height - c.height ) * 0.5
            end,
        { description = "25% X 25%", group = "Client" }),
        
        awful.key({ modkey, "Shift", "Control" }, "Left",
            function ( c )
                c.floating = not c.floating
                c.width = c.screen.geometry.width * 0.5
                c.x = ( c.screen.geometry.width - c.width ) * 0.25
                c.height = c.screen.geometry.height * 0.5
                c.y = c.screen.geometry.height * 0.25
            end,
        { description = "50% X 50%", group = "Client" }),
        
        awful.key({ modkey, "Shift", "Control" }, "Right",
            function ( c )
                c.floating = not c.floating
                c.width = c.screen.geometry.width * 0.75
                c.x = ( c.screen.geometry.width - c.width ) * 0.5
                c.height = c.screen.geometry.height * 0.75
                c.y = ( c.screen.geometry.height - c.height ) * 0.5
            end,
        { description = "75% X 75%", group = "Client" }),
        
        -- ===================================================================
        -- Resize
        --awful.key({ modkey, "Control" }, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
        --awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
        awful.key({ modkey, }, "Down",
        function ( ) awful.client.moveresize( 0, 0, 0, -20 ) end ),
        awful.key({ modkey, }, "Up",
        function ( ) awful.client.moveresize( 0, 0, 0, 20 ) end ),
        awful.key({ modkey, }, "Left",
        function ( ) awful.client.moveresize( 0, 0, -20, 0 ) end ),
        awful.key({ modkey, }, "Right",
        function ( ) awful.client.moveresize( 0, 0, 20, 0 ) end ),
        -- ===================================================================
        -- Move
        awful.key({ modkey, "Shift" }, "Down",
        function ( ) awful.client.moveresize( 0, 20, 0, 0 ) end ),
        awful.key({ modkey, "Shift" }, "Up",
        function ( ) awful.client.moveresize( 0, -20, 0, 0 ) end ),
        awful.key({ modkey, "Shift" }, "Left",
        function ( ) awful.client.moveresize( -20, 0, 0, 0 ) end ),
        awful.key({ modkey, "Shift" }, "Right",
        function ( ) awful.client.moveresize( 20, 0, 0, 0 ) end ),
        
        -- ===================================================================
        -- Toggle Titlebar
        awful.key({ modkey, "Control" }, "t",
            function ( c )
                awful.titlebar.toggle ( c, "top" )
            end,
        { description = "toggle titlebar", group = "Client" }),
        
        -- ===================================================================
        -- Maximized
        awful.key({ modkey, }, "m",
            function ( c )
                c.maximized = not c.maximized
                c:raise( )
            end,
        { description = "(un)maximize", group = "Client" }),
        awful.key({ modkey, "Control" }, "m",
            function ( c )
                c.maximized_vertical = not c.maximized_vertical
                c:raise( )
            end,
        { description = "(un)maximize vertically", group = "Client" }),
        awful.key({ modkey, "Shift" }, "m",
            function ( c )
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise( )
            end,
        { description = "(un)maximize horizontally", group = "Client" })),
        --     scratch.pad.set(c, width, height, sticky, screen)
        awful.key({ modkey }, "`",
            function( )
                scratch.pad.set( c, width, height, sticky, screen )
            end,
        { description = "Popup Terminal Launcher", group = "Launcher" })
        return clientkeys
    end
    
    -- ===================================================================
    
    return setmetatable({ }, {
        __call = function( _, ... ) return _M.get( ... ) end
    })
    
