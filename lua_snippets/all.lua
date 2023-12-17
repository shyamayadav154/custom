local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
local types = require "luasnip.util.types"
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

-- react useState snippet
-- ls.snippet.all = {
--   s("useState", {
--     t("const ["),
--     i(1, "state"),
--     t(", set"),
--     i(2, "setState"),
--     t("] = useState("),
--     i(3, "initialValue"),
--     t(");"),
--   }),
-- }

-- ls.add_snippets = {
--   all = {
--     ls.parser.parse_snippet("us", "const [${1:state}, set${1/(.)(.*)/${1:/u}${2:/e/}}] = useState(${2:initialValue});"),
--   },
-- }

ls.add_snippets("all", {
  s("ternary", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, "cond"),
    t " ? ",
    i(2, "then"),
    t " : ",
    i(3, "else"),
  }),
  s("useS", {
    fmt("const [{}, set{setter}] = useState({})", {
      i(1, "state"),
      i(2, "initialValue"),
      setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1),
    }),
  }),
})

