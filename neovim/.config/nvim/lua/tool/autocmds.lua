-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  reopening the buffer to restore the cursor position                         │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd("BufReadPost", {
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
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  close some file with <q>                                                    │
-- │  Use :ehco &filetype get the filetype                                        │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd({ "FileType" }, {
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
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    if not no_name and not directory then
      return
    end
    -- change to the directory
    if directory then
      vim.cmd.cd(data.file)
    end
    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
})

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Go to last used hidden buffer when deleting a buffer                        │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd("BufEnter", {
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
