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
if string.find(string.lower(hs.execute("id -un"):gsub("\n", "")), "bytedance") then
  ModuleMap["modules.bytedance"] = true
end
for name, enabled in pairs(ModuleMap) do
  if enabled then
    Module = require(name)
    Module:init()
  end
end
