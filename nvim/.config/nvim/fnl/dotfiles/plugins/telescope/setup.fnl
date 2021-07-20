(module dotfiles.plugins.telescope.setup
        {require {actions telescope.actions
                  icons nvim-nonicons
                  telescope telescope
                  previewers telescope.previewers
                  Job plenary.job}})

(defn- maker [filepath bufnr opts]
  (let [filepath (vim.fn.expand filepath)]
    (: (Job:new {:command "file"
                 :args ["--mime-type" "-b" filepath]
                 :on_exit
                   (fn [j]
                     (let [ft (. (vim.split
                                   (. (j:result) 1)
                                   "/")
                                 1)]
                       (if (or (= "text" ft) (= "inode" ft))
                           (previewers.buffer_previewer_maker filepath bufnr opts)
                           (vim.schedule (fn [] (vim.api.nvim_buf_set_lines bufnr 0 -1 false ["BINARY"]))))))})

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
      :borderchars ["─" "│" "─" "│" "┌" "┐" "┘" "└"]
      :buffer_previewer_maker maker}

   :pickers {:file_browser {:layout_config {:horizontal {:preview_width 0.7}}}
             :buffers {:sort_lastused true
                       :mappings {:i {:<c-d> actions.delete_buffer}
                                  :n {:<c-d> actions.delete_buffer}}}}

   :extensions
     {:fzf {:fuzzy true
            :override_generic_sorter true
            :override_file_sorter true}}})
