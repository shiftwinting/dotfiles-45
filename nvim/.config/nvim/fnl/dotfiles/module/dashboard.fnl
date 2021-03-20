(module dotfiles.module.dashboard
  {require {nvim aniseed.nvim
            icons nvim-nonicons}})

(set nvim.g.dashboard_custom_shortcut
     {:last_session " • "
      :find_history "L h"
      :find_file "L f"
      :new_file " • "
      :change_colorscheme " • "
      :find_word "L g"
      :book_marks "L b"})

(set nvim.g.dashboard_custom_shortcut_icon
  {:last_session "<< "
   :find_history (.. (icons.get "history") " ")
   :find_file (.. (icons.get "telescope") " ")
   :new_file (.. (icons.get "file") " ")
   :change_colorscheme " "
   :find_word (.. (icons.get "search") " ")
   :book_marks (.. (icons.get "bookmark") " ")})
(set nvim.g.dashboard_change_to_dir 1)
(set nvim.g.dashboard_default_executive "telescope")
(set nvim.g.dashboard_custom_header
 ["███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗"
  "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║"
  "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║"
  "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║"
  "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║"
  "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"])
(let [q (nvim.fn.systemlist "pq")]
  (set nvim.g.dashboard_custom_footer q))
