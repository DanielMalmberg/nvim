-- [[ Vim Settings ]]
-- `:help vim.o`

-- Don't show current mode as text
vim.cmd('set noshowmode')

-- Make line numbers default
vim.wo.number = true
vim.cmd('set number')

-- Disable Neovim intro text
vim.opt.shortmess:append("sI")

-- Disable tilde on end of buffer
vim.cmd [[let &fcs='eob: ']]

-- Set highlight on search
vim.o.hlsearch = false

-- Conceal some characters
vim.opt.conceallevel = 2

-- Enable mouse mode
vim.o.mouse = 'a'

-- Scroll steps when using <C-u>, <C-d>, <C-y> and <C-e>
vim.o.scroll = 20

--- Set tabs to given number of spaces
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Required for Bufferline plugin to work
vim.opt.termguicolors = true


-- Set language for file extensions
-- .base
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.base",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})
