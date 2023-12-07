-- [[ Configure Plugin manager ]]

local gui_utils = require('utils.gui')
local current_theme = gui_utils.get_current_theme()
local optional_theme = gui_utils.get_optional_theme()

-- Lazy.nvim boostrap
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  {
    current_theme.plugin.source,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(current_theme.plugin.name)
    end,
  },
  optional_theme.plugin.source,

  "nvim-tree/nvim-tree.lua", -- File explorer
  "akinsho/bufferline.nvim", -- Tabs
  "preservim/tagbar", -- Tagbar
  "github/copilot.vim", -- AI copilot
  "RRethy/vim-illuminate", -- Highlight current word occurrences
  "tpope/vim-surround", -- Change symbols wrapping a text
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "akinsho/toggleterm.nvim", -- Toggleable terminal window
  "folke/which-key.nvim", -- Useful plugin to show you pending keybinds.
  "lewis6991/gitsigns.nvim", -- Adds git releated signs to the gutter, as well as utilities for managing changes
  "nvim-lualine/lualine.nvim",
  "folke/todo-comments.nvim",
  "sindrets/diffview.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "mbbill/undotree",


  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',   opts = {} },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup{}
    end
  },

  -- Add indentation guides even on blank lines
  -- `:help indent_blankline.txt`
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
      space_char_blankline = " ",
      show_current_context = true,
      -- show_current_context_start = true,
    },
  },





-- PLUGINS WITH DEPENDENCIES 

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Debugger
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',
    }
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
        config = true
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'saadparwaiz1/cmp_luasnip'},

      'folke/neodev.nvim',
      -- Toggle LSP warnings and errors
      'folke/lsp-trouble.nvim',
      -- Required for lsp-trouble.nvim
      'kyazdani42/nvim-web-devicons',
      'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    }
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies =
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
    build = ":TSUpdate",
  },


}, {})
