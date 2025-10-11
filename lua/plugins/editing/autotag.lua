-- [[ Autotag ]]
-- Automatically add closing tags in HTML and XML files (using Treesitter)

return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  config = true
}
