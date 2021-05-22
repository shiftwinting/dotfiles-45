(module dotfiles.plugins.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp
            core aniseed.core
            icons nvim-nonicons}})

(let [diag-attrs  [[:Hint "#988bc7" "!"]
                   [:Warning "#E4803A" (icons.get "alert")]
                   [:Information "#038013" "i"]
                   [:Error "#ed4556" (icons.get "stop")]]
      hl (fn [[diag colour _]] (nvim.ex.highlight (.. "LspDiagnosticsDefault" diag) (.. "guifg=" colour)))
      set-sign (fn [[diag _ sign]] (nvim.fn.sign_define (.. "LspDiagnosticsSign" diag) {:text sign}))]
   (do
    (core.map hl diag-attrs)
    (core.map set-sign diag-attrs)))

(when (not (or nvim.g.uivonim nvim.g.neovide))
  (nvim.fn.sign_define "LightBulbSign" {:text "a"}))

(tset lsp.handlers "textDocument/publishDiagnostics"
      (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                       :signs true
                                                       :update_in_insert false}))
