-----------------------------------------------------------------
---------------------     Statusbar(s)      ---------------------
-----------------------------------------------------------------
-- Standard awesome library
local gears = require("gears")
local awful     = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local widgets = {
    wallpaper = require("widgets.wallpaper"),
    taglist   = require("widgets.taglist"),
    tasklist  = require("widgets.tasklist"),

}
local calendar_widget = require("widgets.calendar")
local vicious = require("vicious")
require("configuration.menu")
local taglist_buttons  = widgets.taglist()
local tasklist_buttons = widgets.tasklist()
local naughty = require("naughty")
local home = os.getenv("HOME")
local vicious = require("vicious")
local keygrabber = require("awful.keygrabber")
local clickable_container = require('widgets.clickable-container')

local helpers = require("configuration.helpers")
local _M = {}


local spacer ={
    widget =  wibox.container.background,
    forced_width = dpi(100)
}
function pad(size)
    local str = ""
    for i = 1, size do
        str = str .. " "
    end
    local pad = wibox.widget.textbox(str)
    return pad

end
local systray = wibox.widget.systray()
systray:set_horizontal(true)
systray:set_base_size(32)

local build_widget = function(widget)
    return wibox.widget {
        {
            widget,
            bg = beautiful.groups_title_bg,
            shape = function(cr, w, h)
                gears.shape.rounded_rect(cr, w, h, dpi(6))
            end,
            widget = wibox.container.background
        },
        top = dpi(10),
        bottom = dpi(10),
        widget = wibox.container.margin
    }
end

-- cpu widget
local cpu = wibox.widget.textbox()
vicious.cache(vicious.widgets.cpu)
vicious.register(cpu, vicious.widgets.cpu, " <span color='#00caff'> CPU: </span> $1%  ", 4)
cpu.font = "SF TransRobotics 16"
-- memory widget
local mem = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(mem, vicious.widgets.mem, " <span  color='#ff9cff'> Mem: </span>  $1%  ", 4)
mem.font = "SF TransRobotics 16"
-- Create a textclock widget
mytextclock = wibox.widget.textclock()
local cw = calendar_widget({
    placement = 'bottom_right'
})
mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout   = {
            spacing = 1,
            top = 5,
            layout  = wibox.layout.grid.horizontal,
                shape  = gears.shape.rounded_rect,

        },
        shape  = gears.shape.rounded_bar,

    }
    s.screen_rec 	= require('widgets.screen-recorder')()
    s.end_session	= require('widgets.end-session')()
s.network = require('widgets.network')()
    s.bluetooth = require('widgets.bluetooth')()

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = tasklist_buttons,
        style    = {
            shape_border_width = 0,
            shape_border_color = beautiful.xforeground,
            shape  = gears.shape.bar,
        },
        layout   = {
            spacing = 1,
            spacing_widget = {
                {
                    forced_width = 150,
                    shape  = gears.shape.square,
                    color        = beautiful.xbackground,
                    widget       = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                margin = dpi(3),
                widget = wibox.container.place,
            },
            layout  = wibox.layout.fixed.horizontal
        },
    }
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 35, ontop = true })

    -- Add widgets to the wibox
    s.mywibox:setup {

        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            spacer,

        },
        {-- Middle widgets

            {
                s.mytaglist,
                widget = wibox.container.margin,

            },
            widget = wibox.container.background,
            layout = wibox.layout.fixed.horizontal,
            align="center",


        },
        { -- Right widgets
            layout = wibox.layout.align.horizontal,
            cpu,
            mem,

            right=10,
            align = "right",

        },
        layout = wibox.layout.align.horizontal,
        expand = "none",
        spacing =10,


    }
    s.mywibox2 = awful.wibar({ position = "bottom", screen = s, height = 30, ontop = true })

    -- Add widgets to the wibox
    s.mywibox2:setup {
        layout      = wibox.layout.align.horizontal,
        { -- Left widgets
            layout  = wibox.layout.fixed.horizontal,
            s.mypromptbox,
            require('widgets.xdg-folders'),
            left    = dpi(10),
            spacing = 10,
            spacer,

        },
        { -- Middle widget
            s.mytasklist,
            s.add_button,
            -- Add top and bottom margins to force text to one line
            widget = wibox.container.margin,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 10,
            mytextclock,
            s.screen_rec,
            s.network,
            s.end_session,

        },


    }
end)
-- }}}