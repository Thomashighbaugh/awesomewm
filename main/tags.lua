--  _______
-- |_     _|.---.-.-----.-----.
--   |   |  |  _  |  _  |__ --|
--   |___|  |___._|___  |_____|
--                |_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard awesome library
local awful = require("awful")
local _M = {}

-- ===================================================================
--  Name tags
-- ===================================================================
function _M.get()
    local tags = {}

    local tagpairs = {
        --  names  = { "term", "net", "edit", "place", 5, 6, 7, 8, 9 },
        names = {"a", "w", "e", "s", "o", "m", "e", "w", "m"},

        layout = awful.layout.layouts
    }
    awful.screen.connect_for_each_screen(
        function(s)
            -- Each screen has its own tag table.
            tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
        end)

    return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})

