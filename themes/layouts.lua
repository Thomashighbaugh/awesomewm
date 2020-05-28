-----------------------------------------------------------------
---------------------     Theme Layouts      --------------------
-----------------------------------------------------------------

-- You can use your own layout icons like this:

local layout_icons = "default-white"
local layout_path = theme_path .. "layouts/" .. layout_icons .. "/"
local lain_path = theme_path .. "layouts/default-lain-white/"
-- default awful related
theme.layout_dwindle        = layout_path .. "dwindle.png"
theme.layout_fairh          = layout_path .. "fairh.png"
theme.layout_fairv          = layout_path .. "fairv.png"
theme.layout_floating       = layout_path .. "floating.png"
theme.layout_magnifier      = layout_path .. "magnifier.png"
theme.layout_max            = layout_path .. "max.png"
theme.layout_spiral         = layout_path .. "spiral.png"
theme.layout_tilebottom     = layout_path .. "tilebottom.png"
theme.layout_tileleft       = layout_path .. "tileleft.png"
theme.layout_tile           = layout_path .. "tile.png"
theme.layout_tiletop        = layout_path .. "tiletop.png"

theme.layout_fullscreen     = layout_path .. "fullscreen.png"
theme.layout_cornernw       = layout_path .. "cornernw.png"
theme.layout_cornerne       = layout_path .. "cornerne.png"
theme.layout_cornersw       = layout_path .. "cornersw.png"
theme.layout_cornerse       = layout_path .. "cornerse.png"

-- lain related
theme.layout_termfair          = lain_path .. "centerfair.png"
theme.layout_uselessfair       = lain_path .. "centerfair.png"
theme.layout_uselessfairh      = lain_path .. "termfair.png"
theme.layout_uselessdwindle    = lain_path .. "cascadebrowse.png"
theme.layout_uselesspiral      = lain_path .. "cascade.png"
