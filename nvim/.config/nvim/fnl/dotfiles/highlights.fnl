(module dotfiles.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:Whitespace "guifg=#424760 guibg=#191622"
           :EndOfBuffer "guifg=#424760"
           :Statusline "guibg=#312C3E"
           :NormalFloat "guibg=#282A36"
           :IndentBlanklineChar "guifg=#424760 guibg=#191622 gui=nocombine"

           :TelescopeBorder "guifg=#534A76"
           :TelescopeMatching "guifg=#ff79c6"
           :TelescopePromptPrefix "guifg=#78d1e1"
           :TelescopeSelectionCaret "guifg=#ff79c6"
           :TelescopeSelection "guifg=#67e480"

           :Keyword "guifg=#ff79c6"
           :TSParameter "guifg=#FFb86C guibg=#191622 gui=Italic"

           :ElBranch "guifg=#67e480"
           :ElLsp "guifg=#e7de79 guibg=#312c3e"
           :ElFile "guifg=#ff79c6 guibg=#312C3E"
           :ElLine "guibg=#312c3e guifg=#78d1e1 "
           :ElChanges "guibg=#312c3e guifg=#67e480"
           :ElSleuth "guibg=#312c3e guifg=#FFb86C"
           :ElFt "guifg=#988bc7 guibg=#312c3e"

           :VGitSignAdd "guifg=#67e480 guibg=#191622"
           :VGitSignRemove "guifg=#ed4556 guibg=#191622"
           :VGitSignChange "guifg=#e7de79 guibg=#191622"

           :BufferlineNonCurrent "guifg=#8796b0"
           :NvimDapVirtualText "guifg=#8871E2"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))
