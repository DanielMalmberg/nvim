
-- UNBIND UNNECESSARY KEYMAPS
----------------------------------
vim.api.nvim_set_keymap('n', '<C-l>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-l>', '<Nop>', { noremap = true, silent = true })


-- APPLY CUSTOM KEYMAPS
----------------------------------
local modes = {
  ['insert'] = 'i',
  ['visual'] = 'v',
  ['normal'] = 'n',
  ['normal_and_visual'] = { 'n', 'v' }
}

local keymaps = require('settings.keymaps')
for mode, bindings in pairs(keymaps) do
  for key, binding in pairs(bindings) do
    vim.keymap.set(modes[mode], key, binding[1], { desc = binding[2], silent = true, noremap = true })
  end
end


-- SET WORDWRAP KEYMAPS
----------------------------------
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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
        -- Selected text (visual)
        vim.keymap.set('v', '<leader>' .. symbol, cmd_text, { desc = desc_text, silent = true })
        -- Selected text (normal)
        vim.keymap.set('n', '<leader>' .. symbol, 'viw' .. cmd_text, { desc = desc_text, silent = true, noremap = true })
        -- Selected line (visual)
        vim.keymap.set('v', '<leader>l' .. symbol, cmd_line, { desc = desc_line, silent = true })
    end
end
