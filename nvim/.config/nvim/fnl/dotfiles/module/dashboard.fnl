(module dotfiles.module.dashboard
        {require {nvim aniseed.nvim}})

(set nvim.g.dashboard_custom_shortcut
     {:last_session "···"
      :find_history "L h"
      :find_file "L f"
      :new_file "···"
      :change_colorscheme "···"
      :find_word "···"
      :book_marks "L b"})
(set nvim.g.dashboard_change_to_dir 1)
