-- [[ Toggle transparency on/off on background colors ]]

local colors = require('settings.colors')

local M = {}
M.background_colors = {}
vim.g.transparent = false

local function set_background_color(element, color)
  vim.cmd(string.format('highlight %s guibg=%s', element, color))
end

M.toggle_transparency = function()
  for index, element in ipairs(colors.backgrounds) do
    local highlight_exists, _ = pcall(vim.api.nvim_get_hl_by_name, element, true)
    if highlight_exists then
      -- Save hightlight color
      if not M.background_colors[element] then
        local output = vim.api.nvim_command_output('hi normal')
        local guibg = string.match(output, 'guibg=([^%s]+)')
        if guibg ~= nil then
          M.background_colors[element] = guibg
        end
      end
      -- Toggle off transparency
      if vim.g.transparent and M.background_colors[element] then
        set_background_color(element, M.background_colors[element])
        -- Toggle on transparency
      elseif not vim.g.transparent then
        set_background_color(element, "NONE")
      end
    end
  end
  -- Reverse toggle
  vim.g.transparent = not vim.g.transparent
end

return M
