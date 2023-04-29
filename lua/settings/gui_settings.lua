-- [[ GUI Settings ]

local M = {}


-- COLORS
-----------------------------------------------------------

-- Themes
M.dark_theme = {
    plugin = {
        name = 'vscode', source = 'mofiqul/vscode.nvim', bg = '#1e1e1e'
        -- name = 'onedark', source = 'navarasu/onedark.nvim',  bg = '#262A2F'
        -- name = 'tokyonight', source = 'folke/tokyonight.nvim', bg = '#242635'
        -- name = 'everforest', source = 'sainnhe/everforest', bg = '#282F34'
        -- name = 'nightfly', source = 'bluz71/vim-nightfly-colors', bg = '#0A1522'
        -- name = 'rose-pine-moon', source = 'rose-pine/neovim', bg = '#1E1823'
        -- name = 'quantum' source = 'tyrannicaltoucan/vim-quantum', bg = '#1e1e1e'
        -- name = 'catppuccin-mocha', lualine = 'catppuccin', source = 'catppuccin/nvim', bg = '#212332'
    },
    colors = {
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
}

M.light_theme = {
    plugin = {
    name = 'catppuccin-latte', lualine = 'catppuccin', source = 'catppuccin/nvim', bg = '#EDEFF3'
    },
    colors = {
        ['BufferLineIndicatorSelected'] = "guifg=#EDEFF3 guibg=#EDEFF3",
        ['NvimTreeWinSeparator'] = "guifg=#B4B8C4",
        ['BufferLineBackground'] = "guifg=#9ca0b0",
        ['BufferLineBuffer'] = "guifg=#9ca0b0",
        ["BufferLineHint"] = "guifg=#9ca0b0",
        ["BufferLineInfo"] = "guifg=#9ca0b0",
        ["BufferLineWarning"] = "guifg=#9ca0b0",
        ['BufferLineCloseButton'] = "guifg=#9ca0b0",
        ['BufferLineCloseButtonSelected'] = "guifg=#5a5a5a",
        ['BufferLineBufferSelected'] = "guifg=#5a5a5a gui=none",
        ['BufferLineInfoSelected'] = "guifg=#5a5a5a gui=none",
        ['BufferLineHintSelected'] = "guifg=#5a5a5a gui=none",
        ['BufferLineWarningSelected'] = "guifg=#5a5a5a gui=none",
    }
}

-- Theme options
M.setup_themes = function() 
    require('catppuccin').setup({
    	no_italic = true,
    	no_bold = true,
    	integrations = {
            cmp = true,
            nvimtree = true,
            telescope = true
    	}
    })
end

-- Default settings 
M.use_dark_theme = true
M.current_bg = "NONE"
-- M.current_bg = M.dark_theme.plugin.bg

return M
