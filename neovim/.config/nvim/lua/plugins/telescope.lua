-- https://github.com/nvim-telescope/telescope.nvim
local keys = require("settings.keymaps")
local opt = { noremap = true, silent = true }

return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Telescope.nvim                                                              │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          initial_mode = "insert",
          mappings = {
            i = {
              -- history
              [keys.telescope_cycle_history_next] = "cycle_history_next",
              [keys.telescope_cycle_history_prev] = "cycle_history_prev",
            },
          },
        },
        pickers = {},
        extensions = {},
      })

      -- keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", keys.telescope_find_files, builtin.find_files, opt)
      vim.keymap.set("n", keys.telescope_live_grep, builtin.live_grep, opt)
      vim.keymap.set("n", keys.telescope_buffers, builtin.buffers, opt)
    end,
  },
}
