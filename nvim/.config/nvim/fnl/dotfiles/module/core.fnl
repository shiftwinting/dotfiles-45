(module dotfiles.module.core
  {require {nvim aniseed.nvim
            core aniseed.core
            str aniseed.string}})

(defn autocmd [event name action]
      (nvim.ex.autocmd event name action))

(defn setopt [opt value]
  "Sets a vim option"
  (core.assoc nvim.o opt value))

(nvim.ex.colorscheme :omni)

(autocmd :FileType :dashboard "set showtabline=1")
(autocmd :WinLeave :<buffer> "set showtabline=2")
(autocmd "BufNewFile,BufRead" "*.jsonc" "setfiletype jsonc")
(autocmd :BufWritePost :wezterm.fnl "!fennel --compile wezterm.fnl > wezterm.lua")
(autocmd :FileType :fennel "setlocal indentexpr=lisp")
(autocmd :FileType :clojure "setlocal indentexpr=lisp")
(autocmd :CursorHoldI "lua require('lspsaga.signaturehelp').signature_help()")

(let [options
       {:termguicolors true
        :mouse :a
        :number true
        :relativenumber true
        :guicursor (str.join "," (core.concat (str.split nvim.o.guicursor ",") ["a:blinkon700"]))
        :listchars "tab:» ,trail:_"
        :showmode false
        :tabstop 2
        :shiftwidth 2
        :expandtab true
        :softtabstop 2
        :foldexpr "nvim_treesitter#foldexpr()"
        :foldmethod "expr"
        :clipboard "unnamedplus"
        :completeopt "menuone,noselect"
        :hidden true
        :autoindent true
        :smartindent true
        :emoji true
        :list true
        :pumblend 15
        :winblend 15
        :title true
        :incsearch true
        :hlsearch true
        :autowrite true
        :fixeol true}]
     (each [option value (pairs options)]
       (setopt option value)))

(if
  nvim.g.gnvim          (setopt :guifont "JetBrains Mono,Delugia Nerd Font,Inter:h12")
  nvim.g.gonvim_running (setopt :linespace 2)
  nvim.g.neovide        (setopt :guifont "JetBrains Mono,Delugia Nerd Font,Inter,Noto Color Emoji:h15")
  nvim.g.uivonim        (setopt :guifont "Fira Code,Delugia Nerd Font,Inter,Noto Color Emoji:h30"))

(when nvim.g.gnvim
  (setopt :completeopt "menuone,noinsert,noselect,preview"))
