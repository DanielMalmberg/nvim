require('plugins')
require('settings')
require('features')


-- Initialize
-----------------------------------------------------------

-- GUI 
require('utils.gui').set_custom_colors()
require('settings.themes').setup_themes()

-- Diagnostics
require'toggle_lsp_diagnostics'.init({ start_on = false })
