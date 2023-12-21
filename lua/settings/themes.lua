-- [[ GUI Settings ]

local colors = require('settings.colors')
local M = {}

M.selected_theme = {
    -- name = '', source = '', custom_colors = {} (optional)
    -- name = 'vscode', source = 'mofiqul/vscode.nvim', custom_colors = colors.vscode_custom_colors
    -- name = 'onedark', source = 'navarasu/onedark.nvim'
    -- name = 'tokyonight', source = 'folke/tokyonight.nvim'
    -- name = 'everforest', source = 'sainnhe/everforest'
    -- name = 'nightfly', source = 'bluz71/vim-nightfly-colors'
    -- name = 'rose-pine-moon', source = 'rose-pine/neovim'
    -- name = 'quantum' source = 'tyrannicaltoucan/vim-quantum'
    -- name = 'catppuccin-mocha', source = 'catppuccin/nvim'
    -- name = 'falcon', source = 'fenetikm/falcon'
    name = 'tundra', source = 'sam4llis/nvim-tundra'
}

M.transparent_at_startup = false

return M
