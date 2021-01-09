vim.cmd[[packadd nvim-jdtls]]
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local jdtls = require('jdtls')
local config  = {
  cmd = {'jdtls_launcher.sh'},
  capabilities = capabilities
}

if vim.g.uivonim == 1 then
  local lsp_callbacks = require'uivonim/lsp'.callbacks
  config['callbacks'] = { lsp_callbacks; }
end

jdtls.start_or_attach(config)
