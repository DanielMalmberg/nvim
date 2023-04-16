local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', ',of', builtin.oldfiles, {})
vim.keymap.set('n', ',lg', builtin.live_grep, {})
vim.keymap.set('n', ',ht', builtin.help_tags, {})
