-- [[ Colorscheme ]]
-- Sets the current colorscheme (in lua/settings/themes.lua)

return {
  require('settings.themes').selected_theme.source,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme(require('settings.themes').selected_theme.name)
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
