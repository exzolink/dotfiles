return {
  setup = function(on_attach, on_init, capabilities)
    vim.lsp.enable("html")

    vim.lsp.config("html", {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    })
  end,
}
