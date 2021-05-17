(module ale
  {require {nvim aniseed.nvim
            tdcmt todo-comments
            icons nvim-nonicons}})
(tdcmt.setup {:keywords
              {:FIX {:icon (icons.get "bug")}
               :WARN {:icon (icons.get "alert")}
               :TODO {:icon (icons.get "checklist")}
               :HACK {:icon (icons.get "flame")}
               :PERF {:icon (icons.get "clock")}
               :NOTE {:icon (icons.get "note")}}})
