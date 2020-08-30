(module dotfiles.module.airline
        {require {nvim aniseed.nvim}})

(set nvim.g.airline_theme :dracula)
(set nvim.g.airline_powerline_fonts 1)
(set nvim.g.airline#extensions#tabline#enabled 0)
(set nvim.g.airline#extensions#ale#enabled 1)
(set nvim.g.airline#extensions#coc#enabled 1)
(set nvim.g.airline#extensions#statusline#enabled 1)
(set nvim.g.airline#extensions#wordcount#filetypes
     [:asciidoc :help :mail :markdown :markdown.pandoc :org :rst :tex :text])
