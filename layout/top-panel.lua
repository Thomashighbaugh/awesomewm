local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local task_list = require('widget.task-list')
local vicious = require("vicious")
local top_panel = function(s)
    -- Initialize widget
cpuwidget = wibox.widget.textbox()
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, '<span  font_desc="Play Bold 14" color="#ff9cff"> CPU:</span> <span  font_desc="Play Bold 18">$1%</span> ', 2)
-- Memory
-- Initialize widget
memwidget = wibox.widget.textbox()
-- Register widget
vicious.register(memwidget, vicious.widgets.mem, '<span font_desc="Play Bold 14" color="#00caff">RAM:</span> <span  font_desc="Play Bold 18">$1%</span> ', 4)



    local panel = wibox
    {
        ontop = true,
        expand = "none",
        screen = s,
        type = "toolbar",
        height = dpi(28),
        width = s.geometry.width,
        x = s.geometry.x,
        y = s.geometry.y,
        stretch = false,
        bg = beautiful.background,
        fg = beautiful.fg_normal
    }
    
    panel:struts
    {
    top = dpi(28)}
    
    panel:connect_signal(
        'mouse::enter',
        function()
            local w = mouse.current_wibox
            if w then
                w.cursor = 'left_ptr'
            end
        end
    )

	local layoutbox = require('widget.layoutbox')(s)    
    local logout = require('widget.end-session')(s)
    local clock = require('widget.clock')(s)
--  local network = require('widget.network')(s)
    local  bluetooth = require('widget.bluetooth')(s)
    local  search = require('widget.search-apps')(s)
    local screen_rec = require('widget.screen-recorder')(s)

    local separator = wibox.widget {
        orientation = 'vertical',
        forced_height = dpi(1),
        forced_width = dpi(5),
        span_ratio = 0.55,
        widget = wibox.widget.separator
    }
    
    panel : setup {
            layout = wibox.layout.align.horizontal,
        {
        search,
         cpuwidget,
         separator,
         memwidget,
         spacing=dpi(10),
                    layout = wibox.layout.fixed.horizontal,
        },
            task_list(s),
        {
            layout = wibox.layout.fixed.horizontal,
screen_rec,
			bluetooth,
			network,
            clock,
            
            logout,
        },
    }
    
    return panel
end

return top_panel
