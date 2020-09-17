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

(defn- noremap [mode from to]
 "Sets a mapping with {:noremap true}"
 (nvim.set_keymap mode from to {:noremap true}))

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
(smap :n :<leader>n ":LuaTreeFindFile<CR>")
(smap :n :<leader>r ":LuaTreeRefresh<CR>")

;which-key
(smap :n :<leader> ":<c-u>WhichKey '<Space>'<CR>")
(smap :n :<localleader> ":<c-u>WhichKey ','<CR>")

;nvim-treesitter
(smap :n :<C-h> ":w | e | TSBufEnable highlight<CR>")

;nvim-colorizer
(smap :n :<leader>c ":ColorizerToggle<CR>")

;LSP
(noremap :n :<M-CR> ":lua require('jdtls').code_action()<CR>")
(noremap :v :<M-CR> ":lua require('jdtls').code_action(true)<CR>")
(noremap :n :<M-o> ":lua require'jdtls'.organize_imports()<CR>")
(noremap :n :crv ":lua require('jdtls').extract_variable()<CR>")
(noremap :v :crv "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
(noremap :v :crm "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")

;DAP
(noremap :n :<leader>dc ":lua require'jdtls'.test_class()<CR>")
(noremap :n :<leader>dm ":lua require'jdtls'.test_nearest_method()<CR>")
