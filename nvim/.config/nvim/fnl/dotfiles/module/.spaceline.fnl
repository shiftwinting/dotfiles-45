(module dotfiles.module.spaceline
        {require {nvim aniseed.nvim}})

(set nvim.g.spaceline_diagnostic_tool :nvim_lsp)
(if
  (= 1 nvim.g.gnvim) (set nvim.g.spaceline_diagnostic_errorsign :×)
  (set nvim.g.spaceline_diagnostic_errorsign :🚫))
(if
  (= 1 nvim.g.gnvim) (set nvim.g.spaceline_diagnostic_warnsign :!)
  (= 1 nvim.g.gonvim_running) (set nvim.g.spaceline_diagnostic_warnsign :⚠️)
  (set nvim.g.spaceline_diagnostic_warnsign :❗))
(set nvim.g.spaceline_git_branch_icon :)
(set nvim.g.spaceline_function_icon :)
(set nvim.g.spaceline_diff_tool "git-gutter")
(set nvim.g.spaceline_seperate_style :curve)
