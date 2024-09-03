return {
	{
		"williamboman/mason.nvim",

		opts = {
			ensure_installed = {
				"html-lsp",
				"css-lsp",
				"prettier",
				"eslint_d",
				"vue-language-server",
				"vtsls",
				"emmet-language-server",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",

		config = function() require("configs.lsp") end,
		opts = {},
	},
}
