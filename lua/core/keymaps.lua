vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.backspace = '2'
vim.opt.showcmd = false
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = false
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.o.number = true

-- automatically add closing parentheses and quotations
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })
