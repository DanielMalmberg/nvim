-- [[ Configure Bufferline ]]

require("bufferline").setup{
  options = {
    color_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      if level:match("error") then
        return " "
      else
        return ""
      end
    end,
    always_show_bufferline = false,
    separator_style = "thin"
  },
  highlights = {
    error = {
      fg = "#F93E43",
    },
    error_diagnostic = {
      fg = "#B32E32",
    }
  }
}
