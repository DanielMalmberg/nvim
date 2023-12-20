-- INFO: Dependencies
-- -----------------------------------------------------------
-- neovim
-- node.js
-- ripgrep (for Telescope Live Grep)
-- Universal Ctags (for Tagbar - https://ctags.io/)

-- Initialize
-----------------------------------------------------------
require('plugins')
require('settings')
require('features')
require('managers')

require 'toggle_lsp_diagnostics'.init({ start_on = false })
