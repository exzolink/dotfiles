return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

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
			timeout_ms = 2000,
			lsp_fallback = true,
			async = true,
		},
	},
}
