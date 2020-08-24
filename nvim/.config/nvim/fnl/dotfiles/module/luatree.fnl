(module dotfiles.module.luatree
        {require {nvim aniseed.nvim}})

(set nvim.g.lua_tree_auto_open 0) ;0 by default, opens the tree when typing `vim $DIR` or `vim`
(set nvim.g.lua_tree_auto_close 1) ;0 by default, closes the tree when it's the last window
(set nvim.g.lua_tree_follow 1) ;0 by default, this option allows the cursor to be updated when entering a buffer
(set nvim.g.lua_tree_show_icons
     {:git 1
      :folders 1
      :files 1})
;If 0, do not show the icons for one of 'git' 'folder' and 'files'. 1 by default, note that if 'files' is 1, it will only display if nvim-web-devicons is installed and on your runtimepath

(set nvim.g.lua_tree_bindings ;You can edit keybindings be defining this variable, you don't have to define all keys.
     {:edit "<CR>"
      :edit_vsplit "<C-v>"
      :edit_split "<C-x>"
      :edit_tab "<C-t>"
      :preview "<Tab>"
      :cd "<C-]>"})

(set nvim.g.lua_tree_icons
     {:default ""
      :git {:unstaged "✗"
            :staged "✓"
            :unmerged "═"
            :renamed "❯"
            :untracked "★"}
      :folder {:default ""
               :open ""}})
