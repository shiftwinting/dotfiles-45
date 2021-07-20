(module dotfiles.lsp
  {require {lspconfig lspconfig
            lsp-status lsp-status
            signature lsp_signature
            icons nvim-nonicons
            lua-dev lua-dev
            rust-tools rust-tools}})
(defn- preview-location-callback [_ _ result]
  (if (or (= result nil)
          (vim.tbl_isempty result))
      nil
      (vim.lsp.util.preview_location (. result 1) {:border "single"})))

(defn peek-definition []
  (let [params (vim.lsp.util.make_position_params)]
    (do
      (if (not (pcall vim.lsp.buf_request 0 "textDocument/definition" params preview-location-callback))
          (pcall vim.lsp.buf_request 0 "textDocument/declaration" params preview-location-callback)))))

(let [on-init (fn [client]
                (set client.config.flags [])
                (if (. "flags" client.config)
                    (tset client.config.flags "allow_incremental_sync" true)))
      capabilities (vim.lsp.protocol.make_client_capabilities)
      on_attach (fn [client bufnr]
                  (do (lsp-status.on_attach client bufnr)
                      (signature.on_attach client bufnr)))
      handlers {"textDocument/publishDiagnostics"
                 (vim.lsp.with
                           vim.lsp.diagnostic.on_publish_diagnostics
                           {:severity_sort true
                            :update_in_insert false
                            :underline true
                            :virtual_text false})
                "textDocument/hover"
                 (vim.lsp.with
                           vim.lsp.handlers.hover
                           {:border "single"})
                "textDocument/signatureHelp"
                 (vim.lsp.with
                           vim.lsp.handlers.signature_help
                           {:border "single"})}

      luadev (lua-dev.setup {:lspconfig {:cmd [(vim.fn.expand
                                                 "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server")
                                               "-E"
                                               (vim.fn.expand
                                                 "/home/p00f/bin/lua-language-server/main.lua")]
                                         :settings {:Lua {:diagnostics
                                                            {:globals ["vim" "wezterm"]}
                                                          :completion {:keywordSnippet true}
                                                          :workspace {:preloadFileSize 170}
                                                          :telemetry {:enable true}
                                                          :window {:progressBar false}}}
                                         :capabilities capabilities
                                         :on_attach on_attach
                                         :handlers handlers
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
            :indicator_ok "OK"
            :status_symbol ""
            :component_separator "|"})

      (lspconfig.clangd.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :on_init on-init
                 :handlers (vim.tbl_deep_extend "error" handlers (lsp-status.extensions.clangd.setup))
                 :init_options {:clangdFileStatus true}
                 :cmd ["clangd" "--background-index" "--suggest-missing-includes" "--header-insertion=iwyu"]})

      (lspconfig.sumneko_lua.setup luadev)
      (rust-tools.setup {:server
                           {:capabilities capabilities
                            :on_attach on_attach
                            :handlers handlers
                            :on_init on-init}
                         :tools
                           {:inlay_hints {:other_hints_prefix " » "
                                          :highlight "RustInlayHints"
                                          :max_len_align true
                                          :max_len_align_padding 2}}})
      (lspconfig.bashls.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :handlers handlers
                 :on_init on-init})
      (lspconfig.tsserver.setup
                {:capabilities capabilities
                 :on_attach (fn [client bufnr]
                              (on_attach client bufnr)
                              (let [ts-utils (require :nvim-lsp-ts-utils)]
                                (ts-utils.setup {})
                                (ts-utils.setup_client client)))
                 :handlers handlers
                 :on_init on-init})))

{:peek_definition peek-definition}
