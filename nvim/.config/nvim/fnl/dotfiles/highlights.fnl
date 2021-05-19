(module dotfiles.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:Whitespace "guifg=#424760 guibg=#191622"
           :EndOfBuffer "guifg=#424760"
           :Statusline "guibg=#312C3E"
           :TelescopeBorder "guifg=#534A76"
           :TelescopeMatching "guifg=#ff79c6"
           :TelescopePromptPrefix "guifg=#78d1e1"
           :TelescopeSelectionCaret "guifg=#ff79c6"
           :TelescopeSelection "guifg=#67e480"
           :Keyword "guifg=#ff79c6"
           :IndentBlanklineChar "guifg=#424760 guibg=#191622 gui=nocombine"
           :TSParameter "guifg=#FFb86C guibg=#191622 gui=Italic"
           :Gitbranch "guifg=#67e480 guibg=None"
           :Statusdiag "guifg=#FFB86C guibg=#312C3E"
           :Curfile "guifg=#ff79c6 guibg=#312C3E"
           :VGitSignAdd "guifg=#67e480 guibg=#191622"
           :VGitSignRemove "guifg=#ed4556 guibg=#191622"
           :VGitSignChange "guifg=#e7de79 guibg=#191622"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))

(let [rainbow_colours ["#e1e1e6"
                       "#8796b0"
                       "#ff79c6"
                       "#FFB86C"
                       "#67e480"
                       "#988bc7"
                       "#78d1e1"]]
     (each [number colour (pairs rainbow_colours)]
      (nvim.ex.highlight (.. "rainbowcol" number) (.. "guifg=" colour))))
