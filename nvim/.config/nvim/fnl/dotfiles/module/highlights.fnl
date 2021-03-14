(module dotfiles.module.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:Whitespace "guifg=#424760 guibg=#191622"
           :EndOfBuffer "guifg=#424760"
           :Statusline "guibg=#312C3E"
           :TelescopeBorder "guifg=#534A76"
           :TelescopeMatching "guifg=#ff79c6"
           :TelescopePromptPrefix "guifg=#5a4b81"
           :TelescopeSelectionCaret "guifg=#ff79c6"
           :TelescopeSelection "guifg=#67e480"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))
