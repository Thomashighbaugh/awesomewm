-- |    |  |.-----.|  |_.--.--.--.-----.----.|  |--.|__|.-----.-----.
-- |       ||  -__||   _|  |  |  |  _  |   _||    < |  ||     |  _  |
-- |__|____||_____||____|________|_____|__|  |__|__||__||__|__|___  |
--                                                            |_____|



local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local naughty = require('naughty') 

local dpi = require('beautiful').xresources.apply_dpi

local apps = require('configuration.apps')
local clickable_container = require('widget.clickable-container')

local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. 'widget/network/icons/'

local wlan_interface = 'wlp3s0'
local lan_interface = 'enp0s31f6'

local return_button = function()


	local connected_to_network = false
	local conn_status = 'disconnected'

	local update_notify_no_access = false
	local notify_no_access_quota = 0

	local startup = true
	local net_speed = 'N/A'

	local widget = wibox.widget {
		{
			id = 'icon',
			image = widget_icon_dir .. 'wired-off' .. '.svg',
			widget = wibox.widget.imagebox,
			resize = true
		},
		layout = wibox.layout.align.horizontal
	}

	local widget_button = wibox.widget {
		{
			widget,
			margins = dpi(2),
			widget = wibox.container.margin
		},
		widget = clickable_container
	}
	
	widget_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(apps.default.network_manager, false)
				end
			)
		)
	)
	awful.tooltip(
		{
			objects = {widget_button},
			mode = 'outside',
			align = 'right',
			timer_function = function()
				if connected_to_network then
						return 'Ethernet Interface: ' .. lan_interface .. ''
					end
				else
					return 'Network is currently disconnected'
				end
			end,
			preferred_positions = {'left', 'right', 'top', 'bottom'},
			margin_leftright = dpi(2),
			margin_topbottom = dpi(2)
		}
	)

	gears.timer {
		timeout = 100,
		autostart = true,
		call_now = true,
		callback = function()
			awful.spawn.easy_async_with_shell(
				[[
				net_status="$(ip route get 8.8.8.8 2>&1 >/dev/null)"
				if ]] .. "[[ " .. [[ "$(echo ${net_status} |  awk -F ": " '{print $2}')" == *'unreachable'* ]] .. " ]];" .. [[
				then
					echo 'No internet connection'
					exit;
				fi

				net_status="$(ip route get 8.8.8.8 | grep -Po 'dev \K\w+' | grep -Ff - /proc/net/wireless)"

				if [ ! -z "${net_status}" ]
				then
					echo 'wireless'
				else
					echo 'wired'
				fi
				]],
				function(stdout)
					if stdout:match('No internet connection') then
						update_disconnected()
						return
					end

				if stdout:match('wired') then
						update_wired()
					end
				end
			)		
		end	
	}

	return widget_button

end

return return_button
