-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local keys = require("settings.keymaps")
local M = {}
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Install list and Config list                                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
M.lsp_list = function()
  local list = {}
  if vim.loop.os_uname().sysname == "Windows_NT" then
    list = { "lua_ls", "gopls" }
  elseif vim.loop.os_uname().sysname == "Darwin" then
    list = { "lua_ls", "cmake", "clangd", "gopls" }
  elseif vim.loop.os_uname().sysname == "Linux" then
    list = { "lua_ls", "cmake", "clangd" }
  end
  return list
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  LSP common config                                                           │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local common = function(client, bufnr)
  -- set keymap
  local opt = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", keys.lsp_format, "<cmd> lua vim.lsp.buf.format() <CR>", opt)
  vim.keymap.set("n", keys.lsp_rename, "<cmd> lua vim.lsp.buf.rename() <CR>", opt)
  vim.keymap.set("n", keys.lsp_code_action, "<cmd> lua vim.lsp.buf.code_action() <CR>", opt)
  vim.keymap.set("n", keys.lsp_hover_float, "<cmd> lua vim.lsp.buf.hover() <CR>", opt) -- Calling the function twice will jump into the floating window.
  vim.keymap.set("n", keys.lsp_signature_float, "<cmd> lua vim.lsp.buf.signature_help() <CR>", opt)
  vim.keymap.set("n", keys.lsp_reference_list_quickfix, "<cmd> lua vim.lsp.buf.references() <CR>", opt)
  vim.keymap.set("n", keys.lsp_implementation_list_quickfix, "<cmd> lua vim.lsp.buf.implementation() <CR>", opt)
  vim.keymap.set("n", keys.lsp_definition_jump, "<cmd> lua vim.lsp.buf.definition() <CR>", opt)
  vim.keymap.set("n", keys.lsp_definition_type_jump, "<cmd> lua vim.lsp.buf.type_definition() <CR>", opt)
  vim.keymap.set("n", keys.lsp_declaration_jump, "<cmd> lua vim.lsp.buf.declaration() <CR>", opt)
  vim.keymap.set("n", keys.lsp_diagnostic_float, "<cmd> lua vim.diagnostic.open_float() <CR>", opt)
  vim.keymap.set("n", keys.lsp_diagnostic_jump_prev, "<cmd> lua vim.diagnostic.goto_prev() <CR>", opt)
  vim.keymap.set("n", keys.lsp_diagnostic_jump_next, "<cmd> lua vim.diagnostic.goto_next() <CR>", opt)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Lua                                                                         │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
M.lua_ls = {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  debounce_text_changes = 150,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end,
}

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  C/CPP                                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local clangd_capabilities = require("cmp_nvim_lsp").default_capabilities()
clangd_capabilities.offsetEncoding = "utf-8"
M.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--completion-style=detailed",
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  capabilities = clangd_capabilities,
  debounce_text_changes = 150,
  on_attach = function(client, bufnr)
    common(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end,
}

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  CMake                                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
M.cmake = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  debounce_text_changes = 150,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end,
}

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Golang                                                                      │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
M.gopls = {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  debounce_text_changes = 150,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end,
}

return M
