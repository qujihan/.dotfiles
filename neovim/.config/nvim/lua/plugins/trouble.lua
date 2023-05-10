local keys = require("keymap.keys")

-- https://github.com/folke/trouble.nvim
return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Lua
    vim.keymap.set("n", keys.trouble_TroubleToggle, "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
    vim.keymap.set(
      "n",
      keys.trouble_TroubleToggle_workspace_diagnostics,
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set(
      "n",
      keys.trouble_TroubleToggle_document_diagnostics,
      "<cmd>TroubleToggle document_diagnostics<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set(
      "n",
      keys.trouble_TroubleToggle_loclist,
      "<cmd>TroubleToggle loclist<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set(
      "n",
      keys.trouble_TroubleToggle_quickfix,
      "<cmd>TroubleToggle quickfix<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set(
      "n",
      keys.trouble_TroubleToggle_lsp_references,
      "<cmd>TroubleToggle lsp_references<cr>",
      { silent = true, noremap = true }
    )
    require("trouble").setup({
      action_keys = {
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = keys.trouble_close,
        cancel = keys.trouble_cancel,
        refresh = keys.trouble_refresh,
        jump = keys.trouble_jump,
        open_split = keys.trouble_open_split,
        open_vsplit = keys.trouble_open_vsplit,
        open_tab = keys.trouble_open_tab,
        jump_close = keys.trouble_jump_close,
        toggle_mode = keys.trouble_toggle_mode,
        toggle_preview = keys.trouble_preview,
        hover = keys.trouble_hover,
        preview = keys.trouble_preview,
        close_folds = keys.trouble_close_folds,
        open_folds = keys.trouble_open_folds,
        toggle_fold = keys.trouble_toggle_fold,
        previous = keys.trouble_previous,
        next = keys.trouble_next,
      },
    })
  end,
}
