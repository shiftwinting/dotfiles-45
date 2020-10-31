(module dotfiles.module.treesitter_setup
  {require {nvim aniseed.nvim}})

(let [tsconfigsetup (require (. "nvim-treesitter.configs" setup))]
  (tset tsconfigsetup highlight {:enable true
                                 :disable ["css"]
                                 :custom_captures {"lispbrackets" "lispbrackets"}})
  (tset tsconfigsetup indent {:enable false})
  (tset tsconfigsetup incremental_selection {:enable true
                                             :disable {}
                                             :keymaps {:init_selection "gnn"
                                                       :node_incremental "grn"
                                                       :scope_incremental "grc"
                                                       :node_decremental "grm"}})
  (tset tsconfigsetup refactor {:highlight_definitions {:enable true}
                                :highlight_current_scope {:enable false}
                                :sign_current_scope {:enable false}
                                :smart_rename {:enable true
                                               :keymaps {:smart_rename "grr"}}
                                :navigation {:enable true
                                             :keymaps {:goto_definition "gnd"
                                                       :list_definitions "gnD"}}})
  (tset tsconfigsetup textobjects {:enable true
                                   :disable {}
                                   :keymaps {"iL" {:python "(function_definition) @function"
                                                   :cpp "(function_definition) @function"
                                                   :c "(function_definition) @function"
                                                   :java "(method_declaration) @function"}
                                             "af" "@function.outer"
                                             "if" "@function.inner"
                                             "aC" "@class.outer"
                                             "iC" "@class.inner"
                                             "ac" "@conditional.outer"
                                             "ae" "@block.outer"
                                             "ie" "@block.inner"
                                             "al" "@loop.outer"
                                             "il" "@loop.inner"
                                             "is" "@statement.inner"
                                             "as" "@statement.outer"
                                             "ad" "@comment.outer"
                                             "am" "@call.outer"
                                             "im" "@call.inner"}})
  (tset tsconfigsetup ensure_installed {:java :query :lua :fennel :python :c :cpp :bash :json :regex :toml :css})
  (tset tsconfigsetup playground {:enable true
                                  :disable {}
                                  :updatetime 25
                                  :persist_queries false}))
