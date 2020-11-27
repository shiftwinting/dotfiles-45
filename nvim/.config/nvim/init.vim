lua require('init')

"" jdtls
"packadd nvim-jdtls
"lua dofile('/home/p00f/.config/nvim/lua/jdtls_setup.lua')
"augroup lsp
"  au!
"  au FileType java lua jdtls.start_or_attach(config)
"augroup end

set termguicolors
let g:oak_virtualtext_bg = 1
