(module dotfiles.lsp
  {require {lspconfig lspconfig
            lsp-status lsp-status
            icons nvim-nonicons}})

(let [on-init (fn [client]
                (set client.config.flags [])
                (if (. "flags" client.config)
                    (tset client.config.flags "allow_incremental_sync" true)))
      capabilities (vim.lsp.protocol.make_client_capabilities)]

  (do (tset capabilities.textDocument.completion.completionItem "snippetSupport" true)
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
            :indicator_ok (icons.get "check")
            :status_symbol ""
            :component_separator "|"})

      (lspconfig.clangd.setup
                {:capabilities capabilities
                 :on_attach lsp-status.on_attach
                 :on_init on-init
                 :handlers (lsp-status.extensions.clangd.setup)
                 :init_options {:clangdFileStatus true}})

      (lspconfig.sumneko_lua.setup
                {:cmd [(vim.fn.expand
                         "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server")
                       "-E"
                       (vim.fn.expand
                         "/home/p00f/bin/lua-language-server/main.lua")]
                 :settings {:Lua {:diagnostics
                                    {:globals ["vim" "wezterm"]
                                     :completion {:keywordSnippet true}}}}
                 :capabilities capabilities
                 :on_attach lsp-status.on_attach
                 :on_init on-init})

      (lspconfig.rust_analyzer.setup
                {:capabilities capabilities
                 :on_attach lsp-status.on_attach
                 :on_init on-init})
      (lspconfig.bashls.setup
                {:capabilities capabilities
                 :on_attach lsp-status.on_attach
                 :on_init on-init})))
