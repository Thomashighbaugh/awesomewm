--  ______ __ __        __           __     __
-- |      |  |__|.----.|  |--.---.-.|  |--.|  |.-----.
-- |   ---|  |  ||  __||    <|  _  ||  _  ||  ||  -__|
-- |______|__|__||____||__|__|___._||_____||__||_____|
--  ______               __          __
-- |      |.-----.-----.|  |_.---.-.|__|.-----.-----.----.
-- |   ---||  _  |     ||   _|  _  ||  ||     |  -__|   _|
-- |______||_____|__|__||____|___._||__||__|__|_____|__|
-- ===================================================================
-- Initialization
-- ===================================================================
local wibox = require('wibox')

-- ===================================================================
-- Widget Creation
-- ===================================================================
-- build function wrapping widget in a button (purpose of file ultiuately)
function build(widget)
    local container = wibox.widget {widget, widget = wibox.container.background}
    local old_cursor, old_wibox
    -- When mouse enters the box, cursor becomes the hand pressing the button (hand1)
    container:connect_signal('mouse::enter', function()
        container.bg = '#0e121a11'
        local w = _G.mouse.current_wibox
        if w then
            old_cursor, old_wibox = w.cursor, w
            w.cursor = 'hand1'
        end
    end)

    -- mouse leaves the wibox, background returns to original color
    container:connect_signal('mouse::leave', function()
        container.bg = '#0e121a00'
        if old_wibox then
            old_wibox.cursor = old_cursor
            old_wibox = nil
        end
    end)
    -- changes BG when mouse click occurs
    container:connect_signal('button::press',
                             function() container.bg = '#0e121a22' end)
    -- upon releasing the mouse, it again shifts BG
    container:connect_signal('button::release',
                             function() container.bg = '#0e121a11' end)

    return container
end

return build

