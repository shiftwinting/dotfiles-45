(module dotfiles.plugins.dap.setup
 {require {nvim aniseed.nvim
           dap dap
           icons nvim-nonicons}})

(set dap.adapters
 {:rust {:type "executable"
         :attach {:pidProperty "pid" :pidSelect "ask"}
         :command "lldb-vscode"
         :env {:LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY "YES"}
         :name "lldb"}
  :cpp {:type "executable"
         :attach {:pidProperty "pid" :pidSelect "ask"}
         :command "lldb-vscode"
         :env {:LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY "YES"}
         :name "lldb"}
  :nlua (fn [callback config]
          (callback {:type "server"
                     :host config.host
                     :port config.port}))})

(nvim.fn.sign_define "DapBreakpoint"
                     {:text "🛑"
                      :texthl ""
                      :linehl ""
                      :numhl ""})
(nvim.fn.sign_define "DapLogpoint"
                     {:text (icons.get "file-code")
                      :texthl ""
                      :linehl ""
                      :numhl ""})

{:scopes_sidebar (fn []
                   (let [widgets (require :dap.ui.widgets)
                         my_sidebar (widgets.sidebar widgets.scopes)]
                    (my_sidebar.open)))
 :scopes_float (fn []
                 (let [widgets (require :dap.ui.widgets)]
                  (widgets.centered_float widgets.scopes)))}
