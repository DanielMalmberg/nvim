-- [[ Indent blankline ]]
-- Add indentation guides even on blank lines

return {
  'lukas-reineke/indent-blankline.nvim',
  opts = {
    char = '┊',
    show_trailing_blankline_indent = false,
    space_char_blankline = " ",
    show_current_context = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  }
}
