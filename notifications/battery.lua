local naughty = require("naughty")
local icons = require("icons")
icons.init("sheet")

local display = true

awesome.connect_signal("ears::battery", function(value)
	if value < 11 then
		naughty.notification({
			title = "Critical Battery",
			text = "Charge at " .. value .. "%",
			image = icons.battery,
		})
	end

	if (value > 99 and display) then
		naughty.notification({
			title = "Charged",
			text = "Battery at " .. value .. "%",
			image = icons.battery,
		})
		display = false
	end
end)

awesome.connect_signal("ears::charger", function(plugged)
	if plugged then
		naughty.notification({
			title = "Battery Status:",
			text = "Charging",
			image = icons.battery_charging,
		})
		display = false
	end

end)
