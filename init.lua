-- Dependencies
-----------------------------------------------------------
-- ripgrep (for Telescope Live Grep)
-- Universal Ctags (for Tagbar - https://ctags.io/)

-- Initialize
-----------------------------------------------------------
require('plugins')
require('settings')
require('features')

-- Setup themes and colors
require('utils.gui').set_custom_colors()
require('settings.themes').setup_themes()

-- Disable Neovim intro text
vim.opt.shortmess:append("sI")

-- Disable tilde on end of buffer
vim.cmd [[let &fcs='eob: ']]

-- Disable diagnostics
require 'toggle_lsp_diagnostics'.init({ start_on = false })
