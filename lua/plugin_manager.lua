-- [[ Configure Plugin manager ]]

-- `:help lazy.nvim.txt`
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
  -- THEMES AND GUI
  -----------------------------------------------------------
  {
   -- 'navarasu/onedark.nvim',
    'mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'vscode'
    end,
  },

  -- File explorer 
  "nvim-tree/nvim-tree.lua",
  
  -- Tabs
  {'akinsho/bufferline.nvim', version = "*"},

  -- Set lualine as statusline
  -- `:help lualine.txt`
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'vscode',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- FEATURES
  -----------------------------------------------------------

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- LSP Configuration & Plugins
  { 
    'neovim/nvim-lspconfig',
    dependencies = 
    {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      'folke/neodev.nvim',
      -- Toggle LSP warnings and errors
      'folke/lsp-trouble.nvim',
      -- Required for lsp-trouble.nvim
      'kyazdani42/nvim-web-devicons',
      'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    },
  },

  -- Adds git releated signs to the gutter
  -- as well as utilities for managing changes
  -- `:help gitsigns.txt`
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

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

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = 
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },

  -- ENHANCED TYPING 
  -----------------------------------------------------------
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies =
    {
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }
  },

  -- Change symbols wrapping a text
  "tpope/vim-surround",

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- Add indentation guides even on blank lines
  -- `:help indent_blankline.txt`
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
}, {})
