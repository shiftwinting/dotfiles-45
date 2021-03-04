(module dotfiles.module.formatter
  {require {formatter formatter}})

(formatter.setup
  {:filetype {:lua
              [(fn [] {:exe "lua-format"
                       :args ["--indent-width"
                              2
                              "--no-use-tab"]
                       :stdin true})]
              :cpp
              [(fn [] {:exe "clang-format"
                       :args ["--style=Google"]
                       :stdin true})]
              :java
              [(fn [] {:exe "google-java-format"
                       :args ["-"]
                       :stdin true})]
              :fennel
              [(fn [] {:exe "fnlfmt.fnl"
                       :args ["-"]
                       :stdin true})]
              :sh
              [(fn [] {:exe "shfmt"
                       :args ["-" "-i 2"]
                       :stdin true})]
              :zsh
              [(fn [] {:exe "shfmt"
                       :args ["-i 2"]
                       :stdin true})]}})
