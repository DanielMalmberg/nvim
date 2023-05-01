-- [[ Configure Tagbar ]]

-- Removes the help-text at the top of the window 
vim.api.nvim_exec('let g:tagbar_compact = 2', false)

-- Jumps cursor to the tagbar when it's opened
vim.api.nvim_exec('let g:tagbar_autofocus = 1', false)

-- Automatically closes the tagbar when jumping to a tag (by pressing enter)
vim.api.nvim_exec('let g:tagbar_autoclose = 1', false)
