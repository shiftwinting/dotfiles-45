(module dotfiles.plugins.ale
  {require {nvim aniseed.nvim}})

(set nvim.g.ale_linters
     {:sh []
      :lua []
      :clojure [:joker]
      :fennel [:joker]
      :cpp []
      :rust []
      :c []
      :typescript []
      :javascript []})

(set nvim.g.ale_fixers
     {:* [:remove_trailing_lines :trim_whitespace]})

(set nvim.g.ale_sign_error :>>)
(set nvim.g.ale_lint_on_text_changed :always)
(set nvim.g.ale_disable_lsp 1)
