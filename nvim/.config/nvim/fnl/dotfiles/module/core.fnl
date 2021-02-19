(module dotfiles.module.core
  {require {nvim aniseed.nvim
            core aniseed.core
            str aniseed.string}})

(defn autocmd [event name todo]
  (nvim.ex.autocmd event name todo))

(defn setopt [[opt value]]
  "Sets a vim option"
  (core.assoc nvim.o opt value))

(nvim.ex.colorscheme :nvcode)

(autocmd :FileType :dashboard "set showtabline=1")
(autocmd :WinLeave :<buffer> "set showtabline=2")
(autocmd :BufEnter :* "lua require'completion'.on_attach()")

(nvim.ex.highlight :TelescopeMatching "guifg=orange")

(let [options
      [[:termguicolors true]
       [:mouse :a]
       [:number true]
       [:relativenumber true]
       [:guicursor (str.join "," (core.concat (str.split nvim.o.guicursor ",") ["a:blinkon700"]))]
       [:listchars "tab:<->"]
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
       [:title true]
       [:cursorline true]
       [:incsearch true]
       [:hlsearch true]
       [:autowrite true]
       [:fixeol true]]]
  (core.map setopt options))

(if
  nvim.g.gnvim          (setopt [:guifont "JetBrains Mono,Delugia Nerd Font,Inter:h12"])
  nvim.g.gonvim_running (setopt [:guifont "Delugia Nerd Font:h11:b"])
  nvim.g.neovide        (setopt [:guifont "JetBrains Mono,Delugia Nerd Font,Inter,Noto Color Emoji:h15"])
  nvim.g.uivonim        (setopt [:guifont "Delugia Nerd Font,Inter,Noto Color Emoji:h15"]))

(when nvim.g.gnvim
  (setopt [:completeopt "menuone,noinsert,noselect,preview"]))
(nvim.ex.highlight :TSType "guifg=#c586c0 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE")
(nvim.ex.highlight :TSVariable "guifg=#9cdcfe ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE")
