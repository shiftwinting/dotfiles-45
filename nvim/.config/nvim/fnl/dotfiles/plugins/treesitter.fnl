(module dotfiles.plugins.treesitter
  {require {nvim aniseed.nvim
            tsconfigs nvim-treesitter.configs}})

(tsconfigs.setup
  {:highlight {:enable true
               :use_languagetree true
               :disable ["latex" "clojure" "css"]}
   :rainbow {:enable true
             :extended_mode true
             :disable ["c" "cpp" "lua"]
             :colors ["#7c8f8f"
                      "#ff79c6"
                      "#21c7a8"
                      "#82aaff"
                      "#ae81ff"]}
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
                                     :list_definitions "gnD"
                                     :list_defintions_toc "gO"
                                     :goto_next_usage "<M-2>"
                                     :goto_previous_usage "<M-1>"}}}
   :textobjects {:select {:enable true
                          :lookahead true
                          :keymaps {:af "@function.outer"
                                    :if "@function.inner"
                                    :aC "@class.outer"
                                    :iC "@class.inner"
                                    :ac "@conditional.outer"
                                    :ic "@conditional.inner"
                                    :ae "@block.outer"
                                    :ie "@block.inner"
                                    :al "@loop.outer"
                                    :il "@loop.inner"
                                    :is "@statement.inner"
                                    :as "@statement.outer"
                                    :ad "@comment.outer"
                                    :am "@call.outer"
                                    :im "@call.inner"}}
                 :swap {:enable true
                        :swap_next {"<M-l>" "@parameter.inner"
                                    "<M-j>" "@function.outer"}
                        :swap_previous {"<M-h>" "@parameter.inner"
                                        "<M-k>" "@function.outer"}}
                 :move {:enable true
                        :set_jumps true
                        :goto_next_start {"]m" "@function.outer"
                                          "]]" "@class.outer"}
                        :goto_next_end {"]M" "@function.outer"
                                        "][" "@class.outer"}
                        :goto_previous_start {"[m" "@function.outer"
                                              "[[" "@class.outer"}
                        :goto_previous_end {"[M" "@function.outer"
                                            "[]" "@class.outer"}}}
   :ensure_installed [:yaml :query :lua :fennel :python :c :cpp :bash :json :regex :toml :css :jsonc :rust]
   :playground {:enable true
                :disable {}
                :updatetime 25
                :persist_queries false}
   :context {:enable false}
   :matchup {:enable true}})
