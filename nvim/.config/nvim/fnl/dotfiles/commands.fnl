(module dotfiles.commands
        {require {nvim aniseed.nvim}})

(nvim.ex.command :CD ":lcd %:p:h")
(nvim.ex.command :XplrProjectRoot ":XplrPicker `git rev-parse --show-toplevel`")
(nvim.ex.command :CCFiles "lua require 'dotfiles.plugins.telescope.custom'.cc()")
