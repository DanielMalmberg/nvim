-- [[ Switch between custom installed themes ]]

local M = {}
M.theme_index = 0

-- Populate themes automatically from lazy.nvim plugins
local function get_installed_themes()
    local themes = {}
    local lazy_plugins = require("lazy").plugins()
    for _, plugin in pairs(lazy_plugins) do
        if plugin.is_theme then
            table.insert(themes, plugin.name)
        end
    end
    return themes
end

local themes = get_installed_themes()

-- Move to next theme
M.next_theme = function()
    if #themes == 0 then return end  -- safety check
    vim.g.transparent = false
    vim.api.nvim_command('echo ""')
    M.theme_index = M.theme_index + 1
    if M.theme_index > #themes then
        M.theme_index = 1
    end
    vim.cmd("colorscheme " .. themes[M.theme_index])
    vim.api.nvim_out_write("Theme changed to: " .. themes[M.theme_index] .. "\n")
end

-- Move to previous theme
M.previous_theme = function()
    if #themes == 0 then return end  -- safety check
    vim.g.transparent = false
    vim.api.nvim_command('echo ""')
    M.theme_index = M.theme_index - 1
    if M.theme_index < 1 then
        M.theme_index = #themes
    end
    vim.cmd("colorscheme " .. themes[M.theme_index])
    vim.api.nvim_out_write("Theme changed to: " .. themes[M.theme_index] .. "\n")
end

return M
