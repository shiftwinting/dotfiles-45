(module dotfiles.globals
  {require {nvim aniseed.nvim
            core aniseed.core}})

(defn set-global [global_ value]
  "Sets a neovim global variable"
  (core.assoc nvim.g global_ value))

(let [globals
       {:indent_blankline_char "▏"
        :indent_blankline_show_current_context false
        :indent_blankline_filetype_exclude [:clojure :fennel :dashboard :help "" :packer :Results :NeogitStatus]

        :cphlang "rust"
        :cph_rust_createjson true
        :cpp_compile_command "g++ -D XOX solution.cpp -o cpp.out -g -O0"
        :rust_compile_command "rustc -g solution.rs -o rust.out"


        :neovide_window_floating_blur false
        :neovide_window_floating_opacity 0.7

        :hardtime_default_on 0
        :list_of_normal_keys ["h" "j" "k" "l" "-" "+" "<LEFT>" "<RIGHT>"]


        "conjure#highlight#enabled" 1
        "conjure#highlight#timeout" 500
        "conjure#highlight#group" "IncSearch"
        "conjure#mapping#doc_word" "K"
        "conjure#extract#tree_sitter#enabled" true
        "conjure#client#fennel#aniseed#aniseed_module_prefix" "aniseed."

        :dap_virtual_text "all frames"
        :cursorhold_updatetime 300  ;; shorter CursorHold, decoupled from updatetime
        :gtfo#terminals {:unix "wezterm start --cwd "}
        :AutoPairsMapCR false}]
  (each [global_ value (pairs globals)]
       (set-global global_ value)))
