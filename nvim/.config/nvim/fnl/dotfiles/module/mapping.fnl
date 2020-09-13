(module dotfiles.module.mapping
        {require {nvim aniseed.nvim
                  nu aniseed.nvim.util
                  core aniseed.core}})

(defn- map [mode from to]
  "Sets a mapping"
  (nvim.set_keymap mode from to {}))

(defn- smap [mode from to]
  "Sets a mapping with {:silent true}"
  (nvim.set_keymap mode from to {:silent true}))


(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(map :c :<C-v> "<C-r>+")
(map :n :<F8> "<Plug>(ale_fix)")
(smap :n :K ":call <SID>show_documentation()<CR>")

;reload init.vim
(map :n :<leader>rv ":source ~/.config/nvim/init.vim<CR>")

;vim-clap
(smap :n :<leader>f ":Clap files<CR>")
(smap :n :<leader>h ":Clap history<CR>")
(smap :n :<leader>e ":Clap filer<CR>")
(smap :n :<leader>b ":Clap marks<CR>")

;vim-smoothie
(map :n :<ScrollWheelUp> "<C-Y>")
(map :n :<ScrollWheelDown> "<C-E>")
(smap :n :<ScrollWheelUp> ":call smoothie#upwards()<CR>")
(smap :n :<ScrollWheelDown> ":call smoothie#downwards()<CR>")

;LuaTree
(smap :n :<leader>v ":LuaTreeToggle<CR>")
(map :n :<leader>r ":LuaTreeRefresh<CR>")
(smap :n :<leader>n ":LuaTreeFindFile<CR>") ;LuaTreeOpen and LuaTreeClose are also available if you need them

;which-key
(smap :n :<leader> ":<c-u>WhichKey '<Space>'<CR>")
(smap :n :<localleader> ":<c-u>WhichKey ','<CR>")
;(smap :n :<C> ":<c-u> WhichKey '<C>'<CR>")

;nvim-treesitter
(smap :n :<C-h> ":w | e | TSBufEnable highlight<CR>")

;nvim-colorizer
(smap :n :<leader>c ":ColorizerToggle<CR>")

;format
(smap :n :<C-f> "1G0gqG")
