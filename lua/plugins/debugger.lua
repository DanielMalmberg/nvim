-- [[ Debugger ]]
-- This module configures the nvim-dap plugin for debugging in Neovim. 

return {
  'mfussenegger/nvim-dap',
  enabled = true,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'leoluz/nvim-dap-go',
    'rcarriga/nvim-dap-ui',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        -- 'delve',
      },
    }

    -- `:h nvim-dap-ui`
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Golang specific config
    require('dap-go').setup()
  end,
}
