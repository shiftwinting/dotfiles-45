(let [wezterm (require "wezterm")
      font_with_fallback (fn [name params]
                            (let [names [name "nonicon" "Noto Color Emoji"]]
                              (wezterm.font_with_fallback names params)))]
     {:harfbuzz_features ["clig=1"
                          "liga=1"
                          "ss03"
                          "ss06"
                          "ss07"]
      :font (font_with_fallback "Source Code Pro")
      :font_rules [{:italic true
                    :font (font_with_fallback "Source Code Pro" {:italic true})}
                   {:intensity "Bold"
                    :font (font_with_fallback "Source Code Pro" {:bold true})}
                   {:intensity "Bold"
                    :italic true
                    :font (font_with_fallback "Source Code Pro" {:bold true}
                                                         :italic true)}
                   {:intensity "Half"
                    :font (font_with_fallback "Source Code Pro Light")}]
      :window_background_opacity 0.9
      :font_size 11.0
      :default_cursor_style "BlinkingUnderline"
      :line_height 1.04
      :hide_tab_bar_if_only_one_tab true
      :adjust_window_size_when_changing_font_size false
      ;:enable_wayland true
      :window_close_confirmation "NeverPrompt"
      :font_hinting "Full"
      :allow_square_glyphs_to_overflow_width "Always"
      :keys [{:key "Enter" :mods "ALT" :action "DisableDefaultAssignment"}]
      :window_padding {:left 5
                       :top 5}
      :color_scheme "Duotone Dark"})
