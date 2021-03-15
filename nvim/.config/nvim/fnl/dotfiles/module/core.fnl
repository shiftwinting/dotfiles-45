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
(autocmd "CursorHold,CursorHoldI" "*.rs" "lua require'lsp_extensions'.inlay_hints {
                                              prefix = ' » ',
                                              only_current_line = true,}")
(autocmd "BufEnter,BufWinEnter,TabEnter,BufWritePost" "*.rs" "lua require'lsp_extensions'.inlay_hints {prefix = ' » ', aligned = true}")
(autocmd :FileType :Results "let b:auto_cursorline_disabled = 1")

(let [options
       {:termguicolors true
        :mouse :a
        :number true
        :relativenumber true
        :guicursor (str.join "," (core.concat (str.split nvim.o.guicursor ",") ["a:blinkon700"]))
        :listchars "tab:» ,trail:_"
        :showmode false
        :tabstop 8
        :shiftwidth 4
        :expandtab true
        :softtabstop 4
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
        :fixeol true
        :smarttab true
        :smartindent true
        :undofile true}]
     (each [option value (pairs options)]
       (setopt option value)))

(if
  nvim.g.gnvim          (setopt :guifont "JetBrains Mono,Delugia Nerd Font,Inter:h12")
  nvim.g.gonvim_running (do
                         (setopt :linespace 2)
                         (setopt :guifont "Delugia Nerd Font:h11"))
  nvim.g.neovide        (setopt :guifont "Fira Code,Delugia Nerd Font,Inter,Noto Color Emoji:h17")
  nvim.g.uivonim        (setopt :guifont "Fira Code,Delugia Nerd Font,Inter,Noto Color Emoji:h30"))

(when nvim.g.gnvim
  (setopt :completeopt "menuone,noinsert,noselect,preview"))
