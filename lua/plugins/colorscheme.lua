-- [[ Colorscheme ]]
-- Sets the current colorscheme (in lua/settings/theme.lua)

return {
  require('settings.theme').source,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme(require('settings.theme').name)
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
