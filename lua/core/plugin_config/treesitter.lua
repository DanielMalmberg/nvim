require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'c', 
    'c_sharp', 
    'python', 
    'json', 
    'lua', 
    'gitignore', 
    'ruby', 
    'vim', 
    'markdown', 
    'markdown_inline'
  },

  -- Install parsers synchronously (only applied to 'ensure_installed')
  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true,
  },
}
