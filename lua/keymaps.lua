-- [[ Basic Keymaps ]]
-- `:help Telescope keymaps`

local utils = require('utils')

-- TYPING 
-----------------------------------------------------------
-- automatically add closing parentheses and quotations
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '"', '""<Left>')
vim.keymap.set('i', "'", "''<Left>")

vim.keymap.set('n', '<CR>', 'o<ESC>', { desc = "Create new row in normal mode" })
vim.keymap.set('n', '<S-CR>', '<S-o><ESC>', { desc = "Create new row in normal mode (above)" })
vim.keymap.set('n', '<BS>', 'ddk', { desc = "Delete row in normal mode", })
vim.keymap.set('n', '<S-BS>', 'dd', { desc = "Delete row in normal mode (use on last row)" })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { desc = "Disable Space-key in normal and visual", silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- FUNCTIONS
-----------------------------------------------------------
vim.keymap.set('n', '<C-M-f>', ':Format<CR>', { desc = "Format code (according to current LSP)", silent = true })

vim.keymap.set('n', '<leader>tr', "<cmd>lua require('utils').toggle_transparency()<CR>", { desc = "Toggle transparency", silent = true })

vim.keymap.set('n', '<leader>cw', ':bufdo bd<CR>', { desc = "Close all windows (buffers)", silent = true })


-- PLUGINS 
-----------------------------------------------------------
-- Toggle LSP warnings and errors
vim.keymap.set('n', '<leader>tt', ':ToggleDiag<CR>', { desc = "[T]oggle [Troubles] - show/hide LSP warnings and errors"})
vim.keymap.set('n', '<leader>lt', ':TroubleToggle<CR>', { desc = "[L]ist all [T]roubles - LSP warnings and errors", silent = true })

-- `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set('n', '<leader>/', function()
  -- Pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false
  })
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', ',sh', require('telescope.builtin').help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', ',sw', require('telescope.builtin').grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set('n', '<C-f>', require('telescope.builtin').live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', ',sd', require('telescope.builtin').diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { desc = "Open File Explorer", silent = true })
