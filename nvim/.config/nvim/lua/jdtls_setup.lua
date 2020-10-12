jdtls = require('jdtls')
config  = {
  cmd = {'jdtls_launcher.sh'};
  init_options = {
    bundles = {
      vim.fn.glob("/home/p00f/stuff/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
    };
  };
  on_attach = function(client, bufnr)
                require('jdtls').setup_dap()
              end
}

if vim.g.uivonim == 1 then
  local lsp_callbacks = require'uivonim/lsp'.callbacks
  config['callbacks'] = { lsp_callbacks; }
end

jdtls.start_or_attach(config)
