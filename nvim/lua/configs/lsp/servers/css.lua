return {
	setup = function(on_attach, on_init, capabilities)
		local lspconfig = require("lspconfig")

		lspconfig.cssls.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,

			settings = {
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})
	end,
}
