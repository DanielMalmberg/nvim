-- [[ Spectre ]]
-- A panel that uses sed to search and replace a given regex word in files

return {
  "nvim-pack/nvim-spectre",
  enabled = true,
  config = function()
    require('spectre').setup({
      result_padding = '', -- character that shows up before search result
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = {
            "-i",
            "",
            "-E",
          },
        },
      },
    })
  end
}
