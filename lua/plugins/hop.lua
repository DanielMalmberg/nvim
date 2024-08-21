-- [[ Hop ]]
-- Function for making larger jumps in the current buffer

return {
  "phaazon/hop.nvim",
  enabled = true,
  config = function()
    require('hop').setup()
  end,
}
