-- [[ Mason ]]
-- Package manager for LSP servers, DAP servers, linters and formatters  

return {
  "williamboman/mason.nvim",
  enabled = true,
  priority = 850,
  build = function()
    pcall(vim.cmd, 'MasonUpdate')
  end,
  config = true
}
