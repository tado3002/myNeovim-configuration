local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("config.lsp.mason")
-- require "config.lsp.config"  -- ini hanya untuk windows supaya jdtls jalan, kalau pakai linu x remark saja
require("config.lsp.handlers").setup()
-- require("config.lsp.null-ls").setup()
require "config.lsp.null-ls" 
