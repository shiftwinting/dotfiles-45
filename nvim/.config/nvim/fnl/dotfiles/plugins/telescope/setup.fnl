(module dotfiles.plugins.telescope.setup
        {require {actions telescope.actions
                  icons nvim-nonicons
                  telescope telescope
                  previewers telescope.previewers
                  Job plenary.job}})

(defn- maker [filepath bufnr opts]
  (let [filepath (vim.fn.expand filepath)]
    (: (Job:new {:command "inspect"
                 :args [filepath]
                 :on_exit
                   (fn [j]
                     (let [ft (. (vim.split
                                   (. (j:result) 1)
                                   ": ")
                                 2)]
                       (if (= "binary" ft)
                           (vim.schedule (fn [] (vim.api.nvim_buf_set_lines bufnr 0 -1 false ["BINARY"])))
                           (previewers.buffer_previewer_maker filepath bufnr opts))))})
      :sync)))

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
      :buffer_previewer_maker maker}

   :pickers {:file_browser {:layout_config {:horizontal {:preview_width 0.7}}}
             :git_files {:shorten_path true}}

   :extensions
     {:fzf {:fuzzy true
            :override_generic_sorter true
            :override_file_sorter true}}})
