-- ===========================================
-- Switcher Function
-- https://github.com/berlam/awesome-switcher
-- Note: A slick little import this one, some 
-- configuration is below, you may want to mod
-- ===========================================
local cairo = require("lgi").cairo
local mouse = mouse
local screen = screen
local wibox = require('wibox')
local table = table
local keygrabber = keygrabber
local math = require('math')
local awful = require('awful')
local gears = require("gears")
local timer = gears.timer
local client = client
awful.client = require('awful.client')

local naughty = require("naughty")
local string = string
local tostring = tostring
local tonumber = tonumber
local debug = debug
local pairs = pairs
local unpack = unpack or table.unpack

local surface = cairo.ImageSurface(cairo.Format.RGB24,20,20)
local cr = cairo.Context(surface)

local _M = {}

-- settings

settings = {
	preview_box = true,
	preview_box_bg = "#121115dd",
	preview_box_border = "#00caff",
	preview_box_fps = 30,
	preview_box_delay = 100,
	preview_box_title_font = {"Play Bold ","italic","normal"},
	preview_box_title_font_size_factor = 0.6,
	preview_box_title_color = {256,256,256,256},

	client_opacity = false,
	client_opacity_value_selected = 1,
	client_opacity_value_in_focus = 0.5,
	client_opacity_value = 0.5,

	cycle_raise_client = true,
}

-- Create a wibox to contain all the client-widgets
preview_wbox = wibox({ width = screen[mouse.screen].geometry.width })
preview_wbox.border_width = 1
preview_wbox.ontop = true
preview_wbox.visible = false

preview_live_timer = timer({ timeout = 1/settings.preview_box_fps })
preview_widgets = {}

altTabTable = {}
altTabIndex = 1

source = string.sub(debug.getinfo(1,'S').source, 2)
path = string.sub(source, 1, string.find(source, "/[^/]*$"))
noicon = path .. "noicon.png"

-- simple function for counting the size of a table
function tableLength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

-- this function returns the list of clients to be shown.
function getClients()
	local clients = {}

	-- Get focus history for current tag
	local s = mouse.screen;
	local idx = 0
	local c = awful.client.focus.history.get(s, idx)

	while c do
		table.insert(clients, c)

		idx = idx + 1
		c = awful.client.focus.history.get(s, idx)
	end

	-- Minimized clients will not appear in the focus history
	-- Find them by cycling through all clients, and adding them to the list
	-- if not already there.
	-- This will preserve the history AND enable you to focus on minimized clients

	local t = s.selected_tag
	local all = client.get(s)

	for i = 1, #all do
		local c = all[i]
		local ctags = c:tags();

		-- check if the client is on the current tag
		local isCurrentTag = false
		for j = 1, #ctags do
			if t == ctags[j] then
				isCurrentTag = true
				break
			end
		end

		if isCurrentTag then
			-- check if client is already in the history
			-- if not, add it
			local addToTable = true
			for k = 1, #clients do
				if clients[k] == c then
					addToTable = false
					break
				end
			end


			if addToTable then
				table.insert(clients, c)
			end
		end
	end

	return clients
end

-- here we populate altTabTable using the list of clients taken from
-- getClients(). In case we have altTabTable with some value, the list of the
-- old known clients is restored.
function populateAltTabTable()
	local clients = getClients()

	if tableLength(altTabTable) then
		for ci = 1, #clients do
			for ti = 1, #altTabTable do
				if altTabTable[ti].client == clients[ci] then
					altTabTable[ti].client.opacity = altTabTable[ti].opacity
					altTabTable[ti].client.minimized = altTabTable[ti].minimized
					break
				end
			end
		end
	end

	altTabTable = {}

	for i = 1, #clients do
		table.insert(altTabTable, {
		client = clients[i],
		minimized = clients[i].minimized,
		opacity = clients[i].opacity
       })
	end
end

-- If the length of list of clients is not equal to the length of altTabTable,
-- we need to repopulate the array and update the UI. This function does this
-- check.
function clientsHaveChanged()
	local clients = getClients()
	return tableLength(clients) ~= tableLength(altTabTable)
end

function createPreviewText(client)
	if client.class then
		return " - " .. client.class
	else
		return " - " .. client.name
	end
end

-- Preview is created here.
function clientOpacity()
	if not settings.client_opacity then return end

	local opacity = settings.client_opacity_value
	if opacity > 1 then opacity = 1 end
	for i,data in pairs(altTabTable) do
		data.client.opacity = opacity
	end

	if client.focus == altTabTable[altTabIndex].client then
		-- Let's normalize the value up to 1.
		local opacityFocusSelected = settings.client_opacity_value_selected + settings.client_opacity_value_in_focus
		if opacityFocusSelected > 1 then opacityFocusSelected = 1 end
		client.focus.opacity = opacityFocusSelected
	else
		-- Let's normalize the value up to 1.
		local opacityFocus = settings.client_opacity_value_in_focus
		if opacityFocus > 1 then opacityFocus = 1 end
		local opacitySelected = settings.client_opacity_value_selected
		if opacitySelected > 1 then opacitySelected = 1 end

		client.focus.opacity = opacityFocus
		altTabTable[altTabIndex].client.opacity = opacitySelected
	end
end

-- This is called any settings.preview_box_fps milliseconds. In case the list
-- of clients is changed, we need to redraw the whole preview box. Otherwise, a
-- simple widget::updated signal is enough
function updatePreview()
	if clientsHaveChanged() then
		populateAltTabTable()
		preview()
	end

	for i = 1, #preview_widgets do
		preview_widgets[i]:emit_signal("widget::updated")
	end
end

function cycle(dir)
	-- Switch to next client
	altTabIndex = altTabIndex + dir
	if altTabIndex > #altTabTable then
		altTabIndex = 1 -- wrap around
	elseif altTabIndex < 1 then
		altTabIndex = #altTabTable -- wrap around
	end

	updatePreview()

	altTabTable[altTabIndex].client.minimized = false

	if not settings.preview_box and not settings.client_opacity then
		client.focus = altTabTable[altTabIndex].client
	end

	if settings.client_opacity and preview_wbox.visible then
		clientOpacity()
	end

	if settings.cycle_raise_client == true then
		altTabTable[altTabIndex].client:raise()
	end
end

function preview()
	if not settings.preview_box then return end

	-- Apply settings
	preview_wbox:set_bg(settings.preview_box_bg)
	preview_wbox.border_color = settings.preview_box_border

	-- Make the wibox the right size, based on the number of clients
	local n = math.max(7, #altTabTable)
	local W = screen[mouse.screen].geometry.width -- + 2 * preview_wbox.border_width
	local w = W / n -- widget width
	local h = w * 0.75  -- widget height
	local textboxHeight = w * 0.125

	local x = screen[mouse.screen].geometry.x - preview_wbox.border_width
	local y = screen[mouse.screen].geometry.y + (screen[mouse.screen].geometry.height - h - textboxHeight) / 2
	preview_wbox:geometry({x = x, y = y, width = W, height = h + textboxHeight})

	-- create a list that holds the clients to preview, from left to right
	local leftRightTab = {}
	local leftRightTabToAltTabIndex = {} -- save mapping from leftRightTab to altTabTable as well
	local nLeft
	local nRight
	if #altTabTable == 2 then
		nLeft = 0
		nRight = 2
	else
		nLeft = math.floor(#altTabTable / 2)
		nRight = math.ceil(#altTabTable / 2)
	end

	for i = 1, nLeft do
		table.insert(leftRightTab, altTabTable[#altTabTable - nLeft + i].client)
		table.insert(leftRightTabToAltTabIndex, #altTabTable - nLeft + i)
	end
	for i = 1, nRight do
		table.insert(leftRightTab, altTabTable[i].client)
		table.insert(leftRightTabToAltTabIndex, i)
	end

	-- determine fontsize -> find maximum classname-length
	local text, textWidth, textHeight, maxText
	local maxTextWidth = 0
	local maxTextHeight = 0
	local bigFont = textboxHeight / 2
	cr:set_font_size(fontSize)
	for i = 1, #leftRightTab do
		text = createPreviewText(leftRightTab[i])
		textWidth = cr:text_extents(text).width
		textHeight = cr:text_extents(text).height
		if textWidth > maxTextWidth or textHeight > maxTextHeight then
			maxTextHeight = textHeight
			maxTextWidth = textWidth
			maxText = text
		end
	end

	while true do
		cr:set_font_size(bigFont)
		textWidth = cr:text_extents(maxText).width
		textHeight = cr:text_extents(maxText).height

		if textWidth < w - textboxHeight and textHeight < textboxHeight then
			break
		end

		bigFont = bigFont - 1
	end
	local smallFont = bigFont * settings.preview_box_title_font_size_factor

	preview_widgets = {}

	-- create all the widgets
	for i = 1, #leftRightTab do
		preview_widgets[i] = wibox.widget.base.make_widget()
		preview_widgets[i].fit = function(preview_widget, width, height)
			return w, h
		end
		local c = leftRightTab[i]
		preview_widgets[i].draw = function(preview_widget, preview_wbox, cr, width, height)
			if width ~= 0 and height ~= 0 then

				local a = 0.8
				local overlay = 0.6
				local fontSize = smallFont
				if c == altTabTable[altTabIndex].client then
					a = 0.9
					overlay = 0
					fontSize = bigFont
				end

				local sx, sy, tx, ty

				-- Icons
				local icon
				if c.icon == nil then
					icon = gears.surface(gears.surface.load(noicon))
				else
					icon = gears.surface(c.icon)
				end

				local iconboxWidth = 0.9 * textboxHeight
				local iconboxHeight = iconboxWidth

				-- Titles
				cr:select_font_face(unpack(settings.preview_box_title_font))
				cr:set_font_face(cr:get_font_face())
				cr:set_font_size(fontSize)

				text = createPreviewText(c)
				textWidth = cr:text_extents(text).width
				textHeight = cr:text_extents(text).height

				local titleboxWidth = textWidth + iconboxWidth
				local titleboxHeight = textboxHeight

				-- Draw icons
				tx = (w - titleboxWidth) / 2
				ty = h
				sx = iconboxWidth / icon.width
				sy = iconboxHeight  / icon.height

				cr:translate(tx, ty)
				cr:scale(sx, sy)
				cr:set_source_surface(icon, 0, 0)
				cr:paint()
				cr:scale(1/sx, 1/sy)
				cr:translate(-tx, -ty)

				-- Draw titles
				tx = tx + iconboxWidth
				ty = h + (textboxHeight + textHeight) / 2

				cr:set_source_rgba(unpack(settings.preview_box_title_color))
				cr:move_to(tx, ty)
				cr:show_text(text)
				cr:stroke()

				-- Draw previews
				local cg = c:geometry()
				if cg.width > cg.height then
					sx = a * w / cg.width
					sy = math.min(sx, a * h / cg.height)
				else
					sy = a * h / cg.height
					sx = math.min(sy, a * h / cg.width)
				end

				tx = (w - sx * cg.width) / 2
				ty = (h - sy * cg.height) / 2

				local tmp = gears.surface(c.content)
				cr:translate(tx, ty)
				cr:scale(sx, sy)
				cr:set_source_surface(tmp, 0, 0)
				cr:paint()
				tmp:finish()

				-- Overlays
				cr:scale(1/sx, 1/sy)
				cr:translate(-tx, -ty)
				cr:set_source_rgba(0,0,0,overlay)
				cr:rectangle(tx, ty, sx * cg.width, sy * cg.height)
				cr:fill()
			end
		end

		-- Add mouse handler
		preview_widgets[i]:connect_signal("mouse::enter", function()
			cycle(leftRightTabToAltTabIndex[i] - altTabIndex)
		end)
	end

	-- Spacers left and right
	local spacer = wibox.widget.base.make_widget()
	spacer.fit = function(leftSpacer, width, height)
		return (W - w * #altTabTable) / 2, preview_wbox.height
	end
	spacer.draw = function(preview_widget, preview_wbox, cr, width, height) end

	--layout
	preview_layout = wibox.layout.fixed.horizontal()

	preview_layout:add(spacer)
	for i = 1, #leftRightTab do
		preview_layout:add(preview_widgets[i])
	end
	preview_layout:add(spacer)

	preview_wbox:set_widget(preview_layout)
end


-- This starts the timer for updating and it shows the preview UI.
function showPreview()
	preview_live_timer.timeout = 1 / settings.preview_box_fps
	preview_live_timer:connect_signal("timeout", updatePreview)
	preview_live_timer:start()

	preview()
	preview_wbox.visible = true

	clientOpacity()
end

function switch(dir, mod_key1, release_key, mod_key2, key_switch)
	populateAltTabTable()

	if #altTabTable == 0 then
		return
	elseif #altTabTable == 1 then
		altTabTable[1].client.minimized = false
		altTabTable[1].client:raise()
		return
	end

	-- reset index
	altTabIndex = 1

	-- preview delay timer
	local previewDelay = settings.preview_box_delay / 1000
	previewDelayTimer = timer({timeout = previewDelay})
	previewDelayTimer:connect_signal("timeout", function()
		previewDelayTimer:stop()
		showPreview()
	end)
	previewDelayTimer:start()

	-- Now that we have collected all windows, we should run a keygrabber
	-- as long as the user is alt-tabbing:
	keygrabber.run(
		function (mod, key, event)
			-- Stop alt-tabbing when the alt-key is released
			if gears.table.hasitem(mod, mod_key1) then
				if (key == release_key or key == "Escape") and event == "release" then
					if preview_wbox.visible == true then
						preview_wbox.visible = false
						preview_live_timer:stop()
					else
						previewDelayTimer:stop()
					end

					if key == "Escape" then
						for i = 1, #altTabTable do
							altTabTable[i].client.opacity = altTabTable[i].opacity
							altTabTable[i].client.minimized = altTabTable[i].minimized
						end
					else
						-- Raise clients in order to restore history
						local c
						for i = 1, altTabIndex - 1 do
							c = altTabTable[altTabIndex - i].client
							if not altTabTable[i].minimized then
								c:raise()
								client.focus = c
							end
						end

						-- raise chosen client on top of all
						c = altTabTable[altTabIndex].client
						c:raise()
						client.focus = c

						-- restore minimized clients
						for i = 1, #altTabTable do
							if i ~= altTabIndex and altTabTable[i].minimized then
								altTabTable[i].client.minimized = true
							end
							altTabTable[i].client.opacity = altTabTable[i].opacity
						end
					end

					keygrabber.stop()
				
				elseif key == key_switch and event == "press" then
					if gears.table.hasitem(mod, mod_key2) then
						-- Move to previous client on Shift-Tab
						cycle(-1)
					else
						-- Move to next client on each Tab-press
						cycle( 1)
					end
				end
			end
		end
	)

	-- switch to next client
	cycle(dir)

end -- function altTab

return {switch = switch, settings = settings}
