(module dotfiles.options
  {require {nvim aniseed.nvim
            core aniseed.core
            str aniseed.string}})


(defn setopt [opt value]
  "Sets a vim option"
  (core.assoc nvim.o opt value))

(nvim.ex.colorscheme :nightfly)

(let [options
       {:mouse :a
        :splitbelow true
        :number true
        :relativenumber true
        :guicursor (str.join "," (core.concat (str.split nvim.o.guicursor ",") ["a:blinkon700"]))
        :listchars "tab:» ,trail:_"
        :showmode false
        :tabstop 4
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
        :emoji false
        :list true
        :pumblend 0
        :title true
        :incsearch true
        :hlsearch true
        :autowrite true
        :fixeol true
        :smarttab true
        :smartindent true
        :inccommand "nosplit"}]
     (each [option value (pairs options)]
       (setopt option value)))

(if
  nvim.g.gnvim          (setopt :guifont "JetBrains Mono,nonicon,FantasqueSansMono Nerd Font,Inter:h12")
  nvim.g.gonvim_running (do
                         (setopt :linespace 2)
                         (setopt :guifont "Fira Code:h11"))
  nvim.g.neovide        (setopt :guifont "Source Code Pro,nonicon,FantasqueSansMono Nerd Font,Inter Regular:h15")
  nvim.g.uivonim        (setopt :guifont "JetBrains Mono,nonicon,FantasqueSansMono Nerd Font,Inter,Noto Color Emoji:h30"))

(when nvim.g.gnvim
  (setopt :completeopt "menuone,noinsert,noselect,preview"))
