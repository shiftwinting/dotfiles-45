(module dotfiles.plugins.dap.functions
        {require {dap dap
                  nvim aniseed.nvim}})

(var last-gdb-config nil)

{:start_c_debugger
   (fn [args mi-mode mi-debugger-path]
     (require "plugins.dap.setup")
     (when (and args (> (# args) 0))
       (set last-gdb-config
         {:type "rust"
          :name (. args 1)
          :request "launch"
          :program (table.remove args 1)
          :args args
          :cwd (nvim.fn.getcwd)
          :externalConsole true
          :MIMode mi-mode
          :MIDebuggerPath mi-debugger-path}))
     (if (not last-gdb-config)
       (print "No binary to debug set! Use \":DebugC <binary> <args>\" or \":DebugRust <binary> <args>")
       (dap.run last-gdb-config)))}
