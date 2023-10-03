local keys = require("settings.keymaps")

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapvt = require("nvim-dap-virtual-text")
      local dap_config = require("settings.dap-config")
      -- local dap_delve = require("settings.dap-delve")
      -- local dap_codelldb = require("settings.dap-codelldb")

      dapvt.setup()

      -- config dap-go
      dap.adapters.delve = dap_config.delve.delve
      dap.configurations.go = dap_config.delve.go

      -- set keymap
      vim.keymap.set("n", keys.dap_continue, function()
        require("dap").continue()
      end)
      vim.keymap.set("n", keys.dap_step_over, function()
        require("dap").step_over()
      end)
      vim.keymap.set("n", keys.dap_step_into, function()
        require("dap").step_into()
      end)
      vim.keymap.set("n", keys.dap_step_out, function()
        require("dap").step_out()
      end)
      vim.keymap.set("n", keys.dap_toggle_breakpoint, function()
        require("dap").toggle_breakpoint()
      end)
      vim.keymap.set("n", keys.dap_set_breakpoint, function()
        require("dap").set_breakpoint()
      end)
      vim.keymap.set("n", keys.dap_repl_open, function()
        require("dap").repl.open()
      end)
      vim.keymap.set("n", keys.dap_run_last, function()
        require("dap").run_last()
      end)
    end,
  },

  -- Fot dap-ui, it will delelt
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- this snippets from https://github.com/nshen/InsisVim/blob/main/lua/insis/dap/nvim-dap/init.lua
      dapui.setup({
        element_mappings = {
          scopes = {
            open = keys.dapui_open,
            edit = keys.dapui_edit,
            expand = keys.dapui_expand,
            repl = keys.dapui_repl,
          },
        },
        layouts = {
          {
            elements = {
              -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.4 },
              "stacks",
              "watches",
              "breakpoints",
              "console",
            },
            size = 0.35, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "rounded", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
