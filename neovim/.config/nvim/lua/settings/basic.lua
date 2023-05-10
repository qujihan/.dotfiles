local keys = require("keymap.keys")
local map, nor_opts, buf_opts = keys.map, keys.normal_opts, keys.buffer_opts
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
vim.o.noswapfile = false
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
-- │  For DAP                                                                     │
-- │  https://github.com/mfussenegger/nvim-dap/discussions/355                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- change point color
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointCondition", {
  text = "ﳁ",
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointRejected", {
  text = "",
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapLogPoint", {
  text = "",
  texthl = "DapLogPoint",
  linehl = "DapLogPoint",
  numhl = "DapLogPoint",
})
vim.fn.sign_define("DapStopped", {
  text = "",
  texthl = "DapStopped",
  linehl = "DapStopped",
  numhl = "DapStopped",
})
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Set Basic keymaps                                                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", nor_opts)
map("v", "K", ":move '<-2<CR>gv-gv", nor_opts)
-- 在visual 模式里粘贴不要复制
-- map("v", "p", '"_dP', nor_opts)
map("v", keys.yank_to_system, '"+y', nor_opts)
map("n", keys.paste_to_vim, '"+p', nor_opts)
-- buffer
map("n", keys.buffer_hop_up, "<c-w>k", nor_opts)
map("n", keys.buffer_hop_down, "<c-w>j", nor_opts)
map("n", keys.buffer_hop_left, "<c-w>h", nor_opts)
map("n", keys.buffer_hop_right, "<c-w>l", nor_opts)
map("n", keys.buffer_resize_left, ":vertical resize -2<CR>", nor_opts)
map("n", keys.buffer_resize_right, ":vertical resize +2<CR>", nor_opts)
