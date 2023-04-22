-- [[ Close Current Bufffer ]]

function close_current_buffer()
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
