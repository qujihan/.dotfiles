local keys = require("settings.keymaps")
local opt = { noremap = true, silent = true }
require("tool.autocmds")

-- basic
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.encoding = "UTF-8"
vim.o.number = true -- 显示行号
vim.o.relativenumber = true
vim.o.cursorline = true -- 高亮所在行
vim.o.ignorecase = true -- 忽略大小写
vim.o.smartcase = true
vim.o.wrap = false -- 禁止折行
vim.o.showtabline = 2 -- 永远显示tabline
vim.o.signcolumn = "yes"
-- color
vim.o.termguicolors = true
-- backup and swap
vim.o.backup = false
vim.o.writebackup = false
vim.o.noswapfile = true
-- indent
vim.o.expandtab = true -- 空格代替tab
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true -- >> << 时移动长度
vim.o.autoindent = true -- 新行对其当前行
-- zc 折叠 zo 展开
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  For lazy.nvim                                                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  For which-key                                                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.o.timeout = true
vim.o.timeoutlen = 1000
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  For nvim tree                                                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.o.loaded_netrw = 1 --disable netrw
vim.o.loaded_netrwPlugin = 1
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Set Basic keymaps                                                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- vim.keymap.set("v", "p", '"_dP', opt)
vim.keymap.set("v", keys.yank_to_system, '"+y', opt)
vim.keymap.set("n", keys.paste_to_vim, '"+p', opt)
vim.keymap.set("n", keys.buffer_hop_up, "<c-w>k", opt)
vim.keymap.set("n", keys.buffer_hop_down, "<c-w>j", opt)
vim.keymap.set("n", keys.buffer_hop_left, "<c-w>h", opt)
vim.keymap.set("n", keys.buffer_hop_right, "<c-w>l", opt)
vim.keymap.set("n", keys.buffer_resize_left, ":vertical resize -2<CR>", opt)
vim.keymap.set("n", keys.buffer_resize_right, ":vertical resize +2<CR>", opt)
