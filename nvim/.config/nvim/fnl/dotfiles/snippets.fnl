(module dotfiles.snippets
        {require {snippets snippets
                  U snippets.utils}})

(defn- note-snippet [header]
  (var S "${-1}:\n $0\n   - ${=os.date()}")
  (set S (U.force_comment S))
  (set S (U.match_indentation S))
  (U.iterate_variables_by_id S (- 1)
                             (fn [v]
                               (set v.default header))))
(set snippets.snippets
     {:lua
       {:req "local ${2:${1|S.v:match\"([^.()]+)[()]*$\"}} = require '$1'"
        :func "function${1|vim.trim(S.v):gsub(\"^%S\",\" %0\")}(${2|vim.trim(S.v)})$0 end"
        :local "local ${2:${1|S.v:match\"([^.()]+)[()]*$\"}} = ${1}"
        :for (U.match_indentation "for ${1:i}, ${2:v} in ipairs(${3:t}) do
    $0
end")
        :fori (U.match_indentation "for ${1:i} = ${2:1}, ${3:#t} do
    $0
end")
        :forp (U.match_indentation "for ${1:k}, ${2:v} in pairs(${3:t}) do
    $0
end")
        :if (U.match_indentation "if ${1:i} then
    $0
end")
        :loc "local $1 = $0"
        :exp "$1 = $1;"
        :ymd "${=os.date('%Y-%m-%d')}"
        :todo (note-snippet :TODO)
        :note (note-snippet :NOTE)
        :idea (note-snippet :IDEA)
        :important (note-snippet :IMPORTANT)}
      :_global
       {:date "${=os.date()}" :epoch "${=os.time()}"}
      :cpp
       {:cc_base (U.match_indentation "#include <bits/stdc++.h>
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
int main()
{
        ios::sync_with_stdio(false);
        cin.tie(nullptr);
        constexpr char endl = '\\n';
        int t;
        cin >> t;
        while (t--) {
                $0
        }
        return 0;
}")
        :REP (U.match_indentation "REP( ${1:i}, ${2:i} ) {
        $0
}")
        :inc "#include \"${=vim.fn.expand(\"%:t\"):upper()}\""
        :debug (U.match_indentation "vector<string> vec_splitter(string s)
{
        s += ',';
        vector<string> res;
        while (!s.empty()) {
                res.push_back(s.substr(0, s.find(',')));
                s = s.substr(s.find(',') + 1);
        }
        return res;
}
void debug_out(
    vector<string> __attribute__((unused)) args,
    __attribute__((unused)) int idx,
    __attribute__((unused)) int LINE_NUM) { cerr << endl; }
template <typename Head, typename... Tail>
void debug_out(vector<string> args, int idx, int LINE_NUM, Head H, Tail... T)
{
        if (idx > 0)
                cerr << \", \";
        else
                cerr << \"Line(\" << LINE_NUM << \") \";
        stringstream ss;
        ss << H;
        cerr << args[idx] << \" = \" << ss.str();
        debug_out(args, idx + 1, LINE_NUM, T...);
}
#ifdef XOX
#define debug(...) debug_out(vec_splitter(#__VA_ARGS__), 0, __LINE__, __VA_ARGS__)
#else
#define debug(...) 42
#endif
")
        :debugin (U.match_indentation "#ifdef XOX
freopen(\"input1\", \"r\", stdin);
#endif")
        :freq_str (U.match_indentation "unordered_map<char, int> freq_str(string s)
{
        unordered_map<char, int> freqs;
        for (char c : s) {
                freqs[c]++;
        }
        return freqs;
}
")
        :freq_intvec (U.match_indentation "unordered_map<int, int> freq_intarr(vector<int> src)
{
        unordered_map<int, int> freqs;
        for (int x: src) {
\t\tfreqs[x]++;
\t}
\treturn freqs;
}
")
        :ceil (U.match_indentation "int ceil_div(int x, int y)
{
        return (x + y - 1) / y;
}")}
      :rust
       {:ri "scanner.token::<${1:u}>();"
        :rv "(0..n).map(|_| scanner.token()).collect::<Vec<${1:u}>>();"
        :freqmap (U.match_indentation "let mut ${1:freqs} = HashMap::new();
for x in &${2:v} {
    let count = $1.entry(x).or_insert(0);
    *count += 1;
}")
        :ceil (U.match_indentation "fn ceil_div(x: u64, y: u64) -> u64 {
    (x + y - 1) / y
}")
        :ncr (U.match_indentation "fn nCr(n: u64, r: u64) -> u64 {
    if r > n {
        0
    } else {
        (1..=r.min(n - r)).fold(1, |acc, val| acc * (n - val + 1) / val)
    }
}")
        :npr (U.match_indentation "fn nPr(n: u64, r: u64) -> u64 {
    (n - r + 1..=n).product()
}")
        :gcd (U.match_indentation "fn gcd(mut x: u32, mut y: u32) -> u32 { // max is 4.2e9
    while y != 0 {
        let t = y;
        y = x % y;
        x = t;
    }
    x
}")
        :factorise (U.match_indentation "fn factorise(mut n: u64) -> HashMap<u64, u64> {
    let mut factors = HashMap::new();

    while n % 2 == 0 {
        *factors.entry(2).or_insert(0) += 1;
        n /= 2;
    }
    for i in (3..(n as f64).sqrt() as u64 + 1).step_by(2) {
        while n % i == 0 {
            *factors.entry(i).or_insert(0) += 1;
            n /= i;
        }
    }
    if n > 2 {
        *factors.entry(n).or_insert(0) += 1;
    }

    factors
}")
        :file_stdin (U.match_indentation "let f = File::open(\"input1\").unwrap(); // DELET THIS 🔫
let f = BufReader::new(f); // DELET THIS 🔫
let mut scan = Scanner::new(f); // CHANGE THIS BACK 🔫")
        :cc_base (U.match_indentation "#![allow(unused_imports)]
use std::{io::{self, prelude::*}, str};

macro_rules! input_multiple {
    (\\$scanner:ident -> \\$(\\$i:tt: \\$t:tt),+ \\$(,)?) => {
        \\$(input!{\\$scanner -> \\$i: \\$t})*
    };
}
macro_rules! input {
    (\\$scanner:ident -> \\$i:tt: [[\\$t:ty; \\$m:ident]; \\$n:ident]) => { // nxm matrix
        let \\$i = {
        let mut v:Vec<Vec<\\$t>> = Vec::new();
        for i in 0..n {
            let subv = (0..\\$m).map(|_| \\$scanner.token()).collect::<Vec<\\$t>>();
            v.push(subv);
        }
        let v = v;
        v
    };};
    (\\$scanner:ident -> \\$i:tt: [\\$t:ty; \\$n:ident]) => {
        let \\$i = (0..\\$n).map(|_| \\$scanner.token()).collect::<Vec<\\$t>>();
    };
    (\\$scanner:ident -> \\$i:tt: (\\$t1:ty, \\$t2:ty)) => {
        let x = \\$scanner.token::<\\$t1>();
        let y = \\$scanner.token::<\\$t2>();
        let \\$i = (x, y);
    };
    (\\$scanner:ident -> \\$i:tt: \\$t:ty) => {
        let \\$i = \\$scanner.token::<\\$t>();
    };
    (\\$scanner:ident -> \\$i:tt: \"bytes\") => {
        let \\$i:Vec<u8> = Vec::from(\\$scanner.token::<String>());
    };
    (\\$scanner:ident -> \\$i:tt: \"chars\") => {
        let \\$i:Vec<char> = \\$scanner.token::<String>().chars().collect();
    };
}

fn main() {
    let (stdin, stdout) = (io::stdin(), io::stdout());
    let mut scanner = Scanner::new(stdin.lock());
    let mut out = io::BufWriter::new(stdout.lock());

    for _ in 0..scanner.token::<usize>() {
        $0
    }
}

// Scanner by @EbTech
struct Scanner<R> {
    reader: R,
    buf_str: Vec<u8>,
    buf_iter: str::SplitWhitespace<'static>,
}

impl<R: BufRead> Scanner<R> {
    fn new(reader: R) -> Self {
        Self {
            reader,
            buf_str: vec![],
            buf_iter: \"\".split_whitespace(),
        }
    }
    fn token<T: str::FromStr>(&mut self) -> T {
        loop {
            if let Some(token) = self.buf_iter.next() {
                return token.parse().ok().expect(\"Failed parse\");
            }
            self.buf_str.clear();
            self.reader
                .read_until(b'\\n', &mut self.buf_str)
                .expect(\"Failed to read\");
            self.buf_iter = unsafe {
                let slice = str::from_utf8_unchecked(&self.buf_str);
                std::mem::transmute(slice.split_whitespace())
            }
        }
    }
}")}})
