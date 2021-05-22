(module dotfiles.lsp
  {require {lspconfig lspconfig
            lsp-status lsp-status
            icons nvim-nonicons
            lspsaga lspsaga
            lua-dev lua-dev}})

(let [on-init (fn [client]
                (set client.config.flags [])
                (if (. "flags" client.config)
                    (tset client.config.flags "allow_incremental_sync" true)))
      capabilities (vim.lsp.protocol.make_client_capabilities)
      on_attach lsp-status.on_attach
      diag_handler {"textDocument/publishDiagnostics"
                     (vim.lsp.with
                               vim.lsp.diagnostic.on_publish_diagnostics
                               {:virtual_text {:prefix "●"}
                                :severity_sort true
                                :update_in_insert false
                                :underline true})}
      luadev (lua-dev.setup {:lspconfig {:cmd [(vim.fn.expand
                                                 "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server")
                                               "-E"
                                               (vim.fn.expand
                                                 "/home/p00f/bin/lua-language-server/main.lua")]
                                         :settings {:Lua {:diagnostics
                                                            {:globals ["vim" "wezterm"]}
                                                          :completion {:keywordSnippet true}
                                                          :workspace {:preloadFileSize 170}
                                                          :telemetry {:enable true}}}
                                         :capabilities capabilities
                                         :on_attach on_attach
                                         :handlers diag_handler
                                         :on_init on-init}})]

  (do
      (tset capabilities.textDocument.completion.completionItem "snippetSupport" true)
      (tset capabilities.textDocument.completion.completionItem "resolveSupport"
            {:properties ["documentation"
                          "detail"
                          "additionalTextEdits"]})
      (lsp-status.register_progress)
      (lsp-status.config
           {:indicator_errors (icons.get "stop")
            :indicator_warnings (icons.get "alert")
            :indicator_info "i"
            :indicator_hint "!"
            :indicator_ok "👍"
            :status_symbol ""
            :component_separator "|"})

      (lspconfig.clangd.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :on_init on-init
                 :handlers (vim.tbl_deep_extend "error" diag_handler (lsp-status.extensions.clangd.setup))
                 :init_options {:clangdFileStatus true}
                 :cmd ["clangd" "--background-index" "--suggest-missing-includes" "--header-insertion=iwyu"]})

      (lspconfig.sumneko_lua.setup luadev)
      (lspconfig.rust_analyzer.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :handlers diag_handler
                 :on_init on-init})
      (lspconfig.bashls.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :handlers diag_handler
                 :on_init on-init})
      (lspsaga.init_lsp_saga {:use_saga_diagnostic_sign false
                              :code_action_icon (icons.get "light-bulb")
                              :dianostic_header_icon (.. (icons.get "bug") " ")}))
 true)
