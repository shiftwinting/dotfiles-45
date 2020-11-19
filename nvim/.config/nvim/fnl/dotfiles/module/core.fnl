(module dotfiles.module.core
        {require {nvim aniseed.nvim
                  core aniseed.core
                  str aniseed.string}})

(set nvim.o.termguicolors true)
(set nvim.o.mouse :a)
(set nvim.o.number true)
(set nvim.o.relativenumber true)

(if
  nvim.g.gnvim (set nvim.o.guifont "JetBrains Mono,Delugia Nerd Font,Inter:h11")
  nvim.g.gonvim_running (set nvim.o.guifont "JetBrains Mono:h11")
  nvim.g.neovide (set nvim.o.guifont "JetBrains Mono,Delugia Nerd Font,Inter,Noto Color Emoji:h15")
  nvim.g.uivonim (set nvim.o.guifont "Delugia Nerd Font,Inter,Noto Color Emoji:h15"))

(set nvim.o.guicursor (str.join "," (core.concat (str.split nvim.o.guicursor ",") ["a:blinkon700"])))
(if
  nvim.g.uivonim (set nvim.o.listchars "tab:<->,space:·")
  (set nvim.o.listchars "eol:↴,tab:<->,space:·"))
(set nvim.o.showmode false)
(set nvim.o.tabstop 2)
(set nvim.o.shiftwidth 2)
(set nvim.o.expandtab true)
(set nvim.o.softtabstop 2)
(set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
(set nvim.o.foldmethod :expr)
(set nvim.o.clipboard :unnamedplus)
(set nvim.o.completeopt "menuone,noinsert,noselect")
(set nvim.o.hidden true)
(set nvim.o.autoindent true)
(set nvim.o.smartindent true)
(set nvim.o.emoji false)
(set nvim.o.list true)
(when nvim.g.gnvim
  (set nvim.o.completeopt "menuone,noinsert,noselect,preview"))

(set nvim.o.pumblend 15)
(set nvim.o.winblend 15)
(nvim.ex.colorscheme :dracula)

(nvim.ex.highlight :dashboardHeader "guifg=#50fa7b")
(nvim.ex.highlight :link :TSParameter :DraculaOrangeItalic)
(nvim.ex.highlight :link :Label :DraculaPurple)
(nvim.ex.highlight :MsgSeparator "guifg=#282a36")

(nvim.ex.autocmd :FileType :dashboard "set showtabline=0")
(nvim.ex.autocmd :WinLeave :<buffer> "set showtabline=2")
(nvim.ex.autocmd :BufEnter :* "lua require'completion'.on_attach()")
