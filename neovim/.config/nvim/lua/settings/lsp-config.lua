-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local M = {}

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Common Config for LSP                                                       │
-- │  Todo!                                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────────╯

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Install list and Config list                                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
M.lsp_list = function()
  local install_name, config_name = {}, {}
  if vim.loop.os_uname().sysname == "Windows_NT" then
    install_name = { "lua_ls", "clangd", "cmake", "gopls" }
    config_name = { lua_ls, clangd, cmake, gopls }
  elseif vim.loop.os_uname().sysname == "Darwin" then
    install_name = { "lua_ls", "clangd", "cmake", "gopls" }
    config_name = { lua_ls, clangd, cmake, gopls }
  elseif vim.loop.os_uname().sysname == "Linux" then
    install_name = { "clangd", "cmake" }
    config_name = { lua_ls, clangd, cmake, gopls }
  end
  return install_name, config_name
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
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
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
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  CMake                                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
M.cmake = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  debounce_text_changes = 150,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
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
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}

return M
