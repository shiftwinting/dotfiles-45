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
  if not lspconfig.clojure_lsp then
    configs.clojure_lsp = {
      default_config = {
        cmd = {'/home/p00f/.local/bin/clojure-lsp'};
        filetypes = {'clojure'};
        settings = {};
      };
    }
  end
  lspconfig.clojure_lsp.setup{}
end
