(module dotfiles.module.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:Whitespace "guifg=#424760 guibg=#191622"
           :EndOfBuffer "guifg=#424760"
           :Statusline "guibg=#312C3E"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))
