(module dotfiles.commands
        {require {nvim aniseed.nvim}
         require-macros [macros]})

(defcmd :CD ":lcd %:p:h")
(defcmd :XplrProjectRoot ":XplrPicker `git rev-parse --show-toplevel`")
(defcmd :CCFiles "lua require 'dotfiles.plugins.telescope.custom'.cc()")
