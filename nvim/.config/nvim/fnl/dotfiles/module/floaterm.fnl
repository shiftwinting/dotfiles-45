(module dotfiles.module.floaterm
        {require {nvim aniseed.nvim}})

(if (not nvim.g.neovide) (set nvim.g.floaterm_winblend 10))
(set nvim.g.floaterm_autoclose 1)
(set nvim.g.floaterm_keymap_new "<Leader>tn")
(set nvim.g.floaterm_keymap_prev "<Leader>tp")
(set nvim.g.floaterm_keymap_next "<Leader>tm")
(set nvim.g.floaterm_keymap_toggle "<Leader>tt")
(set nvim.g.floaterm_keymap_kill "<Leader>tk")
