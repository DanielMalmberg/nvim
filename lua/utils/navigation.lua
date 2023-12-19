-- [[ Configure navigation utilities ]]

local M = {}

local modes = {
  ['insert'] = 'i',
  ['visual'] = 'v',
  ['normal'] = 'n',
  ['normal_and_visual'] = { 'n', 'v' }
}

M.apply_keymaps = function(keymaps)
  for mode, bindings in pairs(keymaps) do
    for key, binding in pairs(bindings) do
      vim.keymap.set(modes[mode], key, binding[1], { desc = binding[2], silent = true, noremap = true })
    end
  end
end

M.apply_text_wrapping_keymaps = function(keymaps)
  for _, symbols in pairs(keymaps) do
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
end

return M
