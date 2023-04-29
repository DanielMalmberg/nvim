require('plugin_manager')
require('plugins')
require('settings')
require('keymaps')
require('features')


-- Initialize
-----------------------------------------------------------

-- Backgroundcolor
require('utils/gui_utils').set_custom_colors()

-- Diagnostics
require'toggle_lsp_diagnostics'.init({ start_on = false })
