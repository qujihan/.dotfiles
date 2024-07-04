hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
package.path = hs.configdir .. '/?.lua;' .. hs.configdir .. '/?/init.lua;' .. hs.configdir .. '/Spoons/?.spoon/init.lua;' .. package.path

require "modules/window"
require "modules/mouse"
require "modules/vim"

-- reload keymap
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", function()
  hs.notify.new({title="Hammerspoon", informativeText="Reload Config"}):send()
  hs.reload()
end)