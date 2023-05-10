local lsp_config = require("settings.lsp-config")
local keys = require("keymap.keys")
local map, nor_opts = keys.map, keys.normal_opts

return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  LSP-ZERO                                                                    │
  -- │  https://github.com/VonHeikemen/lsp-zero.nvim                                │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" }, -- Required
    },
    config = function()
      local lsp = require("lsp-zero").preset({})
      local install_list, config_list = lsp_config.lsp_list()
      local lspconfig = require("lspconfig")
      -- auto install lsp
      lsp.ensure_installed(install_list)
      -- config lsp
      for name in pairs(config_list) do
        lspconfig[name].setup(lsp_config[name])
      end
      -- keymap
      map("n", keys.lsp_format, "<cmd> lua vim.lsp.buf.format() <CR>", nor_opts)
      map("n", keys.lsp_rename, "<cmd> lua vim.lsp.buf.rename() <CR>", nor_opts)
      map("n", keys.lsp_code_action, "<cmd> lua vim.lsp.buf.code_action() <CR>", nor_opts)
      map("n", keys.lsp_hover_float, "<cmd> lua vim.lsp.buf.hover() <CR>", nor_opts) -- Calling the function twice will jump into the floating window.
      map("n", keys.lsp_signature_float, "<cmd> lua vim.lsp.buf.signature_help() <CR>", nor_opts)
      map("n", keys.lsp_reference_list_quickfix, "<cmd> lua vim.lsp.buf.references() <CR>", nor_opts)
      map("n", keys.lsp_implementation_list_quickfix, "<cmd> lua vim.lsp.buf.implementation() <CR>", nor_opts)
      map("n", keys.lsp_definition_jump, "<cmd> lua vim.lsp.buf.definition() <CR>", nor_opts)
      map("n", keys.lsp_definition_type_jump, "<cmd> lua vim.lsp.buf.type_definition() <CR>", nor_opts)
      map("n", keys.lsp_declaration_jump, "<cmd> lua vim.lsp.buf.declaration() <CR>", nor_opts)
      map("n", keys.lsp_diagnostic_float, "<cmd> lua vim.diagnostic.open_float() <CR>", nor_opts)
      map("n", keys.lsp_diagnostic_jump_prev, "<cmd> lua vim.diagnostic.goto_prev() <CR>", nor_opts)
      map("n", keys.lsp_diagnostic_jump_next, "<cmd> lua vim.diagnostic.goto_next() <CR>", nor_opts)
      lsp.setup()
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Null-ls                                                                     │
  -- │  https://github.com/jose-elias-alvarez/null-ls.nvim                          │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- for lua
          null_ls.builtins.formatting.stylua,

          -- for golang
          null_ls.builtins.formatting.gofmt,

          -- for markdown
          null_ls.builtins.formatting.cbfmt,
          null_ls.builtins.formatting.deno_fmt,
        },
      })
    end,
  },
}
