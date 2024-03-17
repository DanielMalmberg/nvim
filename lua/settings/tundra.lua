require('nvim-tundra').setup({
  transparent_background = false,
  dim_inactive_windows = {
    enabled = false,
    color = nil,
  },
  sidebars = {
    enabled = true,
    color = nil,
  },
  editor = {
    search = {},
    substitute = {},
  },
  syntax = {
    booleans = { bold = false, italic = false },
    comments = { bold = false, italic = false },
    conditionals = {},
    constants = { bold = false },
    fields = {},
    functions = {},
    keywords = {},
    loops = {},
    numbers = { bold = false },
    operators = { bold = false },
    punctuation = {},
    strings = {},
    types = { italic = false },
  },
  diagnostics = {
    errors = {},
    warnings = {},
    information = {},
    hints = {},
  },
  plugins = {
    lsp = true,
    semantic_tokens = true,
    treesitter = true,
    telescope = true,
    nvimtree = true,
    cmp = true,
    context = true,
    dbui = true,
    gitsigns = true,
    neogit = true,
    textfsm = true,
  },
  overwrite = {
    colors = {},
    highlights = {},
  },
})

vim.g.tundra_biome = 'arctic' -- 'arctic' or 'jungle'
