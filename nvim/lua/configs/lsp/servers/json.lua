return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.jsonls.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,

      settings = {
        json = {
          validate = { enable = true },
          schemas = require("schemastore").json.schemas({
            extra = {
              {
                description = "TypeScript compiler configuration file for vue",
                fileMatch = { "tsconfig*.json" },
                name = "vue-tsconfig.json",
                url = "https://raw.githubusercontent.com/vuejs/language-tools/master/packages/language-core/schemas/vue-tsconfig.schema.json",
              },
            },
          }),
        },
      },
    })
  end,
}
