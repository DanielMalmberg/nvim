-- [[ Gitsigns ]]
-- Adds git releated signs to the gutter, as well as utilities for managing changes

return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  end
}
