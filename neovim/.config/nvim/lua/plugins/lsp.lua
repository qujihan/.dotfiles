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
  -- │  Treesitter                                                                  │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", opts = {} },
}
