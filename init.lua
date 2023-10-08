-- Dependencies
-----------------------------------------------------------
-- ripgrep (for Telescope Live Grep)
-- Universal Ctags (for Tagbar - https://ctags.io/)

-- Initialize
-----------------------------------------------------------
require('plugins')
require('settings')
require('features')

-- Setup colors
require('utils.gui').set_custom_colors()

-- Setup themes
require('settings.themes').setup_themes()

-- Vim GUI settings (set here in case they are overridden by plugins)
vim.cmd('set noshowmode')
vim.cmd('set number')

-- Disable Neovim intro text
vim.opt.shortmess:append("sI")

-- Disable tilde on end of buffer
vim.cmd [[let &fcs='eob: ']]

-- Disable diagnostics
require 'toggle_lsp_diagnostics'.init({ start_on = false })
-- require 'lspconfig'.omnisharp.setup{}
-- require'omnisharp-vim'.setup{}
