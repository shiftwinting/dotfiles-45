(module dotfiles.plugins.dap.setup
 {require {nvim aniseed.nvim
           dap dap
           icons nvim-nonicons}})

(set dap.adapters
 {:lldb {:type "executable"
         :command "/usr/bin/lldb-vscode"
         :name "lldb"}
  :nlua (fn [callback config]
          (callback {:type "server"
                     :host config.host
                     :port config.port}))})
(def- lldb-conf
 [{:name "Don't run in terminal"
   :type "lldb"
   :request "launch"
   :program (fn []
              (vim.fn.input
                "Path to executable: "
                (.. (vim.fn.getcwd) "/")
                "file"))
   :cwd "${workspaceFolder}"
   :stopOnEntry false
   :args []
   :runInTerminal false}
  {:name "Run in terminal"
   :type "lldb"
   :request "launch"
   :program (fn []
              (vim.fn.input
                "Path to executable: "
                (.. (vim.fn.getcwd) "/")
                "file"))
   :cwd "${workspaceFolder}"
   :stopOnEntry false
   :args []
   :runInTerminal true}])

(set dap.configurations
      {:rust lldb-conf
       :c lldb-conf
       :cpp lldb-conf})

(nvim.fn.sign_define "DapBreakpoint"
                     {:text "•"
                      :texthl "NightflyRed"
                      :linehl ""
                      :numhl ""})
(nvim.fn.sign_define "DapLogPoint"
                     {:text (icons.get "file-code")
                      :texthl "NightflyBlue"
                      :linehl ""
                      :numhl ""})
(nvim.fn.sign_define "DapStopped"
                     {:text "‣"
                      :texthl "NightflyYellow"
                      :linehl ""
                      :numhl ""})
