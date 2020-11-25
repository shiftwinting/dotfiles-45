(module dotfiles.module.completion
  {require {nvim aniseed.nvim}})

(set nvim.g.completion_chain_complete_list
     {:default
      [{:complete_items [:tabnine
                         :lsp
                         :snippet]}
       {:mode "<c-p>"}
       {:mode "<c-n>"}]})

(set nvim.g.completion_tabnine_sort_by_defaults 1)
(set nvim.g.completion_enable_snippet :vim-vsnip)
