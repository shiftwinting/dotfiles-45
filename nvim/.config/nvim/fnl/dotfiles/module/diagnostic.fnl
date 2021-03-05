(module dotfiles.module.diagnostic
  {require {nvim aniseed.nvim
            lsp vim.lsp
            core aniseed.core}})

(let [diag_hls {:Hint "#3a86ff"
                :Warning "#fcbf49"
                :Information "#caffbf"
                :Error "#d62828"}]
   (each [group colour (pairs diag_hls)]
    (nvim.ex.highlight (.. "LspDiagnosticsDefault" group) (.. "guifg=" colour))))

(when (not (or nvim.g.uivonim nvim.g.neovide))
  (nvim.fn.sign_define "LightBulbSign" {:text "✨"}))

(tset lsp.handlers "textDocument/publishDiagnostics"
      (lsp.with lsp.diagnostic.on_publish_diagnostics {:virtual_text true
                                                       :signs true
                                                       :update_in_insert false}))
