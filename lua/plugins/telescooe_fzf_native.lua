-- [[ Telescope-FZF-Native ]]
-- Fuzzy Finder Algorithm which requires local dependencies to be built.
-- Only load if `make` is available. Make sure you have the system
-- requirements installed.

return {
  'nvim-telescope/telescope-fzf-native.nvim',
  enabled = true,
  lazy = false,
  build = 'make',
  cond = function()
    return vim.fn.executable 'make' == 1
  end,
}
