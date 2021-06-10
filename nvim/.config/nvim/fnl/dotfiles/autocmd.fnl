(module dotfiles.autocmd
        {require {core aniseed.core
                  nvim aniseed.nvim}})

(let [autocmds [[:WinLeave :<buffer> "set showtabline=2"]
                ["BufNewFile,BufRead" "*.jsonc" "setfiletype jsonc"]
                [:BufWritePost :wezterm.fnl "!fennel --compile wezterm.fnl > wezterm.lua"]
                [:FileType :fennel "setlocal indentexpr=lisp"]
                [:FileType :clojure "setlocal indentexpr=lisp"]
                [:CursorHoldI "lua require('lspsaga.signaturehelp').signature_help()"]
                [:FileType "Results,lspinfo,NeogitStatus" "let b:auto_cursorline_disabled = 1"]
                [:FileType "c,cpp" "set shiftwidth=8"]
                [:FileType "c,cpp" "set softtabstop=8"]
                [:FileType :python "nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>"]
                [:FileType :lua "nnoremap <F4> :w <bar> exec '!lua '.shellescape('%')<CR>"]
                [:FileType :c "nnoremap <F4> :w <bar> exec '!gcc -lm '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]
                [:FileType :cpp "nnoremap <F4> :w <bar> exec '!g++ -lm '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]
                [:FileType :rust "nnoremap <F4> :w <bar> exec '!rustc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]]]

     (core.map (fn [[event name action]]
                  (nvim.ex.autocmd event name action)) autocmds))
