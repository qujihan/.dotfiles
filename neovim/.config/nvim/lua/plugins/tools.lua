local keys = require("settings.keymaps")
local opt = { noremap = true, silent = true }
return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Nvim-tree                                                                   │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      vim.keymap.set("n", keys.tree_toggle, ":NvimTreeToggle<cr>", opt)
    end,
    opts = {},
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Gitsigns                                                                    │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  { "lewis6991/gitsigns.nvim", opts = {} },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Indentline                                                                  │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Mini plugins                                                                │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "echasnovski/mini.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("mini.hues").setup({ background = "#002734", foreground = "#c0c8cc" }) -- azure
      require("mini.tabline").setup({})
      require("mini.statusline").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      vim.keymap.set("n", keys.buffer_prev, ":bprev<CR>", opt)
      vim.keymap.set("n", keys.buffer_next, ":bnext<CR>", opt)
      vim.keymap.set("n", keys.buffer_close, ":bdelete<CR>", opt)
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  FTerm                                                                       │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "numToStr/FTerm.nvim",
    event = "VeryLazy",
    init = function()
      vim.keymap.set("n", keys.term_open, '<CMD>lua require("FTerm").toggle()<CR>', opt)
      vim.keymap.set("t", keys.term_open, '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opt)
    end,
    opts = {},
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Flash                                                                       │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    init = function()
      vim.keymap.set({ "n", "x", "o" }, keys.flash_jump, [[<cmd>lua require("flash").jump()<cr>]])
      vim.keymap.set({ "n", "x", "o" }, keys.flash_treesitter, [[<cmd>lua require("flash").treesitter()<cr>]])
    end,
    opts = {},
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Which key                                                                   │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Persistence                                                                 │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "folke/persistence.nvim",
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_user_command(keys.persistence_load, function()
        require("persistence").load()
      end, { desc = "load persisted session" })
    end,
    opts = {},
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Trouble                                                                     │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  { "folke/trouble.nvim", opts = {} },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Noice                                                                       │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {},
  },
}
