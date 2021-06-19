(module dotfiles.plugins.formatter
  {require {formatter formatter}})

(defn- sw [] vim.bo.shiftwidth)

(defn- prettier [lang]
 (fn [] {:exe "prettier"
         :args [(.. "--tab-width " (sw))
                (.. "--parser " lang)]
         :stdin true}))
(defn- exptab-lua []
  (if vim.bo.expandtab
      "--no-use-tab"
      "--use-tab"))

(formatter.setup
    {:filetype {:lua
                [(fn [] {:exe "lua-format"
                         :args ["--column-limit=100"
                                (exptab-lua)
                                "--align-args"
                                "--align-parameter"
                                "--extra-sep-at-table-end"
                                "--spaces-inside-table-braces"
                                "--align-table-field"
                                "--single-quote-to-double-quote"
                                "--spaces-around-equals-in-field"
                                (.. "--indent-width=" (sw))]
                         :stdin true})]
                :cpp
                [(fn [] {:exe "clang-format"
                         :args ["--style"
                                (.. "\"{BasedOnStyle: Google, IndentWidth: " (sw) "}\"")]
                         :stdin true})]
                :c
                [(fn [] {:exe "clang-format"
                         :args ["--style"
                                (.. "\"{BasedOnStyle: Google, IndentWidth: " (sw) "}\"")]
                         :stdin true})]
                :java
                [(fn [] {:exe "google-java-format"
                         :args ["-"]
                         :stdin true})]
                :fennel
                [(fn [] {:exe "fnlfmt"
                         :args ["-"]
                         :stdin true})]
                :rust
                [(fn [] {:exe "rustfmt"
                         :args ["--emit stdout"]
                         :stdin true})]
                :sh
                [(fn [] {:exe "shfmt"
                         :args [(.. "-i " (sw))]
                         :stdin true})]
                :zsh
                [(fn [] {:exe "shfmt"
                         :args [(.. "-i " (sw))]
                         :stdin true})]
                :css  [(prettier "css")]
                :json [(prettier "json")]
                :less [(prettier "less")]
                :xml  [(prettier "xml")]
                :toml [(prettier "toml")]}})
