-------------------------------------------------
-- CPU Widget for Awesome Window Manager
-- Shows the current CPU utilization
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/cpu-widget

-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local vicious = require("external.lib.vicious")

-- cpu widget
local cpu = wibox.widget.textbox()
vicious.cache(vicious.widgets.cpu)
vicious.register(cpu, vicious.widgets.cpu, " <span color='" .. beautiful.xcolor4 .. "'> CPU: </span> $1%  ", 4)
cpu.font = beautiful.font .. " 16"

local CMD =
    [[sh -c "grep '^cpu.' /proc/stat; ps -eo '%p|%c|%C|' -o "%mem" -o '|%a' --sort=-%cpu ]] ..
    [[| head -11 | tail -n +2"]]

local HOME_DIR = os.getenv("HOME")
local WIDGET_DIR = HOME_DIR .. "/.config/awesome/awesome-wm-widgets/cpu-widget"

local cpu_widget = {}
local cpu_rows = {
    spacing = 0,
    layout = wibox.layout.fixed.vertical
}
local is_update = true
local process_rows = {
    layout = wibox.layout.fixed.vertical
}

-- Splits the string by separator
-- @return table with separated substrings
local function split(string_to_split, separator)
    if separator == nil then
        separator = "%s"
    end
    local t = {}

    for str in string.gmatch(string_to_split, "([^" .. separator .. "]+)") do
        table.insert(t, str)
    end

    return t
end

-- Checks if a string starts with a another string
local function starts_with(str, start)
    return str:sub(1, #start) == start
end

local function create_textbox(args)
    return wibox.widget {
        text = args.text,
        align = args.align or "left",
        markup = args.markup,
        forced_width = args.forced_width or 60,
        widget = wibox.widget.textbox
    }
end

local function create_process_header(params)
    local res =
        wibox.widget {
        create_textbox {markup = "<b>   PID</b>"},
        create_textbox {markup = "<b>         Name</b>"},
        {
            create_textbox {markup = "<b> CPU</b>"},
            create_textbox {markup = "<b> MEM</b>"},
            params.with_action_column and create_textbox {forced_width = 60} or nil,
            layout = wibox.layout.align.horizontal
        },
        layout = wibox.layout.ratio.horizontal
    }
    res:ajust_ratio(2, 0.2, 0.47, 0.33)

    return res
end

local function create_kill_process_button()
    return wibox.widget {
        {
            id = "icon",
            image = "~/.config/awesome/external/lib/awesome-wm-widgets/cpu-widget/window-close-symbolic.svg",
            resize = false,
            opacity = 1,
            widget = wibox.widget.imagebox
        },
        widget = wibox.container.background
    }
end

local function worker(user_args)
    local args = user_args or {}

    local width = args.width or 50
    local step_width = args.step_width or 2
    local step_spacing = args.step_spacing or 1
    local color = args.color or beautiful.fg_normal
    local enable_kill_button = args.enable_kill_button or true
    local process_info_max_length = args.process_info_max_length or -1
    local timeout = args.timeout or 1

    local cpugraph_widget =
        wibox.widget {
        max_value = 100,
        background_color = "#00000000",
        forced_width = width,
        step_width = step_width,
        step_spacing = step_spacing,
        widget = wibox.widget.graph,
        color = "linear:0,0:0,20:0,beautiful.xcolor1:0.3,beautiful.xcolor4:0.6," .. color
    }

    local popup =
        awful.popup {
        ontop = true,
        visible = false,
        shape = gears.shape.rounded_rect,
        border_width = 1,
        border_color = beautiful.bg_normal,
        maximum_width = 700,
        offset = {y = 5},
        widget = {}
    }

    -- Do not update process rows when mouse cursor is over the widget

    cpu:buttons(
        awful.util.table.join(
            awful.button(
                {},
                1,
                function()
                    if popup.visible then
                        popup.visible = not popup.visible
                    else
                        popup:move_next_to(mouse.current_widget_geometry)
                    end
                end
            )
        )
    )

    --- By default graph widget goes from left to right, so we mirror it and push up a bit
    cpu_widget =
        wibox.widget {
        cpu,
        bottom = 0,
        widget = wibox.container.margin
    }

    local cpus = {}
    watch(
        CMD,
        timeout,
        function(widget, stdout)
            local i = 1
            local j = 1
            for line in stdout:gmatch("[^\r\n]+") do
                if starts_with(line, "cpu") then
                    if cpus[i] == nil then
                        cpus[i] = {}
                    end

                    local name, user, nice, system, idle, iowait, irq, softirq, steal, _, _ =
                        line:match("(%w+)%s+(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)")

                    local total = user + nice + system + idle + iowait + irq + softirq + steal

                    local diff_idle = idle - tonumber(cpus[i]["idle_prev"] == nil and 0 or cpus[i]["idle_prev"])
                    local diff_total = total - tonumber(cpus[i]["total_prev"] == nil and 0 or cpus[i]["total_prev"])
                    local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

                    cpus[i]["total_prev"] = total
                    cpus[i]["idle_prev"] = idle

                    if i == 1 then
                        widget:add_value(diff_usage)
                    end

                    local row =
                        wibox.widget {
                        create_textbox {text = name, align = "center"},
                        create_textbox {text = math.floor(diff_usage), align = "center"},
                        {
                            max_value = 100,
                            value = diff_usage,
                            forced_height = 30,
                            forced_width = 150,
                            paddings = 1,
                            margins = 4,
                            border_width = 1,
                            border_color = beautiful.bg_focus,
                            background_color = beautiful.xbackground .. "cc",
                            bar_border_width = 1,
                            bar_border_color = beautiful.xcolor0,
                            color = "linear:150,0:0,0:0,#ff29a8:0.3,#0badff:0.9," .. beautiful.xcolor6,
                            widget = wibox.widget.progressbar
                        },
                        layout = wibox.layout.ratio.horizontal
                    }
                    row:ajust_ratio(2, 0.15, 0.15, 0.7)
                    cpu_rows[i] = row
                    i = i + 1
                else
                    if is_update == true then
                        local columns = split(line, "|")

                        local pid = columns[1]
                        local comm = columns[2]
                        local cpu = columns[3]
                        local mem = columns[4]
                        local cmd = columns[5]

                        local kill_proccess_button = enable_kill_button and create_kill_process_button() or nil

                        local pid_name_rest =
                            wibox.widget {
                            create_textbox {text = pid},
                            create_textbox {text = comm},
                            {
                                create_textbox {text = cpu, align = "center"},
                                create_textbox {text = mem, align = "center"},
                                kill_proccess_button,
                                layout = wibox.layout.fixed.horizontal
                            },
                            layout = wibox.layout.ratio.horizontal
                        }
                        --  pid_name_rest:ajust_ratio(2, 0.2, 0.47, 0.33)

                        local row =
                            wibox.widget {
                            {
                                pid_name_rest,
                                top = 4,
                                bottom = 4,
                                widget = wibox.container.margin
                            },
                            widget = wibox.container.background
                        }

                        row:connect_signal(
                            "mouse::enter",
                            function(c)
                                c:set_bg(beautiful.xbackground .. "dd")
                            end
                        )
                        row:connect_signal(
                            "mouse::leave",
                            function(c)
                                c:set_bg(beautiful.xbackground .. "bb")
                            end
                        )

                        if enable_kill_button then
                            kill_proccess_button:buttons(
                                awful.util.table.join(
                                    awful.button(
                                        {},
                                        1,
                                        function()
                                            row:set_bg("#ff29a8")
                                            awful.spawn.with_shell("kill -9 " .. pid)
                                        end
                                    )
                                )
                            )
                        end

                        awful.tooltip {
                            objects = {row},
                            mode = "outside",
                            preferred_positions = {"bottom"},
                            timer_function = function()
                                local text = cmd
                                if process_info_max_length > 0 and text:len() > process_info_max_length then
                                    text = text:sub(0, process_info_max_length - 3) .. "..."
                                end

                                return text:gsub("%s%-", "\n\t-"):gsub(":/", "\n\t\t:/") -- put arguments on a new line -- java classpath uses : to separate jars
                            end
                        }

                        process_rows[j] = row

                        j = j + 1
                    end
                end
            end
            popup:setup {
                {
                    cpu_rows,
                    {
                        orientation = "horizontal",
                        forced_height = 25,
                        color = beautiful.bg_focus,
                        widget = wibox.widget.separator
                    },
                    create_process_header {with_action_column = enable_kill_button},
                    process_rows,
                    layout = wibox.layout.fixed.vertical
                },
                margins = 0,
                widget = wibox.container.margin
            }
        end,
        cpugraph_widget
    )

    return cpu_widget
end

return setmetatable(
    cpu_widget,
    {
        __call = function(_, ...)
            return worker(...)
        end
    }
)
