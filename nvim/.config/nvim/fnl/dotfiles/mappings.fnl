(module dotfiles.mappings
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

(map :c :<C-v> :<C-r>+)

;reload init.lua
(map :n :<C-r>i ":luafile ~/.config/nvim/init.lua<CR>")

; hop.nvim
(smap "" "\\w" :<cmd>HopWord<CR>)
(smap "" "\\p" :<cmd>HopPattern<CR>)
(smap "" "\\l" :<cmd>HopLine<CR>)
(smap "" "\\c" :<cmd>HopChar1<CR>)
(smap "" "\\C" :<cmd>HopChar2<CR>)

(smap :o :m ":<C-U>lua require('tsht').nodes()<CR>")
(smap :v :m ":lua require('tsht').nodes()<CR>")

;Telescope
(smap :n :<leader>f "<cmd>lua require('telescope.builtin').find_files()<CR>")
(smap :n :<leader>h "<cmd>Telescope frecency<CR>")
(smap :n :<leader>lg "<cmd>lua require('telescope').extensions.fzf_writer.grep()<CR>")
(smap :n :<leader>sg "<cmd>lua require('telescope').extensions.fzf_writer.staged_grep()<CR>")
(smap :n :<leader>gf "<cmd>Telescope git_files<CR>")
(smap :n :<leader>ts "<cmd>Telescope treesitter<CR>")
(smap :n :<leader>d "<cmd>lua require 'dotfiles.plugins.telescope.custom'.dotfiles()<CR>")
(smap :n :<leader>z
      "<cmd>lua require'telescope'.extensions.z.list{ cmd = { vim.o.shell, '-c', 'zoxide query -sl' } }<CR>")
(smap :n :<leader>th "<cmd>Telescope help_tags<CR>")
(smap :n :<leader> "<cmd>Telescope keymaps<CR>")
(smap :n :<C-M-p> "<cmd>Telescope project<CR>")
(smap :n :<leader>cb "<cmd>lua require 'dotfiles.plugins.telescope.custom'.curbuf()<CR>")
(smap :n :<M-x> "<cmd>lua require 'telescope.builtin'.commands(require('telescope.themes').get_ivy({}))<CR>")
(smap :n :<leader>n "<cmd>lua require 'dotfiles.plugins.telescope.custom'.notes()<CR>")

;Scroll
(let [n 2]
 (do
  (smap :n :<Up> (.. n "<C-Y>"))
  (smap :n :<ScrollWheelUp> (.. n "<C-Y>"))
  (smap :n :<Down> (.. n "<C-E>"))
  (smap :n :<ScrollWheelDown> (.. n "<C-E>"))))


;LSP
(noremap :n :<M-CR>
         "<cmd>lua require 'dotfiles.plugins.telescope.custom'.lsp_code_actions()<CR>")

(noremap :v :<M-CR> "<cmd>Telescope lsp_range_code_actions<CR>")
(smap :n :K "<cmd>lua vim.lsp.buf.hover()<CR>")
(smap :n :dn ":lua vim.lsp.diagnostic.goto_next()<CR>")
(smap :n :dp ":lua vim.lsp.diagnostic.goto_prev()<CR>")
(smap :n :gr "<cmd>lua vim.lsp.buf.rename()<CR>")
(smap :n :gd "<cmd>lua require 'telescope.builtin'.lsp_definitions()<CR>")
(smap :n :gs "<cmd>lua vim.lsp.buf.signature_help()<CR>")
(smap :n :sd "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
(smap :n :<leader>e "<cmd>Telescope lsp_workspace_diagnostics<CR>")
(smap :n :<leader>r "<cmd>Telescope lsp_references<CR>")

;JABS
(smap :n :tt "<cmd>JABSOpen<CR>")

;Compe
(nvim.set_keymap :i :<CR> "compe#confirm('<CR>')"
                 {:noremap true :silent true :expr true})

;nvim-dap
(noremap :n :<F5> "<cmd>lua require'dap'.continue()<CR>")
(noremap :n :<F10> "<cmd>lua require'dap'.step_over()<CR>")
(noremap :n :<F11> "<cmd>lua require'dap'.step_into()<CR>")
(noremap :n :<F12> "<cmd>lua require'dap'.step_out()<CR>")
(noremap :n "?b" "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
(noremap :n "?B" "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

(noremap :n "?l"
         "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")

(noremap :n "?r" "<cmd>lua require'dap'.repl.toggle()<CR>")
(noremap :n "?el" "<cmd>lua require'dap'.run_last()<CR>")
(noremap :n "?ss" "<cmd>lua require('dotfiles.plugins.dap.functions').scopes_sidebar()<CR>")
(noremap :n "?sf" "<cmd>lua require('dotfiles.plugins.dap.functions').scopes_float()<CR>")


;Neogit
(noremap :n :<C-g> "<cmd>lua require 'neogit'.open()<CR>")

;Switching buffers
(smap :n :<C-n> ":bnext<CR>")
(smap :n :<C-p> ":bprevious<CR>")

;Toggleterm
(smap :n "<C-\\>" "<cmd>ToggleTerm<CR>")
(smap :i "<C-\\>" "<cmd>ToggleTerm<CR>")
