-- [[ Theme manager ]]

local theme = require('settings.theme')

-- Initialize settings
----------------------------------
-- NOTE: Always set custom colors before toggling transparency
vim.opt.background = 'dark'
if theme.custom_colors ~= nil then
  for key, color in pairs(theme.custom_colors) do
    vim.cmd(string.format('hi %s %s', key, color))
  end
end
