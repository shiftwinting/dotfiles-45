(module dotfiles.plugins.dap.functions
        {require {tel telescope}})

{:scopes_sidebar (fn []
                   (let [widgets (require :dap.ui.widgets)
                         my_sidebar (widgets.sidebar widgets.scopes)]
                     (my_sidebar.open)))}
