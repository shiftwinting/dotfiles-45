(module dotfiles.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:ElBranch "guifg=#a1cd5e"
           :ElLsp "guifg=#e3d18a guibg=#2c3043"
           :ElFile "guifg=#ff5189 guibg=#2c3043"
           :ElLine "guibg=#2c3043 guifg=#82aaff"
           :ElChanges "guibg=#2c3043 guifg=#a1cd5e"
           :ElSleuth "guibg=#2c3043 guifg=#ecc48d"
           :ElFt "guifg=#ae81ff guibg=#2c3043"

           :BufferlineCurrent "guibg=#011627 guifg=#ecc48d"
           :BufferlineNormal "guibg=#2c3043 guifg=#82aaff"
           :NvimDapVirtualText "guifg=#7fdbca gui=Italic"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))

(let [link {:Whitespace "NightflySteelBlue"

            :TelescopeBorder "NightflyBlue"
            :TelescopePromptPrefix "NightflyBlue"
            :TelescopeMatching "NightflyWatermelon"
            :TelescopeSelectionCaret "NightflyWatermelon"
            :TelescopeSelection "NightflyTurquoise"}]
    (each [group hl (pairs link)]
      (nvim.ex.highlight :link group hl)))
