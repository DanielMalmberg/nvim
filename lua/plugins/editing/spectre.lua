-- [[ Spectre ]]
-- Interactive search and replace panel across files using regex

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
