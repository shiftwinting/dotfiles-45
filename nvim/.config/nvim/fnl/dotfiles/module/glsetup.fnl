(module dotfiles.module.glsetup
        {require {nvim aniseed.nvim}})

(def- colors {:bg "#21222c"
              :yellow "#fabd2f"
              :cyan "#008080"
              :darkblue "#081633"
              :green "#afd700"
              :orange "#FF8800"
              :purple "#5d4d7a"
              :magenta "#d16d9e"
              :grey "#c0c0c0"
              :blue "#0087d7"
              :red "#ec5f67"})

(let [gl (require :galaxyline)
      checkwidth
        (fn []
          (let [squeeze_width (/ (nvim.call_function :winwidth [:0]) 2)]
                               (> squeeze_width 40)))
      buffer_not_empty
        (fn [] (not (= 1 (nvim.call_function :empty [(nvim.call_function :expand ["%:t"])]))))
        

      vimode_provider
        (fn []
          (let [alias {:n "NORMAL"
                       :i "INSERT"
                       :c "COMMAND"
                       :v "VISUAL"
                       "" "V-BLOCK"}]
            (. alias (nvim.call_function :mode {}))))]

 (set gl.short_line_list [:LuaTree
                          :vista
                          :dbui])
 (set gl.section {:left
                    [{:FirstElement
                        {:provider (fn [] "▋")
                         :highlight [(. colors :blue) (. colors :yellow)]}}
                     {:ViMode
                        {:provider vimode_provider
                         :separator ""
                         :separator_highlight [(. colors :yellow)
                                               (fn []
                                                 (if buffer_not_empty
                                                   (. colors :darkblue)
                                                   (. colors :purple)))]
                         :highlight [(. colors :magenta)
                                     (. colors :yellow)
                                     :bold]}}
                     {:FileIcon
                        {:provider "FileIcon"
                         :condition buffer_not_empty
                         :highlight [(. (require "galaxyline.provider_fileinfo") :get_file_icon_color)
                                     (. colors :darkblue)]}}
                     {:FileName
                        {:provider [:FileName :FileSize]
                         :condition buffer_not_empty
                         :separator ""
                         :separator_highlight [(. colors :purple) (. colors :darkblue)]
                         :highlight [(. colors :magenta) (. colors :darkblue)]}}
                     {:GitIcon
                        {:provider (fn [] "  ")
                         :condition buffer_not_empty
                         :highlight [(. colors :orange) (. colors :purple)]}}
                     {:GitBranch
                        {:provider "GitBranch"
                         :condition buffer_not_empty
                         :highlight [(. colors :grey) (. colors :purple)]}}
                     {:DiffAdd
                        {:provider "DiffAdd"
                         :condition checkwidth
                         :icon " "
                         :highlight [(. colors :green) (. colors :purple)]}}
                     {:DiffModified
                        {:provider "DiffModified"
                         :condition checkwidth
                         :icon " "
                         :highlight [(. colors :orange) (. colors :purple)]}}
                     {:DiffRemove
                        {:provider "DiffRemove"
                         :condition checkwidth
                         :icon " "
                         :highlight [(. colors :red) (. colors :purple)]}}
                     {:LeftEnd
                        {:provider (fn [] "")
                         :separator ""
                         :separator_highlight [(. colors :purple) (. colors :bg)]
                         :highlight [(. colors :purple) (. colors :purple)]}}
                     {:DiagnosticError
                        {:provider "DiagnosticError"
                         :icon "  "
                         :highlight [(. colors :red) (. colors :bg)]}}
                     {:Space
                        {:provider (fn [] " ")}
                         :highlight (. colors bg)}
                     {:DiagnosticWarn
                        {:provider "DiagnosticWarn"
                         :icon "  "
                         :highlight [(. colors :yellow) (. colors :bg)]}}
                     {:Space
                        {:provider (fn [] " ")}
                         :highlight (. colors bg)}
                     {:DiagnosticHint
                        {:provider "DiagnosticHint"
                         :icon " 💡 "
                         :highlight [(. colors :blue) (. colors :bg)]}}
                     {:Space
                        {:provider (fn [] " ")}
                         :highlight (. colors bg)}
                     {:DiagnosticInfo
                        {:provider "DiagnosticInfo"
                         :icon " i "
                         :highlight [(. colors :green) (. colors :bg)]}}]
                  :right
                    [{:FileFormat
                        {:provider "FileFormat"
                         :separator ""
                         :separator_highlight [(. colors :bg) (. colors :purple)]
                         :highlight [(. colors :grey) (. colors :purple)]}}
                     {:LineInfo
                        {:provider "LineColumn"
                         :separator " | "
                         :separator_highlight [(. colors :darkblue) (. colors :purple)]
                         :highlight [(. colors :grey) (. colors :purple)]}}
                     {:PerCent
                        {:provider "LinePercent"
                         :separator ""
                         :separator_highlight [(. colors :darkblue) (. colors :purple)]
                         :highlight [(. colors :grey) (. colors :darkblue)]}}
                     {:ScrollBar
                        {:provider "ScrollBar"
                         :highlight [(. colors :yellow) (. colors :purple)]}}]
                  :short_line_left
                    [{:BufferType
                        {:provider "FileTypeName"
                         :separator ""
                         :separator_highlight [(. colors :purple) (. colors :bg)]
                         :highlight [(. colors :grey) (. colors :purple)]}}]
                  :short_line_right
                    [{:BufferIcon
                        {:provider "BufferIcon"
                         :separator ""
                         :separator_highlight [(. colors :purple) (. colors :bg)]
                         :highlight [(. colors :grey) (. colors :purple)]}}]}))
