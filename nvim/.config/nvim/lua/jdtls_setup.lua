jdtls = require('jdtls')
config  = {
  cmd = {'jdtls_launcher.sh'}
}

if vim.g.uivonim == 1 then
  local lsp_callbacks = require'uivonim/lsp'.callbacks
  config['callbacks'] = { lsp_callbacks; }
end
