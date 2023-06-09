local keys = require("settings.keymaps")
local opt = { noremap = true, silent = true }

return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Theme                                                                       │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "EdenEast/nightfox.nvim",
    init = function()
      vim.cmd("colorscheme nightfox")
    end,
  },

  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Bufferline                                                                  │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    init = function()
      vim.keymap.set("n", keys.buffer_prev, ":bprev<CR>", opt)
      vim.keymap.set("n", keys.buffer_next, ":bnext<CR>", opt)
      vim.keymap.set("n", keys.buffer_close, ":bdelete<CR>", opt)
      vim.keymap.set("n", keys.buffer_pick, ":BufferLinePick<CR>", opt)
    end,

    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or ""
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Lualine                                                                     │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  { "nvim-lualine/lualine.nvim", opts = {} },
}
