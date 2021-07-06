(module dotfiles.plugins.formatter
  {require {formatter formatter}})

(defn- sw [] vim.bo.shiftwidth)

(defn- exptab-lua []
  (if vim.bo.expandtab
      "Spaces"
      "Tabs"))

(defn- prettier [lang]
  (if (= nil lang)
      (fn [] {:exe "prettier"
              :args ["--stdin-filepath" (vim.api.nvim_buf_get_name 0)
                     "--tab-width" (sw)]
              :stdin true})
      (fn [] {:exe "prettier"
              :args ["--stdin-filepath" (vim.api.nvim_buf_get_name 0)
                     "--tab-width" (sw)
                     "--parser" lang]
              :stdin true})))

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
                :css  [(prettier)]
                :json [(prettier)]
                :less [(prettier)]
                :xml  [(prettier "xml")]
                :toml [(prettier)]
                :javascript [(prettier)]}})
