(module dotfiles.plugins.telescope.setup
        {require {actions telescope.actions
                  icons nvim-nonicons
                  telescope telescope
                  previewers telescope.previewers}})
(telescope.setup
  {:defaults
     {:prompt_prefix (.. (icons.get "telescope") " ")
      :selection_caret  "> "
      :layout_strategy "flex"
      :layout_config {:horizontal {:prompt_position "top"}
                      :vertical {:preview_cutoff 5}}
      :mappings {:i {:<esc> actions.close}}
      :sorting_strategy "ascending"
      :shorten_path true
      :borderchars ["─" "│" "─" "│" "┌" "┐" "┘" "└"]
      :file_previewer previewers.cat.new}
   :extensions
     {:arecibo {:selected_engine "duckduckgo"
                :url_open_command "firefox"
                :show_http_headers false
                :show_domain_icons true}
      :fzf {:fuzzy true
            :override_generic_sorter true
            :override_file_sorter true}}})
