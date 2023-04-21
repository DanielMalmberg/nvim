-- [[ GUI Settings ]]

-- COLORS

-- Define backgroundcolor
local default_bg = "#1e1e1e"
local current_bg = "NONE"

function change_backgroundcolor()
  vim.cmd('highlight Normal guibg=' .. current_bg)
  vim.cmd('highlight LineNr guibg=' .. current_bg)
  vim.cmd('highlight SignColumn guibg=' .. current_bg)
  vim.cmd('highlight NvimTreeNormal guibg=' .. current_bg)
  vim.cmd('highlight NvimTreeWinSeparator guifg=#505050 guibg=' .. current_bg)
end

function toggle_transparency()
  if current_bg == default_bg then
    current_bg = "NONE"
  elseif current_bg == "NONE" then
    current_bg = default_bg
  end
  change_backgroundcolor()
end

-- Initialize backgroundcolor
change_backgroundcolor()
