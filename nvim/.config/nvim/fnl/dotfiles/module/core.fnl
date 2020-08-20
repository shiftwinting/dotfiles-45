(module dotfiles.module.core
  {require {nvim aniseed.nvim}})

(set nvim.o.termguicolors true)
(set nvim.o.mouse :a)
(set nvim.o.number true)
(set nvim.o.relativenumber true)
(set nvim.o.guifont "JetBrains Mono:h11")
(set nvim.o.listchars "eol:↴,tab:<->,space:·")
(set nvim.o.showmode false)
(set nvim.o.tabstop 2)
(set nvim.o.shiftwidth 2)
(set nvim.o.expandtab true)
(set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
(set nvim.o.foldmethod :expr)
(set nvim.o.clipboard :unnamedplus) ;see https://github.com/Olical/dotfiles/issues/6#issuecomment-667534866
(set nvim.o.completeopt "menuone,noinsert,noselect")
(when nvim.g.gnvim
  (set nvim.o.completeopt "menuone,noinsert,noselect,preview"))

(nvim.ex.set :list)
(nvim.ex.colorscheme :dracula)

(nvim.ex.highlight :dashboardHeader "guifg=#50fa7b")
(nvim.ex.highlight :link :TSParameter :DraculaOrangeItalic)
(nvim.ex.highlight :link :Label :DraculaPurple)
;(nvim.ex.highlight :link :Delimiter :DraculaRed)
;(nvim.ex.highlight :link :Operator :DraculaYellow)
(nvim.ex.highlight :MsgSeparator "guifg=#282a36")

(nvim.ex.autocmd :FileType :dashboard "set showtabline=0")
(nvim.ex.autocmd :WinLeave :<buffer> "set showtabline=2")
(nvim.ex.autocmd :BufEnter "* lua require'completion'.on_attach()")
(nvim.ex.autocmd :BufEnter "* lua require'diagnostic'.on_attach()")

;;gnvim
;(when (= 1 nvim.g.gnvim)
;  (nvim.ex.gnvim.popupmenu.toggle_details))
