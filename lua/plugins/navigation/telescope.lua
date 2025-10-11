-- [[ Telescope ]]
-- Used for navigating in the files and text in the current repository

return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  lazy = false,
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            lsp_references = {
              cwd = vim.loop.cwd(),
            },
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        file_ignore_patterns = {
          -- logfiles
          -- ".log",
          -- python files
          "__init__.py",
          ".pyc",
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      }
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
