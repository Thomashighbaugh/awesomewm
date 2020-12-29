-- wibar.lua
-- Wibar (top bar)
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("main.helpers")
local icon_theme = "sheet"
local icons = require("icons")

local systray_margin = (beautiful.wibar_height - beautiful.systray_icon_size) / 2

-- Helper function that changes the appearance of progress bars and their icons
-- Create horizontal rounded bars
local function format_progress_bar(bar)
    bar.forced_width = dpi(100)
    bar.shape = gears.shape.rounded_bar
    bar.bar_shape = gears.shape.rounded_bar
    bar.background_color = beautiful.xbackground

    return bar
end

-- Awesome Panel -----------------------------------------------------------

local panelPop = require('layout.pop.panel')
local calPop = require('layout.pop.cal')
local awesome_icon = wibox.widget {
    {widget = wibox.widget.imagebox, image = icons.awesome, resize = true},
    margins = 2,
    layout = wibox.container.margin
}

awesome_icon:connect_signal("mouse::enter",
                            function() panelPop.visible = true end)

panelPop:connect_signal("mouse::leave", function() panelPop.visible = false end)

-- Notifs Panel ---------------------------------------------------------------
local fancy_time_widget = wibox.widget.textclock("%H%M")
fancy_time_widget.markup = fancy_time_widget.text:sub(1, 2) ..
                               "<span foreground='" .. beautiful.xcolor12 ..
                               "'>" .. fancy_time_widget.text:sub(3, 4) ..
                               "</span>"
fancy_time_widget:connect_signal("widget::redraw_needed", function()
    fancy_time_widget.markup = fancy_time_widget.text:sub(1, 2) ..
                                   "<span foreground='" .. beautiful.xcolor12 ..
                                   "'>" .. fancy_time_widget.text:sub(3, 4) ..
                                   "</span>"
end)
fancy_time_widget.align = "center"
fancy_time_widget.valign = "center"
fancy_time_widget.font = "FuraCode Nerd Font Mono Bold 10"

local fancy_time = {fancy_time_widget, layout = wibox.layout.fixed.vertical}

local notifPop = require("layout.pop.notif")
local notif_icon = wibox.widget {
    widget = wibox.widget.imagebox,
    image = icons.notif,
    resize = true
}

notif_icon:connect_signal("mouse::enter", function() notifPop.visible = true end)
notifPop:connect_signal("mouse::leave", function() notifPop.visible = false end)

-- Battery Bar Widget ---------------------------------------------------------

local battery_bar = require("widgets.battery_bar")
local battery = format_progress_bar(battery_bar)

-- Systray Widget -------------------------------------------------------------

local mysystray = wibox.widget.systray()
mysystray:set_base_size(beautiful.systray_icon_size)

local mysystray_container = {
    mysystray,
    left = dpi(1),
    right = dpi(1),
    screen = 1,
    widget = wibox.container.margin
}

-- Taglist Widget -------------------------------------------------------------

local taglist_buttons = gears.table.join(
                            awful.button({}, 1, function(t) t:view_only() end),
                            awful.button({modkey}, 1, function(t)

        if client.focus then client.focus:move_to_tag(t) end
    end), awful.button({}, 3, awful.tag.viewtoggle),
                            awful.button({modkey}, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end))

-- Tasklist Widget ------------------------------------------------------------

local tasklist_buttons = gears.table.join(
                             awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", {raise = true})
        end
    end), awful.button({}, 3, function()
        awful.menu.client_list({
            theme = {width = 550, font = "FuraCode Nerd Font Mono 12"}
        })
    end), awful.button({}, 4, function() awful.client.focus.byidx(1) end),
                             awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end))

-- Create the Wibar -----------------------------------------------------------

awful.screen.connect_for_each_screen(function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create layoutbox widget
    s.mylayoutbox = awful.widget.layoutbox(s)

    if s.index == 1 then
        mysystray_container.visible = true
    else
        mysystray_container.visible = false
    end

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "bottom",
        screen = s,
        ontop = true,
        bg = beautiful.wibar_bg .. "00"
    })
    s.mywibox:set_xproperty("WM_NAME", "panel")

    -- Remove wibar on full screen
    local function remove_wibar(c)
        if c.fullscreen or c.maximized then
            s.mywibox.visible = false
        else
            s.mywibox.visible = true
        end
    end

    client.connect_signal("property::fullscreen", remove_wibar)

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {shape = gears.shape.rectangle},
        layout = {spacing = 0, layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {
                {
                    {id = 'text_role', widget = wibox.widget.textbox},
                    layout = wibox.layout.fixed.horizontal
                },
                left = 5,
                right = 5,
                top = 1,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        },
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style = {
            shape = helpers.rrect(beautiful.border_radius),
            shape_border_width = beautiful.widget_border_width,
            shape_border_color = beautiful.widget_border_color
        },
        layout = {spacing = 2, layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {
                {
                    {id = 'text_role', widget = wibox.widget.textbox},
                    layout = wibox.layout.align.horizontal
                },
                left = dpi(2),
                right = dpi(2),
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        }
    }

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        expand = "true",
        {
            layout = wibox.layout.fixed.horizontal,
            {
                {
                    awesome_icon,
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 5,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },
            {
                {
                    s.mytaglist,
                    shape = helpers.rrect(beautiful.border_radius),
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 5,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },
            s.mypromptbox
        },
        {
            s.mytasklist,
            top = 5,
            right = 5,
            left = 5,
            -- without this the bar is whocky and pushes widgets off screen or is always too short.
            layout = wibox.layout.flex.horizontal,
            widget = wibox.container.margin
        },
        {

            {
                {
                    {
                        battery,
                        right = 5,
                        left = 5,
                        widget = wibox.container.margin
                    },
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 5,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },

            helpers.horizontal_pad(0),
            {
                {
                    {
                        mysystray_container,
                        top = dpi(6),
                        layout = wibox.container.margin
                    },
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,

                    widget = wibox.container.background
                },
                top = 5,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },
            helpers.horizontal_pad(0),
            {
                {
                    {
                        notif_icon,
                        margins = dpi(1),
                        widget = wibox.container.margin
                    },
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 5,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },
            {
                {
                    {
                        fancy_time,
                        margins = dpi(5),
                        widget = wibox.container.margin
                    },
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 5,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },
            {
                {
                    {
                        s.mylayoutbox,
                        margins = dpi(2),
                        widget = wibox.container.margin
                    },
                    shape = helpers.rrect(beautiful.border_radius),
                    bg = beautiful.xbackground,
                    border_width = beautiful.widget_border_width,
                    border_color = beautiful.widget_border_color,
                    widget = wibox.container.background
                },
                top = 5,
                right = 5,
                left = 5,
                widget = wibox.container.margin
            },

            layout = wibox.layout.fixed.horizontal
        }
    }
end)

-- EOF ------------------------------------------------------------------------
