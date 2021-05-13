--[[
Author: Thomas Leon Highbaugh (thighbaugh@zoho.com)
init.lua
Desc: description
]]

return {
    globalkeys=require("configurations.keybindings.global"),
    clientkeys =require("configurations.keybindings.client"),
    globalbuttons=require("configurations.keybindings.buttons.global"),
    clientbuttons=require("configurations.keybindings.buttons.client")
}