return {
  setup = function(on_attach, on_init, capabilities)
    vim.lsp.enable("prismals")

    vim.lsp.config("prismals", {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    })
  end,
}
