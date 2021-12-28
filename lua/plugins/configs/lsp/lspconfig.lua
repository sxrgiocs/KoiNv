local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugins.configs.lsp.lsp_installer"
require "plugins.configs.lsp.handlers"

