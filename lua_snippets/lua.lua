
local ls = require("luasnip")


-- Path: lua/custom/lua_snippets/lua.lua

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.snippets = {
    js = {
        s({trig = "log"}, {
            t("console.log("),
            i(1, "message"),
            t(");"),
        }),
    },
}

