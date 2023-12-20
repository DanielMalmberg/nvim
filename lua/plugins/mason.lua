-- [[ Mason ]]
--

return {
  "williamboman/mason.nvim",
  priority = 850,
  build = function()
    pcall(vim.cmd, 'MasonUpdate')
  end,
  config = true
}
