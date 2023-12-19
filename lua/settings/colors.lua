
local M = {}

M.backgrounds = {
    'Normal',
    'NormalNC',
    'LineNr',
    'SignColumn',
    'FoldColumn',
    'NvimTreeNormal',
    'NvimTreeNormalNC',
    'NvimTreeEndOfBuffer',
    'NvimTreeWinSeparator',
    'diffAdded',
    'diffChanged',
    'diffRemoved',
    'EndOfBuffer',
    'TelescopeNormal'
}

M.dark_colors = {
    ['NvimTreeWinSeparator'] = "guifg=#505050",
    ['IndentBlanklineContextChar'] = "guifg=#949494",
    -- ['IlluminatedWordRead'] = "gui=none guibg=#505050",
    -- ['IlluminatedWordText'] = "gui=none guibg=#505050",
    -- ['IlluminatedWordWrite'] = "gui=none guibg=#505050",
}

return M
