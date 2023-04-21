-- [[ Basic Keymaps ]]
-- `:help Telescope keymaps`

-- `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- automatically add closing parentheses and quotations
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })

-- Toggle LSP warnings and errors
vim.api.nvim_set_keymap('n', '<leader>lt', ':TroubleToggle<CR>',
{ silent = true, noremap = true, desc = 'Toggle list of LSP warnings and errors (c)' })

-- `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', ',sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', ',sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<C-f>', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', ',sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Keymap toggle-function
vim.api.nvim_set_keymap('n', '<leader>tr', ':lua toggle_transparency()<CR>',
  { noremap = true, silent = true, desc = 'Toggle transparency' })

-- Keymap to close all buffers
vim.api.nvim_set_keymap('n', '<leader>cw', ':bufdo bd<CR>',
  { noremap = true, silent = true, desc = 'Close all windows (buffers)' })
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { desc = "Open File Explorer", silent = true })

vim.keymap.set('n', '<C-M-f>', ':Format<CR>', { desc = "Format code (according to current LSP)", silent = true })

vim.keymap.set('n', '<CR>', 'o<ESC>', { desc = "Create new row in normal mode", silent = true })

vim.keymap.set('n', '<S-CR>', '<S-o><ESC>', { desc = "Create new row in normal mode (above)", silent = true })

vim.keymap.set('n', '<BS>', 'dd', { desc = "Delete row in normal mode", silent = true })
