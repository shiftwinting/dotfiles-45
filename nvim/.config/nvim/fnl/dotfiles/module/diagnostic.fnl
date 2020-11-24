(module dotfiles.module.diagnostic
        {require {nvim aniseed.nvim
                  lsp vim.lsp}})



(nvim.call_function :sign_define [:LspDiagnosticsSignHint
                                  {:text "💡"
                                   :texthl "LspDiagnosticsSignHint"}])
(nvim.call_function :sign_define [:LspDiagnosticsSignWarning
                                  {:text ""
                                   :texthl "LspDiagnosticsSignWarning"}])
(nvim.call_function :sign_define [:LspDiagnosticsSignInformation
                                  {:text "i"
                                   :texthl "LspDiagnosticsSignInformation"}])
(nvim.call_function :sign_define [:LspDiagnosticsSignError
                                  {:text ""
                                   :texthl "LspDiagnosticsSignError"}])
(tset lsp.handlers "textDocument/publishDiagnostics"
   (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                    :signs true
                                                    :update_in_insert false}))

(nvim.ex.highlight :LspDiagnosticsVirtualTextError "guibg=#2B190A guifg=#ff4d4d")
(nvim.ex.highlight :LspDiagnosticsVirtualTextWarning "guibg=#2B190A guifg=#f0c54c")
(nvim.ex.highlight :LspDiagnosticsVirtualTextHint "guibg=#2B190A guifg=#2dc7d2")
(nvim.ex.highlight :LspDiagnosticsVirtualTextInformation "guibg=#2B190A guifg=#d69060")
