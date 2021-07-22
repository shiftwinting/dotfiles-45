local ps = require("luasnip").parser.parse_snippet
return {
    ps("req", [[local $1 = require("${2:$1}")]]),
    ps(
        "for_ipairs",
        [[for ${1:i}, ${2:v} in ipairs($3) do
    $4
end]]
    ),
    ps(
        "for_pairs",
        [[for ${1:k}, ${2:v} in pairs($3) do
    $4
end]]
    ),
    ps(
        "if",
        [[if $1 then
    $2
end]]
    ),
    ps("loc", [[local $1 = $0]]),
}
