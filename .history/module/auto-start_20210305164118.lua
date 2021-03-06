--[[ 
   _______ _______ _______ _______      _______ _______ _______ ______ _______  __              
|   _   |   |   |_     _|       |    |     __|_     _|   _   |   __ \_     _||  |.--.--.---.-.
|       |   |   | |   | |   -   |    |__     | |   | |       |      < |   |__|  ||  |  |  _  |
|___|___|_______| |___| |_______|    |_______| |___| |___|___|___|__| |___|__|__||_____|___._|
                                                                                              
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 2:42:01 PM
     Last edited:
       3/5/2021, 4:41:18 PM
     Auto updated?
       Yes
    
     Description:
       Runs applications specified elsewhere at the time that awesome
       starts or restarts
--]]
local awful = require('awful')
local apps = require('configuration.apps')

local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(' ')
    if firstspace then
        findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd), false)
end

for _, app in ipairs(apps.run_on_start_up) do
    run_once(app)
end
