
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

local tag_list = require('components.tag-list')
local task_list = require("components.task-list")
local layout_box = require("widgets.layout-box")

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
        layout = wibox.layout.align.horizontal,
        {
            --            folder.create(home_dir),
            
            tag_list(s),
            
            layout = wibox.layout.fixed.horizontal,
        },
        task_list.create(s),
        
        {
            layout = wibox.layout.fixed.horizontal,
            
            layout_box,
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
