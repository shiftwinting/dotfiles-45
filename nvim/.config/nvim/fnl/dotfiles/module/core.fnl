(module dotfiles.module.core
  {require {nvim aniseed.nvim
            core aniseed.core
            str aniseed.string}})


(defn setopt [opt value]
  "Sets a vim option"
  (core.assoc nvim.o opt value))

(nvim.ex.colorscheme :omni)

(let [autocmds [[:WinLeave :<buffer> "set showtabline=2"]
                ["BufNewFile,BufRead" "*.jsonc" "setfiletype jsonc"]
                [:BufWritePost :wezterm.fnl "!fennel --compile wezterm.fnl > wezterm.lua"]
                [:FileType :fennel "setlocal indentexpr=lisp"]
                [:FileType :clojure "setlocal indentexpr=lisp"]
                [:CursorHoldI "lua require('lspsaga.signaturehelp').signature_help()"]
                ["CursorHold,CursorHoldI" "*.rs" "lua require'lsp_extensions'.inlay_hints {
                                                      prefix = ' » ',
                                                      only_current_line = true,}"]
                ["BufEnter,BufWinEnter,TabEnter,BufWritePost" "*.rs" "lua require'lsp_extensions'.inlay_hints {prefix = ' » ', aligned = true}"]
                [:FileType :Results "let b:auto_cursorline_disabled = 1"]
                [:FileType :NeogitStatus "let b:auto_cursorline_disabled = 1"]
                [:FileType :query "ParinferOff"]
                [:FileType :scheme "ParinferOff"]
                [:FileType :python "nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>"]
                [:FileType :lua "nnoremap <F4> :w <bar> exec '!lua '.shellescape('%')<CR>"]
                [:FileType :c "nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]
                [:FileType :cpp "nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]
                [:FileType :rust "nnoremap <F4> :w <bar> exec '!rustc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>"]]]

     (core.map (fn [[event name action]]
                  (nvim.ex.autocmd event name action)) autocmds))
(let [options
       {:mouse :a
        :splitbelow true
        :number true
        :relativenumber true
        :guicursor (str.join "," (core.concat (str.split nvim.o.guicursor ",") ["a:blinkon700"]))
        :listchars "tab:» ,trail:_"
        :showmode false
        :tabstop 8
        :shiftwidth 8
        :expandtab true
        :softtabstop 8
        :foldexpr "nvim_treesitter#foldexpr()"
        :foldmethod "expr"
        :clipboard "unnamedplus"
        :completeopt "menuone,noselect"
        :hidden true
        :autoindent true
        :smartindent true
        :emoji false
        :list true
        :pumblend 0
        :winblend 15
        :title true
        :incsearch true
        :hlsearch true
        :autowrite true
        :fixeol true
        :smarttab true
        :smartindent true
        :inccommand "nosplit"
        :guifont "Fira Code,nonicon:h11"}]
     (each [option value (pairs options)]
       (setopt option value)))

(if
  nvim.g.gnvim          (setopt :guifont "JetBrains Mono,nonicon,FantasqueSansMono Nerd Font,Inter:h12")
  nvim.g.gonvim_running (do
                         (setopt :linespace 2)
                         (setopt :guifont "Delugia Mono Nerd Font:h11"))
  nvim.g.neovide        (setopt :guifont "Fira Code,nonicon,FantasqueSansMono Nerd Font,Inter:h17")
  nvim.g.uivonim        (setopt :guifont "Fira Code,nonicon,FantasqueSansMono Nerd Font,Inter,Noto Color Emoji:h30"))

(when nvim.g.gnvim
  (setopt :completeopt "menuone,noinsert,noselect,preview"))

(nvim.ex.command :CD ":lcd %:p:h")
(nvim.ex.command "-complete=file" "-nargs=*" :DebugC "lua require 'dap_functions'.start_c_debugger({<f-args>}, 'lldb')")
(nvim.ex.command "-complete=file" "-nargs=*" :DebugRust "lua require 'dap_functions'.start_c_debugger({<f-args>}, 'lldb', 'rust-lldb')")
