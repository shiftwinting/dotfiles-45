(module dotfiles.module.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp
            core aniseed.core}})

(if (not nvim.g.neovide)
  (let [diag_signs [[:Hint "💡"]
                    [:Warning "⚠️"]
                    [:Information "ℹ️"]
                    [:Error "🚫"]]
        setsign (fn [[group sign]]
                  (nvim.call_function :sign_define [(.. "LspDiagnosticsSign" group)
                                                    {:text sign
                                                     :texthl (.. "LspDiagnosticsSign" group)}]))]
     (core.map setsign diag_signs)))

(let [diag_colors [[:Error "#d62828"]
                   [:Warning "#fcbf49"]
                   [:Hint "#3a86ff"]
                   [:Information "#caffbf"]]
      hldiag (fn [[group color]]
                (nvim.ex.highlight (.. "LspDiagnosticsDefault" group) (.. "guifg=" color)))]
     (core.map hldiag diag_colors))

(tset lsp.handlers "textDocument/publishDiagnostics"
      (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                       :signs true
                                                       :update_in_insert false}))
