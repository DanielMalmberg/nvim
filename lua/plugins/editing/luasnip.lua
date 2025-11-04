-- [[ LuaSnip ]]
-- Used for defining and configuring snippets

return {
	"L3MON4D3/LuaSnip",
    build = "make install_jsregexp", -- ensures regex support
    config = function()
      local ls = require("luasnip")
      -- Load custom snippets from your lua/snippets directory
      require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets"
      })
    end,
}
