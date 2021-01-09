local lspconfig = require('lspconfig')
local configs = require'lspconfig/configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if vim.g.uivonim == 1 then
  local lsp_callbacks = require'uivonim/lsp'.callbacks
  lspconfig.bashls.setup {
    callbacks = lsp_callbacks;
    capabilities = capabilities
  }
  lspconfig.vimls.setup {
    callbacks = lsp_callbacks;
    capabilities = capabilities
  }
  lspconfig.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua'
    };
    callbacks = lsp_callbacks;
    capabilities = capabilities
  }
else
  lspconfig.bashls.setup {
    capabilities = capabilities
  }
  lspconfig.vimls.setup {
    capabilities = capabilities
  }
  lspconfig.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua'
    };
    capabilities = capabilities
  }
require'lspconfig'.clojure_lsp.setup {
    capabilities = capabilities
  }
require'lspconfig'.clangd.setup {
    capabilities = capabilities
  }
end
