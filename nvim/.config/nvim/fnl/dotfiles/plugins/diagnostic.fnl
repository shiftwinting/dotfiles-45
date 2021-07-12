(module dotfiles.plugins.diagnostic
  {require {nvim aniseed.nvim
            icons nvim-nonicons}})

(let [signs {:Hint "!"
             :Warning (icons.get "alert")
             :Information "i"
             :Error (icons.get "stop")}]
  (each [diag sign (pairs signs)]
    (vim.fn.sign_define (.. "LspDiagnosticsSign" diag) {:text sign})))

(when (not (or nvim.g.uivonim nvim.g.neovide))
  (nvim.fn.sign_define "LightBulbSign" {:text (icons.get "light-bulb")}))
