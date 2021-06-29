(let [wezterm (require "wezterm")]
     {:harfbuzz_features ["clig=1"
                          "liga=1"]
      :font (wezterm.font_with_fallback ["JetBrains Mono" "nonicon" "Noto Color Emoji"])
      :font_size 10.875
      :default_cursor_style "BlinkingUnderline"
      :hide_tab_bar_if_only_one_tab true
      :adjust_window_size_when_changing_font_size false
      :window_close_confirmation "NeverPrompt"
      :enable_wayland true
      :allow_square_glyphs_to_overflow_width "WhenFollowedBySpace"
      :keys [{:key "Enter" :mods "ALT" :action "DisableDefaultAssignment"}]
      :window_padding {:left 5
                       :top 5}
      :color_scheme "iceberg-dark"})
