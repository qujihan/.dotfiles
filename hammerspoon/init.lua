hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
package.path = hs.configdir .. '/?.lua;' .. hs.configdir .. '/?/init.lua;' .. hs.configdir .. '/Spoons/?.spoon/init.lua;' .. package.path

bd = require "modules/bingdaily"
bd:init()

require "modules/mouse"

require "modules/vim"

require "modules/window"

-- reload keymap
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", function()
  hs.notify.new({title="Hammerspoon", informativeText="Reload Config"}):send()
  hs.reload()
end)