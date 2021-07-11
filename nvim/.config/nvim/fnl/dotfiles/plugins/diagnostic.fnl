(module dotfiles.plugins.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp
            core aniseed.core
            icons nvim-nonicons}})

(let [diag-attrs {:Hint "!"
                  :Warning (icons.get "alert")
                  :Information "i"
                  :Error (icons.get "stop")}]
  (each [diag sign (pairs diag-attrs)]
    (vim.fn.sign_define (.. "LspDiagnosticSign" diag) {:text sign})))

(when (not (or nvim.g.uivonim nvim.g.neovide))
  (nvim.fn.sign_define "LightBulbSign" {:text (icons.get "light-bulb")}))
