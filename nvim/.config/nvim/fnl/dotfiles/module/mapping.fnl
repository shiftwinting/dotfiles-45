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

;reload init.lua
(map :n :<C-r>i ":luafile ~/.config/nvim/init.lua<CR>")

; hop.nvim
(smap "" "\\w" "<cmd>HopWord<CR>")
(smap "" "\\p" "<cmd>HopPattern<CR>")
(smap "" "\\l" "<cmd>HopLine<CR>")
(smap "" "\\c" "<cmd>HopChar1<CR>")
(smap "" "\\C" "<cmd>HopChar2<CR>")

;Telescope
(smap :n :<leader>f ":Telescope find_files<CR>")
(smap :n :<leader>h ":Telescope frecency<CR>")
(smap :n :<leader>b ":Telescope marks<CR>")
(smap :n :<leader>g ":Telescope live_grep<CR>")
(smap :n :<leader>gf ":Telescope git_files<CR>")
(smap :n :<leader>ts ":Telescope treesitter<CR>")
(smap :n :<leader>td ":lua require 'custom_telescope'.dotfiles()<CR>")
(smap :n :<leader>tz "<cmd>lua require'telescope'.extensions.z.list{cwd = {vim.o.shell, '-c', 'zi'}}<CR>")
(smap :n :<leader>tpp ":lua require('telescope').extensions.packer.plugins(opts)<CR>")
(smap :n :<leader>ch ":Telescope command_history<CR>")
(smap :n :<leader>th ":Telescope help_tags<CR>")
(smap :n :<leader> ":Telescope keymaps<CR>")
(smap :n :<C-p> ":Telescope project<CR>")

; smooth scroll
(when (and (not nvim.g.neovide) (not (= 1 nvim.g.gonvim_running)))
  (smap :n :<Up> ":call comfortable_motion#flick(-40)<CR>")
  (smap :n :<ScrollWheelUp> ":call comfortable_motion#flick(-40)<CR>")
  (smap :n :<Down> ":call comfortable_motion#flick(40)<CR>")
  (smap :n :<ScrollWheelDown> ":call comfortable_motion#flick(40)<CR>"))



;NvimTree
(smap :n :<leader>v ":NvimTreeToggle<CR>")
(smap :n :<leader>n ":NvimTreeFindFile<CR>")
(smap :n :<leader>r ":NvimTreeRefresh<CR>")

;nvim-treesitter
(smap :n :<C-h> ":w | e | TSBufEnable highlight<CR>")

;nvim-colorizer
(smap :n :<leader>c ":ColorizerToggle<CR>")

;LSP
(noremap :n :<M-CR> ":Lspsaga code_action<CR>")
(noremap :v :<M-CR> ":Lspsaga range_code_action<CR>")
(smap :n :K ":Lspsaga hover_doc<CR>")
(smap :n :pd ":Lspsaga preview_definition<CR>")
(smap :n :dn ":Lspsaga diagnostic_jump_next<CR>")
(smap :n :dp ":Lspsaga diagnostic_jump_prev<CR>")

;jdtls
(noremap :n :<M-r> ":lua require('jdtls').code_action(false, 'refactor')<CR>")
(noremap :n :<M-o> ":lua require('jdtls').organize_imports()<CR>")
(noremap :n :crv ":lua require('jdtls').extract_variable()<CR>")
(noremap :v :crv "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
(noremap :v :crm "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")

;Bufferline
(smap :n :tt ":BufferLinePick<CR>")

;Compe
(nvim.set_keymap :i :<CR> "compe#confirm('<CR>')" {:noremap true
                                                   :silent true
                                                   :expr true})
