local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi



local term_scratch = bling.module.scratchpad:new{
    command = "kitty --class spad",
    rule = {instance = "spad"},
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x = dpi(460), y = dpi(90), height = dpi(900), width = dpi(1000)},
    reapply = true,
    dont_focus_before_close = false
    -- awestore = {y = anim_y}
}

awesome.connect_signal("scratch::term", function() term_scratch:toggle() end)
