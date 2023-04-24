-- [[ GUI Settings ]]

local M = {}

-- COLORS
-----------------------------------------------------------
-- Theme
M.theme = {
    'vscode', 'mofiqul/vscode.nvim', '#1e1e1e'
    -- 'onedark', 'navarasu/onedark.nvim', '#262A2F'
    -- 'tokyonight', 'folke/tokyonight.nvim', '#242634'
    -- 'everforest', 'sainnhe/everforest', '#282F34'
    -- 'catppuccin-macchiato', 'catppuccin/nvim', '#212332'
    -- 'nightfly', 'bluz71/vim-nightfly-colors', '#0A1522'
}

-- Color settings 
local transparent_at_startup = true

-- Define default colors
M.default_bg =  M.theme[3]
M.current_bg = transparent_at_startup and "NONE" or M.default_bg
M.colors = {
    -- key = { 'propery', 'value' }
    NvimTreeSeparator = { 'guifg', '#505050' }
}

return M
