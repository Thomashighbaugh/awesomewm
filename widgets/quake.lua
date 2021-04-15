local helpers = require "main.helpers"
-----------------------------------------------------------------
---------------------     Quake Terminal Dropdown   -------------
-----------------------------------------------------------------
local spawn = require('awful.spawn')
local beautiful = require("beautiful")
local _M = {}

local app = "kitty --title 'Kitty Quake'"
local quake_id = 'notnil'
local quake_client
quake_client = nil
function create_shell()
    quake_id =
    spawn(
        app,
        {
            skip_decoration = true
        }
        )
end

function open_quake()
    quake_client.hidden = false
end

function close_quake()
    quake_client.hidden = true
end

function toggle_quake()
    opened = not opened
    if not quake_client then
        create_shell()
    else
        if opened then
            close_quake()

        else
            open_quake()

        end
    end
end

client.connect_signal(
    'manage',
    function(c)
        if (c.pid == quake_id) then
            quake_client = c
            c.opacity = 0.99
            c.floating = true
            c.skip_taskbar = true
            c.ontop = true
            c.above = true
            c.sticky = true
            c.hidden = not opened
            c.maximized_horizontal = true
            opened = true
            c.width = 600
            c.height = 800
            c.shape= helpers.squircle(10)
            c.y = 100
            c.x = 700
        end
    end
    )

client.connect_signal(
    'unmanage',
    function(c)
        if (c.pid == quake_id) then
            opened = false
            quake_client = nil
        end
    end
    )

--create_shell()
return setmetatable(
    {},
    { __call = function(_, ...) return _M.get(...) end }
    )

