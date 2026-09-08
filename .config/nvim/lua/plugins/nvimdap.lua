return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup({
        layouts = { {
          elements = { {
            id = "scopes",
            size = 0.33
          }, {
            id = "breakpoints",
            size = 0.33
          }, {
            id = "watches",
            size = 0.33
          } },
          position = "left",
          size = 60
        } },
      })

      local function select_sync(items, opts)
        local co = assert(coroutine.running())
        vim.schedule(function()
          vim.ui.select(items, opts, function(selected)
            coroutine.resume(co, selected)
          end)
        end)

        return coroutine.yield()
      end

      local function get_process()
        local processes = require("dap.utils").get_processes()
        local process = select_sync(processes, {
          format_item = function(item)
            return item.name
          end,
        })

        return process.pid
      end

      local csharp_ls_debugger = vim.fn.exepath "netcoredbg"
      if csharp_ls_debugger ~= "" then
        dap.adapters.coreclr = {
          type = 'executable',
          command = csharp_ls_debugger,
          args = { '--interpreter=vscode' }
        }

        dap.configurations.cs = {
          {
            type = "coreclr",
            name = ".NET Attach",
            request = "attach",
            processId = get_process
          }
        }
      end

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F10>", dap.disconnect)
      vim.keymap.set("n", "<F13>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
