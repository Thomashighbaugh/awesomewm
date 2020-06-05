-----------------------------------------------------------------
---------------------     User Variables      -------------------
-----------------------------------------------------------------
local home = os.getenv("HOME")

local _M = {
  -- This is used later as the default terminal and editor to run.
  -- terminal = "xterm",
  terminal = "kitty",
    -- Default modkey.
  modkey = "Mod4",
  -- Default Internet Browser
  browser = "firefox-developer-edition",
    -- System File Manager
  file_manager = "pcmanfm",
  filemanager = "pcmanfm",
  quake = 'kitty --title QuakeTerminal',

}

return _M

