-- [[ Replace all occurences of a text in the current quickfix list ]]

local M = {}

M.replace_quickfix = function ()
      -- Check if quickfix list is open
    if #vim.fn.getqflist() == 0 then
        print("No quickfix list open.")
        return
    end

    -- Prompt user for input arguments
    local arg1 = vim.fn.input("Enter the pattern to replace: ")
    local arg2 = vim.fn.input("Enter the replacement text: ")

    -- Construct and execute the substitution command
    local cmd = string.format("cfdo %s/%s/%s/gi | update | bd", '%s', vim.fn.escape(arg1, '/'), vim.fn.escape(arg2, '/'))
    vim.cmd(cmd)
end

return M
