-- NOTE: Additonal config files with keymaps:
-- plugins/mason_lspconfig.lua
-- plugins/nvim_cmp.lua
-- plugins/toggleterm.lua
-- plugins/treesitter.lua
-- features/format_brackets.lua
-- features/wordwrapper.lua

-- UNBIND UNNECESSARY KEYMAPS
----------------------------------
vim.api.nvim_set_keymap('n', '<C-l>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-l>', '<Nop>', { noremap = true, silent = true })

-- CUSTOM KEYMAPS
----------------------------------
-- ['key'] = { 'action', "description" }
local keymaps = {
    insert = {
        ['<C-c>'] = { '<ESC>', "" }
    },
    visual = {
        ['<Tab>'] = { '>gv', "Indent selection in visual mode" },
        ['<S-Tab>'] = { '<gv', "Back-indent selection in visual mode" },
        ['J'] = { ":m '>+1><CR>gv=gv", "Move the highlighted text down one row" },
        ['K'] = { ":m '<-2><CR>gv=gv", "Move the highlighted text up one row" },
        ['<leader>d'] = { '"_d', "Delete highlighted text without adding it to yank register" },
        ['<leader>p'] = {'"_dP', "Paste yanked text over selected text and keep the yanked text in the clipboard" }
    },
    normal = {
        -- GUI
        ---------------------------------------
        ['<S-u>'] = { ":lua require('features.toggle_transparency').toggle_transparency()<CR>", "Toggle transparency" },
        ['<leader>tn'] = { ":lua require('features.theme_switcher').next_theme()<CR>", "Switch to next custom installed theme"},
        ['<leader>tp'] = { ":lua require('features.theme_switcher').previous_theme()<CR>", "Switch to previous custom installed theme"},
        ['<leader>-'] = { ":Telescope colorscheme<CR>", "Open theme selector" },

        -- NAVIGATING
        ---------------------------------------
        ['n'] = { 'nzzzv', "Keeps the cursos in the middle when stepping through searches" },
        ['N'] = { 'Nzzzv', "Keeps the cursos in the middle when stepping through searches" },
        ['<C-d>'] = { '0<C-d>zz', "Keeps the cursor in the middle when jumping down the page" },
        ['<C-u>'] = { '0<C-u>zz', "Keeps the cursor in the middle when jumping up the page" },
        ['<Space>'] = { '<Nop>', "Disable Space-key in normal" },

        -- WINDOWS
        ---------------------------------------
        ['±'] = { '<C-w>3>', "Increase window width (3 steps)"},
        ['–'] = { '<C-w>3<', "Decrease window width (3 steps)"},

        -- BUFFERS
        ---------------------------------------
        ['<Tab>'] = { ':bp<CR>', "Go to next buffer" },
        ['<S-Tab>'] = { ':bn<CR>', "Go to previous buffer" },
        ['<leader>ls'] = { ':ls<CR>', "List all open buffers" },
        ["<leader>x"] = { ":lua require('features.close_buffer').close_current_buffer()<CR>", "Close current buffer" },
        ['<leader>X'] = { ':bufdo bd<CR>', "Close all open buffers" },

        -- FILES
        ---------------------------------------
        ['<leader>.s'] = { ':w<CR>', "Save file (the current buffer)" },
        ['<leader>.q'] = { ':qa<CR>', "Quits Neovim (if buffers are saved)" },
        ['<leader>exe'] = { ':w<CR><cmd>!chmod +x %<CR>', "Turns current file into an executable program" },

        -- LSP
        ---------------------------------------
        ['<S-f>'] = { ':Format<CR>', "Format code (according to current LSP)" },
        ['<leader>te'] = { vim.diagnostic.open_float, "Open floating diagnostic message" },
        ['<leader>tt'] = { ':ToggleDiag<CR>', "[T]oggle [Troubles] - show/hide LSP warnings and errors" },
        ['<leader>lt'] = { ':Trouble diagnostics toggle<CR>', "[L]ist all [T]roubles - LSP warnings and errors" },

        -- Obsidian
        ---------------------------------------
        ['gf'] = { function() if require('obsidian').util.cursor_on_markdown_link() then return "<cmd>ObsidianFollowLink<CR>" else return "gf" end end, "Go to markdown link" },

        -- EDITING
        ---------------------------------------
        ['vi<C-b>'] = { 'vi[', "Select everything inside closest square brackets" },
        ['ci<C-b>'] = { 'ci[', "Change everything inside closest square brackets" },
        ['di<C-b>'] = { 'di[', "Delete everything inside closest square brackets" },
        ['yi<C-b>'] = { 'yi[', "Yank everything inside closest square brackets" },
        ['<leader>uc'] = { ':e!<CR>', "[U]ndo unsaved [c]hanges in current buffer" },
        ['<leader>rp'] = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
            "Rename all occurrences of word in file" },
        ['<leader>wp'] = {'viw"_dP', "Paste yanked text over current word and keep the yanked text in the clipboard" },
        ["<leader>rq"] = { ":lua require('features.replace_in_quickfix').replace_in_quickfix_keymap()<CR>", "Rename all occurrences of word in quickfix" },

        -- TELESCOPE
        ---------------------------------------
        ['<leader>?'] = { require('telescope.builtin').oldfiles, "[?] Find recently opened files" },
        ['<C-b>'] = { require('telescope.builtin').buffers, "Find existing [b]uffers" },
        ['<leader><C-f>'] = { ':Telescope current_buffer_fuzzy_find<CR>', "[/] Fuzzily search in current buffer" },
        ['<C-f>'] = { require('telescope.builtin').live_grep, "[S]earch by [G]rep" },
        ['<C-p>'] = { require('telescope.builtin').find_files, "[S]earch [F]iles" },
        ['<leader>sh'] = { require('telescope.builtin').help_tags, "[S]earch [H]elp" },
        ['<leader>sw'] = { require('telescope.builtin').grep_string, "[S]earch current [W]ord" },
        ['<leader>wd'] = { require('telescope.builtin').diagnostics, "[W]orkspace [D]iagnostics" },
        ['<leader>ds'] = { require('telescope.builtin').lsp_document_symbols, "LSP [D]ocument [S]ymbols" },

        -- COPLILOT
        ---------------------------------------
        -- ['<leader>ce'] = { ':Copilot enable<CR>:echo "Copilot enabled"<CR>', "Enable Copilot" },
        -- ['<leader>cd'] = { ':Copilot disable<CR>:echo "Copilot disabled"<CR>', "Disable Copilot" },
        -- ['<leader>ci'] = { ':Copilot status<CR>', "Check Copilot status" },
        -- ['<leader>cf'] = { ':Copilot file_info<CR>', "Get file info from Copilot" },
        -- ['<leader>c?'] = { ':Copilot help<CR>', "Get help from Copilot" },

        -- SPECTRE
        ---------------------------------------
        ['<leader>sp'] = { ':lua require("spectre").toggle()<CR>', "Open [Spectre]" },
        ['<leader>sf'] = { ':lua require("spectre").open_file_search({select_word=true})<CR>', "Open [S]pectre for current [f]ile" },

        -- NVIM-TREE
        ---------------------------------------
        [vim.g.is_macos and '˛' or '<M-h>'] = { ':NvimTreeFindFileToggle<CR>', "Open File Explorer" }, -- (symbol for opt + h)

        -- UNDOTREE
        ---------------------------------------
        ['<leader>ut'] = { ':UndotreeToggle<CR>', 'Toggle UndoTree view' },

        --TAGBAR
        ---------------------------------------
        [vim.g.is_macos and "ﬁ" or '<M-l>'] = { ':TagbarToggle<CR>', "Show/hide the file outline" }, -- (symbol for opt + l)
        ['<C-t>'] = { ':TagbarJumpNext<CR>', "Jump to the next filetag" },
        ['<C-S-t>'] = { ':TagbarJumpPrev<CR>', "Jump to the previous filetag" },

        -- DIFFVIEW (GIT)
        ---------------------------------------
        ['<leader>git'] = { ":DiffviewOpen<CR>", "Open git diffview" },
        ['<leader>gc'] = { ":DiffviewClose<CR>", "Close git diffview" },

        -- DEBUGGER
        ---------------------------------------
        ['<F5>'] = { require('dap').continue, "Debugger - Continue" },
        ['<F1>'] = { require('dap').step_over, "Debugger - Step over" },
        ['<F2>'] = { require('dap').step_into, "Debugger - Step into" },
        ['<F3>'] = { require('dap').step_out, "Debugger - Step out" },
        ['<leader>b'] = { require('dap').toggle_breakpoint, "Debugger - Toggle breakpoint" },
        ['<leader>B'] = { function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
            "Debugger - Toggle breakpoint (with condition)" },

        -- ILLUMINATE
        ---------------------------------------
        ['<leader>i'] = { ':IlluminateToggle<CR>', "Toggle illuminate (highlight) plugin" },

        -- HOP
        ---------------------------------------
        ['<S-h>'] = { ':HopWord<CR>', "[H]op to [W]ord" },
    },
    normal_and_visual = {
        ['<C-k>'] = { '4k', "Faster scrolling (up)" },
        ['<C-j>'] = { '4j', "Faster scrolling (down)" },
        ['<C-h>'] = { '4h', "Faster scrolling (left)" },
        ['<C-l>'] = { '4l', "Faster scrolling (right)" },
    },
}

-- APPLY CUSTOM KEYMAPS
----------------------------------
local modes = {
    ['insert'] = 'i',
    ['visual'] = 'v',
    ['normal'] = 'n',
    ['normal_and_visual'] = { 'n', 'v' }
}

for mode, bindings in pairs(keymaps) do
    for key, binding in pairs(bindings) do
        vim.keymap.set(modes[mode], key, binding[1], { desc = binding[2], silent = true, noremap = true })
    end
end

-- UNUSED KEYMAPS
------------------------------------
-- Diagnostic keymaps
-- ['[d'] = { vim.diagnostic.goto_prev, "Go to previous diagnostic message" },
-- [']d'] = { vim.diagnostic.goto_next, "Go to next diagnostic message" },
-- ['<leader>q'] = { vim.diagnostic.setloclist, "Open diagnostics list" },

-- Hop
-- ['<S-h><S-a>'] = { ':HopAnywhere<CR>', "[H]op [A]nywhere" },
-- ['<S-h><S-l>'] = { ':HopWordCurrentLine<CR>', "[H]op to word on current [L]ine" },
--
-- Expressions
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- Editing
-- ['<CR>'] = { 'o<ESC>', "Create new row in normal mode" },
-- ['<S-CR>'] = { '<S-o><ESC>', "Create new row in normal mode (above)" },
-- ['<BS>'] = { 'ddk', "Delete row in normal mode" },
-- ['<S-BS>'] = { 'dd', "Delete row in normal mode (use on last row)" },
--
-- Spectre
-- ['<leader>sw'] = { ':lua require("spectre").open_visual({select_word=true})<CR>', "Open [S]pectre for highlighted [w]ord" },
