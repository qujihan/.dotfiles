local lsp_config = require("settings.lsp-config")

return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  lsp-zero                                                                    │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lsp = require("lsp-zero").preset()
      local ensure_installed_list = lsp_config.lsp_list()
      local lspconfig = require("lspconfig")
      -- config autoinstall lsp
      lsp.ensure_installed(ensure_installed_list)
      -- config lsp
      for _, value in pairs(ensure_installed_list) do
        lspconfig[value].setup(lsp_config[value])
      end
      lsp.setup()
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Null-ls                                                                     │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua",
          "gofmt",
        },
        automatic_installation = false,
      })

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.gofmt,
        },
      })
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Treesitter                                                                  │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", opts = {} },
}
