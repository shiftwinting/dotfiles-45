(module dotfiles.plugins.el
        {require {el el
                  builtin el.builtin
                  extensions el.extensions
                  sections el.sections
                  subscribe el.subscribe
                  lsp-statusline el.plugins.lsp_status
                  icons nvim-nonicons}})

(el.reset_windows)

(let [file-icon (subscribe.buf_autocmd "el_file_icon" "BufRead"
                  (fn [_ bufnr]
                    (let [icon (extensions.file_icon _ bufnr)]
                      (if icon
                        (.. icon " ")
                        ""))))
      git-branch (subscribe.buf_autocmd "el_git_branch" "BufEnter"
                   (fn [window buffer]
                     (let [branch (extensions.git_branch window buffer)]
                       (if branch
                         (.. " " (icons.get "git-branch") " " branch " ")))))
      git-changes (subscribe.buf_autocmd "el_git_changes" "BufWritePost"
                    (fn [window buffer]
                      (extensions.git_changes window buffer)))]
 (el.setup
   {:generator
    (fn [_ _]
     [(extensions.gen_mode {:format_string " %s "})
      (sections.highlight "ElBranch" git-branch)
      " "
      file-icon
      (sections.highlight "ELFile" builtin.tail_file)
      (sections.collapse_builtin [" " builtin.modified_flag])
      sections.split
      (sections.highlight "ElLsp" lsp-statusline.segment)
      git-changes
      "[" builtin.line ":" builtin.column "]"
      "[" (vim.fn.SleuthIndicator) "]"
      (sections.collapse_builtin
          ["[" builtin.help_list builtin.readonly_list "]"])
      builtin.filetype])}))
