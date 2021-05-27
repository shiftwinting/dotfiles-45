(module dotfiles.plugins.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp
            core aniseed.core
            icons nvim-nonicons}})

(let [diag-attrs  [[:Hint "#133328" "#10B981" "!"]
                   [:Warning "#5A4323" "#e0af68" (icons.get "alert")]
                   [:Information "#12343A" "#0db9d7" "i"]
                   [:Error "#3F1E1E" "#db4b4b" (icons.get "stop")]]
      hl (fn [[diag bg fg _]]
             (nvim.ex.highlight
               (.. "LspDiagnosticsVirtualText" diag)
               (.. "guifg=" fg " guibg=" bg)))
      set-sign (fn [[diag _ _ sign]] (nvim.fn.sign_define (.. "LspDiagnosticsSign" diag) {:text sign}))]
   (do
    (core.map hl diag-attrs)
    (core.map set-sign diag-attrs)))

(when (not (or nvim.g.uivonim nvim.g.neovide))
  (nvim.fn.sign_define "LightBulbSign" {:text "a"}))

(tset lsp.handlers "textDocument/publishDiagnostics"
      (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                       :signs true
                                                       :update_in_insert false}))
