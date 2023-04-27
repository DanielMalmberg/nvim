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
    -- 'catppuccin-mocha', 'catppuccin/nvim', '#212332'
    -- 'nightfly', 'bluz71/vim-nightfly-colors', '#0A1522'
    -- 'rose-pine-moon', 'rose-pine/neovim', '#1E1823'
    -- 'quantum', 'tyrannicaltoucan/vim-quantum', '#1e1e1e'
     -- 'ayu', 'ayu-theme/ayu-vim', '#1e1e1e'
}

-- Color settings 
local transparent_at_startup = true

-- Define default colors
M.default_bg =  M.theme[3]
M.current_bg = transparent_at_startup and "NONE" or M.default_bg
M.colors = {
    ['BufferLineIndicatorSelected'] = "guifg=#1B1B1B guibg=#1B1B1B",
    ['NvimTreeWinSeparator'] = "guifg=#505050",
    ['BufferLineBufferSelected'] = "gui=none",
    ['BufferLineBackground'] = "guifg=#5a5a5a",
    ['BufferLineBufferVisible'] = "guifg=#5a5a5a",
    ["BufferLineHintVisible"] = "guifg=#5a5a5a",
    ["BufferLineInfoVisible"] = "guifg=#5a5a5a",
    ["BufferLineWarningVisible"] = "guifg=#5a5a5a",
    ['BufferLineCloseButtonVisible'] = "guifg=#5a5a5a",
    ['BufferLineCloseButton'] = "guifg=#5a5a5a",
    ['BufferLineInfo'] = "guifg=#5a5a5a",
    ['BufferLineHint'] = "guifg=#5a5a5a",
    ['BufferLineWarning'] = "guifg=#5a5a5a",
    ['BufferLineInfoSelected'] = "guifg=#FFFFF gui=none",
    ['BufferLineHintSelected'] = "guifg=#FFFFF gui=none",
    ['BufferLineWarningSelected'] = "guifg=#FFFFF gui=none",
}

return M
