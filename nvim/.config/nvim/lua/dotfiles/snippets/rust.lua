local ps = require("luasnip").parser.parse_snippet

return {
    ps(
        "MOD",
        [[type Data = ${1:usize};

const MOD: Data = 1e9 as Data + 7;

pub trait Modulo {
    fn add(&mut self, other: Data);

    fn sub(&mut self, other: Data);
}

impl Modulo for Data {
    fn add(&mut self, other: Data) {
        *self += other;
        if *self >= MOD {
            *self -= MOD;
        }
    }

    fn sub(&mut self, other: Data) {
        *self -= other;
        if *self < 0 {
            *self += MOD;
        }
    }
}]]
    ),
    ps(
        "cc_base",
        [[#![allow(unused_imports)]
#![warn(clippy::all, clippy::pedantic)]
use std::{io::{self, prelude::*}, str};

fn main() {
    let (stdin, stdout) = (io::stdin(), io::stdout());
    let mut scanner = Scanner::new(stdin.lock());
    let mut out = io::BufWriter::new(stdout.lock());

    for _ in 0..scanner.token::<usize>() {
        $1
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
            buf_iter: "".split_whitespace(),
        }
    }
    fn token<T: str::FromStr>(&mut self) -> T {
        loop {
            if let Some(token) = self.buf_iter.next() {
                return token.parse().ok().expect("Failed parse");
            }
            self.buf_str.clear();
            self.reader
                .read_until(b'\n', &mut self.buf_str)
                .expect("Failed to read");
            self.buf_iter = unsafe {
                let slice = str::from_utf8_unchecked(&self.buf_str);
                std::mem::transmute(slice.split_whitespace())
            }
        }
    }
}]]
    ),
    ps("ri", [[scanner.token::<${1:u}>();]]),
    ps("rv", [[(0..${1:n}).map(|_| scanner.token()).collect::<Vec<${2:u}>>();]]),
    ps(
        "freqmap",
        [[let mut ${1:freqs} = HashMap::new();
for x in &${2:v} {
    let count = $1.entry(x).or_insert(0);
    *count += 1;
}]]
    ),
    ps(
        "ceil",
        [[#[inline]
fn ceil_div(x: u64, y: u64) -> u64 {
    (x + y - 1) / y
}]]
    ),
    ps(
        "ncr",
        [[fn nCr(n: u64, r: u64) -> u64 {
    if r > n {
        0
    } else {
        (1..=r.min(n - r)).fold(1, |acc, val| acc * (n - val + 1) / val)
    }
}]]
    ),
    ps(
        "npr",
        [[fn nPr(n: u64, r: u64) -> u64 {
    (n - r + 1..=n).product()
}]]
    ),
    ps(
        "gcd",
        [[pub fn gcd<T>(a: T, b: T) -> T
where
    T: std::cmp::PartialEq + std::ops::Rem<Output = T> + Default + Copy,
{
    if b == T::default() {
        a
    } else {
        gcd(b, a % b)
    }
}]]
    ),
    ps(
        "factorise",
        [[fn factorise(mut n: u64) -> HashMap<u64, u64> {
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
}]]
    ),
    ps(
        "fstdin",
        [[let f = File::open("input1").unwrap(); // DELET THIS 🔫
let f = BufReader::new(f); // DELET THIS 🔫
let mut scan = Scanner::new(f); // CHANGE THIS BACK 🔫]]
    ),
    ps(
        "inmacros",
        [[macro_rules! input_multiple {
    (\$scanner:ident -> \$(\$i:tt: \$t:tt),+ \$(,)?) => {
        \$(input!{\$scanner -> \$i: \$t})*
    };
}
macro_rules! input {
    (\$scanner:ident -> \$i:tt: [[\$t:ty; \$m:ident]; \$n:ident]) => { // nxm matrix
        let \$i = {
        let mut v:Vec<Vec<\$t>> = Vec::new();
        for i in 0..n {
            let subv = (0..\$m).map(|_| \$scanner.token()).collect::<Vec<\$t>>();
            v.push(subv);
        }
        let v = v;
        v
    };};
    (\$scanner:ident -> \$i:tt: [\$t:ty; \$n:ident]) => {
        let \$i = (0..\$n).map(|_| \$scanner.token()).collect::<Vec<\$t>>();
    };
    (\$scanner:ident -> \$i:tt: (\$t1:ty, \$t2:ty)) => {
        let x = \$scanner.token::<\$t1>();
        let y = \$scanner.token::<\$t2>();
        let \$i = (x, y);
    };
    (\$scanner:ident -> \$i:tt: \$t:ty) => {
        let \$i = \$scanner.token::<\$t>();
    };
    (\$scanner:ident -> \$i:tt: "bytes") => {
        let \$i:Vec<u8> = Vec::from(\$scanner.token::<String>());
    };
    (\$scanner:ident -> \$i:tt: "chars") => {
        let \$i:Vec<char> = \$scanner.token::<String>().chars().collect();
    };
}]]
    ),
}
