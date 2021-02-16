local wezterm = require "wezterm"
return {
  harfbuzz_features = {"clig=1", "liga=1"},
  font = wezterm.font_with_fallback({"JetBrains Mono", "Noto Color Emoji"}),
  font_size = 10.6,
  enable_scroll_bar = true,
  default_cursor_style = "BlinkingUnderline",
  line_height = 1.04,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  enable_wayland = true,
  window_close_confirmation = "NeverPrompt",
  colors = {
    foreground = "#D4D4D4",
    background = "#1e1e1e",
    ansi = {
      "#000000",
      "#cd3131",
      "#608b4e",
      "#CE9178",
      "#2472c8",
      "#C586C0",
      "#11a8cd",
      "#e5e5e5"
    },
    brights = {
      "#666666",
      "#f14c4c",
      "#b5cea8",
      "#DCDCAA",
      "#569cd6",
      "#daadd6",
      "#9cdcfe",
      "#e5e5e5"
    }
  },
  mouse_bindings = {
    {
      event = {Down = {streak = 1, button = {WheelUp = 1}}},
      mods = "CTRL",
      action = "IncreaseFontSize"
    }
  }
}