return {
  setup = function(on_attach, on_init, capabilities)
    vim.lsp.enable("cssls")

    vim.lsp.config("cssls", {
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
