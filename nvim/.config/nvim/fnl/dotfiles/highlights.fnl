(module dotfiles.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:Whitespace "guifg=#424760"

           :TelescopeBorder "guifg=#80a0ff"
           :TelescopeMatching "guifg=#ff5189"
           :TelescopePromptPrefix "guifg=#74b2ff"
           :TelescopeSelectionCaret "guifg=#ff5189"
           :TelescopeSelection "guifg=#79dac8"

           :ElBranch "guifg=#a1cd5e"
           :ElLsp "guifg=#e3d18a guibg=#2c3043"
           :ElFile "guifg=#ff5189 guibg=#312C3E"
           :ElLine "guibg=#2c3043 guifg=#82aaff"
           :ElChanges "guibg=#2c3043 guifg=#a1cd5e"
           :ElSleuth "guibg=#2c3043 guifg=#ecc48d"
           :ElFt "guifg=#ae81ff guibg=#2c3043"

           :BufferlineCurrent "guibg=#011627 guifg=#ecc48d"
           :BUfferlineNormal "guibg=#2c3043 guifg=#82aaff"
           :NvimDapVirtualText "guifg=#7fdbca"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))
