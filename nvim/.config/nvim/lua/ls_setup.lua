nvim_lsp = require('nvim_lsp')
if vim.g.uivonim == 1 then
  local lsp_callbacks = require'uivonim/lsp'.callbacks
  require 'nvim_lsp'.bashls.setup {callbacks = lsp_callbacks;}
  require 'nvim_lsp'.vimls.setup {callbacks = lsp_callbacks;}
  require 'nvim_lsp'.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua'
    };
    callbacks = lsp_callbacks;
  }
else
  require 'nvim_lsp'.bashls.setup{}
  require 'nvim_lsp'.vimls.setup{}
  require 'nvim_lsp'.sumneko_lua.setup {
    cmd = {
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua'
    };
  }
end
