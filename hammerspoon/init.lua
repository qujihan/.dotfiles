hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
package.path = hs.configdir .. '/?.lua;' ..
    hs.configdir .. '/?/init.lua;' ..
    package.path

ModuleMap = {
  ["modules.keymaps"] = true,
  ["modules.bing_daily"] = true,
  ["modules.mouse_button"] = true,
}

BytedanceModule = {
  ["modules.keymaps"] = true,
  ["modules.mouse_button"] = true,
  ["modules.bytedance"] = true,
}

local function loadAndInitModuleMap(Map)
  for name in pairs(Map) do
    Module = require(name)
    Module:init()
  end
end

if string.match(string.lower(hs.execute("id -un"):gsub("\n", "")), "bytedance") then
  hs.notify.new({ title = "Bytedance", informativeText = "Bytedance Init Start" }):send()
  loadAndInitModuleMap(BytedanceModule)
else
  loadAndInitModuleMap(ModuleMap)
end
