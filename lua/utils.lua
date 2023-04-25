-- [[ Configure Utilities ]]

local M = {}

M.get_theme = function()
  theme = require('settings.gui_settings').theme
  if #theme ~= 3 then
    error('Error - GUI theme needs exactly 3 values specified - name, plugin and backgroundcolor')
  end
  return theme
end

M.change_backgroundcolor = function(color)
  local backgrounds = {
    'Normal',
    'NormalNC',
    'LineNr',
    'SignColumn',
    'FoldColumn',
    'NvimTreeNormal',
    'NvimTreeNormalNC',
    'NvimTreeEndOfBuffer',
    'NvimTreeWinSeparator',
    'BufferLineFill',
    'diffAdded',
    'diffChanged',
    'diffRemoved',
    'EndOfBuffer',
    'TelescopeNormal'
  }

  for _, property in pairs(backgrounds) do
    vim.cmd(string.format('highlight %s guibg=%s', property, color))
  end
end

M.set_default_colors = function()
  settings = require('settings.gui_settings')
  M.change_backgroundcolor(settings.current_bg)
  for key, color in pairs(settings.colors) do
    vim.cmd(string.format('hi %s %s', key, color))
  end
end

M.toggle_transparency = function()
  settings = require('settings.gui_settings')
  if settings.current_bg == settings.default_bg then
    settings.current_bg = "NONE"
  elseif settings.current_bg == "NONE" then
    settings.current_bg = settings.default_bg
  end
  M.change_backgroundcolor(settings.current_bg)
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

M.apply_text_wrapping_keymaps = function(keymaps)
  for _, symbols in pairs(keymaps) do
    local cmd_text = string.format('c%s%s<Left><C-c>p<Right>', unpack(symbols)) 
    local desc_text = "[W]rap [t]ext in symbols"
    local cmd_line =  string.format('c%s<C-c>p$a%s<C-c>0i<BS><C-c>$', unpack(symbols))
    local desc_line = "[W]rap [l]ine in symbols"
    for key, symbol in pairs(symbols) do
      -- Selected text (visual)
      vim.keymap.set('v', '<leader>' .. symbol, cmd_text, { desc = desc_text, silent = true })
      -- Selected text (normal)
      vim.keymap.set('n', '<leader>' .. symbol, 'viw' .. cmd_text, { desc = desc_text, silent = true })
      -- Selected line (visual)
      vim.keymap.set('v', '<leader>l' .. symbol, cmd_line, { desc = desc_line, silent = true })
    end
  end 
end

return M
