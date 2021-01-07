local lspconfig = require('lspconfig')
local configs = require'lspconfig/configs'
if vim.g.uivonim == 1 then
  local lsp_callbacks = require'uivonim/lsp'.callbacks
  lspconfig.bashls.setup {callbacks = lsp_callbacks;}
  lspconfig.vimls.setup {callbacks = lsp_callbacks;}
  lspconfig.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua'
    };
    callbacks = lsp_callbacks;
  }
else
  lspconfig.bashls.setup{}
  lspconfig.vimls.setup{}
  lspconfig.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua'
    };
  }
require'lspconfig'.clojure_lsp.setup{}
end
