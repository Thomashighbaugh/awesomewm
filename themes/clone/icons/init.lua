local gears = require( "gears" )
local xresources = require( "beautiful.xresources" )

local xrdb = xresources.get_current_theme( )

local function file_exists( path )
    -- Try to open it
    local f = io.open( path )
    if f then
        f:close( )
        return true
    end
    return false
end

local icons = { }
icons.image = { }
icons.text = { }

-- TODO Set up weather text icons here instead of in ../noodle/text_weather.lua
-- icons.text.weather = {}

-- Set up text symbols and accent colors to be used in tasklists or docks
-- instead of awful.widget.clienticon
-- Based on the client's `class` property
-- TODO Ability to match using rules instead of just class
icons.text.by_class = {
    -- Terminals
    [ 'kitty' ] = { symbol = "", color = xrdb.color5 },
    [ 'Alacritty' ] = { symbol = "", color = xrdb.color5 },
    [ 'Termite' ] = { symbol = "", color = xrdb.color5 },
    [ 'URxvt' ] = { symbol = "", color = xrdb.color5 },
    [ 'st' ] = { symbol = "", color = xrdb.color5 },
    [ 'st-256color' ] = { symbol = "", color = xrdb.color5 },
    
    -- Image viewers
    [ 'feh' ] = { symbol = "", color = xrdb.color1 },
    [ 'Sxiv' ] = { symbol = "", color = xrdb.color1 },
    
    -- General
    [ 'TelegramDesktop' ] = { symbol = "", color = xrdb.color4 },
    [ 'Firefox' ] = { symbol = "", color = xrdb.color3 },
    [ 'firefox' ] = { symbol = "", color = xrdb.color3 },
    [ 'Nightly' ] = { symbol = "", color = xrdb.color4 },
    [ 'Chromium' ] = { symbol = "", color = xrdb.color4 },
    [ 'Chromium-browser' ] = { symbol = "", color = xrdb.color4 },
    [ 'Steam' ] = { symbol = "", color = xrdb.color2 },
    [ 'Lutris' ] = { symbol = "", color = xrdb.color6 },
    [ 'editor' ] = { symbol = "", color = xrdb.color5 },
    [ 'Emacs' ] = { symbol = "", color = xrdb.color2 },
    [ 'email' ] = { symbol = "", color = xrdb.color6 },
    [ 'music' ] = { symbol = "", color = xrdb.color6 },
    [ 'mpv' ] = { symbol = "", color = xrdb.color6 },
    [ 'KeePassXC' ] = { symbol = "", color = xrdb.color1 },
    [ 'Gucharmap' ] = { symbol = "", color = xrdb.color6 },
    [ 'Pavucontrol' ] = { symbol = "", color = xrdb.color4 },
    [ 'htop' ] = { symbol = "", color = xrdb.color2 },
    [ 'Screenruler' ] = { symbol = "", color = xrdb.color3 },
    [ 'Galculator' ] = { symbol = "", color = xrdb.color2 },
    [ 'Zathura' ] = { symbol = "", color = xrdb.color2 },
    [ 'Qemu-system-x86_64' ] = { symbol = "", color = xrdb.color3 },
    [ 'Wine' ] = { symbol = "", color = xrdb.color1 },
    [ 'markdown_input' ] = { symbol = "", color = xrdb.color2 },
    [ 'scratchpad' ] = { symbol = "", color = xrdb.color1 },
    [ 'weechat' ] = { symbol = "", color = xrdb.color5 },
    [ 'discord' ] = { symbol = "", color = xrdb.color5 },
    [ '6cord' ] = { symbol = "", color = xrdb.color3 },
    [ 'libreoffice-writer' ] = { symbol = "", color = xrdb.color4 },
    [ 'libreoffice-calc' ] = { symbol = "", color = xrdb.color2 },
    [ 'libreoffice-impress' ] = { symbol = "", color = xrdb.color1 },
    [ 'Godot' ] = { symbol = "", color = xrdb.color4 },
    
    -- File managers
    [ 'Thunar' ] = { symbol = "", color = xrdb.color3 },
    [ 'Nemo' ] = { symbol = "", color = xrdb.color3 },
    [ 'files' ] = { symbol = "", color = xrdb.color3 },
    
    [ 'Gimp' ] = { symbol = "", color = xrdb.color4 },
    [ 'Inkscape' ] = { symbol = "", color = xrdb.color2 },
    [ 'Gpick' ] = { symbol = "", color = xrdb.color6 },
    
    -- Default
    [ '_' ] = { symbol = "", color = xrdb.color7.."99" }
}

-- Available icons
local image_icon_names = {
    "playerctl_toggle",
    "playerctl_prev",
    "playerctl_next",
    "stats",
    "search",
    "volume",
    "muted",
    "firefox",
    "youtube",
    "reddit",
    "discord",
    "telegram",
    "steam",
    "games",
    "files",
    "manual",
    "keyboard",
    "appearance",
    "editor",
    "redshift",
    "gimp",
    "terminal",
    "mail",
    "music",
    "temperature",
    "battery",
    "battery_charging",
    "cpu",
    "compositor",
    "start",
    "ram",
    "screenshot",
    "home",
    "alarm",
    "alarm_off",
    "alert",
    "submenu",
    -- Weather icons
    "cloud",
    "dcloud",
    "ncloud",
    "sun",
    "star",
    "rain",
    "snow",
    "mist",
    "storm",
    "whatever",
    -- Exit screen icons
    "exit",
    "poweroff",
    "reboot",
    "suspend",
    "lock",
}

-- Path to icons
local p

-- Assumes all the icon files end in .png
-- TODO maybe automatically detect icons in icon theme directory
local function set_image_icon( icon_name )
    local i = p..icon_name..".png"
    icons.image[ icon_name ] = i
end

-- Set all the icon variables
function icons.init( theme_name )
    -- Set the path to image icons
    p = gears.filesystem.get_configuration_dir( ) .. "icons/"..theme_name.."/"
    
    for i = 1, #image_icon_names do
        set_image_icon( image_icon_names[ i ])
    end
    
    -- Set symbols and accent colors for text icons
end

return icons
