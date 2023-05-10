-- https://github.com/nvim-treesitter/nvim-treesitter
-- Extra modules and plugins
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "markdown",
        -- "python",
        -- "java",
        -- "rust",
        "go",
        "json",
        "toml",
        "dockerfile",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
