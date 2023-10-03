-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/L3MON4D3/LuaSnip
local keys = require("settings.keymaps")
return {
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  cmp                                                                         │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "lukas-reineke/cmp-under-comparator",
    },
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            before = function(entry, vim_item)
              vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
              return vim_item
            end,
          }),
        },

        mapping = {
          [keys.cmp_complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          [keys.cmp_abort] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          [keys.cmp_confirm] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace,
          }),
          [keys.cmp_scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          [keys.cmp_scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          [keys.cmp_select_next_item] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          [keys.cmp_select_prev_item] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },

        sources = {
          { name = "luasnip" },
          { name = "buffer" },
          { name = "nvim_lsp" },
        },

        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })
    end,
  },
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  Luasnip                                                                     │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local snippet_path = vim.fn.stdpath("config") .. "/snips/"
      if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
        vim.opt.rtp:append(snippet_path)
      end

      require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged,InsertLeave",
      })

      require("luasnip.loaders.from_vscode").lazy_load()
      -- require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
}
