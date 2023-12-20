-- [[ Lualine ]]
-- Statusbar in the bottom of the window. Shows current mode, file name, cursor location, etc

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = { 
        lualine_c = {
          { 'filename', path = 1 } 
        },
      },
    }
  end,
}




