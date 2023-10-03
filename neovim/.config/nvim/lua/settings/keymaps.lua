return {
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
  buffer_pick = "<leader>bp",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For cmp and luasnip                                                         │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  cmp_complete = "<A-.>",
  cmp_abort = "<A-,>",
  cmp_confirm = "<CR>",
  cmp_scroll_doc_up = "<C-u>",
  cmp_scroll_doc_down = "<C-d>",
  cmp_select_prev_item = "<C-p>",
  cmp_select_next_item = "<C-n>",
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
  tree_toggle = "<Leader>wb",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For telescope                                                               │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  telescope_find_files = "<leader>ff",
  telescope_live_grep = "<leader>fg",
  telescope_buffers = "<leader>fb",
  telescope_cycle_history_next = "<Down>",
  telescope_cycle_history_prev = "<Up>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For term                                                                    │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  term_open = "<A-`>",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For Persistence                                                             │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  persistence_load = "Load",
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  For flash                                                                   │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  flash_jump = "s",
  flash_treesitter = "S",
}
