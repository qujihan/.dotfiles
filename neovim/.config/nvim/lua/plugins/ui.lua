local keys = require("settings.keymaps")
local opt = { noremap = true, silent = true }

return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Theme-Onedark                                                               │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").load()
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Bufferline                                                                  │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.keymap.set("n", keys.buffer_prev, ":bprev<CR>", opt)
      vim.keymap.set("n", keys.buffer_next, ":bnext<CR>", opt)
      vim.keymap.set("n", keys.buffer_close, ":bdelete<CR>", opt)
      vim.keymap.set("n", keys.buffer_pick, ":BufferLinePick<CR>", opt)
      require("bufferline").setup({
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
      })
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Lualine                                                                     │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "NvimTree" },
            winbar = { "NvimTree" },
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}
