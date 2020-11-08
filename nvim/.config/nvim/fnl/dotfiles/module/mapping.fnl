(module dotfiles.module.mapping
  {require {nvim aniseed.nvim}})

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

;reload init.vim
(map :n :<leader>rv ":source ~/.config/nvim/init.vim<CR>")

;Telescope
(smap :n :<leader>f ":Telescope find_files<CR>")
(smap :n :<leader>h ":Telescope oldfiles<CR>")
(smap :n :<leader>b ":Telescope marks<CR>")
(smap :n :<leader>g ":Telescope live_grep<CR>")
(smap :n :<leader>ts ":Telescope treesitter<CR>")
(smap :n :<leader>td ":lua require 'custom_telescope'.dotfiles()<CR>")
(smap :n :<leader>ch ":Telescope command_history<CR>")
(smap :n :<leader>ht ":Telescope help_tags<CR>")

;smoothie
(smap :n :<Up> ":call comfortable_motion#flick(-40)<CR>")
(smap :n :<ScrollWheelUp> ":call comfortable_motion#flick(-40)<CR>")
(smap :n :<Down> ":call comfortable_motion#flick(40)<CR>")
(smap :n :<ScrollWheelDown> ":call comfortable_motion#flick(40)<CR>")

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
(noremap :n :<M-CR> ":lua vim.lsp.buf.code_action()<CR>")
(smap :n :K ":lua vim.lsp.buf.hover()<CR>")

;jdtls
(noremap :v :<M-CR> "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>")
(noremap :n :<M-r> ":lua require('jdtls').code_action(false, 'refactor')<CR>")
(noremap :n :<M-o> ":lua require('jdtls').organize_imports()<CR>")
(noremap :n :crv ":lua require('jdtls').extract_variable()<CR>")
(noremap :v :crv "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
(noremap :v :crm "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")

;DAP
(noremap :n :<leader>dc ":lua require'jdtls'.test_class()<CR>")
(noremap :n :<leader>dm ":lua require'jdtls'.test_nearest_method()<CR>")

;Bufferline
(smap :n :tt ":BufferLinePick<CR>")
