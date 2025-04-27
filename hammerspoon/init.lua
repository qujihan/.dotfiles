hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
package.path = hs.configdir .. '/?.lua;' ..
    hs.configdir .. '/?/init.lua;' ..
    package.path

ModuleMap = {
  ["modules.keymaps"] = true,
  ["modules.bing_daily"] = true,
  ["modules.mouse_button"] = true,
  ["modules.bytedance"] = false,
}

local bytedance_uuid = ""
if require "utils.uuid":get_uuid() == bytedance_uuid then
  ModuleMap["modules.bytedance"] = true
end

for name, enabled in pairs(ModuleMap) do
  if enabled then
    Module = require(name)
    Module:init()
  end
end
