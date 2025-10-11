-- [[ Plugins without configuration or setup function ]]

return {
   -- subfolders
   { import = 'plugins.themes' },

   -- plugins
   "sindrets/diffview.nvim",  -- Toggle view of current git changes
   "tpope/vim-fugitive",      -- Makes it possible to do git commands direclty in Neovim
   "tpope/vim-surround",      -- Change symbols wrapping a text
   "tpope/vim-sleuth",        -- Detect tabstop and shiftwidth automatically
   "mbbill/undotree",         -- A version history tree of text changes made in this repository
   -- "github/copilot.vim",      -- Github Copilot integration
}
