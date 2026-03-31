-- Option
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Global Config
vim.g.mapleader = " "


-- Package Manager
vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/nvim-mini/mini.nvim'
}
require('mini.splitjoin').setup()
require('mini.pairs').setup()
require('mini.files').setup()
require('mini.completion').setup()
require('mini.icons').setup()
require('mini.snippets').setup()
require('mini.cmdline').setup()
require('mini.surround').setup()
require("mason").setup()


-- LSP Config
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable({
    "gopls",
    "lua_ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user.cfg", { clear = true }),
    callback = function(ev)
        local bufopts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = ev.buf, desc = "Format" })

        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})



