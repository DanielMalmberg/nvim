
-- Auto-format brackets - Automatically insert an empty line and indent one step when pressing enter after '(', '[' or '{'
vim.api.nvim_set_keymap('i', '<CR>', 'getline(".")[col(".") - 2] == "{" || getline(".")[col(".") - 2] == "(" || getline(".")[col(".") - 2] == "[" ? "\\n\\<Esc>O" : "\\n"', { expr = true })

-- Automatically remvove closing brackets ), ] or } if opening bracket is removed
vim.api.nvim_set_keymap('i', '<BS>', 'getline(".")[col(".") - 1] == ")" && getline(".")[col(".") - 2] == "(" || getline(".")[col(".") - 1] == "]" && getline(".")[col(".") - 2] == "[" || getline(".")[col(".") - 1] == "}" && getline(".")[col(".") - 2] == "{" ? "<BS><C-o>x" : "<BS>"', { expr = true })
