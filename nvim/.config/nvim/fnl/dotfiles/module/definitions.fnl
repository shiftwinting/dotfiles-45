(module dotfiles.module.definitions
        {require {nvim aniseed.nvim
                  core aniseed.core}})

(defn set_global [var_value]
   "Sets a neovim global variable"
   (core.assoc nvim.g (. var_value 1) (. var_value 2)))

(def globals
  [[:sneak#label 1]
   [:indentLine_char "│"]
   [:indentLine_fileTypeExclude [:clojure :fennel :dashboard]]
   [:which_key_map {}]  ;; initialise which-key map
   [:float_preview#docked 0]
   [:vista_default_executive "nvim_lsp"]
   [:neovide_transparency 0.8]
   [:cursorhold_updatetime 300]  ;; shorter CursorHold, decoupled from updatetime
   [:sexp_filetypes "clojure,query,fennel"]])

(core.map set_global globals)
