(module dotfiles.module.definitions
  {require {nvim aniseed.nvim
            core aniseed.core}})

(defn set_global [[global_ value]]
  "Sets a neovim global variable"
  (core.assoc nvim.g global_ value))

(let [globals
      [[:sneak#label 1]
       [:indentLine_char "│"]
       [:indentLine_fileTypeExclude [:clojure :fennel :dashboard :help ""]]
       [:which_key_map {}]  ;; initialise which-key map
       [:float_preview#docked 0]
       [:vista_default_executive "nvim_lsp"]
       [:neovide_transparency 1]
       [:cursorhold_updatetime 300]  ;; shorter CursorHold, decoupled from updatetime
       [:sexp_filetypes "clojure,query,fennel"]
       [:sidekick_printable_def_types ["function" "class" "type" "module" "parameter" "method" "field"]]
       [:rainbow_active 0]
       [:srcery_italic 1]]]
  (core.map set_global globals))
