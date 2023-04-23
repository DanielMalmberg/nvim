-- [[ Basic Keymaps ]]
-- `:Telescope keymaps`

local dap = require('dap')

--  { mode, input, output, description }
local keymaps = {
    -- TYPING
    -----------------------------------------------------------
    -- Insert mode
    { 'i', '(', '()<Left>', "" },
    { 'i', '[', '[]<Left>', "" },
    { 'i', '{', '{}<Left>', "" },
    { 'i', '"', '""<Left>', "" },
    { 'i', "'", "''<Left>", "" },
    -- Visual mode
    { 'v', '<Tab>', '>gv', "Indent selection in visual mode" },
    { 'v', '<S-Tab>', '<gv', "Back-indent selection in visual mode"},
    -- Normal mode
    { 'n', '<C-k>', '4k', "Faster scrolling (up)"},
    { 'n', '<C-j>', '4j', "Faster scrolling (down)"},
    { 'n', '<CR>', 'o<ESC>', "Create new row in normal mode" },
    { 'n', '<S-CR>', '<S-o><ESC>', "Create new row in normal mode (above)" },
    { 'n', '<BS>', 'ddk', "Delete row in normal mode" },
    { 'n', '<S-BS>', 'dd', "Delete row in normal mode (use on last row)" },
    { 'n', '<Space>', '<Nop>', "Disable Space-key in normal" },
    { 'v', '<Space>', '<Nop>', "Disable Space-key in visual" },

    -- FUNCTIONS 
    -----------------------------------------------------------
    { 'n', '<C-M-f>', ':Format<CR>', "Format code (according to current LSP)" },
    { 'n', '<leader>tr', "<cmd>lua require('utils').toggle_transparency()<CR>", "Toggle transparency" },
    { 'n', '<leader>cw', ':bufdo bd<CR>', "Close all windows (buffers)" },

    -- PLUGINS 
    -----------------------------------------------------------
    -- Bufferline 
    { 'n', '<Tab>', ':BufferLineCycleNext<CR>', "" },
    { 'n', '<S-Tab>', ':BufferLineCyclePrev<CR>', "" },
    { "n", "<leader>x", ":lua require('utils').close_current_buffer()<CR>", "" },
    -- Toggle LSP warnings and errors
    { 'n', '<leader>tt', ':ToggleDiag<CR>', "[T]oggle [Troubles] - show/hide LSP warnings and errors" },
    { 'n', '<leader>lt', ':TroubleToggle<CR>', "[L]ist all [T]roubles - LSP warnings and errors" },
    -- Telecope (`h telescope.builtin`)
    { 'n', '<leader>?', require('telescope.builtin').oldfiles, "[?] Find recently opened files" },
    { 'n', '<leader><space>', require('telescope.builtin').buffers, "[ ] Find existing buffers" },
    { 'n', '<leader><C-f>', ':Telescope current_buffer_fuzzy_find<CR>', "[/] Fuzzily search in current buffer" },
    { 'n', '<C-f>', require('telescope.builtin').live_grep, "[S]earch by [G]rep" },
    { 'n', '<C-p>', require('telescope.builtin').find_files, "[S]earch [F]iles" },
    { 'n', '<leader>sh', require('telescope.builtin').help_tags, "[S]earch [H]elp" },
    { 'n', '<leader>sw', require('telescope.builtin').grep_string, "[S]earch current [W]ord" },
    { 'n', '<leader>sd', require('telescope.builtin').diagnostics, "[S]earch [D]iagnostics" },
    -- Diagnostic keymaps
    { 'n', '[d', vim.diagnostic.goto_prev, "Go to previous diagnostic message" },
    { 'n', ']d', vim.diagnostic.goto_next, "Go to next diagnostic message" },
    { 'n', '<leader>e', vim.diagnostic.open_float, "Open floating diagnostic message" },
    { 'n', '<leader>q', vim.diagnostic.setloclist, "Open diagnostics list" },
    -- Nvim-tree
    { 'n', '<C-n>', ':NvimTreeFindFileToggle<CR>', "Open File Explorer" },
    -- Debugger
    { 'n', '<F5>', dap.continue, "Debugger - Continue" },
    { 'n', '<F1>', dap.step_over, "Debugger - Step over" },
    { 'n', '<F2>', dap.step_into, "Debugger - Step into" },
    { 'n', '<F3>', dap.step_out, "Debugger - Step out" },
    { 'n', '<leader>b', dap.toggle_breakpoint, "Debugger - Toggle breakpoint" },
    { 'n', '<leader>B', function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, "Debugger - Toggle breakpoint (with condition)" },
    -- Diffview (Git)
    { 'n', '<leader>go', ":DiffviewOpen<CR>", "View all git changes" },
    { 'n', '<leader>gc', ":DiffviewClose<CR>", "View all git changes" }
}

require('utils').apply_keymaps(keymaps)

-- CUSTOM KEYMAPS 
-----------------------------------------------------------
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
