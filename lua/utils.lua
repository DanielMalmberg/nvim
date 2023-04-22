-- [[ Config utilities ]]

local M = {}

M.change_backgroundcolor = function(color)
  vim.cmd('highlight Normal guibg=' .. color)
  vim.cmd('highlight LineNr guibg=' .. color)
  vim.cmd('highlight SignColumn guibg=' .. color)
  vim.cmd('highlight NvimTreeNormal guibg=' .. color)
  vim.cmd('highlight NvimTreeWinSeparator guifg=#505050 guibg=' .. color)
  vim.cmd('highlight BufferLineFill guibg=' .. color)
end

M.toggle_transparency = function()
  settings = require('settings.gui_settings')
  if settings.current_bg == settings.default_bg then
    settings.current_bg = "NONE"
  elseif settings.current_bg == "NONE" then
    settings.current_bg = tostring(settings.default_bg)
  end
  M.change_backgroundcolor(tostring(settings.current_bg))
end

return M
