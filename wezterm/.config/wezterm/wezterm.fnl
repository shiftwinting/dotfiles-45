(let [wezterm (require :wezterm)
      font_with_fallback (fn [name params]
                            (let [names [name "Noto Color Emoji" "JetBrains Mono"]]
                              (wezterm.font_with_fallback names params)))]
     {:harfbuzz_features ["clig=1"
                          "liga=1"]
      :font (font_with_fallback "Fira Code")
      :font_rules [{:italic true
                    :font (font_with_fallback "Fira Mono" {:italic true})}
                   {:intensity "Bold"
                    :font (font_with_fallback "Fira Code" {:bold true})}
                   {:intensity "Bold"
                    :italic true
                    :font (font_with_fallback "Victor Mono" {:intensity bold
                                                             :italic true})}
                   {:intensity "Half"
                    :font (font_with_fallback "Fira Code Light")}]
      :font_size 11.0
      :enable_scroll_bar true
      :default_cursor_style "BlinkingUnderline"
      :line_height 1.04
      :hide_tab_bar_if_only_one_tab true
      :adjust_window_size_when_changing_font_size false
      :enable_wayland true
      :window_close_confirmation "NeverPrompt"
      :font_hinting "Full"
      :keys [{:key "Enter" :mods "ALT" :action "DisableDefaultAssignment"}]
      :window_padding {:left 5
                       :top 5}
      :colors {:foreground "#D4D4D4"
               :background "#1e1e1e"
               :ansi      ["#000000"
                           "#cd3131"
                           "#608b4e"
                           "#CE9178"
                           "#2472c8"
                           "#C586C0"
                           "#11a8cd"
                           "#e5e5e5"]
               :brights   ["#666666"
                           "#f14c4c"
                           "#b5cea8"
                           "#DCDCAA"
                           "#569cd6"
                           "#daadd6"
                           "#9cdcfe"
                           "#e5e5e5"]
               :tab_bar
                 {:background         "#151515"
                  :active_tab         {:intensity "Bold"
                                       :bg_color "#363535"
                                       :fg_color "#FFFFFF"}
                  :inactive_tab       {:bg_color "#151515"
                                       :fg_color "#737373"}
                  :inactive_tab_hover {:bg_color "#616161"
                                       :fg_color "#1e1e1e"
                                       :italic true}}}})
