-- [[ Colorscheme ]]

local theme = require 'settings.theme'

return {
  theme.source,
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme(theme.name)
    vim.opt.background = 'dark'
    if theme.custom_colors ~= nil then
      for key, color in pairs(theme.custom_colors) do
        vim.cmd(string.format('hi %s %s', key, color))
      end
    end
  end,
  opts = {
    no_italic = true,
    no_bold = true,
    integrations = {
      cmp = true,
      nvimtree = true,
      telescope = true
    }
  }
}
