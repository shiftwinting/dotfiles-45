(module dotfiles.module.definitions
  {require {nvim aniseed.nvim
            core aniseed.core}})

(defn set-global [global_ value]
  "Sets a neovim global variable"
  (core.assoc nvim.g global_ value))

(let [globals
       {;:indent_blankline_char ""
        :indent_blankline_filetype_exclude [:clojure :fennel :dashboard :help "" :packer]
        :indent_blankline_char_highlight_list [:Conceal]
        :indent_blankline_use_treesitter true
        :float_preview#docked 0
        :vista_default_executive "nvim_lsp"
        :neovide_window_floating_blur false
        :neovide_window_floating_opacity 0.5
        :cursorhold_updatetime 300  ;; shorter CursorHold, decoupled from updatetime
        :sexp_filetypes "clojure,query,fennel"
        :sidekick_printable_def_types ["function" "class" "type" "module" "parameter" "method" "field"]
        :rainbow_active 1
        :hardtime_default_on 0
        :list_of_normal_keys ["h" "j" "k" "l" "-" "+" "<LEFT>" "<RIGHT>"]
        :AutoPairsMapCR false}]
  (each [global_ value (pairs globals)]
       (set-global global_ value)))
