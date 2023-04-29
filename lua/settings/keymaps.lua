-- [[ Basic Keymaps ]]
-- `:Telescope keymaps`

local nav_utils = require('utils.navigation')
local dap = require('dap')

-- ['input'] = { 'output', "description" }
local keymaps = {
    insert = {
        ['('] = { '()<Left>', "" },
        ['['] = { '[]<Left>', "" },
        ['{'] = { '{}<Left>', "" },
        ['"'] = { '""<Left>', "" },
        ["'"] = { "''<Left>", "" },
        ['<C-c>'] = { '<ESC>', ""}
    },
    visual = {
        ['<Tab>'] = { '>gv', "Indent selection in visual mode" },
        ['<S-Tab>'] = { '<gv', "Back-indent selection in visual mode" },
        ['J'] = { ":m '>+1><CR>gv=gv", "Move the highlighted text down one row" },
        ['K'] = { ":m '<-2><CR>gv=gv", "Move the highlighted text up one row" },
    },
    normal = {
        -- NAVIGATING
        ---------------------------------------
        ['n'] = { 'nzzzv', "Keeps the cursos in the middle when stepping through searches" },
        ['N'] = { 'Nzzzv', "Keeps the cursos in the middle when stepping through searches" },
        ['<C-d>'] = { '<C-d>zz', "Keeps the cursor in the middle when jumping down the page" },
        ['<C-u>'] = { '<C-u>zz', "Keeps the cursor in the middle when jumping up the page" },
        ['<CR>'] = { 'o<ESC>', "Create new row in normal mode" },
        ['<S-CR>'] = { '<S-o><ESC>', "Create new row in normal mode (above)" },
        ['<BS>'] = { 'ddk', "Delete row in normal mode" },
        ['<S-BS>'] = { 'dd', "Delete row in normal mode (use on last row)" },
        ['<Space>'] = { '<Nop>', "Disable Space-key in normal" },
        ['<Space>'] = { '<Nop>', "Disable Space-key in visual" },
        ['<leader>p'] = { '\"_dP', "Paste and keep text in the yank register" },

        -- FUNCTIONS 
        ---------------------------------------
        ['<C-M-f>'] = { ':Format<CR>', "Format code (according to current LSP)" },
        ['<S-u>'] = { "<cmd>lua require('utils.gui').toggle_transparency()<CR>", "Toggle transparency" },
        ['<leader>cw'] = { ':bufdo bd<CR>', "Close all windows (buffers)" },
        ['<leader>rp'] = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', "Replace all occurrences of current word in current file" },
        ['<leader>exe'] = { ':w<CR><cmd>!chmod +x %<CR>', "Turns current file into an executable program"},
        
        -- PLUGINS 
        ---------------------------------------
        -- Bufferline 
        ['<Tab>'] = { ':BufferLineCycleNext<CR>', "" },
        ['<S-Tab>'] = { ':BufferLineCyclePrev<CR>', "" },
        ["<leader>x"] = { ":lua require('utils.navigation').close_current_buffer()<CR>", "" },
        -- Toggle LSP warnings and errors
        ['<leader>tt'] = { ':ToggleDiag<CR>', "[T]oggle [Troubles] - show/hide LSP warnings and errors" },
        ['<leader>lt'] = { ':TroubleToggle<CR>', "[L]ist all [T]roubles - LSP warnings and errors" },
        -- Telecope (`h telescope.builtin`)
        ['<leader>?'] = { require('telescope.builtin').oldfiles, "[?] Find recently opened files" },
        ['<leader><space>'] = { require('telescope.builtin').buffers, "[ ] Find existing buffers" },
        ['<leader><C-f>'] = { ':Telescope current_buffer_fuzzy_find<CR>', "[/] Fuzzily search in current buffer" },
        ['<C-f>'] = { require('telescope.builtin').live_grep, "[S]earch by [G]rep" },
        ['<C-p>'] = { require('telescope.builtin').find_files, "[S]earch [F]iles" },
        ['<leader>sh'] = { require('telescope.builtin').help_tags, "[S]earch [H]elp" },
        ['<leader>sw'] = { require('telescope.builtin').grep_string, "[S]earch current [W]ord" },
        ['<leader>sd'] = { require('telescope.builtin').diagnostics, "[S]earch [D]iagnostics" },
        -- Diagnostic keymaps
        ['[d'] = { vim.diagnostic.goto_prev, "Go to previous diagnostic message" },
        [']d'] = { vim.diagnostic.goto_next, "Go to next diagnostic message" },
        ['<leader>e'] = { vim.diagnostic.open_float, "Open floating diagnostic message" },
        ['<leader>q'] = { vim.diagnostic.setloclist, "Open diagnostics list" },
        -- Nvim-tree
        ['<C-l>'] = { ':NvimTreeFindFileToggle<CR>', "Open File Explorer" },
        -- Debugger
        ['<F5>'] = { dap.continue, "Debugger - Continue" },
        ['<F1>'] = { dap.step_over, "Debugger - Step over" },
        ['<F2>'] = { dap.step_into, "Debugger - Step into" },
        ['<F3>'] = { dap.step_out, "Debugger - Step out" },
        ['<leader>b'] = { dap.toggle_breakpoint, "Debugger - Toggle breakpoint" },
        ['<leader>B'] = { function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, "Debugger - Toggle breakpoint (with condition)" },
        -- Diffview (Git)
        ['<leader>git'] = { ":DiffviewOpen<CR>", "View all git changes (open)" },
        ['<leader>gc'] = { ":DiffviewClose<CR>", "View all git changes (close)" },
        --Tagbar
        ['<C-ä>'] = { ':TagbarToggle<CR>', "Show/hide the file outline"},
        ['<C-t>'] = { ':TagbarJumpNext<CR>', "Jump to the next filetag" },
        ['<C-S-t>'] = { ':TagbarJumpPrev<CR>', "Jump to the previous filetag"},

    },
    normal_and_visual = {
        ['<C-S-l>'] = { ":lua require('utils.gui').toggle_theme()<CR>" },
        ['<C-k>'] = { '4k', "Faster scrolling (up)"},
        ['<C-j>'] = { '4j', "Faster scrolling (down)"},
        ['<C-h>'] = { '4h', "Faster scrolling (left)" },
        ['<C-l>'] = { '4l', "Faster scrolling (right)" }
    }
}
nav_utils.apply_keymaps(keymaps)


-- SPECIAL KEYMAPS
------------------------------------
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

wrap_text_symbols = {
    {"\'", "\'"},
    {'\"', '\"'},
    {'*', '*'},
    {'(', ')'},
    {'[', ']'},
    {'{', '}'},
}
nav_utils.apply_text_wrapping_keymaps(wrap_text_symbols)
