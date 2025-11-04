
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
  s("props", {
    t("@property"), t({"", "def "}), i(1, "name"),
    t({"(self) -> "}), i(2, "type"), t({":", "\treturn self._"}), rep(1),
    t({"", "", "@"}), rep(1), t({".setter", "def "}), rep(1),
    t({"(self, value: "}), i(2, "type"), t({") -> None:", "\tself._"}), rep(1), t(" = value")
  })
}
