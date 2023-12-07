-- [[ Configure Plugin manager ]]

local gui_utils = require('utils.gui')
local current_theme = gui_utils.get_current_theme()
local optional_theme = gui_utils.get_optional_theme()

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
    current_theme.plugin.source,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(current_theme.plugin.name)
    end,
  },
  optional_theme.plugin.source,

  -- File explorer
  "nvim-tree/nvim-tree.lua",

  -- Tagbar
  "preservim/tagbar",

  -- Tabs
  { 'akinsho/bufferline.nvim', version = "*" },

  -- Set lualine as statusline
  -- `:help lualine.txt`
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = { 
        lualine_c = {
          { 'filename', path = 1 } 
        },
      },
    },
  },


  "folke/todo-comments.nvim",

  -- FEATURES
  -----------------------------------------------------------
  -- LSP Configuration & Plugins
  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies =
  --   {
  --     -- Automatically install LSPs to stdpath for neovim
  --     { 'williamboman/mason.nvim', config = true },
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     -- Useful status updates for LSP
  --     { 'j-hui/fidget.nvim',       opts = {} },
  --
  --     'folke/neodev.nvim',
  --     -- Toggle LSP warnings and errors
  --     'folke/lsp-trouble.nvim',
  --     -- Required for lsp-trouble.nvim
  --     'kyazdani42/nvim-web-devicons',
  --     'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  --   },
  -- },
  
  "github/copilot.vim",

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

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'sindrets/diffview.nvim',

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

  'mbbill/undotree',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',   opts = {} },

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

  -- Toggleable terminal window
  "akinsho/toggleterm.nvim",

  -- Filepath
  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic"
  --   },
  --   opts = {
  --     theme = {
  --       normal = { bg="none"}
  --     }
  --   },
  -- },

  -- ENHANCED TYPING
  -----------------------------------------------------------
  -- Highlight current word occurrences
  "RRethy/vim-illuminate",

  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup{}
    end
  },

  -- -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies =
  --   {
  --     'hrsh7th/cmp-nvim-lsp',
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip'
  --   }
  -- },

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
      space_char_blankline = " ",
      show_current_context = true,
      -- show_current_context_start = true,
    },
  },

}, {})
