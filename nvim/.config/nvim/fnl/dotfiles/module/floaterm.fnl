(module dotfiles.module.floaterm
        {require {nvim aniseed.nvim}})

(if (not nvim.g.neovide) (set nvim.g.floaterm_winblend 30))
