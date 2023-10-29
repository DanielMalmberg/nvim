
-- Automatically insert an empty line between curly braces in a function
vim.api.nvim_set_keymap('i', '<CR>', 'getline(".")[col(".") - 2] == "{" ? "\\n\\<Esc>O" : "\\n"', { expr = true })
