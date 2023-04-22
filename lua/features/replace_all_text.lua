-- [[ Relplace all text ]]

function replace_all_text(text, replacement)
  -- Escape text and replacement for regex use
  text = vim.fn.escape(text, '\\')
  replacement = vim.fn.escape(replacement, '\\')

  vim.cmd(":cdo s/".. text .. '/' .. replacement .. "/g")
  vim.cmd(':call feedkeys("\\<C-w>o")')
  vim.schedule(function()
    vim.notify("All instances of '" .. text .. "' were replaced with '" .. replacement .. "'")
  end)
end

-- Define the custom command
vim.cmd("command! -nargs=+ Replace lua replace_all_text(<f-args>)")
