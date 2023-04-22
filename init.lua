require('plugin_manager')
require('plugin_configs')
require('settings')
require('keymaps')
require('features')


-- Initialize
-----------------------------------------------------------

-- Backgroundcolor
require('utils').change_backgroundcolor(require('settings.gui_settings').current_bg)

-- Diagnostics
require'toggle_lsp_diagnostics'.init({ start_on = false })
