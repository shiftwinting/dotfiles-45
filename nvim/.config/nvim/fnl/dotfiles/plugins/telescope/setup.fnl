(module dotfiles.plugins.telescope.setup
        {require {actions telescope.actions
                  icons nvim-nonicons
                  telescope telescope
                  previewers telescope.previewers}})
(telescope.setup
  {:defaults
     {:prompt_prefix (.. (icons.get "telescope") " ")
      :selection_caret  "❯ "
      :mappings {:i {:<esc> actions.close}}
      :prompt_position "top"
      :sorting_strategy "ascending"
      :shorten_path true
      :results_width 0.1
      :winblend 20
      :file_previewer previewers.cat.new}
   :extensions
     {:arecibo {:selected_engine "duckduckgo"
                :url_open_command "firefox"
                :show_http_headers false
                :show_domain_icons true}
      :fzf {:fuzzy true
            :override_generic_sorter true
            :override_file_sorter true}}})
