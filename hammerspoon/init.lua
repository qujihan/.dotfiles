hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
package.path = hs.configdir ..
'/?.lua;' .. hs.configdir .. '/?/init.lua;' .. hs.configdir .. '/Spoons/?.spoon/init.lua;' .. package.path

bing_daily = require "modules/bing_daily"
bing_daily:init()

window_move = require "modules/window_move"
window_move:init()

vim_mode = require "modules/vim_mode"
vim_mode:init()

monitor_move = require "modules/monitor_move"
monitor_move:init()

mouse_volume = require "modules/mouse_volume"
mouse_volume:init()

input_set = require "modules/input_set"
input_set:init()

-- reload keymap
hs.hotkey.bind({ "cmd", "ctrl", "shift" }, "R", function()
  hs.notify.new({ title = "Hammerspoon", informativeText = "Reload Config" }):send()
  hs.reload()
end)