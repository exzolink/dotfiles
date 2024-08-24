return {
	"stevearc/conform.nvim",
	event = "BufWritePost",

	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			scss = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			vue = { "prettier" },
		},

		format_after_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
	},
}
