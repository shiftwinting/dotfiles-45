(module dotfiles.plugins.telescope.custom
        {require {themes telescope.themes
                  builtin telescope.builtin}})
{:dotfiles
 (fn []
   (builtin.git_files {:cwd "~/dotfiles"
                       :prompt "~ dotfiles ~"}))
 :cc
 (fn []
   (builtin.find_files {:path_display [:shorten]
                        :cwd "~/contests"
                        :prompt "~ cc ~"}))
 :curbuf
 (fn []
   (builtin.current_buffer_fuzzy_find
     (themes.get_dropdown {:winblend 10
                           :border true
                           :previewer false
                           :path_display [:shorten]})))
 :lsp_code_actions
 (fn []
   (builtin.lsp_code_actions
     (themes.get_dropdown {:winblend 10
                           :border true
                           :previewer false})))
 :notes
 (fn []
   (builtin.find_files {:path_display [:shorten]
                        :find_command [:fd :.org]
                        :cwd "~/org"
                        :prompt "~ Notes ~"}))}
