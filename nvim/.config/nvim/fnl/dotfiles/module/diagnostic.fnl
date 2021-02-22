(module dotfiles.module.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp
            core aniseed.core}})

(let [diag_attrs [[:Hint "💡" "#3a86ff"]
                  [:Warning "⚠️" "#fcbf49"]
                  [:Information "ℹ️" "#caffbf"]
                  [:Error "🚫" "#d62828"]]
      setsign (fn [[group sign _]]
                (nvim.fn.sign_define (.. "LspDiagnosticsSign" group) {:text sign
                                                                      :texthl (.. "LspDiagnosticsSign" group)}))
      hldiag (fn [[group _ color]]
               (nvim.ex.highlight (.. "LspDiagnosticsDefault" group) (.. "guifg=" color)))]
   (if (not nvim.g.neovide)
    (do
     (core.map setsign diag_attrs)
     (nvim.fn.sign_define "LightBulbSign" {:text "✨"})))
   (core.map hldiag diag_attrs))

(tset lsp.handlers "textDocument/publishDiagnostics"
      (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                       :signs true
                                                       :update_in_insert false}))
