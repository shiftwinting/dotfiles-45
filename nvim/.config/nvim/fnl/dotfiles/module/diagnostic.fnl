(module dotfiles.module.diagnostic
        {require {nvim aniseed.nvim}})

(set nvim.g.diagnostic_enable_virtual_text 0)
(set nvim.g.diagnostic_insert_delay 1)

;(nvim.ex.highlight :LspDiagnosticsWarning "guifg=#FFEA00")

(nvim.call_function :sign_define [:LspDiagnosticsHintSign
                                  {:text "💡"
                                   :texthl "LspDiagnosticsHint"}])
(nvim.call_function :sign_define [:LspDiagnosticsWarningSign
                                  {:text ""
                                   :texthl "LspDiagnosticsWarning"}])
(nvim.call_function :sign_define [:LspDiagnosticsInformationSign
                                  {:text "i"
                                   :texthl "LspDiagnosticsInformation"}])
(nvim.call_function :sign_define [:LspDiagnosticsErrorSign
                                  {:text ""
                                   :texthl "DraculaRed"}])
