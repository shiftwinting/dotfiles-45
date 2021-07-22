local ls = require("luasnip")
local ps = ls.parser.parse_snippet
local s = ls.snippet
local f = ls.function_node
return {
    ps(
        "cc_base",
        [[#include <bits/stdc++.h>
#include <vector>
#define REP(i, n) for (int i = 0; (i) < (int)(n); ++(i))
#define REP3(i, m, n) for (int i = (m); (i) < (int)(n); ++(i))
#define REP_R(i, n) for (int i = (int)(n)-1; (i) >= 0; --(i))
#define REP3R(i, m, n) for (int i = (int)(n)-1; (i) >= (int)(m); --(i))
#define ALL(x) ::std::begin(x), ::std::end(x)
#define PB push_back
using namespace std;
typedef vector<int> vi;
typedef pair<int, int> pi;
typedef long long ll;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    constexpr char endl = '\n';
    int t;
    cin >> t;
    while (t--) {
        $1
    }
    return 0;
}]]
    ),
    ps(
        "REP",
        [[REP( ${1:i}, ${2:i} ) {
    $0
}]]
    ),
    ps(
        "freq_str",
        [[unordered_map<char, int> freq_str(string s) {
    unordered_map<char, int> freqs;
    for (char c : s) {
        freqs[c]++;
    }
    return freqs;
}]]
    ),
    ps(
        "freq_intvec",
        [[unordered_map<int, int> freq_intarr(vector<int> src) {
    unordered_map<int, int> freqs;
    for (int x: src) {
        freqs[x]++;
    }
    return freqs;
}]]
    ),
    ps(
        "ceil",
        [[int ceil_div(int x, int y) {
    return (x + y - 1) / y;
}]]
    ),
    s(
        "inc",
        f(function()
            return '#include "' .. vim.fn.expand("%:t"):upper() .. '"'
        end, {})
    ),
}
