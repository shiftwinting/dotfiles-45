(module dotfiles.plugins.treesitter
  {require {nvim aniseed.nvim
            tsconfigs nvim-treesitter.configs}})

(tsconfigs.setup
  {:highlight {:enable true
               :use_languagetree true
               :disable ["latex" "clojure" "css"]}
   :rainbow {:enable true
             :extended_mode true
             :disable ["c" "cpp" "lua" "rust"]
             :colors ["#ff79c6"
                      "#FFB86C"
                      "#67e480"
                      "#988bc7"
                      "#78d1e1"]}
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
                                    :im "@call.inner"}}}
   :ensure_installed [:yaml :query :lua :fennel :python :c :cpp :bash :json :regex :toml :css :jsonc :rust]
   :playground {:enable true
                :disable {}
                :updatetime 25
                :persist_queries false}
   :context {:enable false}
   :matchup {:enable true}})
