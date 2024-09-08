return {
	setup = function(on_attach, on_init, capabilities)
		local lspconfig = require("lspconfig")
		local handlers = require("configs.lsp.handlers")

		lspconfig.volar.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				handlers.setup_inlay_hints(client, bufnr)
			end,
			on_init = on_init,
			capabilities = capabilities,
		})
	end,
}
