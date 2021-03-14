(module dotfiles.module.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp
            core aniseed.core}})

(let [diag-attrs  [[:Hint "#988bc7" "💡"]
                   [:Warning "#BE5C19" ">>"]
                   [:Information "#025A0D" "i"]
                   [:Error "#e61f44" "X"]]
      hl (fn [[diag colour _]] (nvim.ex.highlight (.. "LspDiagnosticsDefault" diag) (.. "guifg=" colour)))
      set-sign (fn [[diag _ sign]] (nvim.fn.sign_define (.. "LspDiagnosticsSign" diag) {:text sign}))]
   (do
    (core.map hl diag-attrs)
    (core.map set-sign diag-attrs)))

(when (not (or nvim.g.uivonim nvim.g.neovide))
  (nvim.fn.sign_define "LightBulbSign" {:text "✨"}))

(tset lsp.handlers "textDocument/publishDiagnostics"
      (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                       :signs true
                                                       :update_in_insert false}))
