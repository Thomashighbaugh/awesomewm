--  __   __ __   __         __                 __
-- |  |_|__|  |_|  |.-----.|  |--.---.-.----. |__|.----.-----.-----.-----.
-- |   _|  |   _|  ||  -__||  _  |  _  |   _| |  ||  __|  _  |     |__ --|
-- |____|__|____|__||_____||_____|___._|__|   |__||____|_____|__|__|_____|

-- ===================================================================
-- Path Variatble Declarations
-- ===================================================================

--declare variable empty
local icondir = ""

-- Modified variant of elenapan's configuration.

-- modified to make sense. A minimize button should point down
icondir = theme_path .. "titlebar/"

icondir = icondir .. "clone/"

-- ===================================================================
-- Titlebar Icons
-- ===================================================================

-- Define the image to load
theme.titlebar_close_button_normal = icondir .. "close_normal.svg"
theme.titlebar_close_button_focus = icondir .. "close_focus.svg"

theme.titlebar_minimize_button_normal = icondir .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus = icondir .. "minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive = icondir .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive = icondir .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = icondir .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active = icondir .. "ontop_focus_active.svg"

theme.titlebar_sticky_button_normal_inactive = icondir .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive = icondir .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = icondir .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active = icondir .. "sticky_focus_active.svg"

theme.titlebar_floating_button_normal_inactive = icondir .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive = icondir .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = icondir .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active = icondir .. "floating_focus_active.svg"

theme.titlebar_maximized_button_normal_inactive = icondir .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive = icondir .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = icondir .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active = icondir .. "maximized_focus_active.svg"
