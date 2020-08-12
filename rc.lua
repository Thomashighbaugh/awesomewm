--       █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗
--      ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝
--      ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗
--      ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝
--      ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗
--      ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================

-- Standard awesome library
local gears = require( "gears" )
local awful = require( "awful" )

-- Import theme
local beautiful = require( "beautiful" )
beautiful.init( gears.filesystem.get_configuration_dir( ) .. "/theme/theme.lua" )

-- Import Keybinds
local keys = require( "keys" )
root.keys( keys.globalkeys )
root.buttons( keys.desktopbuttons )

-- Import rules
local create_rules = require( "rules" ).create
awful.rules.rules = create_rules( keys.clientkeys, keys.clientbuttons )

-- Import notification appearance
require( "components.notifications" )

-- Import components
require( "components.wallpaper" )
require( "components.exit-screen" )
require( "components.volume-adjust" )
require( "configuration" )
-- Autostart specified apps
local apps = require( "apps" )
apps.autostart( )

-- ===================================================================
-- Set Up Screen & Connect Signals
-- ===================================================================

-- Import panels
local bottom_panel = require( "components.bottom-panel" )
local top_panel = require( "components.top-panel" )

-- Set up each screen (add tags & panels)
awful.screen.connect_for_each_screen( function( s )
    -- Only add the left panel on the primary screen
    -- Add the top panel to every screen
    top_panel.create( s )
    bottom_panel.create( s )
end )

-- remove gaps if layout is set to max
tag.connect_signal( 'property::layout', function( t )
    local current_layout = awful.tag.getproperty( t, 'layout' )
    if ( current_layout == awful.layout.suit.max ) then
        t.gap = 0
    else
        t.gap = beautiful.useless_gap
    end
end )

-- Signal function to execute when a new client appears.
client.connect_signal( "manage", function ( c )
    -- Set the window as a slave (put it at the end of others instead of setting it as master)
    if not awesome.startup then
        awful.client.setslave( c )
    end
    
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen( c )
    end
end )

-- ===================================================================
-- Client Focusing
-- ===================================================================

-- Autofocus a new client when previously focused one is closed
require( "awful.autofocus" )

-- Focus clients under mouse
client.connect_signal( "mouse::enter", function( c )
    c:emit_signal( "request::activate", "mouse_enter", { raise = false })
end )

-- ===================================================================
-- Garbage collection (allows for lower memory consumption)
-- ===================================================================

collectgarbage( "setpause", 110 )
collectgarbage( "setstepmul", 1000 )
