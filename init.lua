-- NOTE: Dependencies
-----------------------------------------------------------
-- neovim
-- node.js
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

require 'toggle_lsp_diagnostics'.init({ start_on = false })
