local dap = require("dap")

dap.adapters.rust = {
        type = "executable",
        attach = { pidProperty = "pid", pidSelect = "ask" },
        command = "lldb-vscode",
        env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" },
        name = "lldb",
}
dap.adapters.cpp = dap.adapters.rust
dap.adapters.nlua = function(callback, config)
        callback({ type = "server", host = config.host, port = config.port })
end
dap.configurations.lua = {
        {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
                host = function()
                        local value = vim.fn.input("Host [127.0.0.1]: ")
                        if value ~= "" then
                                return value
                        end
                        return "127.0.0.1"
                end,
                port = function()
                        local val = tonumber(vim.fn.input("Port: "))
                        assert(val, "Please provide a port number")
                        return val
                end,
        },
}

vim.fn.sign_define("DapBreakpoint", {
        text = "🛑",
        texthl = "",
        linehl = "",
        numhl = "",
})
vim.fn.sign_define("DapLogpoint", {
        text = "",
        texthl = "",
        linehl = "",
        numhl = "",
})
