-- [[ LSP Zero ]]
-- A collection of functions and plugins that makes it easy to setup LSPs

return {
  "VonHeikemen/lsp-zero.nvim",
  branch = 'v2.x',
  priority = 950,
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",             -- Required
    "williamboman/mason.nvim",           -- Optional
    "williamboman/mason-lspconfig.nvim", -- Optional

    -- Useful status updates for LSP
    "j-hui/fidget.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",                  -- Required
    "hrsh7th/cmp-nvim-lsp",              -- Required
    "L3MON4D3/LuaSnip",                  -- Required
    "saadparwaiz1/cmp_luasnip",

    -- Toggle LSP warnings and errors
    "folke/lsp-trouble.nvim",
    -- Required for lsp-trouble.nvim
    "kyazdani42/nvim-web-devicons",
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
  },
  config = function()
    require 'toggle_lsp_diagnostics'.init({ start_on = false })
  end
}
