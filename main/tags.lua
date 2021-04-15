--  _______
-- |_     _|.---.-.-----.-----.
--   |   |  |  _  |  _  |__ --|
--   |___|  |___._|___  |_____|
--                |_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard awesome library
local awful = require('awful')
local _M = {}

-- ===================================================================
--  Name tags
-- ===================================================================
function _M.get()
    local tags = {}

    local tagpairs = {

        names = {'a', 'w', 'e', 's', 'o', 'm', 'e', 'w', 'm'},

        layout = awful.layout.layouts[1]
    }
    awful.screen.connect_for_each_screen(
        function(s)
            -- Screen Padding
            screen[s].padding = {left = 0, right = 0, top = 0, bottom = 0}
            -- Each screen has its own tag table.
            tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
        end)

        return tags
    end

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

    return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})

