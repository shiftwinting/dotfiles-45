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

;(nvim.ex.highlight :LspDiagnosticsVirtualTextError "guifg=#FF0072")
;(nvim.ex.highlight :LspDiagnosticsVirtualTextWarning "guifg=#FF5300")
;(nvim.ex.highlight :LspDiagnosticsVirtualTextHint "guifg=#7AFF00")
;(nvim.ex.highlight :LspDiagnosticsVirtualTextInformation "guifg=#0073FF")
