local keys = require("keymap.keys")
local map, nor_opts = keys.map, keys.normal_opts
return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Which key                                                                   │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      --set timeout in /options/init.lua
      require("which-key").setup({})
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Gitsigns                                                                    │
  -- │  https://github.com/lewis6991/gitsigns.nvim                                  │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Leap                                                                        │
  -- │  https://github.com/ggandor/leap.nvim                                        │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Comment                                                                     │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function()
      require("mini.comment").setup({
        mappings = {
          comment = keys.comment,
          comment_line = keys.comment_line,
          textobject = keys.comment_textobject,
        },
      })
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Indentscope                                                                 │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    config = function()
      local indentscope = require("mini.indentscope")
      indentscope.gen_animation.none()
      indentscope.setup({
        mappings = {
          object_scope = "",
          object_scope_with_border = "",
          goto_top = "",
          goto_bottom = "",
        },
      })
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Autopairs                                                                   │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Surround                                                                    │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = keys.surround_add, -- Add surrounding in Normal and Visual modes
          delete = keys.surround_delete, -- Delete surrounding
          find = keys.surround_find, -- Find surrounding (to the right)
          find_left = keys.surround_find_left, -- Find surrounding (to the left)
          highlight = keys.surround_highlight, -- Highlight surrounding
          replace = keys.surround_replace, -- Replace surrounding
          update_n_lines = keys.surround_update_n_lines, -- Update `n_lines`
          suffix_last = keys.surround_suffix_last, -- Suffix to search with "prev" method
          suffix_next = keys.surround_suffix_next, -- Suffix to search with "next" method
        },
      })
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  FTerm                                                                       │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "numToStr/FTerm.nvim",
    config = function()
      require("FTerm").setup({
        cmd = function()
          if vim.loop.os_uname().sysname == "Windows_NT" then
            return "pwsh --nologo"
          elseif vim.loop.os_uname().sysname == "Darwin" then
            return "/bin/zsh -l"
          elseif vim.loop.os_uname().sysname == "Linux" then
            return "/usr/bin/bash"
          end
        end,
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      })
      map("n", keys.term_open, '<CMD>lua require("FTerm").toggle()<CR>', nor_opts)
      map("t", keys.term_open, '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', nor_opts)
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Persistence                                                                 │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "folke/persistence.nvim",
    event = "VeryLazy",
    config = function()
      require("persistence").setup()
      map("n", keys.persistence_load, [[<cmd>lua require("persistence").load()<cr>]])
    end,
  },
}
