
-- ===================================================================
-- Initialization
-- ===================================================================

local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi
local awful = require("awful")
local gears = require("gears")

local tag_list = require("components.tag-list")
local separator = require("widgets.horizontal-separator")
local folder = require("widgets.folder")

local home_dir = os.getenv("HOME")
local tag_list = require('components.tag-list')

-- define module table
local bottom_panel = {}

-- ===================================================================
-- Bar Creation
-- ===================================================================

bottom_panel.create = function(s)
    
    local panel = awful.wibar({
        screen = s,
        width = beautiful.bottom_panel_width,
        position = "bottom",
        ontop = true,
        bg = beautiful.transparent,
        height = beautiful.bottom_panel_height,
        
    })
    
    panel:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        {
            --            folder.create(home_dir),
            folder.create(home_dir .. "/dotfiles"),
            folder.create(home_dir .. "/Downloads"),
            folder.create("trash://"),
            
            layout = wibox.layout.fixed.horizontal,
        },
        tag_list(s),
        
        {
            layout = wibox.layout.fixed.horizontal,
            -- add taglist widget
            -- add folders widgets
            
            require("widgets.layout-box")
            
        },
        nil
    }
    
    -- panel background that becomes visible when client is maximized
    panel_bg = wibox({
        screen = s,
        position = "bottom",
        height = beautiful.top_panel_height,
        width = s.geometry.width,
        visible = false
    })
    
    -- ===================================================================
    -- Functionality
    -- ===================================================================
    
    -- hide panel when client is fullscreen
    client.connect_signal("property::fullscreen",
        function(c)
            panel.visible = not c.fullscreen
        end
    )
    
    -- maximize panel if client is maximized
    local function toggle_maximize_bottom_panel(is_maximized)
        panel_bg.visible = is_maximized
        if is_maximized then
            panel.shape = maximized_panel_shape
        else
            panel.shape = panel_shape
        end
    end
    
    -- maximize if a client is maximized
    client.connect_signal("property::maximized", function(c)
        toggle_maximize_bottom_panel(c.maximized)
    end)
    
    client.connect_signal("manage", function(c)
        if awful.tag.getproperty(c.first_tag, "layout") == awful.layout.suit.max then
            toggle_maximize_bottom_panel(true)
        end
    end)
    
    -- unmaximize if a client is removed and there are no maximized clients left
    client.connect_signal("unmanage", function(c)
        local t = awful.screen.focused().selected_tag
        -- if client was maximized
        if c.maximized then
            -- check if any clients that are open are maximized
            for _, c in pairs(t:clients()) do
                if c.maximized then
                    return
                end
            end
            toggle_maximize_bottom_panel(false)
            
            -- if tag was maximized
        elseif awful.tag.getproperty(t, "layout") == awful.layout.suit.max then
            -- check if any clients are open (and therefore maximized)
            for _ in pairs(t:clients()) do
                return
            end
            toggle_maximize_bottom_panel(false)
        end
    end)
    
    -- maximize if layout is maximized and a client is in the layout
    tag.connect_signal("property::layout", function(t)
        -- check if layout is maximized
        if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
            -- check if clients are open
            for _ in pairs(t:clients()) do
                toggle_maximize_bottom_panel(true)
                return
            end
            toggle_maximize_bottom_panel(false)
        else
            toggle_maximize_bottom_panel(false)
        end
    end)
    
    -- maximize if a tag is swapped to with a maximized client
    tag.connect_signal("property::selected", function(t)
        -- check if layout is maximized
        if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
            -- check if clients are open
            for _ in pairs(t:clients()) do
                toggle_maximize_bottom_panel(true)
                return
            end
            toggle_maximize_bottom_panel(false)
        else
            -- check if any clients that are open are maximized
            for _, c in pairs(t:clients()) do
                if c.maximized then
                    toggle_maximize_bottom_panel(true)
                    return
                end
            end
            toggle_maximize_bottom_panel(false)
        end
    end)
end

return bottom_panel
