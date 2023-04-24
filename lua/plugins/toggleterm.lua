-- [[ Configre Toggleterm ]]

require('toggleterm').setup({
  size = 20,
  open_mapping = [[<C-ö>]],
  hide_numbers = true,
  -- shade_terminals = true,
  -- shading_factor = 100,
  direction = "horizontal",
  highlights = {
    Normal = {
      guibg = "NONE"
    }
  }
})
