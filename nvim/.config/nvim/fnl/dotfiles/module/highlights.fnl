(module dotfiles.module.highlights
  {require {nvim aniseed.nvim}})

(let [tbl {:TelescopeMatching "guifg=orange"
           :TelescopeSelectionCaret "guifg=#2472c8"
           :TelescopeSelection "guifg=#9cdcfe gui=Italic"
           :TelescopeNormal "guifg=#818181"
           :DiffAdd "guifg=#608b4e guibg=#1e1e1e"
           :DiffChange "guifg=#dcdcaa guibg=#1e1e1e"
           :DiffDelete "guifg=#d16969 guibg=#1e1e1e"
           :DiffText "guifg=#dcdcaa guibg=#1e1e1e"
           :TSConstMacro "guifg=#9cdcfe gui=Bold"
           :Todo "guifg=#dcdcaa gui=Bold"
           :TSParameter "gui=Italic"
           :TSVariable "guifg=#d4d4d4"
           :Keyword "guifg=#569cd6"
           :Conditional "guifg=#c586c0"
           :Type "guifg=#c586c0 gui=Italic"
           :Boolean "guifg=#c586c0"
           :Repeat "guifg=#c586c0"
           :TSInclude "guifg=#9cdcfe gui=Bold"
           :Normal "guifg=#d4d4d4"
           :ElNormal "guifg=#c586c0"
           :ElInsert "guifg=#4ec9b0"
           :ElInsertCompletion "guifg=#4ec9b0"
           :ElVisual "guifg=#dcdcaa guibg=#2472c8"
           :ElVisualBlock "guifg=#dcdcaa guibg=#2472c8"
           :ElVisualLine "guifg=#dcdcaa guibg=#2472c8"
           :ElCommand "guifg=#1e1e1e guibg=#d4d4d4"
           :ElCommandCV "guifg=#1e1e1e guibg=#d4d4d4"
           :ElCommandEx "guifg=#1e1e1e guibg=#d4d4d4"
           :ElConfirm "guifg=#2472c8 guibg=#ce9178"}]
           ;:Statusline "guifg=#d4d4d4 guibg=#6C2D6E"}]
     (each [group colour (pairs tbl)]
      (nvim.ex.highlight group colour)))
