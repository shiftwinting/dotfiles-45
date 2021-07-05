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
      "Spaces"
      "Tabs"))

(formatter.setup
    {:filetype {:lua
                [(fn [] {:exe "stylua"
                         :args ["--column-width" "100"
                                "--indent-type " (exptab-lua)
                                "--indent-width" (sw)
                                "--quote-style" "AutoPreferDouble"]
                         :stdin false})]
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
