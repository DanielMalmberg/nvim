-- [[ Config utilities ]

local M = {}

M.change_backgroundcolor = function(color)
  vim.cmd('highlight Normal guibg=' .. color)
  vim.cmd('highlight LineNr guibg=' .. color)
  vim.cmd('highlight SignColumn guibg=' .. color)
  vim.cmd('highlight NvimTreeNormal guibg=' .. color)
  vim.cmd('highlight NvimTreeWinSeparator guifg=#505050 guibg=' .. color)
  vim.cmd('highlight BufferLineFill guibg=' .. color)
  vim.cmd('highlight diffAdded guibg=' .. color)
  vim.cmd('highlight diffChanged guibg=' .. color)
  vim.cmd('highlight diffRemoved guibg=' .. color)
end

M.toggle_transparency = function()
  settings = require('settings.gui_settings')
  if settings.current_bg == settings.default_bg then
    settings.current_bg = "NONE"
  elseif settings.current_bg == "NONE" then
    settings.current_bg = tostring(settings.default_bg)
  end
  M.change_backgroundcolor(tostring(settings.current_bg))
end

M.close_current_buffer = function()
  -- check if buffer has unsaved changes
  if vim.bo.modified then
    local choice = vim.fn.confirm("Buffer has unsaved changes. Save?", "&Yes\n&No", 2)
    if choice == 1 then
      vim.cmd("silent w")
    end
  end
  -- close the buffer
  vim.cmd(":bd!")
end

local modes = {
  ['insert'] = 'i',
  ['visual'] = 'v',
  ['normal'] = 'n',
  ['normal_and_visual'] = { 'n', 'v' }
}

M.apply_keymaps = function(keymaps)
    for mode, bindings in pairs(keymaps) do
        for key, binding in pairs(bindings) do
            vim.keymap.set(modes[mode], key, binding[1], { desc = binding[2], silent = true })
        end
    end
end

M.warp_text_keymaps = function(symbols)
  for _, symbol in pairs(symbols) do
    local left = symbol[1]
    local right = symbol[2]
    local both = "'" .. left .. "' and '" .. right .. "'"
    -- Selected text (visual)
    vim.keymap.set('v', '<leader>wt' .. left, 'c' .. left .. right .. '<Left><C-c>p<Right>', 
      { desc = "[W]rap [t]ext in the symbols " .. both, silent = true })
    -- Selected text (normal)
    vim.keymap.set('n', '<leader>wt' .. left, 'viwc' .. left .. right .. '<Left><C-c>p<Right>', 
      { desc = "[W]rap [t]ext in the symbols " .. both, silent = true })
    -- Selected line (visual)
    vim.keymap.set('v', '<leader>wl' .. left, 'c' .. left .. '<C-c>p$a' .. right .. '<C-c>0i<BS><C-c>$', 
      { desc = "[W]rap [l]ine in the symbols " .. both, silent = true } )
  end 
  end

return M
