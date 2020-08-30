lua require('init')
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
autocmd FileType fennel set lisp
autocmd FileType clojure set lisp
