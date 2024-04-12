-- [[ Relplace all text in the current quickfix list ]]

function replace_in_quickfix(text, replacement)
  -- Escape text and replacement for regex use
  text = vim.fn.escape(text, '\\')
  replacement = vim.fn.escape(replacement, '\\')
  -- Perform substitution in all quickfix items
  vim.cmd(":cdo s/" .. text .. '/' .. replacement .. "/g")
  -- Switch to the quickfix window
  vim.cmd(':call feedkeys("\\<C-w>o")')
  -- Save all modified buffers
  vim.cmd(':silent wa')
  -- Show message asynchronously
  vim.schedule(function()
    vim.notify("All instances of '" .. text .. "' were replaced with '" .. replacement .. "'")
  end)
end

-- Define the custom command
vim.cmd("command! -nargs=+ Replace lua replace_in_quickfix(<f-args>)")
