require('plugin_manager')
require('plugins')
require('settings')
require('keymaps')
require('features')


-- Initialize
-----------------------------------------------------------

-- GUI 
require('utils/gui_utils').set_custom_colors()

require('settings/gui_settings').setup_themes()

-- Diagnostics
require'toggle_lsp_diagnostics'.init({ start_on = false })
