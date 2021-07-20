(module dotfiles.autocmd
        {require {core aniseed.core
                  nvim aniseed.nvim}
         require-macros [macros]})

(let [autocmds [[:WinLeave :<buffer> "set showtabline=2"]
                ["BufNewFile,BufRead" "*.jsonc" "setfiletype jsonc"]
                [:BufWritePost :wezterm.fnl "!fennel --compile wezterm.fnl > wezterm.lua"]
                ["CursorHold,CursorHoldI" :* "lua require'nvim-lightbulb'.update_lightbulb({status_text={enabled=true}})"]
                [:FileType :fennel "setlocal indentexpr=lisp"]
                [:FileType :clojure "setlocal indentexpr=lisp"]
                [:FileType "Results,lspinfo,NeogitStatus" "let b:auto_cursorline_disabled = 1"]
                [:FileType :python "nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>"]
                [:FileType :lua "nnoremap <F4> :w <bar> exec '!lua '.shellescape('%')<CR>"]
                [:FileType :c "nnoremap <F4> :w <bar> exec '!gcc -lm '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]
                [:FileType :cpp "nnoremap <F4> :w <bar> exec '!g++ -lm '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]
                [:FileType :rust "nnoremap <F4> :w <bar> exec '!rustc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]]]

     (core.map (fn [[event pattern action]]
                  (autocmd event pattern action)) autocmds))

(vim.api.nvim_exec
  "augroup FormatAutogroup
     autocmd!
     autocmd BufWritePost *.rs,*.lua,*.c,*.cpp FormatWrite
   augroup END"
 true)
