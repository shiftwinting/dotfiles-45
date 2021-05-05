(module dotfiles.module.treesitter
  {require {nvim aniseed.nvim
            tsconfigs nvim-treesitter.configs}})

(tsconfigs.setup
  {:highlight {:enable true
               :use_languagetree true
               :disable ["clojure" "css"]}
   :rainbow {:enable true
             :extended_mode ["latex" "html"]
             :disable ["cpp"]}
   :indent {:enable true}
   :incremental_selection {:enable true
                           :keymaps {:init_selection "gnn"
                                     :node_incremental "grn"
                                     :scope_incremental "grc"
                                     :node_decremental "grm"}}
   :refactor {:highlight_definitions {:enable true}
              :highlight_current_scope {:enable false}
              :smart_rename {:enable true
                             :keymaps {:smart_rename "grr"}}
              :navigation {:enable true
                           :keymaps {:goto_definition "gnd"
                                     :list_definitions "gnD"}}}
   :textobjects {:select {:enable true
                          :keymaps {"iF" {:python "(function_definition) @function"
                                          :c "(function_definition) @function"
                                          :java "(method_declaration) @function"
                                          :lua "(local_function) @function"}
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
                                    "im" "@call.inner"}}}
   :ensure_installed [:java :query :lua :fennel :python :c :cpp :bash :json :regex :toml :css :jsonc :rust]
   :playground {:enable true
                :disable {}
                :updatetime 25
                :persist_queries false}
   :context {:enable false}
   :matchup {:enable true}})
