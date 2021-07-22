local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local ps = ls.parser.parse_snippet

ls.snippets = {
    all = {
        s(
            "ymd",
            f(function()
                return "" .. os.date("%Y-%m-%d")
            end, {})
        ),
        s(
            "date",
            f(function()
                return "" .. os.date()
            end, {})
        ),
        s(
            "epoch",
            f(function()
                return "" .. os.time()
            end, {})
        ),
    },
    rust = require("dotfiles.snippets.rust"),
    lua = require("dotfiles.snippets.lua"),
    cpp = require("dotfiles.snippets.cpp"),
}
