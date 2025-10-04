-- INFO: Dependencies
-- neovim
-- node.js
-- shellcheck (for bashls LSP)
-- ripgrep (for Telescope Live Grep)
-- fd (for Telescope - https://github.com/sharkdp/fd) 
-- Universal Ctags (for Tagbar - https://ctags.io/)
-- -----------------------------------------------------------

-- INFO: Locked plugin versions
-- indent_blankline.nvim (commit "b7aa0aed55887edfaece23f7b46ab22232fc8741") 
-- - Plugin version 3 not compatible, use version 2 
-- toggle-lsp-diagnostics.nvim (commit "77399c5f8fc68541b222aeae278afd0988ab660c")
--  - Annoying popup message added in newer vesions when toggling diagnostics on
-- -----------------------------------------------------------

-- BEFORE

-- Detect OS
vim.g.is_macos = vim.loop.os_uname().sysname == 'Darwin'

-- Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Hide deprecated warnings 
vim.deprecate = function() end

-- -----------------------------------------------------------

-- INITIALIZE

require('managers')
require('settings')
require('features')

-- -----------------------------------------------------------

-- AFTER

require('settings.theme').setup()

-- Disable Copilot at startup
-- vim.cmd('Copilot disable')
