-- [[ mini.nvim ]]
-- A collection of small, focused modules to enhance the editor's functionality
-- Each module can be activated by calling its setup function

return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup()
    end,
  },
}
