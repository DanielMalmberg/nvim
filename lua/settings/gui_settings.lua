-- [[ GUI Settings ]]

local M = {}

-- COLORS
-----------------------------------------------------------
-- Theme
M.theme = {
    'vscode', 'mofiqul/vscode.nvim', '#1e1e1e'
    -- 'onedark', 'navarasu/onedark.nvim', '#262A2F'
    -- 'tokyonight', 'folke/tokyonight.nvim', '#242634'
}

-- Define backgroundcolor
local transparent_at_startup = true 
M.default_bg = M.theme[3]
M.current_bg = transparent_at_startup and "NONE" or M.default_bg 

return M
