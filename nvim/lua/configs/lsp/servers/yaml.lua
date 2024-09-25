return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.yamlls.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,

      settings = {
        yaml = {
          schemas = require("schemastore").yaml.schemas(),
          schemaStore = {
            enable = false,
            url = "",
          },
        },
      },
    })
  end,
}
