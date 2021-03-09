local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp_status = require("lsp-status")
lsp_status.register_progress()
lsp_status.config({
    indicator_errors = "🚫",
    indicator_warnings = "⚠️",
    indicator_info = "ℹ️",
    indicator_hint = "💡",
    indicator_ok = "👌",
})

if vim.g.uivonim == 1 then
    local lsp_callbacks = require("uivonim/lsp").callbacks
    lspconfig.bashls.setup({
        callbacks = lsp_callbacks,
        capabilities = capabilities,
    })
    lspconfig.sumneko_lua.setup({
        cmd = {
            "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server",
            "/home/p00f/bin/lua-language-server/main.lua",
        },
        settings = {
            Lua = {
                -- runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
                diagnostics = { globals = { "vim" } },
                completion = { keywordSnippet = true },
            },
        },
        callbacks = lsp_callbacks,
        capabilities = capabilities,
    })
    lspconfig.clojure_lsp.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
    })
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
    })
else
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
    })
    lspconfig.sumneko_lua.setup({
        cmd = {
            "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server",
            "-E",
            "/home/p00f/bin/lua-language-server/main.lua",
        },
        settings = {
            Lua = {
                -- runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
                diagnostics = { globals = { "vim" } },
                completion = { keywordSnippet = true },
            },
        },
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
    })
    require("lspconfig").clojure_lsp.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
    })
    require("lspconfig").clangd.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
    })
    require("lspconfig").rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
    })
end
