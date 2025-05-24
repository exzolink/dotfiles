return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    -- After refactor lsp servers rename to vue_ls
    lspconfig.volar.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    })
  end,
}
