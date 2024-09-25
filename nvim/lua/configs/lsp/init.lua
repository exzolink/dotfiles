dofile(vim.g.base46_cache .. "codeactionmenu")

require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities(nvlsp.capabilities)
capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

local servers = { "html", "css", "volar", "typescript", "emmet" }

for _, lsp in pairs(servers) do
	local server_config_ok, mod = pcall(require, "configs.lsp.servers." .. lsp)
	if server_config_ok then
		mod.setup(nvlsp.on_attach, nvlsp.on_init, capabilities)
	end
end