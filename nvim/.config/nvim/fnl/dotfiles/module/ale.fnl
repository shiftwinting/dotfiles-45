(module dotfiles.module.ale
        {require {nvim aniseed.nvim}})

;(nvim.call_function :ale#fix#registry#Add
;                    [:"joker"
;                     :"joker --format -"
;                     :[:fennel :clojure]
;                     :"Format lisps"]}})
(set nvim.g.ale_linters
     {:python [:flake8]
      :sh []
      :java []
      :vim []
      :lua []})
(set nvim.g.ale_fixers
     {:* [:remove_trailing_lines :trim_whitespace]
      :java [:google_java_format]})

(set nvim.g.ale_sign_error :×)
(set nvim.g.ale_lint_on_text_changed :always)
(set nvim.g.ale_disable_lsp 1)
