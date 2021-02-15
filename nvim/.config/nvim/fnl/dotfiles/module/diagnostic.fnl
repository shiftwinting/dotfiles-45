(module dotfiles.module.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp}})



(nvim.call_function :sign_define [:LspDiagnosticsSignHint
                                  {:text "💡"
                                   :texthl "LspDiagnosticsSignHint"}])
(nvim.call_function :sign_define [:LspDiagnosticsSignWarning
                                  {:text "⚠️"
                                   :texthl "LspDiagnosticsSignWarning"}])
(nvim.call_function :sign_define [:LspDiagnosticsSignInformation
                                  {:text "ℹ️"
                                   :texthl "LspDiagnosticsSignInformation"}])
(nvim.call_function :sign_define [:LspDiagnosticsSignError
                                  {:text "🚫"
                                   :texthl "LspDiagnosticsSignError"}])
(nvim.call_function :sign_define [:LightBulbSign
                                  {:text "✨"}])
(tset lsp.handlers "textDocument/publishDiagnostics"
      (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                       :signs true
                                                       :update_in_insert false}))
