local config = require("configs.lsp.config")
local nvlsp = require("nvchad.configs.lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities(nvlsp.capabilities)
capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

config.overrides()
nvlsp.defaults()

local servers = { "html", "css", "volar", "tailwindcss", "typescript", "emmet", "prisma", "json", "yaml" }
for _, lsp in ipairs(servers) do
  local server_config_ok, mod = pcall(require, "configs.lsp.servers." .. lsp)
  if server_config_ok then
    mod.setup(config.on_attach, nvlsp.on_init, capabilities)
  end
end
