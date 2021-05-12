local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}
local lsp_status = require("lsp-status")
local on_init = function(client)
    client.config.flags = {}
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
end
lsp_status.register_progress()
local icons = require("nvim-nonicons")
lsp_status.config({
    indicator_errors = icons.get("stop"),
    indicator_warnings = icons.get("alert"),
    indicator_info = "i",
    indicator_hint = "?",
    indicator_ok = icons.get("check"),
    status_symbol = "",
})

if vim.g.uivonim == 1 then
    local lsp_callbacks = require("uivonim/lsp").callbacks
    lspconfig.bashls.setup({
        callbacks = lsp_callbacks,
        capabilities = capabilities,
        on_init = on_init,
    })
    lspconfig.sumneko_lua.setup({
        cmd = {
            vim.fn.expand("~/bin/lua-language-server/bin/Linux/lua-language-server"),
            "-E",
            vim.fn.expand("~/bin/lua-language-server/main.lua"),
        },
        settings = {
            Lua = {
                runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
                diagnostics = { globals = { "vim" } },
                completion = { keywordSnippet = true },
                hint = { enable = true },
                telemetry = { enable = true },
            },
        },
        callbacks = lsp_callbacks,
        capabilities = capabilities,
        on_init = on_init,
    })
    lspconfig.clojure_lsp.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
        on_init = on_init,
    })
    lspconfig.clangd.setup({
        capabilities = capabilities,
        handlers = lsp_status.extensions.clangd.setup(),
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
        on_init = on_init,
        init_options = {
            clangdFileStatus = true,
        },
    })
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
        on_init = on_init,
    })
else
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
    lspconfig.sumneko_lua.setup({
        cmd = {
            vim.fn.expand("/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server"),
            "-E",
            vim.fn.expand("/home/p00f/bin/lua-language-server/main.lua"),
        },
        settings = {
            Lua = {
                -- runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
                diagnostics = { globals = { "vim", "wezterm" } },
                completion = { keywordSnippet = true },
            },
        },
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
    lspconfig.clojure_lsp.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        handlers = lsp_status.extensions.clangd.setup(),
        on_init = on_init,
        init_options = {
            clangdFileStatus = true,
        },
    })
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
end
