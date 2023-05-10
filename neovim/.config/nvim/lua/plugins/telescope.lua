-- https://github.com/nvim-telescope/telescope.nvim
local keys = require("keymap.keys")
local map, nor_opts = keys.map, keys.normal_opts

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
              -- 上下移动
              [keys.telescope_move_selection_next] = "move_selection_next",
              [keys.telescope_move_selection_previous] = "move_selection_previous",
              -- 历史记录
              [keys.telescope_cycle_history_next] = "cycle_history_next",
              [keys.telescope_cycle_history_prev] = "cycle_history_prev",
              -- 关闭窗口
              [keys.telescope_close] = "close",
              -- 预览窗口上下滚动
              [keys.telescope_preview_scrolling_up] = "preview_scrolling_up",
              [keys.telescope_preview_scrolling_down] = "preview_scrolling_down",
            },
          },
        },
        pickers = {},
        extensions = {},
      })
      local builtin = require("telescope.builtin")
      map("n", keys.telescope_find_files, builtin.find_files, nor_opts)
      map("n", keys.telescope_live_grep, builtin.live_grep, nor_opts)
      map("n", keys.telescope_buffers, builtin.buffers, nor_opts)
    end,
  },
}
