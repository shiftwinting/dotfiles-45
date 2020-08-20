set termguicolors
lua require'init'
set guicursor+=a:blinkon700
autocmd FileType lua set formatprg=lua-format\ -i
autocmd FileType java set formatprg=google-java-format\ -i
