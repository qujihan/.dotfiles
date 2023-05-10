-- https://github.com/nvim-tree/nvim-tree.lua
local keys = require("keymap.keys")
local map, nor_opts = keys.map, keys.normal_opts
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup()
    map("n", keys.tree_toggle, ":NvimTreeToggle<CR>", nor_opts)
  end,
}
