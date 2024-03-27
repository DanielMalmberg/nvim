-- [[ Current theme ]]

local colors = require('settings.colors')
local M = {}

-- format: name = 'name of the theme', source = 'github repo'
M.startup_theme = {
    name = 'tundra', source = 'sam4llis/nvim-tundra'
}

-- format: { name = 'name of the theme', source = 'github repo', custom_colors = colors.example_table }
M.other_themes = {
    -- { name = 'tundra', source = 'sam4llis/nvim-tundra' },
    -- { name = 'onedark', source = 'navarasu/onedark.nvim' },
    { name = 'rose-pine-main', source = 'rose-pine/neovim' },
    -- { name = 'rose-pine-moon', source = 'rose-pine/neovim' },
    { name = 'catppuccin-mocha', source = 'catppuccin/nvim' },
    { name = 'vscode', source = 'mofiqul/vscode.nvim' },
    -- { name = 'dracula', source = 'Mofiqul/dracula.nvim' },
    -- { name = 'tokyonight', source = 'folke/tokyonight.nvim' },
    -- { name = 'nightfly', source = 'bluz71/vim-nightfly-colors' },
}

function M.get_other_themes_sources()
    local sources = {}
    for _, theme in ipairs(M.other_themes) do
        table.insert(sources, theme.source)
    end
    return sources
end

function M.get_other_themes_names()
    local names = {}
    for _, theme in ipairs(M.other_themes) do
        table.insert(names, theme.name)
    end
    return names
end

return M
