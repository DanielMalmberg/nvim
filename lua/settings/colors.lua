
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
    -- 'BufferLineFill',
    'diffAdded',
    'diffChanged',
    'diffRemoved',
    'EndOfBuffer',
    'TelescopeNormal'
}

M.dark_colors = {
    -- General
    -- ['BufferLineInfo'] = "guifg=#5a5a5a",
    -- ['BufferLineHint'] = "guifg=#5a5a5a",
    -- ['BufferLineWarning'] = "guifg=#5a5a5a",
    -- ['BufferLineDuplicate'] = "guifg=#5a5a5a gui=none",
    -- ['BufferLineCloseButton'] = "guifg=#5a5a5a",
    -- ['BufferLineBackground'] = "guifg=#5a5a5a",
    ['NvimTreeWinSeparator'] = "guifg=#505050",
    ['IndentBlanklineContextChar'] = "guifg=#949494",
    -- ['IlluminatedWordRead'] = "gui=none guibg=#505050",
    -- ['IlluminatedWordText'] = "gui=none guibg=#505050",
    -- ['IlluminatedWordWrite'] = "gui=none guibg=#505050",

    -- Visible
    -- ['BufferLineBufferVisible'] = "guifg=#5a5a5a",
    -- ["BufferLineHintVisible"] = "guifg=#5a5a5a",
    -- ["BufferLineInfoVisible"] = "guifg=#5a5a5a",
    -- ["BufferLineWarningVisible"] = "guifg=#5a5a5a",
    -- ['BufferLineCloseButtonVisible'] = "guifg=#5a5a5a",
    -- ['BufferLineDuplicateSelected'] = "guifg=grey gui=none",
    -- Selected
    -- ['BufferLineBufferSelected'] = "gui=none",
    -- ['BufferLineInfoSelected'] = "guifg=#FFFFF gui=none",
    -- ['BufferLineHintSelected'] = "guifg=#FFFFF gui=none",
    -- ['BufferLineWarningSelected'] = "guifg=#FFFFF gui=none",
    -- ['BufferLineIndicatorSelected'] = "guifg=#1B1B1B guibg=#1B1B1B",
}

return M
