lua require('init')

" Fennel filetype detection
fun! s:DetectFennel()
    if getline(1) =~# '^#!.*/bin/env\s\+fennel\>'
        setfiletype fennel
    endif
endfun

autocmd BufRead,BufNewFile *.fnl setlocal filetype=fennel
autocmd BufNewFile,BufRead * call s:DetectFennel()

" jdtls
"packadd nvim-jdtls
"lua dofile('/home/p00f/.config/nvim/lua/jdtls_setup.lua')
"augroup lsp
"  au!
"  au FileType java lua jdtls.start_or_attach(config)
"augroup end

set termguicolors
let g:oak_virtualtext_bg = 1
