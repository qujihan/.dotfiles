local autocmd = vim.api.nvim_create_autocmd
-- local usercmd = vim.api.nvim_create_user_command
local keys = require("settings.keymaps")

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  reopening the buffer to restore the cursor position                         │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos(".", vim.fn.getpos("'\""))
      vim.cmd("silent! foldopen")
    end
  end,
})

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Cancel new line comment                                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  close some file with <q>                                                    │
-- │  Use :ehco &filetype get the filetype                                        │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
autocmd({ "FileType" }, {
  pattern = {
    "help",
    "Trouble",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- ╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
-- │  Opening nvim-tree at neovim startup                                                                 │
-- │  https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup#opening-nvim-tree-at-neovim-startup │
-- ╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
autocmd({ "VimEnter" }, {
  callback = function(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1
    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    if not real_file and not no_name then
      return
    end
    -- open the tree, find the file but don't focus it
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
  end,
})

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Go to last used hidden buffer when deleting a buffer                        │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
autocmd("BufEnter", {
  nested = true,
  callback = function()
    -- Only 1 window with nvim-tree left: we probably closed a file buffer
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      local api = require("nvim-tree.api")
      -- Required to let the close event complete. An error is thrown without this.
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last hidden buffer used before closing
        api.tree.toggle({ find_file = true, focus = true })
        -- re-open nivm-tree
        api.tree.toggle({ find_file = true, focus = true })
        -- nvim-tree is still the active window. Go to the previous window.
        vim.cmd("wincmd p")
      end, 0)
    end
  end,
})

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  NvimTree keymap add and del                                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
autocmd({ "FileType" }, {
  pattern = { "NvimTree" },
  callback = function()
    vim.keymap.set("n", keys.buffer_prev, "<cmd>:NvimTreeFocus<cr>", { buffer = true, silent = true })
    vim.keymap.set("n", keys.buffer_next, "<cmd>:NvimTreeFocus<cr>", { buffer = true, silent = true })
  end,
})
