-- [[ GUI Settings ]

local colors = require('settings.colors')

local M = {}

M.selected_theme = {
    name = 'vscode', source = 'mofiqul/vscode.nvim', transparency = true, bg = '#1e1e1e', custom_colors = colors.dark_colors
    -- name = 'onedark', source = 'navarasu/onedark.nvim', transparency = false
    -- name = 'tokyonight', source = 'folke/tokyonight.nvim', bg = '#242635'
    -- name = 'everforest', source = 'sainnhe/everforest', bg = '#282F34'
    -- name = 'nightfly', source = 'bluz71/vim-nightfly-colors', bg = '#0A1522'
    -- name = 'rose-pine-moon', source = 'rose-pine/neovim', bg = '#1E1823'
    -- name = 'quantum' source = 'tyrannicaltoucan/vim-quantum', bg = '#1e1e1e'
    -- name = 'catppuccin-mocha', lualine = 'catppuccin', source = 'catppuccin/nvim', bg = '#212332'
    -- name = 'github-theme', source = 'projekt0n/github-nvim-theme', bg = '#1e1e1e'
    -- name = 'material', source = 'marko-cerovac/material.nvim', bg = '#1e1e1e'
    -- name = 'falcon', source = 'fenetikm/falcon', bg = '#1e1e1e'
}

-- Startup background
-- M.current_bg = "NONE"
M.current_bg = M.selected_theme.bg

return M
