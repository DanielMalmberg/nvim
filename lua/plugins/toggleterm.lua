-- [[ Toggleterm ]]
-- Toggleable terminal window

return {
  "akinsho/toggleterm.nvim",
  enabled = true,
  config = function()
    require('toggleterm').setup({
      size = 20,
      open_mapping = vim.g.is_macos and [[√]] or [[<M-j>]], -- opt + j
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 0.5,
      direction = "horizontal"
    })
  end,
}
