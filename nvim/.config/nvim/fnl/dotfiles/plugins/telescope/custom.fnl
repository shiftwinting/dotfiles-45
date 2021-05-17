(module dotfiles.plugins.telescope.custom
        {require {themes telescope.themes
                  builtin telescope.builtin}})
{:dotfiles
 (fn []
   (builtin.git_files {:shorten_path false
                       :cwd "~/dotfiles"
                       :prompt "~ dotfile ~"
                       :height 10}))
 :curbuf
 (fn []
   (builtin.current_buffer_fuzzy_find
     (themes.get_dropdown {:winblend 10
                           :border true
                           :previewer false
                           :shorten_path false})))
 :lsp_code_actions
 (fn []
   (builtin.lsp_code_actions
     (themes.get_dropdown {:winblend 10
                           :border true
                           :previewer false
                           :shorten_path false})))}
