(module dotfiles.module.core
  {require {nvim aniseed.nvim
            core aniseed.core
            str aniseed.string}})

(defn autocmd [event name todo]
  (nvim.ex.autocmd event name todo))

(defn setopt [[opt value]]
  "Sets a vim option" 
  (core.assoc nvim.o opt value))

(nvim.ex.colorscheme :oak)

(autocmd :FileType :dashboard "set showtabline=1")
(autocmd :WinLeave :<buffer> "set showtabline=2")
(autocmd :BufEnter :* "lua require'completion'.on_attach()")
(autocmd :BufWritePost :packages.lua "PackerCompile")

(let [options
      [[:termguicolors true]
       [:mouse :a]
       [:number true]
       [:relativenumber true]
       [:guicursor (str.join "," (core.concat (str.split nvim.o.guicursor ",") ["a:blinkon700"]))]
       [:listchars "eol:↴,tab:<->,space:·"]
       [:showmode false]
       [:tabstop 2]
       [:shiftwidth 2]
       [:expandtab true]
       [:softtabstop 2]
       [:foldexpr "nvim_treesitter#foldexpr()"]
       [:foldmethod "expr"]
       [:clipboard "unnamedplus"]
       [:completeopt "menuone,noinsert,noselect"]
       [:hidden true]
       [:autoindent true]
       [:smartindent true]
       [:emoji true]
       [:list true]
       [:pumblend 15]
       [:winblend 15]
       [:title true]]]
  (core.map setopt options))

(if
  nvim.g.gnvim          (setopt [:guifont "JetBrains Mono,Delugia Nerd Font,Inter:h11"])
  nvim.g.gonvim_running (setopt [:guifont "JetBrains Mono:h11"])
  nvim.g.neovide        (setopt [:guifont "JetBrains Mono,Delugia Nerd Font,Inter,Noto Color Emoji:h15"])
  nvim.g.uivonim        (setopt [:guifont "Delugia Nerd Font,Inter,Noto Color Emoji:h15"]))

(when nvim.g.gnvim
  (setopt [:completeopt "menuone,noinsert,noselect,preview"]))
