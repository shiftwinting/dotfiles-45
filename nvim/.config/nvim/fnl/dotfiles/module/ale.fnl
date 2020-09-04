(module dotfiles.module.ale
        {require {nvim aniseed.nvim}})

(set nvim.g.ale_linters
     {:python [:flake8]
      :sh []
      :java []
      :vim []
      :lua []
      :clojure [:joker]
      :fennel [:joker]})

(set nvim.g.ale_fixers
     {:* [:remove_trailing_lines :trim_whitespace]
      :java [:google_java_format]
      :sh [:shfmt]})

(set nvim.g.ale_sign_error :×)
(set nvim.g.ale_lint_on_text_changed :always)
(set nvim.g.ale_disable_lsp 1)
