-- [[ Colorscheme ]]

local themes = require 'settings.theme'

return {
  themes.startup_theme.source,
  dependencies = themes.get_other_themes_sources(),
  lazy = false,
  priority = 1000,
  config = function()
    if themes.startup_theme.name == 'tundra' then
      require ('settings.tundra')
    end
    vim.cmd.colorscheme(themes.startup_theme.name)
    vim.opt.background = 'dark'
    if themes.startup_theme.custom_colors ~= nil then
      for key, color in pairs(themes.startup_theme.custom_colors) do
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

