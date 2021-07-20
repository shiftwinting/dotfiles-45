(module dotfiles.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:ElBranch "guifg=#A4BF8D"
           :ElLsp "guifg=#EBCA89 guibg=#0E1016"
           :ElFile "guifg=#E46767 guibg=#0E1016"
           :ElLine "guibg=#0E1016 guifg=#85A0C7"
           :ElChanges "guibg=#0E1016 guifg=#A4BF8D"
           :ElSleuth "guibg=#0E1016 guifg=#D18771"
           :ElFt "guifg=#A092C8 guibg=#0E1016"

           :BufferlineCurrent "guibg=#161822 guifg=#D18771"
           :BufferlineNormal "guibg=#0E1016 guifg=#85A0C7"

           :LspCodeLens "guifg=#D18771 gui=Italic"
           :LspCodeLensSeparator "guifg=#D18771"

           :NormalFloat "guibg=#161822"
           :FloatBorder "guifg=#414758 guibg=#161822"

           :NvimDapVirtualText "guifg=#828597 gui=Italic"
           :IndentBlankLineChar "cterm=nocombine gui=nocombine guifg=#36384A"
           :TSBoolean "guifg=#E46767"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))

(let [link {:SignAdd :GitSignsAdd
            :SignChange :GitSignsChange
            :SignDelete :GitSignsDelete
            :NvimDapVirtualText :RustInlayHints
            :FloatBorder :TSPunctBracket}]
  (each [source destination (pairs link)]
    (nvim.ex.highlight! :link destination source)))
