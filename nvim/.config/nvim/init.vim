lua require('init')

fun! s:DetectFennel()
    if getline(1) =~# '^#!.*/bin/env\s\+fennel\>'
        setfiletype fennel
    endif
endfun

autocmd BufRead,BufNewFile *.fnl setlocal filetype=fennel
autocmd BufNewFile,BufRead * call s:DetectFennel()


if has('nvim-0.5')
  packadd nvim-jdtls
  lua jdtls = require('jdtls')
  augroup lsp
    au!
    au FileType java lua jdtls.start_or_attach({cmd={'jdtls_launcher.sh'}})
  augroup end
endif
