-- [[ Theme manager ]]

local theme = require('settings.themes')
local colors = require('settings.colors')
local M = {}
M.background_colors = {}
M.transparent = false
M.initialized = false

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
      if M.transparent and M.background_colors[element] then 
        set_background_color(element, M.background_colors[element])
      -- Toggle on transparency
      elseif not M.transparent then 
        set_background_color(element, "NONE")
      end
    end
  end
  -- Reverse toggle
  M.transparent = not M.transparent
end


-- Initialize settings
----------------------------------
if not M.initialized then
  -- Set custom colors before (!) toggling transparency
  vim.opt.background = 'dark'
  if theme.selected_theme.custom_colors ~= nil then
    for key, color in pairs(theme.selected_theme.custom_colors) do
      vim.cmd(string.format('hi %s %s', key, color))
    end
  end
  if theme.transparent_at_startup then
    M.toggle_transparency()
  end
  M.initialized = true
end

return M
