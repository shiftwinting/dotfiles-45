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
  :cpp dap.adapters.rust
  :nlua (fn [callback config]
          (callback {:type "server"
                     :host config.host
                     :port config.port}))})

;(dap.configurations
;  {:lua
;    {:type "nlua"
;     :request "attach"
;        :name "Attach to running Neovim instance",
;        :host (fn []
;                (let [value (nvim.fn.input "Host [127.0.0.1]: ")]
;                  (if (not (= value "")
;                       value
;                       "127.0.0.1"))))
;        :port (fn []
;                (let [val (tonumber (nvim.fn.input "Port: "))]
;                  (assert val "Please provide a port number"
;                   val)))}})

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
