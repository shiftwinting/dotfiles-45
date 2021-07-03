(module dotfiles.plugins.dap.functions)

{:scopes_sidebar (fn []
                   (let [widgets (require :dap.ui.widgets)
                         my_sidebar (widgets.sidebar widgets.scopes)]
                    (my_sidebar.open)))
 :scopes_float (fn []
                 (let [widgets (require :dap.ui.widgets)]
                  (widgets.centered_float widgets.scopes)))
 :pick_process (fn [] {})}
