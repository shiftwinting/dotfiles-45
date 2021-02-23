(module dotfiles.module.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:TelescopeMatching "guifg=orange"
           :DiffAdd "guifg=#608b4e guibg=#1e1e1e"
           :DiffChange "guifg=#dcdcaa guibg=#1e1e1e"
           :DiffDelete "guifg=#d16969 guibg=#1e1e1e"
           :DiffText "guifg=#dcdcaa guibg=#1e1e1e"
           :TSType "guifg=#c586c0"
           :TSVariable "guifg=#9cdcfe"
           :Normal "guifg=#d4d4d4"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))
