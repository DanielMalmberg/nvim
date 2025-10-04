-- [[ Current theme ]]

local M = {}

M.transparent_at_startup = false
M.startup_theme = 'tundra'

function M.setup()
    vim.opt.background = 'dark'
    vim.cmd.colorscheme(M.startup_theme)
    if M.transparent_at_startup then
      require('features.toggle_transparency').toggle_transparency()
    end
end

return M
