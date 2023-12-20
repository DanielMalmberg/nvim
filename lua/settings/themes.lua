-- [[ GUI Settings ]

local colors = require('settings.colors')

local M = {}

M.selected_theme = {
    -- name = '', source = '', transparency = false
    -- name = 'vscode', source = 'mofiqul/vscode.nvim', transparency = true, bg = '#1e1e1e', custom_colors = colors.vscode_custom_colors
    -- name = 'onedark', source = 'navarasu/onedark.nvim', transparency = false, --bg = '#1e1e1e'
    -- name = 'tokyonight', source = 'folke/tokyonight.nvim', transparency = false, --bg = '#242635'
    -- name = 'everforest', source = 'sainnhe/everforest', transparency = false, --bg = '#282F34'
    -- name = 'nightfly', source = 'bluz71/vim-nightfly-colors', transparency = false, --bg = '#0A1522'
    -- name = 'rose-pine-moon', source = 'rose-pine/neovim', transparency = false, --bg = '#1E1823'
    -- name = 'quantum' source = 'tyrannicaltoucan/vim-quantum', transparency = false, --bg = '#1e1e1e'
    -- name = 'catppuccin-mocha', source = 'catppuccin/nvim', transparency = false, -- bg = '#212332'
    -- name = 'falcon', source = 'fenetikm/falcon', transparency = false, -- bg = '#1e1e1e'
    name = 'tundra', source = 'sam4llis/nvim-tundra', transparency = false
}

-- Startup background (when toggle transparency is active)
M.current_bg = M.selected_theme.bg
-- M.current_bg = "NONE"

return M
