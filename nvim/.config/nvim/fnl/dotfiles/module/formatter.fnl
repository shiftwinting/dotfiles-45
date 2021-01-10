(module dotfiles.module.formatter
  {require {formatter formatter}})

(formatter.setup
  {:filetype {
              :lua
              [(fn [] {:exe "luafmt"
                       :args ["--indent-count"
                              2
                              "--stdin"]
                       :stdin true})]
              :cpp
              [(fn [] {:exe "clang-format"
                       :args ["--style=Google"]
                       :stdin true})]
              :java
              [(fn [] {:exe "google-java-format"
                       :args ["-"]
                       :stdin true})]}})
