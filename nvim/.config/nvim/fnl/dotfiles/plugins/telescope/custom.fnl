(module dotfiles.plugins.telescope.custom
        {require {themes telescope.themes
                  builtin telescope.builtin}})
{:dotfiles
 (fn []
   (builtin.git_files {:shorten_path false
                       :cwd "~/dotfiles"
                       :prompt "~ dotfiles ~"}))
 :cc
 (fn []
   (builtin.find_files {:shorten_path true
                        :cwd "~/contests"
                        :prompt "~ cc ~"}))
 :curbuf
 (fn []
   (builtin.current_buffer_fuzzy_find
     (themes.get_dropdown {:winblend 10
                           :border true
                           :previewer false
                           :shorten_path true})))
 :lsp_code_actions
 (fn []
   (builtin.lsp_code_actions
     (themes.get_dropdown {:winblend 10
                           :border true
                           :previewer false})))
 :notes
 (fn []
   (builtin.find_files {:shorten_path true
                        :find_command [:fd :.org]
                        :cwd "~/org"
                        :prompt "Notes"}))}
