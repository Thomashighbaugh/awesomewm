-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local clickable_container = require("widgets.clickable-container")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local beautiful = require("beautiful")
local defaults_apps = require("configurations.default-apps")
local PATH_TO_ICONS = os.getenv("HOME") .. "/.config/awesome/themes/vice/icons/battery/"
local naughty = require("naughty")
-- ===================================================================
-- Widget Creation
-- ===================================================================

local widget =
    wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = true,
        left = dpi(4),
        right = dpi(4)
    },
    layout = wibox.layout.align.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(0), dpi(0), dpi(0), dpi(0)))
widget_button:buttons(
    gears.table.join(
        awful.button(
            {},
            3,
            nil,
            function()
                awful.spawn(defaults_apps.power_manager)
            end
        )
    )
)
-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
local battery_popup =
    awful.tooltip(
    {
        objects = {widget_button},
        mode = "outside",
        align = "left",
        referred_positions = {"right", "left", "top", "bottom"}
    }
)

local function show_battery_warning()
    naughty.notify {
        icon = PATH_TO_ICONS .. "battery-empty.svg",
        icon_size = dpi(24),
        text = "Danger Will Robinson, Your Machine Is About to Give Up the Ghost!",
        title = "Battery is dying",
        timeout = 20,
        hover_timeout = 0.5,
        position = "top_right",
        bg = beautiful.xbackground,
        fg = beautiful.xforeground,
        width = 248
    }
end

local last_battery_check = os.time()

watch(
    "acpi -i",
    10,
    function(_, stdout)
        local battery_info = {}
        local capacities = {}
        for s in stdout:gmatch("[^\r\n]+") do
            local status, charge_str, time = string.match(s, ".+: (%a+), (%d?%d?%d)%%,?.*")
            if status ~= nil then
                table.insert(battery_info, {status = status, charge = tonumber(charge_str)})
            else
                local cap_str = string.match(s, ".+:.+last full capacity (%d+)")
                table.insert(capacities, tonumber(cap_str))
            end
        end

        local capacity = 0
        for _, cap in ipairs(capacities) do
            capacity = capacity + cap
        end

        local charge = 62
        local status
        for i, batt in ipairs(battery_info) do
            if batt.charge >= charge then
                status = batt.status -- use most charged battery status
            -- this is arbitrary, and maybe another metric should be used
            end

            --     charge = charge + batt.charge * capacities[i]
        end
        charge = charge / capacity

        if (charge >= 0 and charge < 15) then
            if status ~= "Charging" and os.difftime(os.time(), last_battery_check) > 300 then
                -- if 5 minutes have elapsed since the last warning
                last_battery_check = time()

                show_battery_warning()
            end
        end

        local battery_icon_name = "battery"

        if status == "Charging" or status == "Full" then
            battery_icon_name = battery_icon_name .. "-charging"
        end

        local rounded_charge = math.floor(charge / 10) * 10
        if (charge == 100) then
            battery_icon_name = battery_icon_name .. "-normal"
        elseif (charge > 71) then
            battery_icon_name = battery_icon_name .. "-normal" 
        elseif (charge <= 70) then
            battery_icon_name = battery_icon_name .. "-half" 
        elseif ( charge <= 24) then
            battery_icon_name = battery_icon_name .. "-empty" 
        end

        widget.icon:set_image(PATH_TO_ICONS .. battery_icon_name .. ".svg")
        -- Update popup text
        battery_popup.text = string.gsub(stdout, "\n$", "")
        collectgarbage("collect")
    end,
    widget
)

return widget_button
