-- [[ Nvim-tree ]]
-- Toggleable file explorer

return {
  "nvim-tree/nvim-tree.lua",
  config = function()
require("nvim-tree").setup({
  filters = {
    dotfiles = true
  }
})
  end
}
