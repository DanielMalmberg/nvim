-- [[ Nvim-tree ]]
-- Toggleable file explorer

return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = true,
        custom = { 
          -- python
          "__pycache__",
          "pyrightconfig.json"
        }
      }
    })
  end
}
