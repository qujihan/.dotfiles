vim.pack.add {
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-mini/mini.splitjoin' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
}

require('mini.splitjoin').setup()
require('mini.pairs').setup()
vim.lsp.config('gopls', {})
vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
