-- "My" lmao what a joke
local snippets = require("snippets")
local U = require("snippets.utils")
local function note_snippet(header)
    local S = [[
${-1}:
 $0
   - ${=os.date()}]]
    S = U.force_comment(S)
    S = U.match_indentation(S)
    return U.iterate_variables_by_id(S, -1, function(v)
        v.default = header
    end)
end

snippets.snippets = {
    lua = {
        req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
        func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
        ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
        ["for"] = U.match_indentation([[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
    $0
end]]),
        fori = U.match_indentation([[
for ${1:i} = ${2:1}, ${3:#t} do
    $0
end]]),
        forp = U.match_indentation([[
for ${1:k}, ${2:v} in pairs(${3:t}) do
    $0
end]]),
        ["if"] = U.match_indentation([[
if ${1:i} then
    $0
end]]),
        loc = "local $1 = $0",
        exp = "$1 = $1;",
        ymd = [[${=os.date('%Y-%m-%d')}]],

        todo = note_snippet("TODO"),
        note = note_snippet("NOTE"),
        idea = note_snippet("IDEA"),
        important = note_snippet("IMPORTANT"),
    },
    _global = {
        date = "${=os.date()}",
        epoch = "${=os.time()}",
    },
    cpp = {
        REP = U.match_indentation([[
REP( ${1:i}, ${2:i} ) {
    $0
}]]),
        inc = [[#include "${=vim.fn.expand("%:t"):upper()}"]],
    },
}
