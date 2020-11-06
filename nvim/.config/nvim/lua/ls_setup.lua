local nvim_lsp = require('nvim_lsp')
local configs = require'nvim_lsp/configs'
if vim.g.uivonim == 1 then
  local lsp_callbacks = require'uivonim/lsp'.callbacks
  nvim_lsp.bashls.setup {callbacks = lsp_callbacks;}
  nvim_lsp.vimls.setup {callbacks = lsp_callbacks;}
  nvim_lsp.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua'
    };
    callbacks = lsp_callbacks;
  }
else
  nvim_lsp.bashls.setup{}
  nvim_lsp.vimls.setup{}
  nvim_lsp.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua'
    };
  }
  if not nvim_lsp.clojure_lsp then
    configs.clojure_lsp = {
      default_config = {
        cmd = {'/home/p00f/.local/bin/clojure-lsp'};
        filetypes = {'clojure'};
        settings = {};
      };
    }
  end
  nvim_lsp.clojure_lsp.setup{}
end
