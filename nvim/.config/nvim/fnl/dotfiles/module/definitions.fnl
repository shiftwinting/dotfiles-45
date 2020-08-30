(module dotfiles.module.definitions
        {require {nvim aniseed.nvim}})

(set nvim.g.languagetool_server_command :languagetool)
(set nvim.g.neoterm_default_mod :botright)
(set nvim.g.sneak#label 1)
(set nvim.g.indentLine_fileTypeExclude [:dashboard :startify :clj :fennel])
(set nvim.g.indentLine_char :│)
; Initialise WhichKey map, this will be populated automatically
(set nvim.g.which_key_map {})
(set nvim.g.float_preview#docked 0)
(set nvim.g.vista_default_executive :nvim_lsp)
;(set nvim.g.hardtime_default_on :1)
(set nvim.g.neosnippet#enable_completed_snippet 1)
(set nvim.g.neosnippet#enable_complete_done 1)
