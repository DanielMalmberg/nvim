-- [[ Switch between custom installed themes ]]

local theme_settings = require('settings.theme')
local themes = theme_settings.get_other_themes_names()
table.insert(themes, theme_settings.startup_theme.name)
local M = {}
M.theme_index = 0

M.next_theme = function()
    vim.api.nvim_command('echo ""')
    M.theme_index = M.theme_index + 1
    if M.theme_index > #themes then
        M.theme_index = 1
    end
    vim.cmd("colorscheme " .. themes[M.theme_index])
    vim.api.nvim_out_write("Theme changed to: " .. themes[M.theme_index] .. "\n")
end

M.previous_theme = function()
    vim.api.nvim_command('echo ""')
    M.theme_index = M.theme_index - 1
    if M.theme_index < 1 then
        M.theme_index = #themes
    end
    vim.cmd("colorscheme " .. themes[M.theme_index])
    vim.api.nvim_out_write("Theme changed to: " .. themes[M.theme_index] .. "\n")
end

return M
