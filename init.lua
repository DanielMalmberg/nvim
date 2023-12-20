-- INFO: Dependencies
-- -----------------------------------------------------------
-- neovim
-- node.js
-- ripgrep (for Telescope Live Grep)
-- fd (for Telescope - https://github.com/sharkdp/fd) 
-- Universal Ctags (for Tagbar - https://ctags.io/)
-----------------------------------------------------------
--
--  Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

require('managers')
require('settings')
require('features')

require 'toggle_lsp_diagnostics'.init({ start_on = false })
