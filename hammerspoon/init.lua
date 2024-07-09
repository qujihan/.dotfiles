hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
package.path = hs.configdir .. '/?.lua;' .. hs.configdir .. '/?/init.lua;' .. hs.configdir .. '/Spoons/?.spoon/init.lua;' .. package.path

bing_daily = require "modules/bing_daily"
bing_daily:init()

windows_move = require "modules/window_move"
windows_move:init()

vim_mode = require "modules/vim_mode"
vim_mode:init()

monitor_move = require "modules/monitor_move"
monitor_move:init()

-- reload keymap
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", function()
  hs.notify.new({title="Hammerspoon", informativeText="Reload Config"}):send()
  hs.reload()
end)