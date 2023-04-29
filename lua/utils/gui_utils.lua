-- [[ Configure GUI utilities ]]

local M = {}

local gui_settings = require('settings.gui_settings')

local function get_theme(current)
  local theme = {}
  if current then
    theme = gui_settings.use_dark_theme and gui_settings.dark_theme or gui_settings.light_theme
  else
    theme = gui_settings.use_dark_theme and gui_settings.light_theme or gui_settings.dark_theme 
  end
  if rawget(theme.plugin, 'lualine') == nil then
    theme.plugin['lualine'] = theme.plugin.name
  end
  return theme
end

M.get_current_theme = function()
  return get_theme(true)
end

M.get_optional_theme = function()
  return get_theme(false)
end


M.change_backgroundcolor = function(color)
  local backgrounds = {
    'Normal',
    'NormalNC',
    'LineNr',
    'SignColumn',
    'FoldColumn',
    'NvimTreeNormal',
    'NvimTreeNormalNC',
    'NvimTreeEndOfBuffer',
    'NvimTreeWinSeparator',
    'BufferLineFill',
    'diffAdded',
    'diffChanged',
    'diffRemoved',
    'EndOfBuffer',
    'TelescopeNormal'
  }

  for _, property in pairs(backgrounds) do
    vim.cmd(string.format('highlight %s guibg=%s', property, color))
  end
end

M.set_custom_colors = function()
  vim.o.background = gui_settings.use_dark_theme and 'dark' or 'light'
  M.change_backgroundcolor(gui_settings.current_bg)
  for key, color in pairs(M.get_current_theme().colors) do
    vim.cmd(string.format('hi %s %s', key, color))
  end
end

M.toggle_theme = function()
  gui_settings.use_dark_theme = not gui_settings.use_dark_theme
  current_theme = M.get_current_theme()
  vim.cmd(string.format('colorscheme %s', current_theme.plugin.name))
  gui_settings.current_bg = current_theme.plugin.bg
  -- gui_settings.current_bg = gui_settings.use_dark_theme and "NONE" or current_theme.plugin.bg
  M.set_custom_colors()
end

M.toggle_transparency = function()
  local default_bg = M.get_current_theme().plugin.bg 
  if gui_settings.current_bg == "NONE" then
    gui_settings.current_bg = default_bg
  else
    gui_settings.current_bg = "NONE"
  end
  M.change_backgroundcolor(gui_settings.current_bg)
end

return M
