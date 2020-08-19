--  ________ __ __
-- |  |  |  |__|  |--.---.-.----.
-- |  |  |  |  |  _  |  _  |   _|
-- |________|__|_____|___._|__|

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox = require("wibox")
local vicious = require("vicious")
-- Custom Local Library: Common Functional Decoration
local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist = require("deco.taglist"),
tasklist = require("deco.tasklist")}

local taglist_buttons = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}
local W = {}
local F = {} -- Format

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    --Memory Widget
    memwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.mem)
    vicious.register(memwidget, vicious.widgets.mem, " RAM: $1%", 3)
    
    --Memory Widget
    cpuwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.cpu)
    vicious.register(cpuwidget, vicious.widgets.cpu, " CPU: $1% ", 3)
    
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function () awful.layout.inc(1) end),
    awful.button({}, 3, function () awful.layout.inc(-1) end)))
    
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }
    
    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }
    
    -- Create the wibox
    s.mywibox = awful.wibar({position = "bottom", screen = s, bg = "#292b35cc", height = 35})
    
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {-- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        {-- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
    -- Create the wibox
    s.mywibox2 = awful.wibar({position = "top", screen = s, bg = "#292b35cc", height = 15})
    
    -- Add widgets to the wibox
    s.mywibox2:setup {
        layout = wibox.layout.align.horizontal,
        {-- Left widgets
            layout = wibox.layout.align.horizontal,
            RC.launcher,
            align = "left",
        },
        mytextclock, -- Middle widget
        expand = "none",
        align = "center",
        
        {-- Right widgets
            layout = wibox.layout.fixed.horizontal,
            align = "right",
            cpuwidget,
            memwidget,
        },
    }
end)

-- }}}
