(module dotfiles.mappings
        {require {nvim aniseed.nvim}})

;leaders
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;pasting into cmd area
(nvim.set_keymap :c :<C-v> :<C-r>+ {:noremap true})

(defn- map [mode from to opts]
  (let [params {:silent true
                :noremap true
                :expr false}]
   (if (not= opts nil)
     (do (if opts.nosilent
           (tset params "silent" false))
         (if opts.remap
           (tset params "noremap" false))
         (if opts.expr
           (tset params "expr" true))
         (if opts.noformat
           (nvim.set_keymap mode from to params)
           (nvim.set_keymap mode from (.. "<cmd>" to "<CR>") params)))
     (nvim.set_keymap mode from (.. "<cmd>" to "<CR>") params))))


;Compe
(map :i :<CR> "compe#confirm('<CR>')" {:expr true :noformat true})

;hop.nvim
(map "" "\\w" :HopWord)
(map "" "\\p" :HopPattern)
(map "" "\\l" :HopLine)
(map "" "\\c" :HopChar1)
(map "" "\\C" :HopChar2)

;Telescope
(map :n :<leader>f "lua require('telescope.builtin').find_files()")
(map :n :<leader>h "Telescope frecency")
(map :n :<leader>lg "lua require('telescope.builtin').live_grep()")
(map :n :<leader>gf "Telescope git_files")
(map :n :<leader>ts "Telescope treesitter")
(map :n :<leader>d "lua require 'dotfiles.plugins.telescope.custom'.dotfiles()")
(map :n :<leader>z "lua require'telescope'.extensions.z.list{ cmd = { vim.o.shell, '-c', 'zoxide query -sl' } }")

(map :n :<leader>th "Telescope help_tags")
(map :n :<leader> "Telescope keymaps")
(map :n :<C-M-p> "lua require'telescope'.extensions.project.project(require('telescope.themes').get_dropdown({}))")
(map :n :<leader>cb "lua require 'dotfiles.plugins.telescope.custom'.curbuf()")
(map :n :<M-x> "lua require 'telescope.builtin'.commands(require('telescope.themes').get_ivy({}))")
(map :n :<leader>n "lua require 'dotfiles.plugins.telescope.custom'.notes()")
(map :n :tt "Telescope buffers")

;Scroll
(let [n 2]
 (do
  (map :n :<Up> (.. n "<C-Y>") {:noformat true})
  (map :n :<ScrollWheelUp> (.. n "<C-Y>") {:noformat true})
  (map :n :<Down> (.. n "<C-E>") {:noformat true})
  (map :n :<ScrollWheelDown> (.. n "<C-E>") {:noformat true})))


;LSP
(map :n :<M-CR> "lua require 'dotfiles.plugins.telescope.custom'.lsp_code_actions()" {:nosilent true})
(map :v :<M-CR> "lua require 'telescope.builtin.lsp'.range_code_actions(require('telescope.themes').get_cursor({}))" {:nosilent true})
(map :n :K "lua vim.lsp.buf.hover()")
(map :n "]d" "lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = 'single' } })")
(map :n "[d" "lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = 'single' } })")
(map :n :gr "lua require 'telescope.builtin'.lsp_references({layout_strategy = 'vertical', layout_config = { preview_height = 0.7 }})")
(map :n :gd "lua require 'telescope.builtin'.lsp_definitions({layout_strategy = 'vertical', layout_config = { preview_height = 0.7 }})")
(map :n :gD "lua vim.lsp.buf.declaration()")
(map :n :gt "lua vim.lsp.buf.type_definition()")
(map :n :gi "lua require 'telescope.builtin'.lsp_implementations({layout_strategy = 'vertical', layout_config = { preview_height = 0.7 }})")
(map :n :<C-k> "lua vim.lsp.buf.signature_help()")
(map :n "'d" "lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'single' })")
(map :n :<leader>e "Telescope lsp_workspace_diagnostics")
(map :n :<M-r> "lua vim.lsp.buf.rename()")
(map :n :gk "lua require 'dotfiles.lsp'.peek_definition()")
(map :n :<C-q> "Trouble")

;nvim-dap
(map :n :<F5> "lua require'dap'.continue()")
(map :n :<F10> "lua require'dap'.step_over()")
(map :n :<F11> "lua require'dap'.step_into()")
(map :n :<F12> "lua require'dap'.step_out()")
(map :n "?b" "lua require'dap'.toggle_breakpoint()")
(map :n "?B" "lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))")
(map :n "?l" "lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))")

(map :n "?r" "lua require'dap'.repl.toggle()")
(map :n "?el" "lua require'dap'.run_last()")
(map :n "?ts" "lua require 'telescope'.extensions.dap.scopes()")
(map :n "?ss" "lua require('dotfiles.plugins.dap.functions').scopes_sidebar()")
(map :n "?tv" "lua require 'telescope'.extensions.dap.variables { layout_strategy = 'vertical' }")

;Switching buffers
(map :n :<C-n> ":bnext")
(map :n :<C-p> ":bprevious")

;Toggleterm
(map :n "<C-\\>" "ToggleTerm")
(map :i "<C-\\>" "ToggleTerm")
