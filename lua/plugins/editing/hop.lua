-- [[ Hop ]]
-- Easy-motion style navigation to quickly jump to any word, character, or pattern in the buffer

return {
  "phaazon/hop.nvim",
  enabled = true,
  config = function()
    require('hop').setup()
  end,
}
