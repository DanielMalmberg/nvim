-- [[ Theme handler ]]

local theme = require('settings.themes')
local colors = require('settings.colors')


-- Functions for toggling transparency
local function change_backgroundcolor(color)
  for _, property in pairs(colors.backgrounds) do
    vim.cmd(string.format('highlight %s guibg=%s', property, color))
  end
end

local M = {}
M.toggle_transparency = function()
  if theme.selected_theme.transparency then
    local default_bg = theme.selected_theme.bg
    if theme.current_bg == "NONE" then
      theme.current_bg = default_bg
    else
      theme.current_bg = "NONE"
    end
    change_backgroundcolor(theme.current_bg)
  end
end


-- INITIALIZE
----------------------------------
vim.opt.background = 'dark'
if theme.selected_theme.transparency then
  change_backgroundcolor(theme.current_bg)
end
if theme.selected_theme.custom_colors ~= nil then
  for key, color in pairs(theme.selected_theme.custom_colors) do
    vim.cmd(string.format('hi %s %s', key, color))
  end
end

return M
