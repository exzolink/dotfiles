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
			},
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			require("nvchad.configs.lspconfig").defaults()

			local lspconfig = require("lspconfig")
			local nvlsp = require("nvchad.configs.lspconfig")

			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			local servers = { "html", "cssls" }

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = nvlsp.on_attach,
					on_init = nvlsp.on_init,
					capabilities = nvlsp.capabilities,
				})
			end

			lspconfig.volar.setup({
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				init_options = {
					typescript = {
						tsdk = "/Users/1/AppData/Local/nvim-data/mason/packages/vue-language-server/node_modules/typescript/lib",
					},
					vue = {
						hybridMode = false,
					},
				},
			})

			-- lspconfig.tsserver.setup {
			--   init_options = {
			--     plugins = {
			--       {
			--         name = '@vue/typescript-plugin',
			--         location = vue_language_server_path,
			--         languages = { 'vue' },
			--       },
			--     },
			--   },
			--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
			-- }

			-- lspconfig.volar.setup {}
		end,
	},
}
