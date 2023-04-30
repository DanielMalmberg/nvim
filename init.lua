-- Dependencies
-----------------------------------------------------------
-- ripgrep (for Telescope Live Grep)
-- Universal Ctags (for Tagbar - https://ctags.io/)

-- Initialize
-----------------------------------------------------------
require('plugins')
require('settings')
require('features')

-- GUI 
require('utils.gui').set_custom_colors()
require('settings.themes').setup_themes()

-- Diagnostics
require'toggle_lsp_diagnostics'.init({ start_on = false })

-- Use this to automatically hide the startup text 
-- vim.cmd(':call feedkeys("<S-u>")')
