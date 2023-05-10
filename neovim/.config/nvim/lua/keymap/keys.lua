-- local keys = require("settings.keys")
local keys = {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Yank to system                                                              │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  yank_to_system = "gy",
  paste_to_vim = "gp",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For buffer operation                                                        │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  buffer_hop_up = "<A-k>",
  buffer_hop_down = "<A-j>",
  buffer_hop_left = "<A-h>",
  buffer_hop_right = "<A-l>",
  buffer_resize_left = "<A-[>",
  buffer_resize_right = "<A-]>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For buffer                                                                  │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  buffer_prev = "<A-,>",
  buffer_next = "<A-.>",
  buffer_close = "<A-w>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For cmp and luasnip                                                         │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  cmp_complete = "<A-.>",
  cmp_abort = "<A-,>",
  cmp_confirm = "<CR>",
  cmp_scroll_doc_up = "<C-u>",
  cmp_scroll_doc_down = "<C-d>",
  cmp_select_prev_item = "<C-k>",
  cmp_select_next_item = "<C-j>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For comment                                                                 │
  -- │  Note:Module mappings. Use `''` (empty string) to disable one.               │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  comment = "gc",
  comment_line = "gcc",
  comment_textobject = "gc",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For surround                                                                │
  -- │  Note:Module mappings. Use `''` (empty string) to disable one.               │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  -- Module mappings. Use `''` (empty string) to disable one.
  surround_add = "sa", -- Add surrounding in Normal and Visual modes
  surround_delete = "sd", -- Delete surrounding
  surround_find = "sf", -- Find surrounding (to the right)
  surround_find_left = "sF", -- Find surrounding (to the left)
  surround_highlight = "sh", -- Highlight surrounding
  surround_replace = "sr", -- Replace surrounding
  surround_update_n_lines = "sn", -- Update `n_lines`
  surround_suffix_last = "l", -- Suffix to search with "prev" method
  surround_suffix_next = "n", -- Suffix to search with "next" method
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For lspsage                                                                 │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  lsp_format = "<Leader>lf",
  lsp_rename = "<Leader>lr",
  lsp_code_action = "<Leader>la",
  -- Calling the function twice will jump into the floating window.
  lsp_hover_float = "K",
  lsp_signature_float = "gs",
  lsp_reference_list_quickfix = "gr",
  lsp_implementation_list_quickfix = "gi",
  lsp_definition_jump = "gd",
  lsp_definition_type_jump = "gD",
  lsp_declaration_jump = "gD",
  lsp_diagnostic_float = "gl",
  lsp_diagnostic_jump_prev = "[d",
  lsp_diagnostic_jump_next = "]d",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For dap                                                                     │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  dap_continue = "<F5>",
  dap_step_over = "<F10>",
  dap_step_into = "<F11>",
  dap_step_out = "<F12>",
  dap_toggle_breakpoint = "<Leader>b",
  dap_set_breakpoint = "<Leader>B",
  dap_repl_open = "<Leader>dr",
  dap_run_last = "<Leader>dl",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For dapui                                                                   │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  dapui_open = "<CR>",
  dapui_edit = "e",
  dapui_expand = "o",
  dapui_repl = "r",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For nvim tree                                                               │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  tree_toggle = "<A-e>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For telescope                                                               │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  telescope_find_files = "<leader>ff",
  telescope_live_grep = "<leader>fg",
  telescope_buffers = "<leader>fb",
  telescope_move_selection_next = "<C-j>",
  telescope_move_selection_previous = "<C-k>",
  telescope_cycle_history_next = "<Down>",
  telescope_cycle_history_prev = "<Up>",
  telescope_close = "<A-w>",
  telescope_preview_scrolling_up = "<C-u>",
  telescope_preview_scrolling_down = "<C-d>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For term                                                                    │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  term_open = "<A-`>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For trouble                                                                 │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  trouble_TroubleToggle = "<A-q>",
  trouble_TroubleToggle_workspace_diagnostics = "<A-q>w",
  trouble_TroubleToggle_document_diagnostics = "<A-q>d",
  trouble_TroubleToggle_loclist = "<A-q>l",
  trouble_TroubleToggle_quickfix = "<A-q>q",
  trouble_TroubleToggle_lsp_references = "<A-q>r",
  trouble_close = "q", -- close the list
  trouble_cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
  trouble_refresh = "r", -- manually refresh
  trouble_jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
  trouble_open_split = { "<A-x>" }, -- open buffer in new split
  trouble_open_vsplit = { "<A-v>" }, -- open buffer in new vsplit
  trouble_open_tab = { "<A-t>" }, -- open buffer in new tab
  trouble_jump_close = { "o" }, -- jump to the diagnostic and close the list
  trouble_toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
  trouble_toggle_preview = "P", -- toggle auto_preview
  trouble_hover = "<leader><leader>null", -- opens a small popup with the full multiline message
  trouble_preview = "p", -- preview the diagnostic location
  trouble_close_folds = { "zM", "zm" }, -- close all folds
  trouble_open_folds = { "zR", "zr" }, -- open all folds
  trouble_toggle_fold = { "zA", "za" }, -- toggle fold of current file
  trouble_previous = "k", -- previous item
  trouble_next = "j", -- next item
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For Persistence                                                             │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  persistence_load = "<leader>ll",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Map                                                                         │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  map = vim.keymap.set,
  normal_opts = {
    noremap = true,
    silent = true,
  },
  buffer_opts = {
    buffer = true,
    noremap = true,
    silent = true,
  },
}

return keys
