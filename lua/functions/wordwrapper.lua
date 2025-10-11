
-- SET WORDWRAP KEYMAPS
----------------------------------
wrap_text_symbols = {
    { "\'", "\'" },
    { '\"', '\"' },
    { '*',  '*' },
    { '(',  ')' },
    { '[',  ']' },
    { '{',  '}' },
}
for _, symbols in pairs(wrap_text_symbols) do
    local cmd_text = string.format('c%s%s<Left><C-c>p<Right>', unpack(symbols))
    local desc_text = "[W]rap [t]ext in symbols"
    local cmd_line = string.format('c%s<C-c>p$a%s<C-c>0i<BS><C-c>$', unpack(symbols))
    local desc_line = "[W]rap [l]ine in symbols"
    for key, symbol in pairs(symbols) do
      -- Selected text (normal)
      vim.keymap.set('n', '<leader>' .. symbol, 'viw' .. cmd_text, { desc = desc_text, silent = true, noremap = true })
      -- Selected text (visual)
      vim.keymap.set('v', '<leader>' .. symbol, cmd_text, { desc = desc_text, silent = true })
      -- Selected line (visual)
      vim.keymap.set('v', '<leader>l' .. symbol, cmd_line, { desc = desc_line, silent = true })
    end
end
